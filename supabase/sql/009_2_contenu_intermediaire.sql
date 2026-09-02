-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Partie 2 sur 3 : parcours intermediaire.
-- A executer dans l'ordre : la partie 1 vide la table.

begin;

insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 1, '1.1', 'Trente trades, et ce qu''ils ne disent pas', 'HOOK:
Tu as trente trades conformes et un R moyen positif. Le Débutant t''avait demandé d''attendre ce moment pour conclure. Il t''a menti par omission : trente trades ne concluent rien. Ils autorisent seulement à commencer à regarder.

P: La raison tient à une asymétrie entre les deux chiffres que tu suis. Le **taux de conformité** dépend de toi seul : trente observations suffisent largement à savoir si tu appliques tes règles. Le **R moyen** dépend du marché, et le marché est bruyant. Sur trente trades, il produit un chiffre, pas une mesure.

P: C''est exactement pourquoi le chapitre 6.3 du Débutant t''imposait de corriger la conformité en premier. Ce n''était pas une question de discipline morale : c''était la seule des deux grandeurs qu''un petit échantillon permette de mesurer.

P: L''outil qui sépare les deux s''appelle l''**erreur-type** : l''incertitude qui reste sur une moyenne, compte tenu du nombre d''observations. Elle vaut l''écart-type des résultats divisé par la racine carrée du nombre de trades.

CASE: Ton R moyen, avec sa marge
Sur une série à 1R de perte et 3R de gain, l''écart-type des résultats vaut environ **1,9 R**. C''est le chiffre à retenir, il sert dans tout le parcours.
**Sur 30 trades** : erreur-type = 1,9 ÷ √30 = **0,35 R**. Pour un R moyen affiché de +0,52 R, l''intervalle à deux erreurs-types va de **−0,18 à +1,22 R**. Il contient zéro. Ton système pourrait être perdant.
**Sur 100 trades** : erreur-type = 1,9 ÷ √100 = **0,19 R**. Le même +0,52 R donne un intervalle de **+0,14 à +0,90 R**. Le signe est enfin établi.
Le chiffre affiché n''a pas bougé. Ce qui a changé, c''est ce que tu as le droit d''en dire.

ERR: L''erreur classique
Annoncer son R moyen comme un fait. Trente trades donnent un nombre exact — c''est bien ce qui s''est passé — et une mesure fausse — ce n''est pas ce qui se passera. Les deux affirmations coexistent, et confondre la première avec la seconde est la faute fondatrice de ce niveau.

KEY: À retenir
- Trente trades mesurent ta conformité, pas ton espérance.
- Erreur-type = écart-type ÷ racine de n. Quadrupler l''échantillon divise l''incertitude par deux.
- Tant que ton intervalle contient zéro, tu n''as rien démontré.', 1);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 1, '1.2', 'Série ou signal', 'HOOK:
Six pertes d''affilée. Tu modifies quelque chose. C''est là que la plupart des gens détruisent un système qui fonctionnait — et le calcul dit qu''ils avaient tort de bouger.

P: Le chapitre 6.2 du Débutant te demandait de ne pas changer de méthode sur une série courte. Il te le demandait au nom du bon sens. Tu peux désormais le vérifier au lieu de le croire.

P: Le principe : avant d''attribuer un sens à un motif, demande-toi combien d''occasions ce motif avait de survenir. Une série de six pertes est spectaculaire quand elle t''arrive. Elle est banale quand on compte le nombre de positions où elle pouvait démarrer.

P: Le calcul exact est fastidieux ; une approximation suffit largement pour l''usage qu''on en fait ici, et elle donne le bon ordre de grandeur.

CASE: Ce que la variance produit toute seule
Système à 40 % de réussite, donc 60 % de pertes. Sur une séquence de 100 trades :
Probabilité qu''une série d''**au moins 6 pertes consécutives** apparaisse quelque part : environ **84 %**.
Probabilité pour une série d''**au moins 8** : environ **47 %**.
Autrement dit : une série de six est presque garantie sur cent trades, et une série de huit tombe à pile ou face. Ce ne sont pas des accidents. Ce sont les motifs que produit un système parfaitement sain.
*(Approximation de Poisson sur le nombre de séries attendues. L''ordre de grandeur est fiable, la décimale ne l''est pas.)*

ERR: L''erreur classique
Chercher une explication à une série. Le cerveau est excellent pour trouver des causes, et il en trouvera : un changement de volatilité, une actualité, une baisse d''attention. Ces explications sont plausibles, gratuites, et le plus souvent fausses. Le seul test valable est le nombre d''occasions.

KEY: À retenir
- Une série de six pertes sur cent trades est attendue dans plus de huit cas sur dix.
- Avant d''interpréter un motif, compte combien d''occasions il avait de survenir.
- Le signal d''alerte n''est jamais une série : c''est un écart qui persiste sur un sous-échantillon entier.', 2);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 1, '1.3', 'Segmenter son journal', 'HOOK:
Ton R moyen global est un mélange. Il additionne tes achats et tes ventes, tes deux actifs, tes matins et tes soirs. Séparer ce mélange une seule fois t''apprend plus que trois mois de trades supplémentaires.

P: La **segmentation** consiste à découper ton échantillon selon un critère unique et à comparer les sous-échantillons obtenus. Les critères utiles à ce niveau sont peu nombreux : le sens de la position, l''actif, le moment de la journée, le régime de marché, la conformité.

P: Une contrainte gouverne tout l''exercice : **un seul critère à la fois**. Deux critères croisés sur soixante trades produisent des cases de quinze, où le chapitre 1.1 t''a montré que l''incertitude dépasse largement l''effet cherché.

P: Et un écart entre deux sous-échantillons ne se compare pas à zéro. Il se compare à l''erreur-type de la différence, qui vaut l''écart-type multiplié par la racine de la somme des inverses des effectifs.

CASE: Un écart qui n''en est peut-être pas un
Journal de 60 trades conformes, R moyen global **+0,45 R**.
Segmenté par sens : **achats** (34 trades) **+0,78 R** · **ventes** (26 trades) **+0,02 R**.
Écart apparent : **0,76 R**. Impressionnant.
Erreur-type de la différence : 1,9 × √(1/34 + 1/26) = 1,9 × 0,26 = **0,49 R**.
L''écart vaut donc **1,5 erreur-type**. C''est suggestif. Ce n''est pas établi — il faudrait deux erreurs-types, soit un écart de 0,98 R.
Conclusion : on écrit l''hypothèse, on ne touche à rien, et on la teste au module suivant.

ERR: L''erreur classique
Segmenter jusqu''à trouver. En découpant assez longtemps, un sous-échantillon brillant finit toujours par apparaître. C''est le surapprentissage du module 2 appliqué à ton propre journal — et c''est sa forme la plus séduisante, parce que ce sont tes données et que tu leur fais confiance.

KEY: À retenir
- Un seul critère de segmentation à la fois. Jamais deux croisés.
- Un écart se compare à son erreur-type, jamais à zéro.
- Une segmentation produit une hypothèse. Elle ne produit pas une décision.', 3);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 1, '1.4', 'Ce que tu ne peux pas conclure', 'HOOK:
Le résultat le plus fréquent d''une bonne analyse de journal est « je ne sais pas encore ». Ce n''est pas un échec de l''analyse. C''est ce qu''elle est censée produire la plupart du temps.

P: Trois conclusions sont possibles au sortir d''une analyse. Un **effet établi** — rare. Une **hypothèse à tester** — fréquent. Et **rien** — le cas le plus courant de tous. Savoir nommer le troisième est la compétence de ce module.

P: La difficulté n''est pas technique, elle est psychologique. Tu viens de passer du temps sur cette analyse, et la tentation est de produire une conclusion proportionnelle à l''effort fourni. Une heure de travail semble mériter mieux que « rien ».

P: Ce que la retenue achète est pourtant considérable : elle laisse ton système intact assez longtemps pour qu''il devienne mesurable. C''est la conformité du Débutant, transposée à l''échelle du mois.

CASE: Un module entier, zéro décision
Reprends les trois analyses conduites ici.
**Le R moyen sur 30 trades** : intervalle contenant zéro. Aucune décision.
**La série de six pertes** : attendue dans 84 % des cas. Aucune décision.
**La segmentation par sens** : écart à 1,5 erreur-type. Une hypothèse, pas une décision.
Trois analyses, un module de travail, **zéro modification**. Une seule ligne à écrire : *« hypothèse : ventes moins performantes que achats, à tester »*.
C''est le rendement normal de ce travail. Il paraît faible. Il est très supérieur à celui d''une modification injustifiée.

ERR: L''erreur classique
Transformer une hypothèse en règle. Entre « les ventes semblent moins bien marcher » et « je ne vends plus », il y a exactement le protocole du module suivant. Sauter cette étape revient à ajouter une règle non testée à un système qui en comptait sept testées.

KEY: À retenir
- Trois conclusions possibles : effet établi, hypothèse à tester, rien. La troisième domine.
- Une analyse qui ne conclut pas a fait son travail.
- Écris l''hypothèse. Ne change pas la règle.', 4);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 1, 'EX', 'Ce que dit vraiment ton relevé', 'EXF: Compétence évaluée
Objectifs 13 et 14 : déterminer si un écart relève de la variance ou d''un effet réel ; segmenter un journal selon un critère unique et comparer les sous-échantillons.

EXF: Consigne
**Étape A.** Un journal de 60 trades t''est fourni. Calcule le R moyen et son erreur-type, puis dis si le signe du résultat est établi.
**Étape B.** Segmente ce journal selon un critère au choix parmi trois. Compare les deux sous-échantillons et exprime l''écart en erreurs-types.
**Étape C.** Applique la même démarche à ton propre journal du parcours Débutant, puis choisis ta conclusion parmi trois formulations imposées.

