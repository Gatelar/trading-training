// ============ EXERCICES INTERACTIFS D'UN MODULE ============
// Un exercice est décrit dans la source du module, à côté du cours, et voyage
// par le même chemin : formation/contenu*/ → push_chapitres.py → Supabase, sous
// RLS. Rien n'est stocké dans un fichier servi par GitHub Pages : les énoncés
// et les réponses sont du contenu payant, ils ne doivent pas être
// téléchargeables par un non-abonné.
//
// Balisage, dans le corps d'un chapitre « EX » :
//
//   EXO: vraifaux | Titre de la partie
//   CONSIGNE: Ce qu'on demande au lecteur.
//   Q: L'affirmation. | vrai | Pourquoi, et pourquoi l'autre réponse tentait.
//
//   EXO: grille | Titre de la partie
//   CONSIGNE: Ce qu'on demande au lecteur.
//   FIXE: Donnée | valeur | mention      ← bandeau fixe, non modifiable
//   COL: Intitulé                        ← première colonne : l'intitulé de ligne
//   COL: Résultat | 1 | €                ← libellé | tolérance | suffixe
//   ROW: Premier cas | 50                ← intitulé | valeur attendue par colonne
//
// Les exemples sont volontairement vides : ce fichier est servi en clair par
// GitHub Pages, pas le contenu qu'il met en forme.
//
// Les nombres des sources sont canoniques — chiffres nus, point décimal, pas de
// séparateur de milliers — parce que « 1,000 » ne vaut pas la même chose en
// français et en anglais. L'affichage est reconstruit, la saisie est tolérante.

