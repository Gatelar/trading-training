// ============ FORMATION ============
// Tout ce qui s'affiche vient de data/formation-index.js, généré depuis
// formation/contenu*/ : aucun titre, aucune durée n'est écrit à la main.
//
// La section entière est réservée aux abonnés. Ce fichier pilote l'affichage ;
// la protection réelle est la RLS de supabase/sql/008_formation_rls.sql.

(function () {
    'use strict';

    if (typeof FORMATION_INDEX === 'undefined') return;

    function tt(cle, repli) {
        var lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        var e = typeof I18N_DICT !== 'undefined' ? I18N_DICT[cle] : null;
        return e ? (e[lang] || e.fr) : repli;
    }

    // ══════════ 1. LE RUBAN ══════════
    // Trois plans. Le nombre de marques de chaque plan est le nombre réel de
    // chapitres du parcours : 29, 28 et 26. La profondeur porte une donnée.
    function ruban(hote, parcours) {
        if (typeof THREE === 'undefined' || !hote) return null;
        var REDUIT = matchMedia('(prefers-reduced-motion: reduce)').matches;

        var ACCENT = new THREE.Color('#CDFC8A');
        var DOWN = new THREE.Color('#FF5C5C');
        var BG = 0x10140f;

        var scene = new THREE.Scene();
        scene.background = new THREE.Color(BG);
        scene.fog = new THREE.Fog(BG, 14, 52);

        var camera = new THREE.PerspectiveCamera(38, 1, 0.1, 120);
        camera.position.set(0, 2.3, 15.5);

        var renderer = new THREE.WebGLRenderer({ antialias: true });
        renderer.setPixelRatio(Math.min(devicePixelRatio, 2));
        hote.appendChild(renderer.domElement);

        function rng(g) {
            return function () {
                g = (g * 1664525 + 1013904223) % 4294967296;
                return g / 4294967296;
            };
        }

        function boite(P, C, cx, cy, w, h, d, col) {
            var x0 = cx - w / 2, x1 = cx + w / 2, y0 = cy - h / 2, y1 = cy + h / 2,
                z0 = -d / 2, z1 = d / 2;
            var v = [[x0, y0, z1], [x1, y0, z1], [x1, y1, z1], [x0, y1, z1],
                     [x0, y0, z0], [x1, y0, z0], [x1, y1, z0], [x0, y1, z0]];
            var f = [0, 1, 2, 0, 2, 3, 5, 4, 7, 5, 7, 6, 3, 2, 6, 3, 6, 7,
                     4, 5, 1, 4, 1, 0, 1, 5, 6, 1, 6, 2, 4, 0, 3, 4, 3, 7];
            for (var i = 0; i < f.length; i++) {
                var p = v[f[i]];
                P.push(p[0], p[1], p[2]);
                C.push(col.r, col.g, col.b);
            }
        }

        // Marche aléatoire déterministe. Ce n'est pas un prix réel, et rien
        // dans la page ne le présente comme tel.
        function bande(graine, n, pas, amp, larg) {
            var r = rng(graine), P = [], C = [], prix = 0, closes = [], i;
            for (i = 0; i < n; i++) { prix += (r() - 0.5) * amp; closes.push(prix); }
            var moy = closes.reduce(function (a, b) { return a + b; }, 0) / n;
            for (var rep = 0; rep < 2; rep++) {
                for (i = 0; i < n; i++) {
                    var x = (i + rep * n) * pas;
                    var o = (i ? closes[i - 1] : closes[0]) - moy;
                    var c = closes[i] - moy;
                    var col = c >= o ? ACCENT : DOWN;
                    boite(P, C, x, (o + c) / 2, larg, Math.max(Math.abs(c - o), 0.11), larg, col);
                    boite(P, C, x, (o + c) / 2, larg * 0.13,
                          Math.abs(c - o) + 0.16 + r() * 0.55, larg * 0.13, col);
                }
            }
            var g = new THREE.BufferGeometry();
            g.setAttribute('position', new THREE.Float32BufferAttribute(P, 3));
            g.setAttribute('color', new THREE.Float32BufferAttribute(C, 3));
            return { geo: g, span: n * pas };
        }

        var REGLAGE = [
            { z: 0,   pas: 0.72, larg: 0.15, amp: 1.15, op: 1.00, graine: 8123 },
            { z: -10, pas: 0.52, larg: 0.11, amp: 0.95, op: 0.34, graine: 5507 },
            { z: -20, pas: 0.38, larg: 0.08, amp: 0.80, op: 0.16, graine: 3391 }
        ];

        var bandes = parcours.map(function (p, i) {
            var s = REGLAGE[i];
            var b = bande(s.graine, p.totalChapitres, s.pas, s.amp, s.larg);
            var mat = new THREE.MeshBasicMaterial({
                vertexColors: true, transparent: true, opacity: s.op });
            var mesh = new THREE.Mesh(b.geo, mat);
            mesh.position.set(-b.span / 2, 0, s.z);
            scene.add(mesh);

            var lg = new THREE.BufferGeometry().setAttribute('position',
                new THREE.Float32BufferAttribute([-b.span, 0, s.z, b.span * 2, 0, s.z], 3));
            scene.add(new THREE.Line(lg, new THREE.LineBasicMaterial({
                color: 0xCDFC8A, transparent: true, opacity: 0.10 * s.op })));

            return { mesh: mesh, mat: mat, span: b.span, z0: s.z, op0: s.op, x0: -b.span / 2 };
        });

        var actif = 0, mx = 0, my = 0, vivant = true;

        function taille() {
            var r = hote.getBoundingClientRect();
            if (!r.width) return;
            camera.aspect = r.width / r.height;
            camera.updateProjectionMatrix();
            renderer.setSize(r.width, r.height);
        }
        taille();
        addEventListener('resize', taille);

        addEventListener('mousemove', function (e) {
            mx = e.clientX / innerWidth - 0.5;
            my = e.clientY / innerHeight - 0.5;
        });

        // on cesse de dessiner dès que l'en-tête sort de l'écran
        if ('IntersectionObserver' in window) {
            new IntersectionObserver(function (ents) {
                vivant = ents[0].isIntersecting;
            }, { threshold: 0 }).observe(hote);
        }

        var dernier = performance.now();
        function image(now) {
            var dt = Math.min((now - dernier) / 1000, 0.05);
            dernier = now;
            if (vivant) {
                bandes.forEach(function (t, i) {
                    if (!REDUIT) {
                        t.mesh.position.x -= (0.85 - i * 0.16) * dt;
                        if (t.mesh.position.x < t.x0 - t.span) t.mesh.position.x += t.span;
                    }
                    var zc = t.z0 + (i === actif ? 5.5 : 0);
                    var oc = i === actif ? Math.min(1, t.op0 + 0.62) : t.op0;
                    t.mesh.position.z += (zc - t.mesh.position.z) * Math.min(1, dt * 3.4);
                    t.mat.opacity += (oc - t.mat.opacity) * Math.min(1, dt * 3.4);
                });
                camera.position.x += (mx * 2.1 - camera.position.x) * Math.min(1, dt * 2.2);
                camera.position.y += ((2.3 - my) - camera.position.y) * Math.min(1, dt * 2.2);
                camera.lookAt(0, 1.35, -7);
                renderer.render(scene, camera);
            }
            requestAnimationFrame(image);
        }
        requestAnimationFrame(image);

        return { focus: function (i) { actif = i; } };
    }

    // ══════════ 2. LE SOMMAIRE, À DROITE ══════════
    function planes(hote, parcours, rub, cliquable) {
        hote.textContent = '';
        parcours.forEach(function (p, i) {
            var b = document.createElement('button');
            b.type = 'button';
            b.className = 'fo-plane' + (i === 0 ? ' is-on' : '');

            var code = document.createElement('span');
            code.className = 'code';
            code.textContent = p.code;

            var nom = document.createElement('span');
            nom.className = 'name';
            nom.textContent = tt('fo.level.' + p.slug, p.slug);

            var meta = document.createElement('span');
            meta.className = 'meta';
            meta.textContent = p.totalModules + ' ' + tt('fo.modules', 'modules') +
                ' · ' + p.minutes + ' min';

            b.appendChild(code); b.appendChild(nom); b.appendChild(meta);

            function viser() {
                hote.querySelectorAll('.fo-plane').forEach(function (e) {
                    e.classList.toggle('is-on', e === b);
                });
                if (rub) rub.focus(i);
            }
            b.addEventListener('mouseenter', viser);
            b.addEventListener('focus', viser);
            b.addEventListener('click', function () {
                var cible = cliquable && document.getElementById('band-' + p.slug);
                if (cible) cible.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
            hote.appendChild(b);
        });
    }

    // ══════════ 3. LES TROIS BANDES ══════════
    function bandes(hote, parcours) {
        hote.textContent = '';
        parcours.forEach(function (p, i) {
            var sec = document.createElement('section');
            sec.className = 'fo-band fo-band--' + (i + 1);
            sec.id = 'band-' + p.slug;

            var head = document.createElement('div');
            head.className = 'fo-band-head';

            var gauche = document.createElement('div');
            var code = document.createElement('span');
            code.className = 'fo-band-code';
            code.textContent = p.code;
            var h2 = document.createElement('h2');
            h2.textContent = tt('fo.level.' + p.slug, p.slug);
            var acc = document.createElement('p');
            acc.className = 'fo-band-accroche';
            acc.textContent = p.accroche;
            gauche.appendChild(code); gauche.appendChild(h2); gauche.appendChild(acc);

            var stats = document.createElement('div');
            stats.className = 'fo-band-stats';
            [[p.totalModules, tt('fo.modules', 'modules')],
             [p.totalChapitres, tt('fo.chapters', 'chapitres')],
             [p.totalExercices, tt('fo.exercises', 'exercices')],
             [p.minutes + ' min', '']].forEach(function (paire) {
                var l = document.createElement('div');
                var b = document.createElement('b');
                b.textContent = paire[0];
                l.appendChild(b);
                if (paire[1]) l.appendChild(document.createTextNode(' ' + paire[1]));
                stats.appendChild(l);
            });

            head.appendChild(gauche); head.appendChild(stats);
            sec.appendChild(head);

            var grille = document.createElement('div');
            grille.className = 'fo-modules';

            p.modules.forEach(function (m) {
                var carte = document.createElement('article');
                carte.className = 'fo-mod';

                var num = document.createElement('span');
                num.className = 'fo-mod-num';
                num.textContent = tt('fo.module', 'Module') + ' ' + m.numero;

                // le titre ouvre le module : c'est la seule porte d'entrée
                // vers la lecture, autant qu'elle soit là où l'oeil se pose
                var h3 = document.createElement('h3');
                var lien = document.createElement('a');
                lien.className = 'fo-mod-lien';
                lien.href = 'module.html?p=' + p.slug + '&m=' + m.numero;
                lien.textContent = m.titre;
                h3.appendChild(lien);

                var obj = document.createElement('p');
                obj.className = 'fo-mod-obj';
                obj.textContent = m.objectif;

                var meta = document.createElement('div');
                meta.className = 'fo-mod-meta';
                var c1 = document.createElement('span');
                c1.textContent = m.chapitres.length + ' ' + tt('fo.chapters', 'chapitres');
                var c2 = document.createElement('span');
                c2.textContent = m.minutes + ' min';
                meta.appendChild(c1); meta.appendChild(c2);

                var ul = document.createElement('ul');
                ul.className = 'fo-chaps';
                m.chapitres.forEach(function (c) {
                    var li = document.createElement('li');
                    var b = document.createElement('b');
                    b.textContent = c.numero;
                    li.appendChild(b);
                    li.appendChild(document.createTextNode(c.titre));
                    ul.appendChild(li);
                });
                if (m.exercice) {
                    var li = document.createElement('li');
                    var b = document.createElement('b');
                    b.textContent = 'EX';
                    li.appendChild(b);
                    li.appendChild(document.createTextNode(m.exercice));
                    ul.appendChild(li);
                }

                var bouton = document.createElement('button');
                bouton.type = 'button';
                bouton.className = 'fo-mod-toggle';
                bouton.textContent = tt('fo.showChapters', 'Voir les chapitres');
                bouton.setAttribute('aria-expanded', 'false');
                bouton.addEventListener('click', function () {
                    var ouvert = carte.classList.toggle('is-open');
                    bouton.setAttribute('aria-expanded', String(ouvert));
                    bouton.textContent = ouvert
                        ? tt('fo.hideChapters', 'Masquer')
                        : tt('fo.showChapters', 'Voir les chapitres');
                });

                carte.appendChild(num); carte.appendChild(h3); carte.appendChild(obj);
                carte.appendChild(meta); carte.appendChild(bouton); carte.appendChild(ul);
                grille.appendChild(carte);
            });

            sec.appendChild(grille);
            hote.appendChild(sec);
        });
    }

    // ══════════ 4. ACCÈS ══════════
    // Réservé aux abonnés. Un non-abonné voit une page qui existe et qui
    // explique — pas une erreur, pas une redirection.
    function acces(etat) {
        var bands = document.getElementById('foBands');
        var rail = document.querySelector('.fo-search-rail');

        if (etat === 'actif') {
            rail.hidden = false;
            bandes(bands, FORMATION_INDEX);
            planes(document.getElementById('foPlanes'), FORMATION_INDEX, RUBAN, true);
            recherche();
            return;
        }

        rail.hidden = true;
        bands.textContent = '';

        var mur = document.createElement('section');
        mur.className = 'fo-wall';

        var titre = document.createElement('h2');
        titre.textContent = tt('fo.wallTitle', 'Cette partie est réservée aux abonnés.');

        var corps = document.createElement('p');
        corps.textContent = etat === 'anonyme'
            ? tt('fo.wallAnon', "Connecte-toi pour vérifier ton accès. Si ton abonnement est actif, tout s'ouvre ici même.")
            : tt('fo.wallNone', "Ton compte n'a pas d'abonnement actif. Les trois parcours restent fermés tant qu'il ne l'est pas.");

        // On montre le volume, jamais le contenu.
        var chiffres = document.createElement('div');
        chiffres.className = 'fo-wall-stats';
        var totMod = 0, totChap = 0, totMin = 0;
        FORMATION_INDEX.forEach(function (p) {
            totMod += p.totalModules; totChap += p.totalChapitres; totMin += p.minutes;
        });
        [[FORMATION_INDEX.length, tt('fo.tracks', 'parcours')],
         [totMod, tt('fo.modules', 'modules')],
         [totChap, tt('fo.chapters', 'chapitres')],
         [Math.round(totMin / 60) + ' h', tt('fo.reading', 'de lecture')]].forEach(function (paire) {
            var bloc = document.createElement('div');
            var n = document.createElement('b');
            n.textContent = paire[0];
            var l = document.createElement('span');
            l.textContent = paire[1];
            bloc.appendChild(n); bloc.appendChild(l);
            chiffres.appendChild(bloc);
        });

        var a = document.createElement('a');
        a.className = 'btn-primary';
        a.href = etat === 'anonyme'
            ? '../authentification/authentification.html'
            : '../abonnement/abonnement.html';
        a.textContent = etat === 'anonyme'
            ? tt('nav.login', 'Se connecter')
            : tt('nav.subscription', "Voir l'abonnement");

        mur.appendChild(titre); mur.appendChild(corps);
        mur.appendChild(chiffres); mur.appendChild(a);
        bands.appendChild(mur);

        planes(document.getElementById('foPlanes'), FORMATION_INDEX, RUBAN, false);
    }

    // ══════════ 5. RECHERCHE — elle filtre la page ══════════
    // Elle n'existe que pour un abonné : le rail est masqué autrement.
    // Elle porte ici sur ce que la page contient. La recherche plein texte dans
    // le corps des chapitres passe par chercher_formation() (migration 008),
    // en security invoker : un non-abonné n'obtient aucune ligne, sans que le
    // navigateur ait à trier quoi que ce soit.
    function recherche() {
        var champ = document.getElementById('foSearchInput');
        var note = document.getElementById('foSearchNote');
        if (!champ || champ.dataset.pret) return;
        champ.dataset.pret = '1';

        function sansAccent(t) {
            return t.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '');
        }

        function filtrer() {
            var q = sansAccent(champ.value.trim());
            var trouves = 0;

            document.querySelectorAll('.fo-band').forEach(function (bande) {
                var visibles = 0;
                bande.querySelectorAll('.fo-mod').forEach(function (mod) {
                    if (!q) {
                        mod.hidden = false;
                        mod.classList.remove('is-trouve');
                        visibles++;
                        return;
                    }
                    var ok = sansAccent(mod.textContent).indexOf(q) !== -1;
                    mod.hidden = !ok;
                    mod.classList.toggle('is-trouve', ok);
                    if (ok) {
                        visibles++;
                        trouves++;
                        // si la correspondance n'est pas dans le titre ni
                        // l'objectif, elle est dans un chapitre : on l'ouvre
                        var enTete = sansAccent(
                            mod.querySelector('h3').textContent + ' ' +
                            (mod.querySelector('.fo-mod-obj') || { textContent: '' }).textContent
                        ).indexOf(q) !== -1;
                        if (!enTete) mod.classList.add('is-open');
                    }
                });
                bande.hidden = !!q && visibles === 0;
            });

            if (!q) {
                note.textContent = tt('fo.searchHint', 'Tape pour filtrer les dix-huit modules.');
            } else if (trouves === 0) {
                note.textContent = tt('fo.searchNone', 'Aucun module ne correspond.');
            } else {
                note.textContent = trouves + ' ' + (trouves > 1
                    ? tt('fo.searchManyFound', 'modules correspondent')
                    : tt('fo.searchOneFound', 'module correspond'));
            }
        }

        champ.addEventListener('input', filtrer);
        champ.addEventListener('search', filtrer);
        document.getElementById('foSearch').addEventListener('submit', function (e) {
            e.preventDefault();
        });
        addEventListener('keydown', function (e) {
            if (e.key === '/' && document.activeElement !== champ) {
                e.preventDefault();
                champ.focus();
            }
            if (e.key === 'Escape' && document.activeElement === champ) {
                champ.value = '';
                filtrer();
                champ.blur();
            }
        });
        filtrer();
    }

    // ══════════ montage ══════════
    var RUBAN = null;

    function monter() {
        RUBAN = ruban(document.getElementById('foTape'), FORMATION_INDEX);
        acces(window.ttFormationEtat || 'anonyme');
        if (typeof ttApplyTranslations === 'function') {
            ttApplyTranslations(typeof ttGetLang === 'function' ? ttGetLang() : 'fr');
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', monter);
    } else {
        monter();
    }

    window.addEventListener('tt:formationaccess', function (e) {
        var champ = document.getElementById('foSearchInput');
        if (champ) delete champ.dataset.pret;
        acces(e.detail.etat);
    });
    window.addEventListener('tt:langchange', function () {
        var champ = document.getElementById('foSearchInput');
        if (champ) delete champ.dataset.pret;
        acces(window.ttFormationEtat || 'anonyme');
    });
})();