EXF: Ce que la plateforme doit fournir
- Un journal fourni de 60 trades en table triable, reprenant les sept champs du Débutant plus deux colonnes : sens de la position et session.
- Une calculatrice intégrée qui affiche R moyen, écart-type et erreur-type dès que la sélection change. L''utilisateur choisit la sélection, la machine calcule : la compétence évaluée est l''interprétation, pas l''arithmétique.
- Un seul critère de segmentation activable à la fois. L''interface **refuse** le second et affiche pourquoi.
- Étape C : import du journal Débutant de l''utilisateur. **Repli obligatoire** si ce journal est indisponible ou compte moins de 30 trades conformes — un second journal fourni, présenté comme celui d''un autre utilisateur, avec la même mécanique. L''exercice doit rester complet dans les deux cas.
- Trois formulations de conclusion sélectionnables — « effet établi », « hypothèse à tester », « rien de concluant » — plus un champ libre de 120 caractères.

EXF: Correction commentée
**Étape A.** R moyen +0,45 R, erreur-type 0,25 R, intervalle de −0,04 à +0,94 R. Le signe **n''est pas** établi. La majorité des utilisateurs répond que si, parce que le chiffre est positif et que soixante trades paraissent beaucoup. Soixante trades, ce n''est pas beaucoup.
**Étape B.** Par sens, l''écart vaut 1,5 erreur-type : hypothèse. Par actif, l''écart est faible : rien. Par session, le piège est ailleurs — le sous-échantillon « soir » ne compte que 9 trades, et son erreur-type dépasse 0,6 R. Choisir ce critère et en tirer une conclusion est l''erreur attendue, et l''interface doit afficher l''effectif assez gros pour que l''utilisateur ne puisse pas dire qu''il ne l''avait pas vu.
**Étape C.** Pour la quasi-totalité des utilisateurs, les seules réponses correctes sont « hypothèse à tester » ou « rien de concluant ». Cocher « effet établi » sur trente à soixante trades est faux, quel que soit le chiffre obtenu — et c''est vrai même si le chiffre est excellent. Surtout s''il est excellent.', 5);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, '2.1', 'Une hypothèse, pas une intuition', 'HOOK:
« Les ventes marchent moins bien » n''est pas testable. « Sur EUR/USD en H1, mes ventes ont un R moyen inférieur d''au moins 0,3 R à mes achats » l''est. Trois précisions séparent les deux formulations.

P: Une hypothèse exploitable comporte un **périmètre** — quel actif, quelle unité de temps, dans quelles conditions —, une **grandeur mesurée** — R moyen, taux de réussite, taux de conformité — et un **seuil chiffré**.

P: Le seuil est celui qu''on oublie, et c''est le seul qui rende le test réel. Sans lui, n''importe quel résultat confirme : une amélioration de 0,01 R suffira à te faire dire que ça marche.

P: Tu reconnais la propriété. Le chapitre 4.1 du Débutant exigeait qu''un scénario puisse être démenti par un prix précis. C''est la même exigence, appliquée à une règle plutôt qu''à un trade : une hypothèse qu''aucun résultat ne peut réfuter n''est pas une hypothèse.

CASE: La même idée, trois fois
**« Le RSI aide. »** Ni périmètre, ni grandeur, ni seuil. Rien à tester.
**« Le RSI améliore mes résultats. »** Une grandeur vague, aucun seuil. Tout résultat positif confirmera, y compris +0,01 R.
**« Sur EUR/USD en H4, filtrer mes achats par un RSI supérieur à 50 augmente mon R moyen d''au moins 0,25 R sur 100 trades. »** Périmètre, grandeur, seuil, échantillon. Réfutable, donc testable.
La troisième formulation prend vingt secondes de plus à écrire. C''est la seule qui produira une information.

ERR: L''erreur classique
Formuler l''hypothèse après avoir vu les données. C''est la faute la plus discrète de ce niveau : tu regardes ton journal, tu remarques quelque chose, tu formules, puis tu « testes » — sur les données mêmes qui ont suggéré l''idée. Le test ne peut que confirmer. Il ne mesure rien d''autre que ta capacité à repérer un motif que tu viens de repérer.

KEY: À retenir
- Une hypothèse testable = périmètre + grandeur mesurée + seuil chiffré.
- Sans seuil, tout résultat confirme.
- L''hypothèse s''écrit avant de regarder les données qui la testeront.', 6);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, '2.2', 'L''échantillon', 'HOOK:
Trente trades, cent trades, cinq cents. Ces nombres circulent sans justification. Voici d''où ils sortent — et surtout pourquoi celui dont tu as besoin dépend entièrement de la taille de l''effet que tu cherches.

P: La logique est celle du chapitre 1.1, retournée. Tu sais que l''incertitude sur une moyenne vaut deux erreurs-types. Pour qu''un effet soit détectable, il faut donc que cet effet dépasse deux erreurs-types.

P: Cela donne une condition simple : **n supérieur à (2 × écart-type ÷ effet)²**. Avec l''écart-type de 1,9 R installé au module 1, elle se calcule de tête.

TABLE: 40,30,30 || Effet que tu cherches | Trades nécessaires | Durée à 3 trades/semaine
0,5 R | 58 | 5 mois
0,3 R | 160 | 1 an
0,2 R | 361 | 2 ans et demi
0,1 R | 1 444 | 9 ans

CASE: La ligne qui devrait te faire renoncer
Un effet de **0,1 R** demande environ **1 444 trades**. À trois trades conformes par semaine, c''est **neuf années**.
Cet effet existe peut-être. Il est peut-être même réel et stable. Tu ne le vérifieras jamais : le temps qu''il te faudrait pour l''établir dépasse la durée de vie de la plupart des méthodes, et de la plupart des traders particuliers.
La conclusion n''est pas décourageante, elle est libératrice : tu peux cesser de chercher des raffinements. Seuls les effets grossiers sont à ta portée.

ERR: L''erreur classique
Chercher de petits avantages. Le niveau intermédiaire est attiré par le réglage fin — un filtre qui ajoute 0,1 R, une condition supplémentaire qui améliore « un peu ». Même parfaitement réels, ces effets sont invérifiables à ton échelle. Un avantage que tu ne peux pas mesurer n''est pas un avantage, c''est une croyance.

KEY: À retenir
- n > (2 × écart-type ÷ effet)². Retiens la forme, pas la formule.
- Un effet de 0,3 R demande environ 160 trades, soit un an à ton rythme.
- En dessous de 0,2 R, rien n''est mesurable à ton échelle. N''en cherche pas.', 7);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, '2.3', 'Couper ses données en deux', 'HOOK:
Tu construis ta règle sur des données. Tu la testes sur les mêmes données. Elle fonctionne. Évidemment qu''elle fonctionne : tu l''as fabriquée pour ça.

P: La parade tient en deux mots. L''**échantillon de construction** est celui où tu cherches, où tu ajustes, où tu as le droit de te tromper autant de fois que tu veux. L''**échantillon de contrôle** est celui où tu vérifies — et tu ne le regardes qu''une fois.

P: Cette unicité est la règle entière. Si tu retournes ajuster ta règle après avoir vu le contrôle, il cesse d''être un contrôle : il rejoint l''échantillon de construction, et tu n''as plus rien pour vérifier quoi que ce soit.

P: La coupure se fait **par le temps**, jamais au hasard. Les marchés changent de comportement selon les époques ; un découpage aléatoire mélange les périodes et flatte systématiquement le résultat, parce que chaque morceau contient un peu de tout.

CASE: L''écart qui mesure ton ajustement
200 situations rejouées sur EUR/USD, coupées chronologiquement : les 140 premières en construction, les 60 dernières en contrôle.
Règle ajustée sur la construction : **+0,61 R**.
La même règle appliquée au contrôle : **+0,12 R**.
L''écart entre les deux n''est pas un accident : c''est la mesure de ce que ton ajustement a fabriqué. Sur les 0,61 R obtenus, environ 0,49 R étaient du bruit taillé sur mesure.
Reste 0,12 R. Sur 60 trades, l''erreur-type vaut 0,25 R. Ce résidu est indiscernable de zéro.

ERR: L''erreur classique
Recommencer après un mauvais contrôle. « Je réajuste un peu et je retesterai. » À cette seconde précise, ton contrôle est mort et tu n''as plus aucun moyen de vérifier la nouvelle version. Il te faut alors de nouvelles données, pas de nouveaux réglages — et des données, tu n''en as pas en réserve.

KEY: À retenir
- Construction et contrôle. La coupure se fait par le temps, jamais au hasard.
- Le contrôle se regarde une seule fois. Après, il n''existe plus.
- L''écart entre les deux mesure exactement ce que ton ajustement a fabriqué.', 8);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, '2.4', 'Le surapprentissage', 'HOOK:
Bailey et ses coauteurs ont établi un chiffre qui devrait figurer sur l''écran d''accueil de tous les logiciels de test : avec cinq ans de données, quarante-cinq essais suffisent à produire une stratégie brillante et parfaitement vide.

P: Le **surapprentissage** consiste à ajuster une règle au bruit d''un échantillon plutôt qu''à sa structure. Le mécanisme est mécanique : chaque configuration essayée augmente la probabilité qu''au moins l''une d''elles paraisse excellente par pur hasard.

P: L''énoncé exact, tiré de leurs travaux : *« If only five years of data are available, no more than forty-five independent model configurations should be tried or we are almost guaranteed to produce strategies with an annualized Sharpe ratio in-sample of 1 but an expected Sharpe ratio out-of-sample of zero. »*

P: La conséquence pratique est brutale. **Le nombre d''essais est une donnée du test**, au même titre que le résultat. Un test dont on ignore le nombre de configurations essayées n''est pas interprétable — pas « moins fiable » : pas interprétable du tout.

P: Deux autres travaux confirment l''ordre de grandeur. Bajgrowicz et Scaillet ont testé **7 846 règles** sur 114 ans du Dow Jones : aucun investisseur n''aurait pu sélectionner à l''avance les futures meilleures, et la performance mesurée est intégralement effacée par des coûts de transaction même faibles. Harvey, Liu et Zhu, sur 316 facteurs, montrent qu''un seuil statistique habituel devient insuffisant dès que les tests se multiplient.

CASE: Compte tes essais, tu vas être surpris
Tu décides de tester « une moyenne mobile ». Une seule idée, en apparence.
Périodes essayées : 20, 50, 100, 200. → **4**
Unités de temps : H1 et H4. → × 2 = **8**
Filtre au-dessus ou en dessous de la moyenne. → × 2 = **16**
Deux actifs : EUR/USD et BTC/USD. → × 2 = **32**
Tu n''as testé « qu''une moyenne mobile », et tu viens de faire **32 essais**. La limite de Bailey pour cinq ans de données est à 45. Tu y es presque, et tu n''as encore ajouté aucun autre outil.