(function () {
    'use strict';

    // ══════════ lecture du balisage ══════════

    function champs(ligne) {
        return ligne.split('|').map(function (c) { return c.trim(); });
    }

    // Une valeur écrite par un humain : « 1 000 », « 1,5 », « 1.5 », « 300 € ».
    // Renvoie null si rien d'exploitable, ce que l'appelant distingue de 0.
    function nombre(t) {
        var net = String(t).replace(/[\s  ]/g, '').replace(',', '.')
            .replace(/[^0-9.\-]/g, '');
        if (!net || net === '-' || net === '.') return null;
        var v = parseFloat(net);
        return isNaN(v) ? null : v;
    }

    function lire(tete, lignes) {
        var t = champs(tete);
        var ex = {
            type: (t[0] || 'vraifaux').toLowerCase(),
            titre: t[1] || '',
            consigne: '',
            questions: [],
            fixe: null,
            colonnes: [],
            rangs: [],
            actifs: [],
            defaut: '',
            blocs: [],
            croises: [],
            legendes: [],
            positions: [],
            lots: [],
            indice: '',
            items: [],
        };
        lignes.forEach(function (l) {
            // Une option de QCM : elle appartient au dernier item déclaré.
            // « > » désigne la bonne. Même convention de puce que UL et KEY.
            if (l.indexOf('- ') === 0) {
                var dernier = ex.items[ex.items.length - 1];
                if (!dernier || dernier.type !== 'qcm') return;
                var o = champs(l.slice(2));
                var juste = o[0].indexOf('>') === 0;
                dernier.options.push({
                    texte: (juste ? o[0].slice(1) : o[0]).trim(),
                    juste: juste,
                    note: o.slice(1).join(' | '),
                });
                return;
            }
            var m = l.match(/^([A-Z]+):\s?(.*)$/);
            if (!m) return;
            var c = champs(m[2]);
            switch (m[1]) {
                case 'ACTIFS':
                    ex.actifs = c;
                    break;
                case 'DEFAUT':
                    ex.defaut = c[0];
                    break;
                case 'INDICE':
                    ex.indice = m[2];
                    break;
                case 'BLOC':
                    // Toutes les paires internes à la liste sont de cette
                    // catégorie : c'est ainsi que le cours parle d'un groupe.
                    ex.blocs.push({ categorie: c[0], actifs: c.slice(1) });
                    break;
                case 'CROISE':
                    ex.croises.push({ categorie: c[0], actif: c[1], avec: c.slice(2) });
                    break;
                case 'LEGENDE':
                    ex.legendes.push({ categorie: c[0], seuil: c[1], effet: c[2] || '' });
                    break;
                case 'POS':
                    ex.positions.push({
                        actif: c[0],
                        sens: c[1],
                        risque: nombre(c[2]),
                        mention: c[3] || '',
                    });
                    break;
                case 'LOT':
                    ex.lots.push({
                        etiquette: c[0], composition: c[1],
                        valeur: nombre(c[2]), note: c.slice(3).join(' | '),
                    });
                    break;
                case 'CHAMP':
                    ex.items.push({
                        type: 'champ', label: c[0], vise: nombre(c[1]),
                        tol: nombre(c[2]), suffixe: c[3] || '',
                        note: c.slice(4).join(' | '),
                    });
                    break;
                case 'QCM':
                    ex.items.push({ type: 'qcm', question: m[2], options: [] });
                    break;
                case 'CONSIGNE':
                    ex.consigne = m[2];
                    break;
                case 'Q':
                    ex.questions.push({
                        texte: c[0],
                        vrai: (c[1] || '').toLowerCase() === 'vrai',
                        note: c.slice(2).join(' | '),
                    });
                    break;
                case 'FIXE':
                    ex.fixe = { label: c[0], valeur: c[1], mention: c[2] || '' };
                    break;
                case 'COL':
                    ex.colonnes.push({
                        label: c[0],
                        tolerance: c.length > 1 ? nombre(c[1]) : null,
                        suffixe: c[2] || '',
                    });
                    break;
                case 'ROW':
                    ex.rangs.push({ label: c[0], valeurs: c.slice(1).map(nombre) });
                    break;
            }
        });
        return ex;
    }

    // ══════════ mémoire locale ══════════
    // Le suivi de progression n'a pas de table : ce qui est retenu l'est dans
    // le navigateur, et une mémoire indisponible (navigation privée, stockage
    // refusé) doit seulement faire perdre la reprise, jamais casser la page.

    function memoire(cle) {
        return {
            lire: function () {
                try { return JSON.parse(localStorage.getItem(cle) || 'null'); }
                catch (e) { return null; }
            },
            ecrire: function (v) {
                try { localStorage.setItem(cle, JSON.stringify(v)); } catch (e) {}
            },
            vider: function () {
                try { localStorage.removeItem(cle); } catch (e) {}
            },
        };
    }

    // ══════════ fabrique DOM ══════════

    function el(balise, classe, texte) {
        var n = document.createElement(balise);
        if (classe) n.className = classe;
        if (texte !== undefined && texte !== null) n.textContent = texte;
        return n;
    }

    function bouton(classe, texte, action) {
        var b = el('button', classe, texte);
        b.type = 'button';
        b.addEventListener('click', action);
        return b;
    }

    function entete(ex, ctx) {
        var h = el('div', 'exo-head');
        if (ex.titre) h.appendChild(el('h3', null, ex.titre));
        if (ex.consigne) {
            var p = el('p', 'exo-consigne');
            p.innerHTML = ctx.enligne(ex.consigne);
            h.appendChild(p);
        }
        return h;
    }

    // ══════════ ce que les écrans se partagent ══════════

    // Le nombre attendu suit la typographie de la langue de lecture —
    // « 1 000 € » ici, "€1,000" là — comme le fait le PDF. La saisie, elle,
    // accepte les deux écritures : c'est un exercice d'arithmétique, pas de
    // ponctuation.
    function unite(v, suffixe, lang) {
        var fr = lang === 'fr';
        var parts = String(v).split('.');
        var n = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, fr ? ' ' : ',');
        if (parts[1]) n += (fr ? ',' : '.') + parts[1];
        if (!suffixe) return n;
        if (fr) return n + ' ' + suffixe;
        return '€$£'.indexOf(suffixe) !== -1 ? suffixe + n : n + suffixe;
    }

    function attendu(v, suffixe, ctx) {
        return ctx.tt('ex.expected', 'Attendu') +
            (ctx.lang === 'fr' ? ' : ' : ': ') + unite(v, suffixe, ctx.lang);
    }

    // Un essai se compte sur une réponse changée, pas sur un clic : revalider
    // deux fois la même erreur ne donne pas la solution.
    function essai(etat, id, valeur) {
        if (etat.vus[id] === valeur) return etat.essais[id] || 0;
        etat.vus[id] = valeur;
        etat.essais[id] = (etat.essais[id] || 0) + 1;
        return etat.essais[id];
    }

    // ══════════ vrai / faux ══════════
    // Séquentiel et sans retour en arrière : la source le demande, et c'est le
    // point de l'exercice — on répond avec ce qu'on sait, pas en comparant les
    // affirmations entre elles.

    function vraifaux(ex, dans, ctx) {
        var mem = memoire(ctx.cle);
        var etat = mem.lire() || { reponses: [] };
        // Une source modifiée depuis la dernière visite invalide la reprise.
        if (etat.reponses.length > ex.questions.length) etat = { reponses: [] };

        var racine = el('div', 'exo exo--vf');
        racine.appendChild(entete(ex, ctx));

        var jauge = el('div', 'exo-jauge');
        var segments = ex.questions.map(function () {
            var s = el('span');
            jauge.appendChild(s);
            return s;
        });
        racine.appendChild(jauge);

        var scene = el('div', 'exo-scene');
        racine.appendChild(scene);
        dans.appendChild(racine);

        function jaugeMaj() {
            segments.forEach(function (s, i) {
                var r = etat.reponses[i];
                s.className = r === undefined ? '' : (r ? 'est-juste' : 'est-rate');
            });
        }

        function carte(i) {
            scene.textContent = '';
            var c = el('div', 'exo-carte');

            var rang = el('p', 'exo-rang',
                ctx.tt('ex.statement', 'Affirmation') + ' ' + (i + 1) + ' / ' + ex.questions.length);
            c.appendChild(rang);

            var q = el('p', 'exo-enonce');
            q.innerHTML = ctx.enligne(ex.questions[i].texte);
            c.appendChild(q);

            var choix = el('div', 'exo-choix');
            [[true, ctx.tt('ex.true', 'Vrai')], [false, ctx.tt('ex.false', 'Faux')]]
                .forEach(function (paire) {
                    choix.appendChild(bouton('exo-btn', paire[1], function () {
                        repondre(i, paire[0]);
                    }));
                });
            c.appendChild(choix);
            scene.appendChild(c);
        }

        function repondre(i, dit) {
            var q = ex.questions[i];
            etat.reponses[i] = (dit === q.vrai);
            mem.ecrire(etat);
            jaugeMaj();

            var c = scene.querySelector('.exo-carte');
            c.querySelector('.exo-choix').remove();

            var v = el('div', 'exo-verdict ' + (etat.reponses[i] ? 'est-juste' : 'est-rate'));
            v.appendChild(el('span', 'exo-glyphe', etat.reponses[i] ? '✓' : '✕'));
            var titre = (etat.reponses[i]
                ? ctx.tt('ex.right', 'Juste')
                : ctx.tt('ex.wrong', 'Raté')) + ' — ' +
                (q.vrai ? ctx.tt('ex.isTrue', "l'affirmation est vraie")
                        : ctx.tt('ex.isFalse', "l'affirmation est fausse"));
            v.appendChild(el('b', null, titre));
            c.appendChild(v);

            if (q.note) {
                var n = el('p', 'exo-note');
                n.innerHTML = ctx.enligne(q.note);
                c.appendChild(n);
            }

            var suite = (i + 1 < ex.questions.length)
                ? bouton('exo-suite', ctx.tt('ex.next', 'Affirmation suivante →'),
                    function () { carte(i + 1); })
                : bouton('exo-suite', ctx.tt('ex.seeScore', 'Voir le résultat →'), bilan);
            c.appendChild(suite);
            suite.focus();
        }

        function bilan() {
            scene.textContent = '';
            var justes = etat.reponses.filter(Boolean).length;

            var b = el('div', 'exo-bilan');
            b.appendChild(el('p', 'exo-score', justes + ' / ' + ex.questions.length));
            b.appendChild(el('p', 'exo-score-mot', justes === ex.questions.length
                ? ctx.tt('ex.allRight', 'Aucune erreur.')
                : ctx.tt('ex.toReview', 'À revoir :')));

            var rates = ex.questions.filter(function (_, i) { return !etat.reponses[i]; });
            if (rates.length) {
                var ul = el('ul', 'exo-rates');
                rates.forEach(function (q) {
                    var li = el('li');
                    li.innerHTML = ctx.enligne(q.texte);
                    ul.appendChild(li);
                });
                b.appendChild(ul);
            }

            b.appendChild(bouton('exo-rejouer', ctx.tt('ex.restart', 'Refaire cette partie'),
                function () {
                    etat = { reponses: [] };
                    mem.vider();
                    jaugeMaj();
                    carte(0);
                }));
            scene.appendChild(b);
        }

        jaugeMaj();
        // Reprise : on rouvre là où la session précédente s'était arrêtée.
        if (etat.reponses.length >= ex.questions.length) bilan();
        else carte(etat.reponses.length);
    }

    // ══════════ grille chiffrée ══════════

    function grille(ex, dans, ctx) {
        var mem = memoire(ctx.cle);
        var etat = mem.lire() || {};
        etat.saisies = etat.saisies || {};
        etat.essais = etat.essais || {};
        etat.vus = etat.vus || {};
        var cols = ex.colonnes.slice(1); // la première colonne intitule les lignes

        var racine = el('div', 'exo exo--grille');
        racine.appendChild(entete(ex, ctx));

        if (ex.fixe) {
            var f = el('div', 'exo-fixe');
            f.appendChild(el('span', 'exo-fixe-label', ex.fixe.label));
            f.appendChild(el('b', null, ex.fixe.valeur));
            if (ex.fixe.mention) f.appendChild(el('span', 'exo-fixe-mention', ex.fixe.mention));
            racine.appendChild(f);
        }

        var wrap = el('div', 'exo-grille-wrap');
        var table = el('table', 'exo-grille');
        var thead = el('thead'), trh = el('tr');
        ex.colonnes.forEach(function (c) { trh.appendChild(el('th', null, c.label)); });
        thead.appendChild(trh);
        table.appendChild(thead);

        var tbody = el('tbody');
        var cellules = [];
        ex.rangs.forEach(function (r, i) {
            var tr = el('tr');
            tr.appendChild(el('th', 'exo-rang-label', r.label));
            cols.forEach(function (c, j) {
                var td = el('td');
                var champ = el('div', 'exo-champ');
                var input = document.createElement('input');
                input.type = 'text';
                input.inputMode = 'decimal';
                input.autocomplete = 'off';
                input.setAttribute('aria-label', r.label + ' — ' + c.label);
                var id = i + ':' + j;
                if (etat.saisies[id] !== undefined) input.value = etat.saisies[id];
                input.addEventListener('input', function () {
                    etat.saisies[id] = input.value;
                    mem.ecrire(etat);
                    td.className = '';
                    attendu.textContent = '';
                });
                champ.appendChild(input);
                if (c.suffixe) champ.appendChild(el('span', 'exo-suffixe', c.suffixe));
                td.appendChild(champ);
                var attendu = el('p', 'exo-attendu');
                td.appendChild(attendu);
                tr.appendChild(td);
                cellules.push({ id: id, td: td, input: input, attendu: attendu,
                                vise: r.valeurs[j], tol: c.tolerance, col: c });
            });
            tbody.appendChild(tr);
        });
        table.appendChild(tbody);
        wrap.appendChild(table);
        racine.appendChild(wrap);

        var pied = el('div', 'exo-pied');
        var message = el('p', 'exo-message');
        pied.appendChild(bouton('exo-valider', ctx.tt('ex.check', 'Vérifier'), verifier));
        pied.appendChild(message);
        racine.appendChild(pied);
        dans.appendChild(racine);

        function verifier(silencieux) {
            var restants = 0, vides = 0;
            cellules.forEach(function (c) {
                var v = nombre(c.input.value);
                if (v === null) { vides++; restants++; c.td.className = ''; return; }
                var tol = c.tol === null ? 0 : c.tol;
                if (Math.abs(v - c.vise) <= tol + 1e-9) {
                    c.td.className = 'est-juste';
                    c.input.readOnly = true;
                    c.attendu.textContent = '';
                    return;
                }
                restants++;
                c.td.className = 'est-rate';
                // Deux erreurs sur la même case : la valeur est donnée. Chercher
                // plus longtemps n'apprend plus rien, et l'exercice suivant
                // s'appuie sur ce résultat.
                if (essai(etat, c.id, c.input.value) >= 2) {
                    c.attendu.textContent = attendu(c.vise, c.col.suffixe, ctx);
                }
            });
            mem.ecrire(etat);

            if (silencieux) {
                if (!restants) racine.classList.add('est-fini');
                return;
            }
            if (!restants) {
                message.className = 'exo-message est-juste';
                message.textContent = ctx.tt('ex.gridDone', 'Grille complète, tout est juste.');
                racine.classList.add('est-fini');
            } else if (vides === cellules.length) {
                message.className = 'exo-message';
                message.textContent = ctx.tt('ex.gridEmpty', 'Remplis au moins une case.');
            } else {
                message.className = 'exo-message est-rate';
                message.textContent = restants + ' ' +
                    (restants > 1 ? ctx.tt('ex.gridLeftMany', 'cases encore fausses ou vides.')
                                  : ctx.tt('ex.gridLeftOne', 'case encore fausse ou vide.'));
            }
        }

        // Une reprise doit montrer ce que la session précédente avait acquis :
        // sans ça, des cases déjà justes réapparaissent comme non validées.
        verifier(true);
    }

    // ══════════ questions posées sur un écran ══════════
    // Un écran montre quelque chose — un portefeuille, une matrice — puis pose
    // ses questions. Elles partagent un seul bouton « Vérifier » : l'étape se
    // valide d'un bloc, parce que c'est une seule décision qu'on évalue.

    function questions(liste, dans, ctx, etat, mem) {
        var controles = [];

        liste.forEach(function (it, i) {
            var id = 'i' + i;
            var bloc = el('div', 'exo-item');

            if (it.type === 'qcm') {
                var q = el('p', 'exo-question');
                q.innerHTML = ctx.enligne(it.question);
                bloc.appendChild(q);
                var choix = el('div', 'exo-options');
                var boutons = it.options.map(function (o, j) {
                    var b = bouton('exo-option', '', function () {
                        if (b.disabled) return;
                        etat.reponses[id] = j;
                        mem.ecrire(etat);
                        boutons.forEach(function (autre, k) {
                            autre.classList.toggle('est-choisi', k === j);
                        });
                    });
                    b.innerHTML = ctx.enligne(o.texte);
                    if (etat.reponses[id] === j) b.classList.add('est-choisi');
                    choix.appendChild(b);
                    return b;
                });
                bloc.appendChild(choix);
                var motif = el('p', 'exo-note');
                bloc.appendChild(motif);
                dans.appendChild(bloc);
                controles.push({ id: id, it: it, boutons: boutons, motif: motif, bloc: bloc });
                return;
            }

            var l = el('label', 'exo-item-label', it.label);
            bloc.appendChild(l);
            var champ = el('div', 'exo-champ');
            var input = document.createElement('input');
            input.type = 'text';
            input.inputMode = 'decimal';
            input.autocomplete = 'off';
            input.setAttribute('aria-label', it.label);
            if (etat.reponses[id] !== undefined) input.value = etat.reponses[id];
            input.addEventListener('input', function () {
                etat.reponses[id] = input.value;
                mem.ecrire(etat);
                bloc.className = 'exo-item';
            });
            champ.appendChild(input);
            if (it.suffixe) champ.appendChild(el('span', 'exo-suffixe', it.suffixe));
            l.appendChild(champ);
            var note = el('p', 'exo-note');
            bloc.appendChild(note);
            dans.appendChild(bloc);
            controles.push({ id: id, it: it, input: input, motif: note, bloc: bloc });
        });

        return function verifier() {
            var restants = 0;
            controles.forEach(function (c) {
                var juste, choisi;
                if (c.it.type === 'qcm') {
                    choisi = etat.reponses[c.id];
                    if (choisi === undefined) { restants++; c.bloc.className = 'exo-item'; return; }
                    juste = c.it.options[choisi].juste;
                    c.boutons.forEach(function (b, j) {
                        b.classList.toggle('est-juste', juste && j === choisi);
                        b.classList.toggle('est-rate', !juste && j === choisi);
                    });
                    // Le motif du choix fait l'enseignement, pas le verdict : on
                    // dit pourquoi celui-là était tentant, pas qu'il est mauvais.
                    c.motif.innerHTML = ctx.enligne(c.it.options[choisi].note || '');
                } else {
                    var v = nombre(c.input.value);
                    if (v === null) { restants++; c.bloc.className = 'exo-item'; return; }
                    juste = Math.abs(v - c.it.vise) <= (c.it.tol || 0) + 1e-9;
                    c.motif.innerHTML = juste ? ctx.enligne(c.it.note || '') : '';
                    if (juste) c.input.readOnly = true;
                }

                if (juste) { c.bloc.className = 'exo-item est-juste'; return; }

                restants++;
                c.bloc.className = 'exo-item est-rate';
                // Deux réponses fausses différentes : on donne la solution.
                // Chercher plus longtemps n'apprend plus rien.
                if (essai(etat, c.id, String(etat.reponses[c.id])) < 2) return;
                if (c.it.type === 'champ') {
                    c.motif.textContent = attendu(c.it.vise, c.it.suffixe, ctx);
                    return;
                }
                c.boutons.forEach(function (b, j) {
                    if (c.it.options[j].juste) b.classList.add('est-juste');
                });
                c.motif.innerHTML = ctx.enligne(
                    c.it.options.filter(function (o) { return o.juste; })
                        .map(function (o) { return o.note; }).join(' '));
            });
            mem.ecrire(etat);
            return restants;
        };
    }

    // Prépare l'état d'un écran à questions, son bouton et sa ligne de message.
    function poser(ex, racine, ctx) {
        if (!ex.items.length) return;
        var mem = memoire(ctx.cle);
        var etat = mem.lire() || {};
        etat.reponses = etat.reponses || {};
        etat.essais = etat.essais || {};
        etat.vus = etat.vus || {};

        var zone = el('div', 'exo-items');
        racine.appendChild(zone);
        var verifier = questions(ex.items, zone, ctx, etat, mem);

        var p = el('div', 'exo-pied');
        var message = el('p', 'exo-message');
        p.appendChild(bouton('exo-valider', ctx.tt('ex.check', 'Vérifier'), function () {
            var restants = verifier();
            if (!restants) {
                message.className = 'exo-message est-juste';
                message.textContent = ctx.tt('ex.stepDone', 'Étape juste.');
                racine.classList.add('est-fini');
            } else {
                message.className = 'exo-message est-rate';
                message.textContent = restants + ' ' + (restants > 1
                    ? ctx.tt('ex.leftMany', 'réponses encore fausses ou vides.')
                    : ctx.tt('ex.leftOne', 'réponse encore fausse ou vide.'));
            }
        }));
        p.appendChild(message);
        racine.appendChild(p);

        // Une reprise doit montrer ce que la session précédente avait acquis.
        if (verifier() === 0) racine.classList.add('est-fini');
    }

    // ══════════ matrice de corrélation ══════════
    // Trois catégories, jamais un coefficient : le cours est explicite là-dessus,
    // et l'exercice évalue l'application de la règle, pas la lecture d'un
    // tableau de nombres. La couleur seule ne suffirait pas — chaque case porte
    // aussi un disque plein, à moitié, ou vide.

    var DISQUES = { forte: '●', moyenne: '◐', faible: '○' };

    function categorie(ex, a, b) {
        var cat = ex.defaut || 'faible';
        ex.blocs.forEach(function (bl) {
            if (bl.actifs.indexOf(a) !== -1 && bl.actifs.indexOf(b) !== -1) cat = bl.categorie;
        });
        ex.croises.forEach(function (cr) {
            if ((cr.actif === a && cr.avec.indexOf(b) !== -1) ||
                (cr.actif === b && cr.avec.indexOf(a) !== -1)) cat = cr.categorie;
        });
        return cat;
    }

    function matrice(ex, dans, ctx) {
        // « forte », « moyenne », « faible » sont des mots-cles du balisage, pas
        // du texte : l'infobulle reprend le libelle de la legende, qui lui est
        // traduit avec le module.
        var libelle = {};
        ex.legendes.forEach(function (lg) { libelle[lg.categorie] = lg.seuil || lg.categorie; });

        var racine = el('div', 'exo exo--matrice');
        racine.appendChild(entete(ex, ctx));

        var wrap = el('div', 'exo-grille-wrap');
        var table = el('table', 'exo-matrice');
        var thead = el('thead'), trh = el('tr');
        trh.appendChild(el('th'));
        ex.actifs.forEach(function (a) { trh.appendChild(el('th', null, a)); });
        thead.appendChild(trh);
        table.appendChild(thead);

        var tbody = el('tbody');
        ex.actifs.forEach(function (a) {
            var tr = el('tr');
            tr.appendChild(el('th', 'exo-matrice-actif', a));
            ex.actifs.forEach(function (b) {
                if (a === b) { tr.appendChild(el('td', 'est-soi', '—')); return; }
                var cat = categorie(ex, a, b);
                var td = el('td', 'cat-' + cat, DISQUES[cat] || '○');
                td.setAttribute('title', a + ' / ' + b + ' — ' + (libelle[cat] || cat));
                tr.appendChild(td);
            });
            tbody.appendChild(tr);
        });
        table.appendChild(tbody);
        wrap.appendChild(table);
        racine.appendChild(wrap);

        if (ex.legendes.length) {
            var ul = el('ul', 'exo-legende');
            ex.legendes.forEach(function (lg) {
                var li = el('li', 'cat-' + lg.categorie);
                li.appendChild(el('span', 'exo-disque', DISQUES[lg.categorie] || '○'));
                li.appendChild(el('b', null, lg.seuil || lg.categorie));
                if (lg.effet) li.appendChild(el('span', 'exo-legende-effet', lg.effet));
                ul.appendChild(li);
            });
            racine.appendChild(ul);
        }

        poser(ex, racine, ctx);
        dans.appendChild(racine);
    }

    // ══════════ portefeuille ══════════
    // Le sens doit se voir autant que le montant : c'est sur lui que porte le
    // piège, et un lecteur qui n'a lu que la colonne des pourcentages doit
    // pouvoir constater après coup qu'il ne l'a pas regardé.

    function portefeuille(ex, dans, ctx) {
        var racine = el('div', 'exo exo--portefeuille');
        racine.appendChild(entete(ex, ctx));

        var wrap = el('div', 'exo-grille-wrap');
        var table = el('table', 'exo-portefeuille');
        var thead = el('thead'), trh = el('tr');
        [ctx.tt('ex.asset', 'Actif'), ctx.tt('ex.side', 'Sens'),
         ctx.tt('ex.risk', 'Risque')].forEach(function (c) {
            trh.appendChild(el('th', null, c));
        });
        thead.appendChild(trh);
        table.appendChild(thead);

        var tbody = el('tbody');
        ex.positions.forEach(function (pos) {
            var tr = el('tr');
            if (pos.mention) tr.className = 'est-envisage';
            var actif = el('th', 'exo-actif', pos.actif);
            if (pos.mention) actif.appendChild(el('span', 'exo-mention', pos.mention));
            tr.appendChild(actif);
            var sens = (pos.sens || '').toLowerCase();
            var td = el('td', 'exo-sens est-' + (sens.indexOf('s') === 0 ? 'short' : 'long'));
            td.appendChild(el('span', 'exo-fleche', sens.indexOf('s') === 0 ? '↓' : '↑'));
            td.appendChild(document.createTextNode(pos.sens));
            tr.appendChild(td);
            tr.appendChild(el('td', 'exo-risque', unite(pos.risque, '%', ctx.lang)));
            tbody.appendChild(tr);
        });
        table.appendChild(tbody);
        wrap.appendChild(table);
        racine.appendChild(wrap);

        poser(ex, racine, ctx);
        dans.appendChild(racine);
    }

    // ══════════ classement ══════════
    // Glisser-déposer pour la souris, deux flèches pour le reste : le tactile et
    // le clavier ne sont pas un repli, ils sont l'autre moitié des lecteurs.

    function classement(ex, dans, ctx) {
        var mem = memoire(ctx.cle);
        var etat = mem.lire() || {};
        etat.essais = etat.essais || {};
        etat.vus = etat.vus || {};

        var racine = el('div', 'exo exo--classement');
        racine.appendChild(entete(ex, ctx));

        var ordre = (etat.ordre && etat.ordre.length === ex.lots.length)
            ? etat.ordre : ex.lots.map(function (_, i) { return i; });

        var liste = el('ol', 'exo-lots');
        racine.appendChild(liste);
        var message = el('p', 'exo-message');

        function dessiner() {
            liste.textContent = '';
            ordre.forEach(function (idx, rang) {
                var lot = ex.lots[idx];
                var li = el('li', 'exo-lot');
                li.draggable = true;

                var poignee = el('span', 'exo-poignee', '⠿');
                poignee.setAttribute('aria-hidden', 'true');
                li.appendChild(poignee);

                var corps = el('div', 'exo-lot-corps');
                corps.appendChild(el('b', null, lot.etiquette));
                corps.appendChild(el('p', 'exo-lot-compo', lot.composition));
                var note = el('p', 'exo-note');
                corps.appendChild(note);
                li.appendChild(corps);
                li.note = note;

                var fleches = el('div', 'exo-fleches');
                [[-1, '↑', ctx.tt('ex.up', 'Monter')],
                 [1, '↓', ctx.tt('ex.down', 'Descendre')]].forEach(function (f) {
                    var b = bouton('exo-fleche-btn', f[1], function () {
                        deplacer(rang, rang + f[0]);
                    });
                    b.setAttribute('aria-label', f[2] + ' — ' + lot.etiquette);
                    if ((f[0] === -1 && rang === 0) ||
                        (f[0] === 1 && rang === ordre.length - 1)) b.disabled = true;
                    fleches.appendChild(b);
                });
                li.appendChild(fleches);

                li.addEventListener('dragstart', function (e) {
                    e.dataTransfer.setData('text/plain', String(rang));
                    li.classList.add('est-pris');
                });
                li.addEventListener('dragend', function () { li.classList.remove('est-pris'); });
                li.addEventListener('dragover', function (e) { e.preventDefault(); });
                li.addEventListener('drop', function (e) {
                    e.preventDefault();
                    deplacer(parseInt(e.dataTransfer.getData('text/plain'), 10), rang);
                });
                liste.appendChild(li);
            });
        }

        function deplacer(de, vers) {
            if (isNaN(de) || vers < 0 || vers >= ordre.length || de === vers) return;
            ordre.splice(vers, 0, ordre.splice(de, 1)[0]);
            etat.ordre = ordre;
            mem.ecrire(etat);
            message.textContent = '';
            message.className = 'exo-message';
            racine.classList.remove('est-fini');
            dessiner();
        }

        // Le bon classement est celui des valeurs déclarées, décroissant : la
        // source donne l'exposition réelle de chaque lot, pas leur rang.
        function attenduOrdre() {
            return ex.lots.map(function (_, i) { return i; })
                .sort(function (a, b) { return ex.lots[b].valeur - ex.lots[a].valeur; });
        }

        function montrer() {
            var lis = liste.querySelectorAll('.exo-lot');
            ordre.forEach(function (idx, r) {
                lis[r].classList.add('est-juste');
                lis[r].note.innerHTML = ctx.enligne(
                    '**' + unite(ex.lots[idx].valeur, '%', ctx.lang) + '**' +
                    (ex.lots[idx].note ? ' — ' + ex.lots[idx].note : ''));
            });
            message.className = 'exo-message est-juste';
            message.textContent = ctx.tt('ex.rankDone', 'Classement juste.');
            racine.classList.add('est-fini');
        }

        dessiner();

        var p = el('div', 'exo-pied');
        p.appendChild(bouton('exo-valider', ctx.tt('ex.check', 'Vérifier'), function () {
            var vise = attenduOrdre();
            if (ordre.every(function (idx, r) { return idx === vise[r]; })) {
                etat.fini = true;
                mem.ecrire(etat);
                montrer();
                return;
            }
            var n = essai(etat, 'ordre', ordre.join(','));
            mem.ecrire(etat);
            message.className = 'exo-message est-rate';
            message.textContent = (n >= 2 && ex.indice)
                ? ex.indice
                : ctx.tt('ex.rankWrong', "Ce n'est pas l'ordre.");
        }));
        p.appendChild(message);
        racine.appendChild(p);

        if (etat.fini) montrer();
        dans.appendChild(racine);
    }

    // ══════════ point d'entrée appelé par module.js ══════════

    window.ttExercice = {
        bloc: function (tete, lignes, dans, ctx) {
            var ex = lire(tete, lignes);
            if (ex.type === 'grille' && ex.rangs.length) grille(ex, dans, ctx);
            else if (ex.type === 'matrice') matrice(ex, dans, ctx);
            else if (ex.type === 'portefeuille') portefeuille(ex, dans, ctx);
            else if (ex.type === 'classement' && ex.lots.length) classement(ex, dans, ctx);
            else if (ex.questions.length) vraifaux(ex, dans, ctx);
        },
    };
})();
