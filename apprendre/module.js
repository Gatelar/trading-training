// ============ LECTURE D'UN MODULE ============
// Le corps des chapitres vient de public.formation_chapitres, sous RLS :
// un non-abonné ne reçoit aucune ligne, quoi que fasse le navigateur.
// Ce fichier ne fait que rendre ce que la base a bien voulu donner.
//
// URL : module.html?p=experimente&m=1

(function () {
    'use strict';

    function tt(cle, repli) {
        var lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        var e = typeof I18N_DICT !== 'undefined' ? I18N_DICT[cle] : null;
        return e ? (e[lang] || e.fr) : repli;
    }

    var params = new URLSearchParams(location.search);
    var SLUG = params.get('p') || 'debutant';
    var NUM = parseInt(params.get('m') || '1', 10);

    var PARCOURS = (typeof FORMATION_INDEX !== 'undefined')
        ? FORMATION_INDEX.filter(function (x) { return x.slug === SLUG; })[0]
        : null;
    var MODULE = PARCOURS
        ? PARCOURS.modules.filter(function (m) { return m.numero === NUM; })[0]
        : null;

    // ══════════ rendu du format balisé ══════════
    // Mêmes balises que formation/render_formation.py, mêmes rôles.

    function echapper(t) {
        return t.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    }

    // **gras** et *italique*, après échappement : le HTML produit est le nôtre,
    // jamais celui du contenu.
    function enligne(t) {
        return echapper(t)
            .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
            .replace(/(^|[^*])\*([^*]+)\*/g, '$1<em>$2</em>');
    }

    function para(texte, dans) {
        var p = document.createElement('p');
        p.innerHTML = enligne(texte);
        dans.appendChild(p);
    }

    function encadre(classe, label, lignes, dans) {
        var box = document.createElement('div');
        box.className = 'mo-box mo-box--' + classe;
        if (label) {
            var l = document.createElement('span');
            l.className = 'label';
            l.textContent = label;
            box.appendChild(l);
        }
        // Une puce par ligne quand le bloc en contient, sinon un paragraphe
        // par ligne : c'est la convention des sources.
        var puces = lignes.filter(function (l) { return l.indexOf('- ') === 0; });
        if (puces.length === lignes.length && lignes.length) {
            var ul = document.createElement('ul');
            lignes.forEach(function (l) {
                var li = document.createElement('li');
                li.innerHTML = enligne(l.slice(2));
                ul.appendChild(li);
            });
            box.appendChild(ul);
        } else {
            lignes.forEach(function (l) { para(l, box); });
        }
        dans.appendChild(box);
    }

    function tableau(tete, lignes, dans) {
        var parts = null;
        if (tete.indexOf('||') !== -1) {
            var m = tete.split('||');
            parts = m[0].split(',').map(parseFloat);
            tete = m[1];
        }
        var wrap = document.createElement('div');
        wrap.className = 'mo-table-wrap';
        var t = document.createElement('table');

        var thead = document.createElement('thead');
        var tr = document.createElement('tr');
        tete.split('|').forEach(function (c, i) {
            var th = document.createElement('th');
            th.innerHTML = enligne(c.trim());
            if (parts && parts[i]) th.style.width = parts[i] + '%';
            tr.appendChild(th);
        });
        thead.appendChild(tr);
        t.appendChild(thead);

        var tbody = document.createElement('tbody');
        lignes.forEach(function (l) {
            var r = document.createElement('tr');
            l.split('|').forEach(function (c) {
                var td = document.createElement('td');
                td.innerHTML = enligne(c.trim());
                r.appendChild(td);
            });
            tbody.appendChild(r);
        });
        t.appendChild(tbody);
        wrap.appendChild(t);
        dans.appendChild(wrap);
    }

    function rendre(corps, dans) {
        corps.split(/\n\s*\n/).forEach(function (bloc) {
            var lignes = bloc.split('\n').filter(function (l) { return l.trim(); });
            if (!lignes.length) return;
            var m = lignes[0].match(/^([A-Z0-9_]+):\s?(.*)$/);
            if (!m) { para(lignes.join(' '), dans); return; }

            var tag = m[1], tete = m[2], reste = lignes.slice(1);
            var texte = (tete ? [tete] : []).concat(reste).join(' ');

            switch (tag) {
                case 'P':
                    para(texte, dans);
                    break;
                case 'NOTE':
                    encadre('note', '', [texte], dans);
                    break;
                case 'HOOK':
                    var h = document.createElement('div');
                    h.className = 'mo-hook';
                    para(reste.join(' ') || tete, h);
                    dans.appendChild(h);
                    break;
                case 'H3':
                    var h3 = document.createElement('h3');
                    h3.textContent = tete;
                    dans.appendChild(h3);
                    break;
                case 'CASE':
                    encadre('case', tete || tt('mo.case', 'Cas chiffré'), reste, dans);
                    break;
                case 'ERR':
                    encadre('err', tete || tt('mo.err', "L'erreur classique"), reste, dans);
                    break;
                case 'KEY':
                    encadre('key', tete || tt('mo.key', 'À retenir'), reste, dans);
                    break;
                case 'CARD':
                    encadre('card', tete, reste, dans);
                    break;
                case 'WARN':
                    encadre('warn', tete || tt('mo.warn', 'Avertissement'), reste, dans);
                    break;
                case 'UL':
                case 'OL':
                    var liste = document.createElement(tag === 'OL' ? 'ol' : 'ul');
                    reste.forEach(function (l) {
                        var li = document.createElement('li');
                        li.innerHTML = enligne(l.replace(/^-\s*/, ''));
                        liste.appendChild(li);
                    });
                    dans.appendChild(liste);
                    break;
                case 'TABLE':
                    tableau(tete, reste, dans);
                    break;
                case 'EXF':
                    var f = document.createElement('p');
                    f.className = 'mo-ex-field';
                    f.textContent = tete;
                    dans.appendChild(f);
                    reste.forEach(function (l) {
                        if (l.indexOf('- ') === 0) {
                            var ul2 = dans.lastElementChild;
                            if (!ul2 || ul2.tagName !== 'UL') {
                                ul2 = document.createElement('ul');
                                dans.appendChild(ul2);
                            }
                            var li2 = document.createElement('li');
                            li2.innerHTML = enligne(l.slice(2));
                            ul2.appendChild(li2);
                        } else {
                            para(l, dans);
                        }
                    });
                    break;
                default:
                    para(texte, dans);
            }
        });
    }

    // ══════════ en-tête, sommaire, navigation ══════════
    function enTete() {
        var h = document.getElementById('moHead');
        h.textContent = '';

        var k = document.createElement('span');
        k.className = 'kicker';
        k.textContent = PARCOURS.code + ' · ' + tt('fo.module', 'Module') + ' ' + MODULE.numero;

        var t = document.createElement('h1');
        t.textContent = MODULE.titre;

        var o = document.createElement('p');
        o.className = 'objectif';
        o.textContent = MODULE.objectif;

        var meta = document.createElement('div');
        meta.className = 'meta';
        [MODULE.chapitres.length + ' ' + tt('fo.chapters', 'chapitres'),
         MODULE.minutes + ' min',
         tt('fo.level.' + PARCOURS.slug, PARCOURS.slug)].forEach(function (txt) {
            var s = document.createElement('span');
            s.textContent = txt;
            meta.appendChild(s);
        });

        h.appendChild(k); h.appendChild(t); h.appendChild(o); h.appendChild(meta);
        document.title = MODULE.titre + ' — TapeSense';
    }

    function sommaire() {
        var a = document.getElementById('moAside');
        a.textContent = '';

        var code = document.createElement('span');
        code.className = 'mo-aside-code';
        code.textContent = PARCOURS.code;

        var h2 = document.createElement('h2');
        h2.textContent = tt('fo.level.' + PARCOURS.slug, PARCOURS.slug);

        var ol = document.createElement('ol');
        PARCOURS.modules.forEach(function (m) {
            var li = document.createElement('li');
            var lien = document.createElement('a');
            lien.href = 'module.html?p=' + PARCOURS.slug + '&m=' + m.numero;
            lien.textContent = m.titre;
            if (m.numero === NUM) lien.className = 'is-on';
            li.appendChild(lien);
            ol.appendChild(li);
        });

        a.appendChild(code); a.appendChild(h2); a.appendChild(ol);
    }

    function suite() {
        var n = document.getElementById('moNext');
        n.textContent = '';
        var prec = PARCOURS.modules.filter(function (m) { return m.numero === NUM - 1; })[0];
        var suiv = PARCOURS.modules.filter(function (m) { return m.numero === NUM + 1; })[0];

        function lien(m, classe, label) {
            var a = document.createElement('a');
            a.href = 'module.html?p=' + PARCOURS.slug + '&m=' + m.numero;
            a.className = classe;
            var s = document.createElement('span');
            s.textContent = label;
            var b = document.createElement('b');
            b.textContent = m.titre;
            a.appendChild(s); a.appendChild(b);
            return a;
        }
        if (prec) n.appendChild(lien(prec, 'precedent', tt('mo.prev', '← Module précédent')));
        if (suiv) n.appendChild(lien(suiv, 'suivant', tt('mo.next', 'Module suivant →')));
    }

    // ══════════ chargement du contenu ══════════
    function mur(etat) {
        var b = document.getElementById('moBody');
        b.textContent = '';
        var d = document.createElement('div');
        d.className = 'mo-wall';
        var h = document.createElement('h2');
        h.textContent = tt('fo.wallTitle', 'Cette partie est réservée aux abonnés.');
        var p = document.createElement('p');
        p.textContent = etat === 'anonyme'
            ? tt('fo.wallAnon', 'Connecte-toi pour vérifier ton accès.')
            : tt('fo.wallNone', "Ton compte n'a pas d'abonnement actif.");
        var a = document.createElement('a');
        a.className = 'btn-primary';
        a.href = etat === 'anonyme'
            ? '../authentification/authentification.html'
            : '../abonnement/abonnement.html';
        a.textContent = etat === 'anonyme'
            ? tt('nav.login', 'Se connecter') : tt('nav.subscription', "Voir l'abonnement");
        d.appendChild(h); d.appendChild(p); d.appendChild(a);
        b.appendChild(d);
        document.getElementById('moNext').textContent = '';
    }

    function erreur(texte) {
        var b = document.getElementById('moBody');
        b.textContent = '';
        var p = document.createElement('p');
        p.className = 'mo-loading';
        p.textContent = texte;
        b.appendChild(p);
    }

    async function charger(etat) {
        if (etat !== 'actif') { mur(etat); return; }

        var b = document.getElementById('moBody');
        var res = await supabaseClient
            .from('formation_chapitres')
            .select('numero, titre, corps, ordre')
            .eq('parcours', SLUG)
            .eq('module', NUM)
            .order('ordre', { ascending: true });

        if (res.error) {
            erreur(tt('mo.error', 'Le contenu n’a pas pu être chargé.') + ' ' + res.error.message);
            return;
        }
        if (!res.data || !res.data.length) {
            // La RLS renvoie zéro ligne à un non-abonné : pas une erreur,
            // un refus. On le dit comme tel.
            mur('sans-abonnement');
            return;
        }

        b.textContent = '';
        res.data.forEach(function (c) {
            if (c.numero === 'EX') {
                var ex = document.createElement('section');
                ex.className = 'mo-ex';
                var k = document.createElement('p');
                k.className = 'mo-ex-kicker';
                k.textContent = tt('mo.exercise', 'Exercice');
                var h = document.createElement('h2');
                h.textContent = c.titre;
                ex.appendChild(k); ex.appendChild(h);
                rendre(c.corps, ex);
                b.appendChild(ex);
                return;
            }
            var sec = document.createElement('section');
            sec.className = 'mo-chap';
            sec.id = 'c' + c.numero.replace('.', '-');
            var h2 = document.createElement('h2');
            var num = document.createElement('span');
            num.className = 'num';
            num.textContent = c.numero;
            h2.appendChild(num);
            h2.appendChild(document.createTextNode(c.titre));
            sec.appendChild(h2);
            rendre(c.corps, sec);
            b.appendChild(sec);
        });
    }

    // ══════════ montage ══════════
    function monter() {
        if (!PARCOURS || !MODULE) {
            erreur(tt('mo.unknown', 'Ce module est introuvable.'));
            return;
        }
        enTete();
        sommaire();
        suite();
        charger(window.ttFormationEtat || 'anonyme');
        if (typeof ttApplyTranslations === 'function') {
            ttApplyTranslations(typeof ttGetLang === 'function' ? ttGetLang() : 'fr');
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', monter);
    } else {
        monter();
    }

    window.addEventListener('tt:formationaccess', function (e) { charger(e.detail.etat); });
})();