ERR: L''erreur classique
Ne pas compter les essais abandonnés. Les configurations que tu as essayées puis écartées comptent toutes, sans exception. C''est précisément parce qu''elles ont été écartées que celle qui reste paraît bonne — elle est la meilleure d''un concours dont tu as oublié de compter les participants.

KEY: À retenir
- Le nombre de configurations essayées est une donnée du test. Note-le avant de commencer.
- Cinq ans de données, quarante-cinq essais : au-delà, le résultat est du bruit habillé.
- Une configuration abandonnée compte autant qu''une configuration retenue.', 9);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, '2.5', 'Le critère d''abandon', 'HOOK:
Écris ce qui te ferait renoncer, avant de commencer. Sans cette ligne, tu ne testes rien : tu cherches une raison de continuer, et tu finiras par la trouver.

P: Le **critère d''abandon** est la valeur, fixée à l''avance, en dessous de laquelle l''idée est jetée. Sa fonction est de rendre le test symétrique : sans lui, seuls les résultats favorables déclenchent une conclusion, et les autres déclenchent un réajustement.

P: Il porte sur trois choses simultanément, et les trois se décident avant : le **seuil de résultat**, la **taille d''échantillon**, et le **nombre d''essais autorisés**. Dépasser l''un des trois annule le test.

P: C''est l''invalidation du chapitre 4.1 du Débutant, transposée d''un cran. Là, tu écrivais le prix qui te donnerait tort sur un trade. Ici, tu écris le chiffre qui te donnera tort sur une idée.

CASE: Quatre lignes qui valent plus que le test
**Hypothèse** — sur EUR/USD H4, filtrer les achats par une moyenne mobile 50 augmente le R moyen d''au moins 0,3 R.
**Échantillon** — 200 situations, coupées 140 / 60 par ordre chronologique.
**Essais autorisés** — 4 périodes au maximum. Au-delà, le test est annulé et non recommencé.
**Critère d''abandon** — si le contrôle donne moins de +0,15 R d''amélioration, l''idée est jetée et n''est pas réessayée avant six mois.
Ces quatre lignes prennent trois minutes. Elles valent davantage que les deux heures de test qui suivent, parce qu''elles seules empêchent le test de se transformer en recherche de confirmation.

ERR: L''erreur classique
Assouplir le critère quand le résultat s''en approche. « 0,14 R, c''est presque 0,15 R. » Un critère assoupli une fois ne contraindra plus jamais, et tu viens de dépenser 200 situations irremplaçables pour rien. Le seuil a justement été fixé à froid pour que cette discussion n''ait pas lieu à chaud.

KEY: À retenir
- Écris le seuil, l''échantillon et le nombre d''essais autorisés avant de lancer.
- Un test sans critère d''abandon n''est pas un test.
- Note la date d''abandon d''une idée. C''est ce qui t''empêche de la réessayer dans trois semaines.', 10);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 2, 'EX', 'Le test que tu ne truques pas', 'EXF: Compétence évaluée
Objectifs 15, 16, 17 et 18 : formuler une hypothèse testable, séparer construction et contrôle, compter ses essais, écrire et respecter un critère d''abandon.

EXF: Consigne
**Étape A.** Formule ton hypothèse : périmètre, grandeur mesurée, seuil.
**Étape B.** Fixe l''échantillon, le nombre d''essais autorisés et le critère d''abandon.
**Étape C.** Le simulateur rejoue 140 situations. Tu appliques ta règle sur chacune.
**Étape D.** Le simulateur rejoue les 60 situations de contrôle. Une seule fois.
**Étape E.** Conclus : je garde, ou j''abandonne — avec le chiffre.
Puis la plateforme compare ton résultat à ce qu''aurait produit le hasard sur le même échantillon.

EXF: Ce que la plateforme doit fournir
- Un formulaire d''hypothèse à trois champs contraints. Le bouton de validation reste **inactif tant que le seuil chiffré est vide**.
- Un compteur d''essais affiché en permanence, incrémenté automatiquement à chaque modification de paramètre et **jamais réinitialisable**.
- Le rejeu de 140 situations en construction : pour chacune, l''utilisateur décide « je prends / je ne prends pas », et le résultat en R s''affiche après sa réponse.
- Le rejeu des 60 situations de contrôle, accessible **une seule fois**, verrouillé définitivement après consultation.
- **La comparaison au hasard**, qui est le cœur de l''exercice : la plateforme rejoue le même échantillon de contrôle avec une décision aléatoire, 200 fois, et affiche la distribution des R moyens obtenus. Le résultat de l''utilisateur est positionné dans cette distribution.
- **Repli** si le rejeu interactif de 200 situations est trop lourd : un jeu de 200 résultats pré-calculés, l''utilisateur décidant sur des situations statiques présentées en série. La comparaison au hasard doit être conservée dans tous les cas — sans elle, l''exercice perd tout son enseignement.

EXF: Correction commentée
Le contrôle donne un résultat nettement inférieur à la construction. C''est construit ainsi, et c''est représentatif.
Le point de bascule est la comparaison au hasard. Sur les 200 tirages aléatoires, la distribution des R moyens s''étale typiquement de −0,4 à +0,4 R. Le résultat de l''utilisateur tombe presque toujours à l''intérieur — c''est-à-dire qu''il est indiscernable d''une décision prise au hasard sur les mêmes situations.
La conclusion attendue est **j''abandonne**. La majorité des utilisateurs écrit pourtant « je garde », pour deux raisons cumulées : le chiffre est positif, et l''exercice a coûté du temps. C''est exactement le biais que le critère d''abandon existe pour neutraliser — et ce critère avait été écrit à l''étape B, par l''utilisateur lui-même, vingt minutes plus tôt.
Le second enseignement est dans le compteur. La plupart des utilisateurs arrivent à l''étape D avec plus de vingt essais au compteur, sans en avoir eu conscience. La plateforme le leur rappelle à l''écran final, avec la limite de 45 du chapitre 2.4.', 11);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, '3.1', 'Ce qu''un indicateur calcule', 'HOOK:
Trois indicateurs, trois formules, trois lignes. Tu vas constater qu''aucune ne contient d''information que tu n''aies pas déjà sous les yeux depuis le module 3 du Débutant.

P: Une **moyenne mobile** de période n est la moyenne des n dernières clôtures. Un **RSI** de période n compare la moyenne des hausses à celle des baisses sur ces n périodes et ramène le rapport sur une échelle de 0 à 100. Un **ATR** — *average true range* — est la moyenne de l''amplitude réelle des n dernières bougies.

P: Le point commun saute aux yeux dès qu''on les écrit : chacun est une fonction des quatre nombres du chapitre 3.1 du Débutant. Aucun n''accède à une donnée supplémentaire, et chacun en perd — c''est la définition d''un résumé.

P: Le point de séparation compte davantage. Moyenne mobile et RSI prétendent dire quelque chose sur la direction à venir. L''ATR ne prétend rien : il mesure une distance passée. C''est ce qui en fait le seul des trois utilisable sans protocole.

CASE: Le retard d''une moyenne, en heures
Une moyenne mobile 50 sur des bougies H4 résume 50 × 4 = **200 heures**, soit environ huit jours de marché.
Le prix se déplace ; la moyenne le suit avec un retard structurel de l''ordre de la moitié de sa période, soit **environ quatre jours**.
Conséquence directe : une moyenne mobile **ne peut pas** signaler un retournement. Elle peut seulement confirmer qu''un mouvement dure depuis un moment.
Ce n''est pas un défaut de réglage qu''un meilleur paramètre corrigerait. C''est la définition d''une moyenne.

ERR: L''erreur classique
Chercher le bon réglage. La question « moyenne 50 ou moyenne 200 ? » suppose qu''il existe une réponse stable dans le temps. Elle a surtout la propriété de générer des essais — et le chapitre 2.4 vient de te dire ce que chaque essai coûte au crédit de ton résultat final.

KEY: À retenir
- Moyenne mobile, RSI et ATR sont des fonctions des quatre mêmes nombres. Aucun n''ajoute d''information.
- Une moyenne mobile retarde d''environ la moitié de sa période. C''est structurel, pas réglable.
- Un outil qui mesure et un outil qui prétend prédire ne s''emploient pas de la même façon.', 12);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, '3.2', 'Mesurer n''est pas prédire', 'HOOK:
L''ATR ne te dira jamais où va le prix. Il te dit de combien il bouge habituellement — et cette information-là, tu peux l''utiliser dès aujourd''hui, sans test préalable.

P: Le chapitre 2.4 du Débutant plaçait le stop sous le dernier creux. Ce placement reste correct et n''est pas révisé. Il ignore simplement une variable : la même distance en pips ne représente pas le même risque d''être touchée selon la volatilité du moment.

P: L''ATR fournit cette variable. La règle d''usage tient en une comparaison : un stop à moins de **1 ATR** sera touché par le bruit ordinaire ; un stop au-delà de **3 ATR** paie une invalidation trop lointaine. Entre les deux, la distance est cohérente avec ce que fait le marché en ce moment.

P: Un mot sur le **volume**, puisque tu le verras partout ailleurs. Sur BTC/USD, le volume échangé est une donnée réelle, mesurée par les plateformes. Sur EUR/USD au comptant, il n''existe aucun volume centralisé : ce que ton graphique affiche est un **tick volume**, c''est-à-dire le nombre de changements de prix enregistrés par ton seul courtier. C''est une mesure d''activité chez un intermédiaire, pas un volume de marché. Ce parcours ne construit rien dessus, et tu sais désormais pourquoi.

CASE: Le même stop, deux marchés différents
EUR/USD en H1, **ATR 14 = 22 pips**.
Stop à 12 pips = **0,55 ATR** — il sera touché par une bougie ordinaire, sans qu''aucune invalidation ne se soit produite.
Stop à 32 pips = **1,45 ATR**, placé sous le dernier creux. Cohérent avec les deux critères.
Stop à 80 pips = **3,6 ATR** — la structure ne le justifie pas ; tu paies l''incertitude de quelqu''un d''autre.
Trois semaines plus tard, l''ATR tombe à 11 pips. Le même stop de 32 pips vaut désormais **2,9 ATR** : trop large pour le contexte. Ta distance n''a pas bougé, le marché si.

ERR: L''erreur classique
Fixer une distance de stop une fois pour toutes. « Je mets toujours 30 pips » ignore que 30 pips valent 1,4 ATR un jour et 3 ATR un autre. Le Débutant t''a appris à ne pas caler ton stop sur ton budget ; ce niveau ajoute une interdiction : ne le cale pas non plus sur une habitude.

KEY: À retenir
- L''ATR mesure une distance habituelle. Il ne prédit rien, et c''est exactement sa qualité.
- Compare toujours ton stop à l''ATR du moment : entre 1 et 3, sinon justifie.
- Le volume affiché en forex n''est pas un volume de marché. Ne construis aucune règle dessus.', 13);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, '3.3', 'Le filtre', 'HOOK:
Un indicateur ne te dit pas quoi prendre. Au mieux, il te dit quoi ne pas prendre — ce qui est déjà considérable, puisque le chapitre 4.5 du Débutant a montré que la sélectivité est une variable de performance à part entière.

P: Un **filtre** est une condition qui retire des trades d''un ensemble déjà constitué par ta lecture. Il ne crée jamais de trade, et cette contrainte n''est pas décorative : elle est ce qui empêche l''outil de redevenir un signal.

P: La séquence correcte est fixée et le filtre y occupe la dernière place. Lecture de structure (Débutant 3.3), puis scénario et invalidation (4.1), puis checklist (4.4), puis filtre. Rien ne remonte dans cet ordre.

P: Cette position a une conséquence méthodologique qu''on oublie systématiquement. Un filtre ne peut pas être évalué sur les trades gagnants qu''il apporte — il n''en apporte aucun. Il s''évalue sur ce qu''il **retire** : les trades supprimés étaient-ils moins bons que la moyenne ?

CASE: Ce qu''un filtre retire, et ce qu''il coûte
Échantillon de 100 trades, R moyen **+0,40 R**.
Le filtre en retire **30**.
Les 30 trades retirés avaient un R moyen de **−0,10 R**. Les 70 restants : **+0,61 R**.
Le filtre a donc fonctionné sur cet échantillon. Reste à savoir si ce résultat survit au chapitre 2.3, et ce n''est pas acquis.
Note aussi le prix : 30 % des occasions supprimées. À trois trades conformes par semaine, tu passes à 2,1 — et le temps nécessaire pour mesurer quoi que ce soit augmente d''un tiers.

ERR: L''erreur classique
Utiliser un filtre pour entrer. Dès l''instant où tu te surprends à penser « le RSI vient de repasser au-dessus de 50, j''achète », tu as inversé la séquence. Le filtre est devenu un déclencheur, et tu viens de contredire tout ce que le module 3 du Débutant a établi. L''inversion est facile à repérer : elle se produit quand l''outil te donne une idée au lieu d''en retirer une.

KEY: À retenir
- Un filtre soustrait. Il n''ajoute jamais un trade.
- Il s''évalue sur la qualité de ce qu''il retire, pas sur ce qu''il laisse passer.
- Il coûte des occasions, donc du temps de mesure. Compte ce coût avant de l''adopter.', 14);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, '3.4', 'Passer un outil au protocole', 'HOOK:
Voici le test complet, du premier au dernier pas, sur un cas concret. Il prend une heure. C''est la seule heure de ce parcours qui te dira si un outil mérite de rester sur ton écran.

P: Le protocole reprend intégralement le module 2, dans l''ordre : hypothèse, échantillon et coupure, essais autorisés, critère d''abandon, construction, contrôle consulté une fois, décision écrite. Sept étapes, aucune facultative.

P: Ce qui suit est un test réel dans son déroulement complet, y compris sa conclusion — qui est la conclusion la plus fréquente de tous les tests de ce type.

CASE: Un test, de bout en bout
**Hypothèse** — sur EUR/USD H4, ne prendre les achats que si le prix est au-dessus de sa moyenne mobile 50 augmente le R moyen d''au moins 0,3 R.
**Échantillon** — 200 situations, 140 en construction, 60 en contrôle, coupées par le temps.
**Essais autorisés** — 3 périodes : 20, 50, 100.
**Critère d''abandon** — moins de +0,15 R sur le contrôle, l''idée est jetée et non réessayée avant six mois.
**Construction** — moyenne 20 : +0,18 R · moyenne 50 : **+0,44 R** · moyenne 100 : +0,31 R. Trois essais consommés, on retient la 50.
**Contrôle**, consulté une seule fois : **+0,09 R**.
**Décision** — en dessous du critère. **Jeté**, avec la date, dans le journal des tests.

ERR: L''erreur classique
Garder quand même, « parce que 0,09 reste positif ». Sur 60 trades de contrôle, l''erreur-type vaut environ 0,25 R : un résultat de +0,09 R est rigoureusement indiscernable de zéro. Le critère avait été fixé à 0,15 R précisément pour que cette discussion n''ait pas lieu maintenant, alors que tu viens de passer une heure sur ce test.

KEY: À retenir
- Sept étapes, dans l''ordre, avant qu''un outil ne reste sur ton écran.
- La plupart des idées meurent au contrôle. C''est le fonctionnement normal, pas un échec.
- Note la date d''abandon. C''est ce qui t''empêche de retester la même chose en boucle.', 15);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, '3.5', 'Le coût de chaque outil', 'HOOK:
Chaque outil que tu ajoutes a un prix, et il ne se paie pas en euros. Il se paie en occasions, en essais et en attention — trois monnaies dont tu disposes en quantité très limitée.

P: **Coût en occasions.** Un filtre qui retire 30 % des trades allonge d''environ 43 % le temps nécessaire pour atteindre un échantillon donné. Le chapitre 2.2 t''a montré ce que représente ce temps.

P: **Coût en essais.** Chaque outil multiplie le nombre de configurations à explorer. Deux outils à quatre réglages chacun ne font pas huit combinaisons, ils en font seize — et le compteur du chapitre 2.4 monte d''autant.

P: **Coût en attention.** Un écran chargé rallonge la décision et affaiblit la checklist, dont le chapitre 4.4 du Débutant a établi qu''elle ne vaut que si elle s''applique mécaniquement. Un outil de plus, c''est une question de plus à laquelle répondre sous tension.

CASE: Le second filtre que tu n''ajouteras pas
Tu as un filtre en place. Tu envisages un second.
**Occasions** — le premier retire 30 %, le second retire 25 % de ce qui reste. Il te demeure 52,5 % des trades : à trois par semaine, tu tombes à **1,6**.
**Essais** — 4 réglages × 4 réglages = **16 configurations**, contre 4 auparavant.
**Échantillon nécessaire** pour mesurer l''effet du second : 160 trades pour un effet de 0,3 R. À 1,6 trade par semaine, cela fait **deux ans**.
Le second filtre n''est pas une mauvaise idée. Il est simplement invérifiable à ton échelle — ce qui, d''après le chapitre 2.2, revient au même.

ERR: L''erreur classique
Empiler parce que chaque ajout paraît raisonnable isolément. Aucun outil pris séparément ne semble coûteux. C''est le produit des trois coûts qui l''est, et ce produit reste invisible tant qu''on décide un ajout à la fois.

KEY: À retenir
- Trois coûts : occasions, essais, attention. Les trois se chiffrent.
- Un outil à la fois. Testé, puis gardé ou jeté, avant d''en envisager un autre.
- Si l''effet d''un ajout demande deux ans à mesurer, tu ne l''ajoutes pas.', 16);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 3, 'EX', 'L''outil que tu jettes', 'EXF: Compétence évaluée
Objectifs 19 et 20 : décrire ce que calcule un indicateur et ce qu''il ne peut pas faire ; soumettre un filtre au protocole complet et conclure.

EXF: Consigne
**Étape A.** Choisis un filtre parmi trois et règle son paramètre.
**Étape B.** Remplis la fiche de test — hypothèse, échantillon, essais autorisés, critère d''abandon — avant tout accès aux données.
**Étape C.** Applique le filtre sur l''échantillon de construction.
**Étape D.** Consulte le contrôle. Une fois.
**Étape E.** Décide, en confrontant ton résultat au critère que tu as écrit à l''étape B.

EXF: Ce que la plateforme doit fournir
- Trois filtres proposés — moyenne mobile, RSI, position du prix dans l''ATR — chacun avec un paramètre réglable dans une plage fermée.
- Une fiche de test à quatre champs. Le bouton « lancer » reste **inactif tant que le critère d''abandon est vide**.
- Un compteur d''essais visible, incrémenté à chaque changement de paramètre, non réinitialisable.
- Un échantillon de 200 situations pré-calculées sur EUR/USD H4, coupé 140 / 60 par ordre chronologique. Le contrôle se verrouille après une consultation.
- Un écran final affichant, côte à côte : R moyen de construction, R moyen de contrôle, **erreur-type du contrôle**, et le critère écrit par l''utilisateur à l''étape B, recopié tel quel.

EXF: Correction commentée
Les trois filtres sont calibrés pour produire un contrôle situé entre +0,05 et +0,15 R — donc à la limite ou en dessous de tout critère raisonnable, et dans tous les cas indiscernable de zéro avec une erreur-type de 0,25 R sur soixante trades.
La bonne réponse est **j''abandonne**, pour les trois. Ce n''est pas un piège : c''est le taux de survie réel des idées de ce type, et le chapitre 3.4 l''annonçait explicitement.
Deux erreurs sont attendues. La première : garder le filtre qui a rendu +0,15 R exactement, en arrondissant mentalement le critère dans le bon sens. La seconde, plus grave : **relancer avec un autre paramètre après un mauvais contrôle**. La plateforme l''autorise délibérément, incrémente le compteur, et le rappelle à l''écran final — à ce stade, le contrôle a été consulté, il n''existe plus, et le second test ne vaut rigoureusement rien. C''est la démonstration la plus efficace du chapitre 2.3, parce que l''utilisateur vient de la produire lui-même.', 17);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, '4.1', 'Le trade ne s''arrête pas à l''entrée', 'HOOK:
Le Débutant t''a appris à entrer et à poser un stop. Il a délibérément laissé de côté tout ce qui se passe entre les deux. C''est pourtant là que vit une part considérable de ton R moyen.

P: Position ouverte, trois interventions sont possibles : ne rien faire, réduire la position, déplacer le stop. Chacune modifie l''espérance, et aucune n''est neutre — y compris la première, qui est un choix au même titre que les autres.

P: Le principe qui gouverne le module tient en une phrase : **toute intervention en cours de trade se paie**. La question n''est jamais de savoir si elle coûte, mais si ce qu''elle rapporte dépasse ce qu''elle coûte. Cette question a une réponse chiffrable, et les quatre chapitres suivants la chiffrent.

P: Reste une difficulté propre au sujet : l''intervention se décide position ouverte, sous tension. Le module 5 du Débutant a documenté ce que vaut ton jugement à cet instant. La conclusion s''impose d''elle-même — la règle de gestion s''écrit **avant** l''entrée, avec le stop et l''objectif.

CASE: Le même trade, trois gestions
EUR/USD, entrée 1,0852, stop 1,0838 — soit 14 pips, donc 1 R — objectif 1,0895, soit 43 pips, donc 3,1 R.
Déroulé : le prix monte à 1,0880, redescend à 1,0845, puis atteint 1,0895.
**Gestion A, ne rien faire** : le stop initial n''est jamais touché, l''objectif est atteint. **+3,1 R**.
**Gestion B, sortie de la moitié à +1,5 R** : (0,5 × 1,5) + (0,5 × 3,1) = **+2,3 R**.
**Gestion C, stop remonté à l''entrée dès +2 R** : le retour à 1,0845 passe sous 1,0852. Touché. **0 R**.
Même trade, même lecture, même marché. De +3,1 R à zéro.

ERR: L''erreur classique
Juger une gestion sur ce trade-ci. Ici, ne rien faire gagne. Sur le trade suivant — où le prix redescend jusqu''au stop initial sans jamais atteindre l''objectif — la gestion C aurait économisé 1 R. Une gestion se juge sur une série, jamais sur un cas, et c''est précisément ce que les chapitres suivants mesurent.

KEY: À retenir
- Trois interventions possibles : rien, réduire, déplacer. Aucune n''est neutre.
- La règle de gestion s''écrit avant l''entrée, au même titre que le stop et l''objectif.
- Une gestion se juge sur une série. Un seul trade ne prouve rien, même spectaculaire.', 18);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, '4.2', 'La sortie partielle', 'HOOK:
Sortir la moitié à mi-chemin. Le geste paraît prudent, il se justifie sans effort, et son effet sur ton R moyen se calcule exactement.

P: La **sortie partielle** consiste à fermer une fraction de la position avant l''objectif. Elle réduit la variance et réduit l''espérance : c''est un échange, pas une amélioration.

P: Ce qu''elle achète : du confort, et un taux de trades finissant positifs nettement plus élevé. Ce qu''elle vend : la partie droite de ta distribution, c''est-à-dire les trades qui allaient loin et qui financent tout le reste.

P: Tu reconnais le mécanisme. C''est l''effet de disposition du chapitre 5.1 du Débutant, sous forme institutionnalisée. La différence tient à un détail décisif : ici, la décision est prise à froid et appliquée uniformément, ce qui la rend mesurable.

CASE: Ce que le confort coûte, exactement
100 trades, stop à 1 R, objectif à 3 R, 40 % de réussite.
**Sans sortie partielle** : (0,40 × 3) − (0,60 × 1) = **+0,60 R** par trade.
**Avec sortie de la moitié à +1,5 R**, sachant qu''un gagnant traverse forcément 1,5 R avant d''atteindre 3 R, et en supposant qu''un quart des perdants touche 1,5 R avant de revenir au stop :
gagnants : 0,40 × [(0,5 × 1,5) + (0,5 × 3)] = **+0,90**
perdants ayant touché 1,5 R : 0,60 × 0,25 × [(0,5 × 1,5) + (0,5 × −1)] = **+0,04**
perdants n''ayant rien touché : 0,60 × 0,75 × (−1) = **−0,45**
Total : **+0,49 R** par trade.
Le prix du confort : **18 % de l''espérance**. Ce qu''il achète : le taux de trades finissant positifs passe de 40 % à 55 %.

ERR: L''erreur classique
Adopter la sortie partielle pour « sécuriser », sans avoir posé ce calcul. Le choix est parfaitement défendable — si tu sais qu''il te coûte 18 % de ton espérance et que tu juges la baisse de variance plus précieuse. Ce qui n''est pas défendable, c''est de l''adopter en croyant qu''il améliore le résultat.

KEY: À retenir
- La sortie partielle échange de l''espérance contre du confort. C''est un échange, pas un gain.
- Dans un cas standard, elle coûte 18 % du R moyen et fait passer le taux de trades positifs de 40 % à 55 %.
- Si tu l''adoptes, applique-la à tous les trades. Sinon tu ne mesures plus rien du tout.', 19);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, '4.3', 'Le stop suiveur', 'HOOK:
Kaminski et Lo ont établi un résultat contre-intuitif : sous marche aléatoire, une règle de stop réduit toujours l''espérance ; en présence de momentum, elle en ajoute. Le stop suiveur n''est donc ni bon ni mauvais. Il est conditionnel.

P: Un **stop suiveur** est un stop qui se déplace dans le sens du trade, jamais dans l''autre. À ne pas confondre avec le déplacement d''un stop dans le sens de la perte, que le chapitre 2.4 du Débutant interdit et qui reste interdit sans exception.

P: Le résultat de Kaminski et Lo, transposé à ton échelle : si le prix se comporte comme une marche aléatoire, couper une position en cours de route retire de l''espérance, mécaniquement. Si le marché est en tendance persistante, le stop suiveur capture cette persistance et en ajoute.

P: La conséquence opérationnelle est nette. Le stop suiveur s''applique en fonction du **régime**, pas de l''humeur. En tendance lisible au sens du chapitre 3.3 du Débutant, il a une chance d''ajouter. En absence de tendance, il retire — et il n''y a rien à régler pour corriger cela.

CASE: La valeur est dans la condition, pas dans l''outil
100 trades, deux régimes.
**60 trades sans tendance** : le stop suiveur coupe en moyenne à +0,4 R des trades qui auraient fini à +0,6 R. Coût : −0,2 R × 60 = **−12 R**.
**40 trades en tendance** : il laisse courir et capture +2,8 R en moyenne, contre +2,2 R à l''objectif fixe. Gain : +0,6 R × 40 = **+24 R**.
**Appliqué partout** : −12 + 24 = **+12 R** sur 100 trades.
**Appliqué uniquement en tendance** : **+24 R**, soit le double, pour le même outil et le même réglage.
La valeur ne réside pas dans le stop suiveur. Elle réside dans sa condition d''application.

ERR: L''erreur classique
L''appliquer en toutes circonstances parce qu''il « protège les gains ». Sur les 60 trades sans tendance de l''exemple, il n''a rien protégé : il a converti des gains moyens en petits gains, ce qui est la définition exacte de l''effet de disposition — cette fois automatisé, donc appliqué sans même le remords qui l''accompagne d''habitude.

KEY: À retenir
- Le stop suiveur ajoute en tendance et retire en son absence. Ce n''est pas une préférence, c''est un résultat.
- Il ne se déplace jamais dans le sens de la perte. La règle du Débutant est inchangée.
- Sa valeur tient à sa condition d''application, pas à son réglage.', 20);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, '4.4', 'La mise à l''équilibre', 'HOOK:
Remonter le stop à ton prix d''entrée dès que le trade est en gain. On appelle ça « se mettre à l''abri », ça ne semble rien coûter, et c''est le geste le plus cher de ce module.

P: La **mise à l''équilibre** place un stop exactement à l''endroit où le bruit du marché ira le chercher. La raison est structurelle : ton prix d''entrée est un niveau que le marché vient de traverser. Il n''a aucune signification pour personne d''autre que toi, et le prix y revient très souvent avant de repartir.

P: Le chapitre 2.4 du Débutant plaçait le stop à l''invalidation, c''est-à-dire à un niveau justifié par la structure. La mise à l''équilibre le remplace par un niveau arbitraire — et elle le fait au moment précis où le trade commence à fonctionner.

P: Ce qu''elle achète est réel : la disparition du risque de perte sur ce trade. Ce qu''elle vend l''est tout autant : une part des trades qui allaient à l''objectif.

CASE: Vingt et une pertes évitées, douze objectifs perdus
100 trades, espérance de départ +0,60 R. Mise à l''équilibre déclenchée dès +1 R.
Sur les 40 gagnants, **30 % repassent par le prix d''entrée** avant d''atteindre l''objectif : 12 trades passent de +3 R à **0 R**.
Sur les 60 perdants, **35 % atteignent +1 R** avant de retomber : 21 trades passent de −1 R à **0 R**.
Nouveau compte : 28 gagnants × 3 = +84 · 12 gagnants coupés = 0 · 21 perdants sauvés = 0 · 39 perdants × (−1) = −39.
Total : **+45 R** sur 100 trades, soit +0,45 R par trade, contre +0,60 R sans rien faire.
La sensation est excellente : 21 pertes évitées et un tiers des trades qui finissent à zéro. Le compte est inférieur de **25 %**.

ERR: L''erreur classique
Valider ce geste sur le souvenir des pertes évitées. Tu te rappelleras les 21 fois où le stop à l''équilibre t''a sauvé — elles ont produit un soulagement net et daté. Tu ne te rappelleras pas les 12 fois où il t''a coûté 3 R, parce que ces trades se sont refermés à zéro et n''ont laissé aucune trace émotionnelle. Le journal, lui, les a comptées.

KEY: À retenir
- Ton prix d''entrée n''a aucune signification structurelle. Y placer un stop, c''est le placer dans le bruit.
- Dans un cas standard, la mise à l''équilibre coûte environ 25 % de l''espérance.
- Elle laisse un souvenir favorable et un relevé défavorable. Le relevé a raison.', 21);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, '4.5', 'Choisir et tenir', 'HOOK:
Trois gestions, trois chiffres. Aucune n''est la bonne réponse. La seule faute certaine consiste à en changer tous les quinze jours.

P: Alterner les gestions rend l''échantillon ininterprétable. Trois gestions appliquées sur soixante trades produisent trois échantillons de vingt, et le chapitre 2.2 t''a montré qu''à cette taille, rien n''est mesurable — ni séparément, ni ensemble.

P: La règle est donc : une gestion, écrite, appliquée à **tous** les trades, sur un échantillon suffisant, puis mesurée. Pour comparer deux gestions, on ne les alterne pas : on applique la première sur cent trades, on la mesure, puis la seconde.

P: Il existe pourtant un raccourci, et il est excellent. Ajoute au journal du Débutant un huitième champ : le **plus haut atteint par le trade avant sa fermeture**, exprimé en R. Avec ce seul nombre, tu peux recalculer après coup ce qu''aurait produit n''importe quelle gestion, sans avoir eu à la vivre.

CASE: Le champ qui vaut trois cents trades
Journal du Débutant : sept champs, dont le résultat en R.
Ajoute le huitième : **plus haut atteint, en R**, noté à la fermeture. Trois secondes par trade.
Sur cent trades déjà réalisés, ce champ te permet de recalculer l''espérance qu''auraient produite la sortie partielle à 1,5 R, la mise à l''équilibre à 1 R, et le stop suiveur à 1 R de distance.
Trois gestions comparées sur un échantillon que tu possèdes déjà, au lieu de trois cents trades supplémentaires et deux ans d''attente. C''est le meilleur rapport effort-information de tout le parcours.

ERR: L''erreur classique
Changer de gestion après une série défavorable. C''est le chapitre 6.2 du Débutant appliqué à la gestion : une série courte ne dit rien, et le changement remet le compteur d''échantillon à zéro. Au bout d''un an, tu auras essayé quatre gestions et tu ne sauras laquelle fonctionnait pour aucune des quatre.

KEY: À retenir
- Une gestion, appliquée à tous les trades, mesurée sur un échantillon suffisant.
- Ajoute au journal le plus haut atteint en R : il rend toutes les gestions testables après coup.
- Alterner les gestions ne produit pas de comparaison. Ça produit du bruit en trois morceaux.', 22);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 4, 'EX', 'Trois gestions, une seule série', 'EXF: Compétence évaluée
Objectifs 21 et 22 : calculer l''effet d''une sortie partielle sur le R moyen ; décider de l''application d''un stop suiveur selon le régime observé.

EXF: Consigne
**Étape A.** Sur un trade rejoué, observe les trois gestions appliquées en parallèle et note le R obtenu par chacune.
**Étape B.** Choisis **une** gestion, puis applique-la aux 40 trades d''une série rejouée. Le choix est verrouillé pour toute la série.
**Étape C.** La plateforme recalcule ce qu''auraient produit les deux autres sur exactement la même série.
**Étape D.** Qualifie le régime de la série, et dis si le classement obtenu était prévisible.

EXF: Ce que la plateforme doit fournir
- Étape A : un rejeu unique avec les trois gestions calculées en parallèle et affichées côte à côte, R par R.
- Étape B : 40 rejeux courts en accéléré. La gestion est choisie avant le premier trade et **verrouillée** jusqu''au dernier. C''est la contrainte pédagogique centrale de l''exercice : sans elle, l''utilisateur alterne et l''exercice n''enseigne rien.
- L''enregistrement automatique, pour chaque trade, du **plus haut atteint en R** — le huitième champ du chapitre 4.5.
- Étape C : recalcul automatique des deux gestions non retenues à partir des plus hauts enregistrés, avec affichage des trois espérances **et de l''erreur-type sur 40 trades**.
- Étape D : un QCM de qualification du régime — tendance, absence de tendance, mixte — puis une question sur la cohérence entre ce régime et le classement obtenu.

EXF: Correction commentée
La série de 40 est construite en régime **mixte** : 24 trades sans tendance, 16 en tendance.
Résultats attendus : ne rien faire ≈ +0,58 R · stop suiveur ≈ +0,61 R · mise à l''équilibre ≈ +0,44 R.
Le classement n''est pas le point de l''exercice. Le point est l''écart entre les deux premières — 0,03 R — face à l''erreur-type sur 40 trades, qui vaut environ **0,30 R**. Aucune des trois gestions n''est distinguable des deux autres sur cet échantillon. La mise à l''équilibre est en retrait, mais même cet écart-là reste dans le bruit.
La bonne réponse à l''étape D est donc : le régime était mixte, et 40 trades ne suffisent pas à trancher. La majorité des utilisateurs conclut que la gestion arrivée en tête est la meilleure — reproduisant sur la gestion l''erreur exacte que le module 1 avait diagnostiquée sur le R moyen. C''est délibéré : la même faute, commise deux fois à trois modules d''intervalle, est ce qui la rend mémorable.', 23);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 5, '5.1', 'Trois positions à 1 %, un risque à 3 %', 'HOOK:
Tu as trois positions ouvertes, chacune calibrée à 1 % selon la formule du chapitre 2.3 du Débutant. Tu crois risquer 1 %. Selon ce que tu as ouvert, tu risques entre 1 % et 3 %.

P: Le calcul de taille du Débutant est exact. Il porte sur un trade isolé, et il devient insuffisant à la seconde où une deuxième position s''ouvre. Ce n''est pas une erreur du parcours précédent : un débutant n''a qu''une position à la fois, et lui parler de portefeuille aurait été prématuré.

P: L''**exposition cumulée** est la perte que tu subirais si toutes tes positions ouvertes touchaient leur stop dans le même mouvement de marché. C''est une grandeur différente de la somme des risques affichés, et souvent très différente.

P: La question qui la détermine tient en une ligne : **tes positions peuvent-elles perdre ensemble ?** Si la réponse est oui, elles n''en forment qu''une seule, quelle que soit la manière dont ta plateforme les compte.

CASE: Trois portefeuilles, un seul affichage
**A** — long EUR/USD 1 %, long GBP/USD 1 %, long AUD/USD 1 %. Trois paris contre le dollar. Un dollar qui monte les touche tous les trois. Exposition réelle : proche de **3 %**.
**B** — long EUR/USD 1 %, long BTC/USD 1 %, short USD/JPY 1 %. Trois marchés apparemment différents — et trois positions qui perdent si le dollar monte. Exposition réelle : encore élevée.
**C** — long EUR/USD 1 %, short GBP/USD 1 %. Les deux paris s''opposent en grande partie. Exposition réelle : nettement inférieure à 2 %, et le gain potentiel l''est aussi.
Dans les trois cas, ta plateforme affiche « risque : 1 % par position ». Elle a raison position par position, et elle ne répond pas à la question posée.

ERR: L''erreur classique
Additionner des positions en croyant diversifier. Ouvrir trois paires majeures contre le dollar n''est pas de la diversification : c''est un triplement de mise sur une idée unique. Le Débutant a établi que le nombre d''ordres est corrélé à la perte ; ce chapitre en fournit un mécanisme précis.

KEY: À retenir
- La formule de taille du Débutant est exacte pour un trade isolé, insuffisante dès qu''il y en a deux.
- L''exposition cumulée est ce que tu perds si toutes tes positions touchent leur stop ensemble.
- Trois positions qui perdent dans le même scénario ne comptent que pour une.', 24);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 5, '5.2', 'La corrélation', 'HOOK:
EUR/USD et GBP/USD évoluent ensemble avec un coefficient couramment mesuré entre +0,81 et +0,95. Ce chiffre suffit à transformer deux trades en un seul — et deux risques de 1 % en un risque de presque 2 %.

P: La **corrélation** est une mesure comprise entre −1 et +1 du degré auquel deux actifs varient ensemble. À +1, ils se déplacent à l''identique. À 0, ils sont indépendants. À −1, ils se déplacent en sens opposé.

P: Les paires majeures sont corrélées par construction, et non par hasard : EUR/USD et GBP/USD partagent le dollar comme contrepartie, donc toute variation du dollar se retrouve mécaniquement dans les deux. Côté crypto, la plupart des paires évoluent entre +0,6 et +0,9 avec le bitcoin — un portefeuille de dix cryptomonnaies est un portefeuille d''une seule.

P: Tu n''as pas besoin d''un coefficient à trois décimales. Trois catégories suffisent, et elles t''évitent l''erreur d''ordre de grandeur, qui est la seule qui coûte cher.

CASE: La règle en trois lignes
**Au-dessus de +0,7** — un seul groupe. Deux trades à 1 % sur EUR/USD et GBP/USD perdent ensemble, donc leurs risques **s''additionnent** : ils comptent pour **2 %**, soit toute ta limite. Pour ouvrir les deux et garder de la marge, réduis chacun à 0,5 %.
**Entre +0,3 et +0,7** — le second compte à moitié. Deux trades à 1 % comptent pour **1,5 %**.
**En dessous de +0,3** — additionne normalement. Deux trades à 1 % comptent pour **2 %**.
Et une correction qui prime sur tout : si les positions sont de **sens opposés**, une corrélation élevée **réduit** l''exposition au lieu de l''augmenter.
Ce n''est pas exact au sens mathématique. C''est suffisant pour ne jamais se tromper d''un facteur trois.

ERR: L''erreur classique
Chercher la précision. Calculer un coefficient sur une fenêtre glissante donne une impression flatteuse de maîtrise — et ce coefficient change de toute façon selon la période retenue, parfois du simple au double. Trois catégories, appliquées systématiquement, valent mieux qu''un nombre exact appliqué une fois sur trois.

KEY: À retenir
- Au-dessus de +0,7 : un seul groupe, les risques s''additionnent. Entre +0,3 et +0,7 : le second compte à moitié. En dessous : additionne.
- Les paires majeures partagent le dollar. Elles sont corrélées par construction.
- Sens opposés et corrélation élevée : l''exposition diminue. Regarde toujours le sens avant le coefficient.', 25);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 5, '5.3', 'Risque de séance, risque de portefeuille', 'HOOK:
Les sept règles du Débutant plafonnent ce que tu perds pendant une séance. Aucune ne plafonne ce que tu perds pendant que tu dors avec quatre positions ouvertes.

P: Deux limites, deux objets distincts. Le **risque de séance** — deux pertes et la séance est terminée — plafonne les pertes **séquentielles**, celles qui s''enchaînent dans le temps parce que tu continues à trader.

P: Le **risque de portefeuille** plafonne les pertes **simultanées**, celles qui arrivent ensemble sans que tu aies rien décidé de plus. Le Débutant ne l''a pas traité parce qu''il s''adressait à quelqu''un qui n''ouvrait qu''une position à la fois.

P: Les deux sont nécessaires et aucune ne remplace l''autre. Une règle de séance parfaitement respectée ne te protège en rien si tes quatre positions touchent leur stop à trois heures du matin.

CASE: Le trou dans les sept règles
Séance parfaitement conforme : tu ouvres trois positions à 1 %, aucune ne touche son stop, tu fermes ta séance. Zéro perte, zéro règle enfreinte, zéro reproche à te faire.
Pendant la nuit, une annonce fait monter le dollar. Tes trois positions — toutes longues sur des paires contre le dollar — touchent leur stop.
Perte : **3 %**. Aucune des sept règles n''a été violée, parce qu''aucune des sept n''était conçue pour ce cas.
Il te faut donc une huitième règle, et elle porte sur ce qui est **ouvert simultanément**, pas sur ce qui a été décidé successivement.

ERR: L''erreur classique
Croire que les sept règles couvrent tout. Elles couvraient la pratique d''un débutant à une position. Ta pratique a changé — c''est le propre de ce niveau — et une règle qui n''évolue pas avec la pratique qu''elle encadre cesse de protéger sans prévenir.

KEY: À retenir
- Risque de séance : les pertes qui s''enchaînent. Risque de portefeuille : celles qui arrivent ensemble.
- Les sept règles du Débutant ne couvrent que le premier.
- Ta pratique a changé. Tes règles doivent changer avec elle.', 26);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 5, '5.4', 'La règle d''exposition cumulée', 'HOOK:
Une règle, un chiffre, vérifiable en cinq secondes avant chaque ordre. C''est la huitième, et elle complète les sept du chapitre 5.4 du Débutant sans en modifier aucune.

CARD: La huitième règle
**Exposition cumulée maximale : 2 %.**
Elle se calcule en appliquant les trois catégories de corrélation à toutes les positions ouvertes, plus celle que tu envisages, et en tenant compte du sens de chacune.

P: Le choix de 2 % n''est pas arbitraire. Il autorise deux positions indépendantes à 1 %, ou quatre positions corrélées à 0,5 %, et il plafonne la perte simultanée à deux fois la perte d''un trade isolé — un ordre de grandeur que le drawdown du chapitre 2.5 du Débutant rend supportable.

P: Le calcul se fait **avant** l''ordre, comme la taille de position. Il devient la septième question de ta checklist, et il obéit à la même règle que les six autres : sans réponse, pas de trade.

CASE: Quatre positions, un calcul de cinq secondes
Ouvertes : long EUR/USD 0,5 % · long GBP/USD 0,5 % · long BTC/USD 0,5 %.
EUR/USD et GBP/USD, corrélation au-dessus de +0,7, même sens : un seul groupe, dont les risques s''additionnent — **1 %** à elles deux.
BTC/USD, corrélation faible avec les deux autres : s''ajoute pour **0,5 %**.
Exposition actuelle : **1,5 %**.
Tu envisages un long AUD/USD à 1 %. Corrélé au-dessus de +0,7 avec les deux premières et de même sens, il rejoint leur groupe : celui-ci passerait à 2 %, et l''exposition totale à **2,5 %**.
Décision : soit tu le prends à **0,5 %** — le groupe monte à 1,5 %, l''exposition à 2 % pile — soit tu ne le prends pas. Il n''y a pas de troisième option.

ERR: L''erreur classique
Calculer l''exposition après avoir ouvert. Comme pour la taille de position au chapitre 2.3 du Débutant, l''ordre des opérations est la moitié de la règle : une exposition vérifiée après l''ordre ne protège de rien, elle constate.

KEY: À retenir
- Exposition cumulée maximale : 2 %. C''est la huitième règle.
- Applique les trois catégories de corrélation à tout ce qui est ouvert, plus ce que tu envisages.
- Le calcul se fait avant l''ordre. Il devient la septième question de ta checklist.', 27);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 5, 'EX', 'Ce que tu risques vraiment', 'EXF: Compétence évaluée
Objectif 23 : calculer l''exposition cumulée d''un ensemble de positions ouvertes en tenant compte de leur corrélation et de leur sens.

EXF: Consigne
**Étape A.** Un portefeuille de quatre positions ouvertes t''est présenté. Calcule son exposition cumulée.
**Étape B.** Un cinquième trade t''est proposé. Dis s''il passe la règle des 2 % et, sinon, à quelle taille il passerait.
**Étape C.** Trois portefeuilles affichant tous « 1 % par position » te sont donnés. Classe-les du plus exposé au moins exposé.

EXF: Ce que la plateforme doit fournir
- Un écran portefeuille listant quatre positions avec actif, **sens**, et risque en pourcentage. Le sens doit être aussi visible que le montant : c''est sur lui que porte le piège de l''exercice.
- Une matrice de corrélation affichée **en trois couleurs** — au-dessus de +0,7, entre +0,3 et +0,7, en dessous — et non en coefficients numériques. L''exercice évalue l''application de la règle, pas la lecture d''un tableau de nombres.
- Un champ de saisie pour l''exposition calculée, avec une tolérance de ±0,25 point.
- Étape B : deux champs — « passe / ne passe pas » et « taille maximale acceptable ».
- Étape C : trois portefeuilles à classer par glisser-déposer, affichant tous le même risque par position.

EXF: Correction commentée
**Étape A.** Le piège est la position vendeuse. Un short GBP/USD au milieu de longs EUR/USD **réduit** l''exposition, alors que la matrice affiche une corrélation élevée entre les deux paires. Corrélation forte plus sens opposés égale exposition réduite. C''est l''erreur la plus fréquente de l''exercice, et elle vient d''appliquer la règle des couleurs sans regarder la colonne « sens ».
**Étape B.** Le cinquième trade ne passe pas à 1 % et passe à 0,5 %. Répondre « ne passe pas » sans donner la taille est incomplet : la compétence évaluée est précisément de savoir à quelle taille il passerait, parce que c''est cette réponse-là qui te permet de prendre le trade au lieu d''y renoncer.
**Étape C.** Les trois portefeuilles affichent le même risque par position et présentent des expositions réelles de **1 %, 2 % et 3,5 %**. Le classement est le seul résultat qui compte ici, et son enseignement tient en une phrase : l''affichage de ta plateforme ne répond pas à la question que tu dois te poser.', 28);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, '6.1', 'Ce qu''est un système', 'HOOK:
Un système tient sur une page. Si le tien en demande cinq, ce n''est pas un système : c''est une collection d''exceptions, et tu ne pourras jamais la tester.

P: Un **système** est un ensemble de règles assez restreint pour être appliqué à l''identique sur un échantillon entier, et assez précis pour que deux personnes le lisant prennent la même décision devant le même graphique.

P: Le test de qualité est empirique et sans appel : donne ton système à quelqu''un d''autre. S''il ne peut pas prendre les mêmes décisions que toi, ton système n''est pas écrit — il est dans ta tête, et ce qui est dans ta tête n''est pas mesurable.

P: Six éléments le composent : périmètre, condition d''entrée, invalidation, gestion, exposition, critère d''abandon. Ce qu''il ne contient pas est tout aussi important : pas d''exceptions, pas de « sauf si », aucun appel au jugement.

CASE: Le test de transmissibilité
**Version A** — *« J''achète quand la structure H4 est haussière et que le prix revient sur une zone. »*
Deux lecteurs, deux résultats. Quelle zone ? À quelle distance ? Avec quelle confirmation ? Chacun comblera les trous à sa façon, et toi le premier, différemment selon les jours.
**Version B** — *« EUR/USD et BTC/USD, structure en H4, entrée en H1. J''achète si les deux derniers creux H4 montent et si le prix revient à moins de 10 pips d''une zone ayant produit au moins deux réactions. Invalidation sous le creux. Stop entre 1 et 3 ATR. Gestion : aucune intervention. Exposition cumulée maximale 2 %. »*
Deux lecteurs, mêmes décisions dans la grande majorité des cas. La version B n''est pas plus longue. Elle est plus précise.

ERR: L''erreur classique
Confondre précision et complexité. Ajouter des règles ne rend pas un système plus précis : le plus souvent, ça multiplie les situations où deux d''entre elles se contredisent, et c''est ton humeur du moment qui tranche — c''est-à-dire exactement ce que le système existait pour empêcher.

KEY: À retenir
- Un système est transmissible : un autre lecteur prend les mêmes décisions que toi.
- Six éléments : périmètre, entrée, invalidation, gestion, exposition, critère d''abandon.
- Précision et complexité ne sont pas la même chose. Vise la première.', 29);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, '6.2', 'Le document de système', 'HOOK:
Une page, six sections, une date. Ce document est le seul livrable du parcours Intermédiaire, et il vaut davantage que tout ce que tu as lu jusqu''ici.

UL:
- **Périmètre** — actifs, unités de temps, moments de la journée où tu opères.
- **Entrée** — la condition, formulée pour être vérifiable par un tiers.
- **Invalidation et stop** — où, et dans quelle plage d''ATR.
- **Gestion** — une seule, appliquée à tous les trades.
- **Exposition** — la limite cumulée et les catégories de corrélation.
- **Critère d''abandon** — le R moyen en dessous duquel le système est revu, et sur quel échantillon.

P: À ces six sections s''ajoutent deux informations d''en-tête qui transforment un document descriptif en instrument de mesure : la **date de dernière modification** et le **nombre de trades écoulés depuis**.

P: Sans elles, tu ne sais pas sur combien de trades ta version actuelle a été appliquée — et le module 2 a établi que sans échantillon connu, aucun chiffre n''est interprétable.

CASE: L''en-tête qui change tout
*Version 4 · Modifiée le 12/03 · 47 trades depuis la dernière modification · Critère d''abandon : R moyen sous +0,10 R à 100 trades.*
Cette seule ligne répond à trois questions immédiatement : sur quoi je mesure, depuis quand, et à partir de quel moment je m''inquiète.
Sans elle, un système modifié trois fois en deux mois produit un journal de 120 trades qui ne mesure **aucune** des trois versions. Le chiffre existe, il ne décrit rien.

ERR: L''erreur classique
Modifier le document sans incrémenter la version ni remettre le compteur à zéro. C''est l''équivalent, à l''échelle du système, du trade non consigné : la modification a bien eu lieu, elle n''est pas traçable, et tu ne pourras jamais dire ce qu''elle a produit.

KEY: À retenir
- Six sections, une page, plus une date de modification et un compteur de trades.
- Toute modification incrémente la version et remet le compteur à zéro.
- Sans compteur, ton journal ne mesure aucune version en particulier.', 30);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, '6.3', 'La revue mensuelle', 'HOOK:
Une fois par mois, marché fermé, trois questions et une décision. C''est court parce que c''est la seule façon que ce soit fait tous les mois.

P: **Première question : quel est mon taux de conformité ?** En dessous de 90 %, la revue s''arrête ici et la décision porte sur la discipline. Le R moyen n''est même pas examiné — le chapitre 6.3 du Débutant a établi qu''il ne mesure rien tant que la conformité est basse.

P: **Deuxième question : combien de trades depuis la dernière modification ?** En dessous de 100, aucune modification du système n''est autorisée, quel que soit le résultat affiché. Cette règle est la plus difficile à tenir et la plus rentable.

P: **Troisième question : le R moyen est-il sous mon critère d''abandon ?** Si oui, le système est revu. Si non, rien ne change. Et dans tous les cas, relis le journal des idées abandonnées du chapitre 3.4 pour vérifier qu''aucune ne revient discrètement par la fenêtre.

CASE: Trois mois, une seule révision
**Mois 1** — conformité 78 %, 40 trades, R moyen +0,31 R. → *Corriger la discipline.* Le R moyen n''est pas discuté, il ne mesure rien à ce niveau de conformité.
**Mois 2** — conformité 94 %, 71 trades, R moyen +0,08 R. → *Ne rien changer.* Le chiffre est mauvais et l''échantillon insuffisant. C''est de très loin la décision la plus difficile des trois.
**Mois 3** — conformité 96 %, 112 trades, R moyen +0,04 R, critère fixé à +0,10 R. → *Réviser le système.* Là seulement, et pour la première fois.
Trois mois de travail, une seule révision, intervenue au bout de 112 trades. C''est le rythme normal.

ERR: L''erreur classique
Réviser au mois 2. Le chiffre est décourageant, l''échantillon insuffisant, et la tentation à son maximum précisément parce que les deux se conjuguent. Réviser à ce moment détruit les 71 trades accumulés et repart de zéro — pour un système dont on ne saura jamais s''il fonctionnait.

KEY: À retenir
- Trois questions dans l''ordre : conformité, échantillon, résultat. On ne saute aucune marche.
- Sous 100 trades depuis la dernière modification, aucune modification. Sans exception.
- Une revue produit une seule décision écrite, jamais deux.', 31);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, '6.4', 'Quand modifier, quand ne rien faire', 'HOOK:
La question n''est pas de savoir si ton système doit évoluer — il le doit. La question est de savoir quel événement autorise une modification, et il n''y en a que trois.

P: **Premier déclencheur** : le critère d''abandon est atteint sur un échantillon suffisant. C''est le cas prévu, celui pour lequel le critère a été écrit.

P: **Deuxième déclencheur** : une hypothèse a passé le protocole du module 2, contrôle compris. C''est le cas rare — la plupart des hypothèses meurent avant.

P: **Troisième déclencheur** : ta pratique a changé au point que les règles ne la couvrent plus. L''exposition cumulée du module 5 en est l''exemple exact : elle n''existait pas tant que tu n''avais qu''une position ouverte.

P: Tout le reste — une série de pertes, un article lu, une idée entendue, un mois décevant — n''autorise rien du tout. Et chaque modification remet le compteur à zéro : c''est le prix, et il doit être payé en connaissance de cause.

CASE: Ce que coûte une modification, en semaines
À trois trades conformes par semaine, cent trades demandent **33 semaines**.
Un système modifié **tous les deux mois** n''atteint jamais son échantillon de mesure. Au bout d''un an : six versions, zéro mesure, et la conviction sincère d''avoir beaucoup travaillé.
Un système modifié **une fois par an** produit environ 78 trades par version. C''est encore insuffisant, mais l''ordre de grandeur est enfin correct.
Conclusion : la fréquence de modification maximale compatible avec la mesure est de l''ordre d''**une fois par an**. Ce chiffre surprend tout le monde, et il découle d''une simple division.

ERR: L''erreur classique
Modifier « juste un petit paramètre ». Un petit changement remet le compteur à zéro exactement comme un grand : le système appliqué après n''est plus celui d''avant, et les trades des deux périodes ne s''additionnent pas. Il n''existe aucune modification qui préserverait l''échantillon.

KEY: À retenir
- Trois déclencheurs légitimes : critère atteint, hypothèse validée, pratique changée.
- Toute modification remet le compteur à zéro et coûte 33 semaines.
- Une modification par an est la fréquence maximale compatible avec la mesure.', 32);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, '6.5', 'Ce qui t''attend au parcours Expérimenté', 'HOOK:
Tu as un système écrit, une méthode pour le tester et une règle pour le réviser. Ce qui manque désormais n''est plus de la connaissance : c''est la confrontation à un environnement qui ne pardonne pas les approximations.

P: Le parcours Expérimenté traite d''abord le **passage en argent réel** : le slippage, la qualité d''exécution, l''écart entre le prix demandé et le prix obtenu, et le protocole de réduction de taille au démarrage. Ce sont des problèmes que la simulation ne peut pas te poser.

P: Il traite ensuite ce que le réel réintroduit d''un seul coup : l''intégralité du module 5 du Débutant — effet de disposition, surtrading, spirale après une perte — cette fois dans des conditions où l''erreur coûte immédiatement.

P: Ce que l''Intermédiaire n''a pas couvert, pour que tu saches où chercher : le choix d''un courtier, la fiscalité, les produits autres que les paires de devises et les cryptomonnaies au comptant, et la gestion d''un portefeuille au-delà de trois positions.

P: La condition d''entrée dans le parcours Expérimenté n''est pas une formalité : un système écrit, **100 trades conformes sur la version en cours**, et un R moyen au-dessus de ton critère d''abandon. Sans ces trois éléments, l''Expérimenté traiterait de problèmes que tu n''as pas encore.

CASE: Le calendrier honnête, prolongé
Le Débutant chiffrait **10 semaines** pour atteindre 30 trades conformes.
L''Intermédiaire demande 100 trades sur une version stable, soit **33 semaines** supplémentaires au minimum — et ce calcul suppose qu''aucune révision n''intervienne entre-temps, ce qui est optimiste.
Du premier chapitre du Débutant à la fin de l''Intermédiaire correctement pratiqué : **environ un an**.
Cette durée n''est pas une posture pédagogique destinée à te faire patienter. C''est le résultat de la division du chapitre 2.2 par ton rythme de trades.

ERR: L''erreur classique
Passer au niveau suivant à la lecture plutôt qu''à la pratique. Tu peux lire le parcours Expérimenté demain matin, rien ne t''en empêche. Il ne te servira à rien tant que tu n''auras pas les 100 trades sur une version stable — pour exactement la même raison que le protocole du module 2 ne sert à rien sans échantillon.

KEY: À retenir
- Condition d''entrée au niveau Expérimenté : système écrit, 100 trades conformes, R moyen au-dessus du critère.
- Le passage en réel réintroduit tout le comportement, dans des conditions plus dures.
- Débutant et Intermédiaire correctement pratiqués : environ un an.', 33);
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('intermediaire', 6, 'EX', 'Écris ton système', 'EXF: Compétence évaluée
Objectif 24 : rédiger un document de système en une page et conduire une revue mensuelle aboutissant à une décision écrite.

EXF: Consigne
**Étape A.** Rédige ton document de système : six sections, une page.
**Étape B.** Trois situations te sont présentées. Pour chacune, relis ton propre document et dis quelle décision il t''impose.
**Étape C.** Un mois de journal t''est fourni. Conduis la revue : trois questions, une décision.

EXF: Ce que la plateforme doit fournir
- Étape A : un formulaire à six sections, **250 caractères maximum par section**. Cette limite est pédagogique et non technique : elle interdit matériellement le système à exceptions. Un en-tête automatique génère version, date et compteur de trades.
- Étape B : trois situations graphiques, avec le document de l''utilisateur **affiché en permanence à côté**. Pour chacune, deux boutons — « je prends », « je ne prends pas » — et un troisième, essentiel : « **mon document ne tranche pas** ».
- Étape C : un mois de journal fourni affichant conformité, nombre de trades depuis modification et R moyen, puis trois décisions possibles dont une seule est sélectionnable.
- Si le journal Débutant de l''utilisateur est disponible, l''étape A pré-remplit le périmètre et la gestion à partir de ses trades réels. **Repli** : sections vides et un document d''exemple consultable en permanence.

EXF: Correction commentée
**Étape B.** Les trois situations sont choisies pour qu''au moins l''une ne soit pas tranchée par un document typique. Le résultat attendu n''est donc pas une bonne réponse : c''est le troisième bouton. La correction demande alors de compléter le document sur ce point précis — et c''est le vrai livrable de l''exercice. Un utilisateur qui n''appuie jamais sur « mon document ne tranche pas » a probablement répondu selon son intuition plutôt que selon son texte.
**Étape C.** Le mois fourni affiche conformité 94 %, 71 trades depuis modification, R moyen +0,08 R, critère à +0,10 R. La bonne décision est **ne rien changer**, parce que l''échantillon est sous 100.
C''est la reproduction exacte du « mois 2 » du chapitre 6.3, et c''est la décision que la majorité des utilisateurs refuse de prendre : le chiffre est sous le critère, et tout pousse à agir. La règle de l''échantillon existe pour couvrir ce cas et aucun autre — elle ne sert jamais quand les chiffres sont bons.', 34);

commit;
