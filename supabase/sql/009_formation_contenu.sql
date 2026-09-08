-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Les dossiers suffixes '-en' fournissent la version anglaise du parcours.

begin;
delete from public.formation_chapitres;

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, '1.1', 'Ce que tu achètes réellement', 'HOOK:
Tu ouvres l''application. EUR/USD affiche 1,0850. Tu cliques sur « Acheter ». Question simple, et presque personne ne sait y répondre le premier jour : tu viens d''acheter quoi, exactement ?

P: Pas des euros. Il n''y a pas de coffre, pas de billets, rien qui t''appartienne. Tu viens de passer un contrat avec ton courtier : si l''euro monte face au dollar, il te doit de l''argent ; s''il baisse, tu lui en dois. C''est tout.

P: Deux mots que tu vas lire des centaines de fois. Une **position**, c''est ce contrat tant qu''il est ouvert. Un **trade**, c''est l''opération complète : l''ouverture, l''attente, la fermeture. Un trade se juge une fois refermé, jamais pendant.

P: Le prix affiché n''est pas non plus une valeur. C''est le dernier accord trouvé entre un acheteur et un vendeur, il y a une fraction de seconde. Tu ne « prends pas position sur l''euro » : tu paries qu''un autre humain, plus tard, acceptera un prix différent.

P: Et il n''y a pas un prix, il y en a deux. Un prix auquel tu peux acheter, un autre auquel tu peux vendre, toujours un peu plus bas. L''écart entre les deux s''appelle le **spread**. Tu entres toujours du mauvais côté.

CASE: Le coût de la première seconde
EUR/USD affiche 1,08495 à la vente et 1,08505 à l''achat. Tu achètes, donc à 1,08505.
Tu changes d''avis dans la seconde et tu revends : à 1,08495. Le marché n''a pas bougé d''un cheveu, et tu as perdu **1 pip** — le pip est la quatrième décimale d''une paire de devises, soit 0,0001 sur EUR/USD. C''est l''unité dans laquelle se comptent les distances sur ce marché.
Sur une position de 10 000 unités, 1 pip vaut environ 1 $. Vingt allers-retours dans la journée : 20 $. Vingt jours de marché : **400 $**.
Sur un capital de 1 000 $, tu dois gagner 40 % dans l''année pour simplement rentrer dans tes frais.

ERR: L''erreur classique
Le débutant regarde *le* prix, pas *les deux* prix. Il croit être à l''équilibre dès que son ordre est passé. En réalité, chaque trade démarre en perte du montant du spread — et il ne compte jamais ce que ça représente sur un mois.

KEY: À retenir
- Tu ne détiens rien : tu as un contrat contre ton courtier.
- Il y a toujours deux prix. Tu achètes au plus haut, tu vends au plus bas.
- Chaque trade commence en perte. Plus tu en ouvres, plus cette perte s''accumule.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, '1.2', 'Qui est en face de toi', 'HOOK:
Ton courtier t''offre une plateforme, des graphiques en temps réel, parfois une prime de bienvenue et un accompagnement téléphonique. Personne ne fait ça par philanthropie. Alors : d''où vient l''argent ?

P: De trois endroits. Des commissions prélevées sur chaque transaction. Du spread, cet écart entre les deux prix. Et des frais de report, facturés chaque nuit où tu gardes une position ouverte.

P: Ce n''est pas illégitime : c''est un service, et il se paie. Ce qui compte, c''est la forme de ce coût. Il est **certain et régulier**, alors que ton gain est incertain et irrégulier. Le courtier gagne quand tu trades. Pas quand tu gagnes.

P: Maintenant, une nuance que tu n''entendras nulle part ailleurs, et qui va te retirer ton excuse préférée avant même que tu l''aies inventée. L''AMF a mesuré la part des frais dans les pertes des clients : **14,2 %**. Le reste — les 85,8 % — vient des décisions du client. Ton courtier n''est pas ton problème principal. Toi, si.

CASE: Ce que coûte l''attente
Tu gardes une position de 10 000 $ ouverte pendant 30 nuits. Le frais de report est de 0,02 % par nuit, soit 2 $.
30 nuits × 2 $ = **60 $**.
Sur un capital de 1 000 $, cela représente 6 % du compte. Le marché n''a pas bougé. Tu n''as rien fait de mal. Tu as juste attendu.

ERR: L''erreur classique
Garder une position perdante « le temps que ça revienne ». Chaque nuit ajoute un coût, et la position dont tu espères le retour est celle que tu paies le plus longtemps. En trading à effet de levier, le temps n''est pas neutre : il est facturé.

KEY: À retenir
- Ton courtier est rémunéré à l''activité, pas à ta performance.
- Les frais expliquent 14,2 % des pertes. Le reste, ce sont les décisions.
- Une position gardée longtemps coûte de l''argent chaque nuit, même à l''arrêt.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, '1.3', 'Les chiffres qu''on ne te montre pas', 'HOOK:
Avant d''apprendre quoi que ce soit, tu dois savoir dans quelle statistique tu viens d''entrer. Ce chapitre est le plus désagréable du parcours. C''est aussi le seul que je te demande de ne jamais oublier.

P: En 2014, l''Autorité des marchés financiers a fait ce que personne n''avait fait avant : elle a demandé aux courtiers agréés en France les résultats réels de leurs clients. Pas des courtiers frauduleux — des acteurs légaux, régulés, ceux dont tu vois les publicités.

P: 14 799 clients actifs. Quatre années. Le résultat : **89 % de perdants**. Perte moyenne par client : 10 887 €. Perte totale de l''échantillon : 161 millions d''euros.

P: La moyenne ment un peu, et dans un sens qui t''intéresse. Elle est tirée vers le bas par quelques désastres. Le chiffre à retenir est la **médiane : 1 843 €**. C''est le sort du client ordinaire — celui qui n''a pas fait de folie, qui a simplement joué quelques mois et arrêté. Tu as beaucoup plus de chances d''être celui-là.

CASE: La forme de la distribution
Sur les 14 799 clients de l''étude :
722 clients (4,9 %) ont perdu **plus de 50 000 €** chacun, pour un total de 102 millions d''euros.
121 clients (0,8 %) ont gagné **plus de 24 000 €** chacun, pour un total d''environ 10 millions d''euros.
La queue des pertes pèse **dix fois** la queue des gains. Ce n''est pas un jeu équilibré dont tu prendrais un côté au hasard : les rares grands gagnants ne compensent pas, même de loin, les rares grands perdants.

ERR: L''erreur classique
« Ces gens-là ne savaient pas ce qu''ils faisaient. Moi, je vais me former. » L''étude a isolé les 1 881 clients actifs *chaque année* pendant quatre ans — les plus expérimentés de l''échantillon. Résultat : 87,56 % de perdants, et une perte moyenne de 26 745 €. Plus ils duraient, plus ils perdaient. L''AMF conclut à l''absence d''effet d''apprentissage.

KEY: À retenir
- 89 % des clients français perdent. Le client médian perd 1 843 €.
- L''expérience seule n''améliore rien : c''est mesuré, pas supposé.
- Ce parcours ne prétend pas inverser ces chiffres. Il te donne les rares variables sur lesquelles tu peux réellement agir.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, '1.4', 'L''effet de levier', 'HOOK:
Un courtier te propose de déposer 1 000 € et de faire bouger 30 000 € sur le marché. Présenté comme ça, ça ressemble à un cadeau. C''est un accélérateur — et un accélérateur fonctionne dans les deux sens.

P: L''**effet de levier** est le rapport entre la taille de ta position et l''argent que tu as réellement déposé. Levier 30 : 1 000 € pilotent 30 000 €. La conséquence est purement arithmétique, il n''y a rien à interpréter : un mouvement de 1 % du marché devient 30 % de ton capital.

P: Voilà le point que presque tout le monde manque. Le levier ne change pas la probabilité que tu aies raison. Il ne rend pas ton analyse meilleure ni pire. Il change une seule chose : **la vitesse à laquelle tu es éliminé quand tu as tort**.

P: En Europe, ton courtier ferme automatiquement tes positions quand ton compte tombe sous un seuil réglementaire. Ce mécanisme ne te protège pas de la perte. Il protège de la dette. Nuance importante.

P: Regarde ce que produit exactement le même mouvement de marché — une baisse de 1 % — selon le levier choisi, pour un capital de 1 000 €.

TABLE: Levier | Position pour 1 000 € | Perte si le marché baisse de 1 %
×1 | 1 000 € | 10 €, soit 1 % du capital
×5 | 5 000 € | 50 €, soit 5 %
×30 | 30 000 € | 300 €, soit 30 %
×100 | 100 000 € | 1 000 €, soit la totalité

CASE: L''ordre de grandeur qui compte
EUR/USD parcourt en moyenne **0,5 à 0,7 % dans une journée ordinaire**. Pas un krach, pas une annonce surprise : une séance banale.
Avec un levier ×100, cette séance banale représente 50 à 70 % de ton capital.
Tu n''as donc besoin ni d''une erreur d''analyse, ni d''un événement exceptionnel pour disparaître. Il suffit d''un mardi.

ERR: L''erreur classique
Choisir le levier maximum parce qu''il est disponible. Le levier n''est pas un réglage de performance qu''on pousserait au maximum comme le volume d''une enceinte. Il est le **résultat** d''un calcul que tu apprendras au module suivant — jamais un choix par défaut, jamais une préférence.

KEY: À retenir
- Levier ×30 : 1 % de marché devient 30 % de ton capital.
- Le levier ne modifie pas ta justesse, seulement ta vitesse d''élimination.
- Tu ne choisis jamais un levier. Tu calcules une taille de position, et le levier en découle.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, '1.5', 'Ce que ce parcours va — et ne va pas — t''apprendre', 'HOOK:
Tu ne trouveras dans les pages qui suivent ni signal, ni configuration gagnante, ni indicateur réputé secret. Autant te dire tout de suite ce qui va remplacer tout ça.

P: Cinq compétences, et elles sont toutes vérifiables. Calculer ce que tu risques avant de cliquer. Lire un graphique nu. Écrire un scénario qu''un prix précis peut démentir. Refuser un trade et nommer la règle qui l''a refusé. Tenir un journal et en extraire une erreur de processus.

P: Ce que tu ne trouveras pas : une méthode qui gagne, des indicateurs techniques, des figures chartistes exotiques, et le moindre avis sur ce que tu devrais acheter. Les indicateurs arrivent au parcours Intermédiaire, accompagnés de la seule chose qui les rende utiles — une méthode pour les tester.

CASE: Regarde comment le temps est réparti
Sur les 70 minutes du parcours : **13 minutes** sont consacrées à la lecture de graphique, et **35 minutes** au risque, à la décision et au comportement.
C''est exactement l''inverse de la formation moyenne, qui consacre l''essentiel de son volume à l''entrée en position — c''est-à-dire au seul moment du processus qui n''a jamais distingué un compte survivant d''un compte disparu.

ERR: L''erreur classique
Sauter directement au module 3 parce que « les graphiques, c''est le vrai trading ». Les données du chapitre 1.3 disent le contraire, et elles le disent sur 14 799 personnes : ce n''est pas la finesse de l''analyse qui sépare les survivants des autres, c''est la taille de leurs positions.

KEY: À retenir
- Aucun indicateur dans ce parcours. Le graphique nu d''abord.
- L''ordre des modules *est* le contenu : risque, puis lecture, puis décision.
- Tout se passe en simulation. Le seul capital en jeu ici est ton attention.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 1, 'EX', 'Le coût de départ', 'EXF: Compétence évaluée
Objectifs 1 et 2 : expliquer ce qu''est un prix, un spread et un contrat contre le courtier ; calculer l''impact d''un mouvement de 1 % du marché pour trois niveaux de levier.

EXF: Consigne
**Partie A.** Six affirmations te sont présentées une par une. Pour chacune : vrai ou faux.
**Partie B.** Ton capital est de 1 000 €. Pour trois niveaux de levier, calcule la perte en euros et en pourcentage du capital si le marché baisse de 1 %.

EXF: Ce que la plateforme doit fournir
- Écran sans graphique. Cet exercice ne doit contenir aucune donnée de marché : il porte sur des mécanismes, pas sur une lecture.
- Partie A : six cartes vrai/faux présentées séquentiellement, sans retour en arrière, avec affichage de la correction après chaque réponse.
- Partie B : un tableau à trois lignes (levier ×5, ×30, ×100) et deux colonnes de saisie numérique — perte en €, perte en %. Validation avec une tolérance de ±1 € et ±0,5 point.
- Le capital de 1 000 € est affiché en permanence dans un bandeau supérieur, non modifiable.

EXF: Correction commentée
**Partie A.** Les six affirmations et leur réponse :
- *« En achetant EUR/USD, je possède des euros. »* — Faux. Tu détiens un contrat contre ton courtier. Tentant parce que le vocabulaire de la plateforme dit « acheter ».
- *« Si le marché ne bouge pas, je ne perds rien. »* — Faux. Le spread est prélevé à l''ouverture, les frais de report chaque nuit.
- *« Le courtier gagne quand je perds. »* — Faux dans le cas général, et c''est la réponse la plus souvent ratée. Le courtier est rémunéré à l''activité : commissions, spread, report. Ton résultat ne le concerne qu''indirectement.
- *« Les frais expliquent la plus grande partie des pertes des clients. »* — Faux : 14,2 % selon l''AMF. Tentant parce que c''est l''explication la plus confortable.
- *« Les clients les plus expérimentés perdent nettement moins. »* — Faux. 87,56 % de perdants chez les clients actifs quatre ans d''affilée.
- *« Le levier augmente mes chances d''avoir raison. »* — Faux. Il n''agit que sur l''amplitude, jamais sur la probabilité.
**Partie B.** Levier ×5 : 50 €, soit 5 %. Levier ×30 : 300 €, soit 30 %. Levier ×100 : 1 000 €, soit 100 %.
La troisième ligne est la seule qui compte vraiment. Beaucoup d''utilisateurs la calculent juste et en tirent la conclusion inverse de la bonne : « il suffit de ne pas se tromper ». Non. Elle signifie qu''une **journée ordinaire** sur EUR/USD — pas un krach, pas une surprise — suffit à effacer le compte. La question n''est pas d''éviter l''erreur. Elle est de survivre à la normale.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, '2.1', 'La seule question qui compte', 'HOOK:
Deux personnes prennent exactement le même trade. Même actif, même seconde, même prix. Six mois plus tard, l''une a doublé son compte et l''autre l''a vidé. Elles avaient la même analyse. Elles n''avaient pas la même taille de position.

P: Le débutant se demande « où ça va ? ». C''est une question sans réponse fiable : personne, nulle part, ne la connaît. Elle occupe pourtant 95 % du contenu que tu trouveras sur le sujet.

P: La question professionnelle est différente : **« combien je perds si j''ai tort ? »**. Elle a une réponse exacte, connue avant de cliquer, indépendante de ce que fera le marché. C''est la seule chose que tu contrôles réellement.

P: Tu contrôles exactement trois variables : le montant que tu risques, le niveau à partir duquel tu abandonnes, et le fait d''entrer ou de ne pas entrer. Tu n''en contrôles aucune autre. Surtout pas le prix : celui-là ne t''appartient pas.

P: On appelle **R** la somme que tu perds si ton scénario est faux. C''est ton unité de compte pour tout le reste du parcours.

CASE: Ton unité de mesure
Capital : 1 000 €. Risque choisi : 1 % par trade.
1 R = **10 €**.
Que tu traites EUR/USD ou BTC/USD, que le levier soit de 5 ou de 30, qu''il s''agisse de ton premier trade ou de ton centième : un trade met 10 € en jeu. Pas 9, pas 40.
C''est la seule constante du parcours. Tout le reste s''ajuste autour d''elle.

ERR: L''erreur classique
Raisonner en taille de position — « je mets 500 € » — au lieu de raisonner en risque — « je risque 10 € ». Ces deux phrases n''ont aucun rapport entre elles. Une position de 500 € avec un stop à 2 % de distance ne risque que 10 €. La même position sans stop risque 500 €. La taille ne dit rien du risque.

KEY: À retenir
- La question n''est pas « où ça va », mais « combien je perds si j''ai tort ».
- Ton risque s''exprime en pourcentage du capital, jamais en taille de position.
- 1 R = la perte acceptée sur un trade. Compte en R à partir de maintenant.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, '2.2', 'La règle du 1 %', 'HOOK:
Tout le monde répète « ne risque jamais plus de 1 % ». Presque personne n''explique d''où sort ce chiffre. Il sort d''une multiplication que tu peux faire toi-même, et qui prend deux minutes.

P: Point de départ : même une méthode correcte enchaîne des pertes. Ce n''est pas un accident, c''est de l''arithmétique. Avec une chance sur deux de gagner, une série de sept pertes consécutives survient environ une fois tous les 128 trades — soit plusieurs fois par an pour quelqu''un qui trade régulièrement.

P: La question n''est donc pas « comment éviter les séries de pertes » — tu ne peux pas. Elle est : **« quelle taille de risque rend une série de pertes survivable ? »**

TABLE: 30,35,35 || Risque par trade | Capital après 10 pertes | Perte cumulée
1 % | 904 € | −9,6 %
2 % | 817 € | −18,3 %
5 % | 599 € | −40,1 %
10 % | 349 € | −65,1 %

CASE: Le piège de la dernière ligne
La ligne à 10 % ne demande pas seulement de regagner les 651 € perdus.
Pour revenir à 1 000 € en partant de 349 €, il faut faire **+186 %**.
La ligne à 1 %, elle, demande +10,6 % pour revenir à l''équilibre. La différence de départ était de neuf points de risque. La différence d''arrivée est de 176 points de performance à produire.

ERR: L''erreur classique
Augmenter le risque après une série de pertes, pour « se refaire ». L''arithmétique va exactement dans l''autre sens : c''est précisément au moment où le capital est bas que chaque euro risqué pèse le plus lourd dans le pourcentage. Doubler la mise après quatre pertes, c''est accélérer au moment où la route se rétrécit.

KEY: À retenir
- Une série de sept pertes est normale. Elle n''indique rien sur ta méthode.
- À 1 % par trade, dix pertes coûtent 9,6 % du capital. À 10 %, elles en coûtent 65 %.
- Plus la perte est profonde, plus le gain nécessaire pour l''effacer devient disproportionné.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, '2.3', 'Calculer une taille de position', 'HOOK:
C''est le seul calcul obligatoire du parcours. Trois nombres entrent, un nombre sort, et ce nombre décide de ta survie plus sûrement que toute l''analyse que tu feras cette année.

P: La formule tient en une ligne :

CARD: La formule
**Taille de position = (Capital × Risque en %) ÷ Distance jusqu''au stop**
Le résultat est une quantité — un nombre d''unités de devise, une fraction de bitcoin. Pas un montant en euros.

P: Il faut d''abord traduire la distance jusqu''au stop en argent. Sur EUR/USD, l''unité est le **pip** : la quatrième décimale, soit 0,0001. Pour une position de 10 000 unités, 1 pip vaut environ 1 $. Sur BTC/USD, il n''y a pas de pip : on raisonne directement en dollars par unité de bitcoin.

CASE: Deux marchés, un seul calcul
**EUR/USD.** Capital 1 000 €, risque 1 % = 10 €. Entrée à 1,0850, stop à 1,0820 : la distance est de **30 pips**.
10 € ÷ 30 pips = 0,33 € par pip, soit une position d''environ **3 300 unités**.
**BTC/USD.** Capital 1 000 €, risque 1 % = 10 €. Entrée à 62 000, stop à 61 000 : la distance est de **1 000 $**.
10 € ÷ 1 000 $ = **0,01 BTC**, soit une position d''environ 620 $.
Deux marchés qui n''ont rien à voir. Même risque : 10 €.

ERR: L''erreur classique
Choisir la taille d''abord et le stop ensuite. C''est l''ordre inverse du bon. Le débutant décide « je mets 200 € », place son stop là où ça lui semble raisonnable, et découvre son risque après coup — souvent après la perte. La taille est un **résultat**, pas une décision.

KEY: À retenir
- Taille = (Capital × Risque) ÷ Distance au stop. Aucune exception, aucun actif dispensé.
- Le stop se choisit avant la taille, jamais l''inverse.
- Un stop plus large n''augmente pas ton risque : il réduit ta taille.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, '2.4', 'Où placer un stop', 'HOOK:
Tu places ton stop à 20 € de perte, parce que 20 €, c''est ce que tu es prêt à perdre aujourd''hui. Le marché ne connaît pas ton budget. Il est juste passé par là, et il t''a sorti au passage.

P: Un **stop-loss** est un ordre automatique qui ferme ta position à un niveau défini à l''avance. Sa fonction n''est pas de limiter une somme : elle est de marquer le point à partir duquel **ton scénario est faux**. Si le prix l''atteint, ta raison d''être dans ce trade a disparu.

P: Deux erreurs symétriques. Le stop trop serré : tu es sorti par la respiration normale du marché, alors que ton idée était bonne. Le stop trop large : ton scénario est mort depuis longtemps et tu continues à payer.

P: Ordre de grandeur utile : sur EUR/USD en H1, une bougie ordinaire couvre 15 à 25 pips. Un stop placé à 5 pips sera touché par du **bruit** — le mouvement sans signification — et non par une invalidation.

CASE: Deux stops pour la même idée
Tu achètes à 1,0850. Le dernier creux visible sur le graphique est à 1,0822.
**Stop à 1,0845 (5 pips).** Touché dans l''heure par une oscillation banale. Tu avais raison sur la direction et tu es sorti quand même. Perte : 10 €.
**Stop à 1,0818 (32 pips, sous le creux).** Touché seulement si la structure du marché casse réellement. Taille correspondante : 10 € ÷ 32 = 0,31 € par pip, soit 3 100 unités. Perte si touché : 10 €.
Le second stop est six fois plus large et **pas plus risqué**. La taille a absorbé la différence.

ERR: L''erreur classique
Déplacer le stop quand le prix s''en approche. C''est le geste unique qui transforme une perte de 10 € en perte de 200 €. Il se justifie toujours très bien sur le moment — « le niveau était mal placé », « ça va rebondir juste après ». Un stop déplacé n''est plus un stop. C''est un espoir avec un nom d''ordre.

KEY: À retenir
- Le stop se place là où ton scénario devient faux, pas là où ton budget est atteint.
- Sous le dernier creux pour un achat, au-dessus du dernier sommet pour une vente.
- Un stop ne se déplace jamais dans le sens de la perte. Jamais.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, '2.5', 'Le drawdown', 'HOOK:
Ton compte ne monte pas en ligne droite, et il ne descend pas non plus. Entre les deux, il y a un creux. C''est dans ce creux que la plupart des gens abandonnent, ou font n''importe quoi.

P: Le **drawdown** est l''écart entre le plus haut niveau qu''a atteint ton capital et son niveau actuel, exprimé en pourcentage. C''est une mesure de ce que tu subis, pas de ce que tu produis.

P: Sa propriété désagréable est l''asymétrie. Perdre 50 % ne demande pas de gagner 50 % pour revenir : il faut en gagner 100. La perte et le rattrapage ne sont pas symétriques, et l''écart entre les deux se creuse vite.

TABLE: 50,50 || Drawdown subi | Gain nécessaire pour revenir à l''équilibre
−10 % | +11 %
−20 % | +25 %
−33 % | +50 %
−50 % | +100 %
−65 % | +186 %

CASE: Ce que le 1 % achète vraiment
À 1 % de risque par trade, il faut environ **69 pertes nettes consécutives** pour atteindre −50 % de drawdown.
À 10 % de risque par trade, il en faut **7**.
Sept. C''est le nombre de pertes d''affilée qu''une méthode correcte produit régulièrement, comme on l''a vu au chapitre 2.2. À 10 % de risque, la série normale devient un événement terminal.

ERR: L''erreur classique
Mesurer sa progression uniquement au solde du compte. Deux comptes affichant 1 100 € n''ont rien de comparable si le premier n''est jamais descendu sous 980 € et si le second est passé par 400 €. Le second a eu de la chance, et surtout : il ne le sait pas. Il attribuera ce résultat à sa méthode.

KEY: À retenir
- Le drawdown mesure ce que tu subis. Le solde mesure ce que tu montres.
- −50 % exige +100 % pour revenir. L''asymétrie est le vrai adversaire.
- Fixe ta limite de drawdown avant d''en avoir besoin, pas pendant.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 2, 'EX', 'Trois positions, un seul risque', 'EXF: Compétence évaluée
Objectifs 5 et 6 : calculer une taille de position à partir d''un capital, d''un risque de 1 % et d''une distance de stop ; placer un stop à un niveau justifié par la structure du graphique.

EXF: Consigne
**Partie A.** Trois situations te sont données. Pour chacune, calcule la taille de position qui correspond à un risque de 1 % sur un capital de 1 000 €.
**Partie B.** Un graphique EUR/USD H1 t''est présenté avec trois niveaux de stop proposés. Choisis-en un, puis sélectionne la raison de ton choix.

EXF: Ce que la plateforme doit fournir
- Partie A : une calculatrice à quatre champs — capital (prérempli à 1 000 €, verrouillé), risque en % (prérempli à 1, verrouillé), prix d''entrée, prix du stop — et un champ de saisie libre pour la taille. Validation avec une tolérance de ±5 %.
- Le calcul intermédiaire (distance en pips ou en dollars) est affiché automatiquement dès que l''entrée et le stop sont saisis. L''utilisateur doit voir la distance, pas la deviner.
- Partie B : un graphique EUR/USD H1 nu, sans indicateur, montrant une trentaine de bougies avec un creux nettement identifiable. Trois niveaux de stop A, B et C tracés en pointillés. Sélection unique, puis un QCM de justification à trois options.
- Aucun affichage du résultat futur du marché tant que la réponse n''est pas validée.

EXF: Correction commentée
**Partie A.**
- *Cas 1 — EUR/USD, entrée 1,0850, stop 1,0820.* 30 pips. Taille : 3 300 unités.
- *Cas 2 — EUR/USD, entrée 1,0850, stop 1,0790.* 60 pips. Taille : 1 650 unités. C''est le cas qui compte : le stop a doublé, la taille a été divisée par deux, et le risque n''a pas bougé d''un centime. La plupart des utilisateurs s''attendent à ce que le risque double.
- *Cas 3 — BTC/USD, entrée 62 000, stop 61 000.* 1 000 $. Taille : 0,01 BTC.
**Partie B.** La bonne réponse est le stop placé **sous le creux**.
Pourquoi les deux autres sont tentants : le stop serré autorise une position beaucoup plus grosse, ce qui rend le trade plus excitant, et il affiche un chiffre de perte plus petit à l''écran — deux récompenses immédiates pour une décision mauvaise. Le stop très large, lui, donne une sensation de sécurité : on se sent « à l''abri d''être sorti ». En réalité, il fait payer une invalidation déjà consommée. Dans les deux cas, la sensation et le calcul vont dans des directions opposées.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, '3.1', 'Le chandelier japonais', 'HOOK:
Un chandelier ne dit pas où va le prix. Il dit qui a gagné la dernière bataille, et avec quelle marge. C''est infiniment moins séduisant, et infiniment plus utile.

P: Chaque chandelier résume quatre valeurs et rien d''autre : l''**ouverture**, la **clôture**, le **plus haut** et le **plus bas** atteints pendant la période. Le rectangle central — le corps — représente la distance entre l''ouverture et la clôture. Les traits qui en sortent — les mèches — marquent les extrêmes.

P: La lecture utile porte sur ce que les mèches racontent. Une mèche signale un endroit où le prix est allé et **d''où il a été repoussé**. C''est un refus, pas un passage. Le marché y a testé un niveau et n''a pas réussi à s''y installer.

P: Le corps, lui, mesure la conviction. Un corps ample indique qu''un camp a tenu du début à la fin de la période. Un corps minuscule encadré de deux longues mèches indique l''inverse : beaucoup de mouvement, aucune décision.

CASE: Une heure de marché, lue correctement
Bougie H1 sur EUR/USD. Ouverture 1,0840 · plus haut 1,0872 · plus bas 1,0836 · clôture 1,0842.
Le prix a monté de **32 pips**, puis a rendu l''intégralité du mouvement pour clôturer 2 pips au-dessus de son ouverture.
Amplitude parcourue : 36 pips. Progrès net : 2 pips.
Lecture : les acheteurs ont dépensé une heure entière pour presque rien, et ils ont laissé derrière eux une mèche haute de 30 pips. Ce niveau, 1,0872, vient d''être refusé. Il servira de repère.

ERR: L''erreur classique
Nommer les figures avant de lire les nombres. Le débutant apprend « marteau », « doji », « avalement », puis cherche ces formes sur le graphique — et il en trouve, forcément, parce qu''il y en a partout. Une bougie isolée ne prédit rien : elle décrit. La question productive n''est pas « quelle figure est-ce ? » mais « où le prix a-t-il été refusé ? ».

KEY: À retenir
- Quatre nombres suffisent : ouverture, plus haut, plus bas, clôture.
- Une mèche marque un refus. Le prix y est allé et n''y est pas resté.
- Décris la bougie avant de la nommer. La description est plus riche que l''étiquette.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, '3.2', 'L''unité de temps', 'HOOK:
Le même marché, à la même seconde, peut être simultanément en tendance haussière et en tendance baissière. Il suffit de changer d''unité de temps. Ce n''est pas une contradiction du marché, c''est une question d''échelle d''observation.

P: L''**unité de temps** désigne la durée que résume chaque bougie. En H1, une bougie couvre une heure ; en H4, quatre heures. Les données sous-jacentes sont rigoureusement identiques : seul le niveau d''agrégation change.

P: Ce qui varie, en revanche, c''est le rapport entre le signal et le bruit. Plus l''unité est courte, plus tu observes de mouvements qui n''auront aucune conséquence. Tu ne vois pas plus de choses : tu vois les mêmes choses découpées plus finement, et donc davantage d''occasions apparentes d''agir.

P: La convention de travail retenue dans ce parcours attribue un rôle distinct à chaque unité. Le **H4 établit le contexte** — où se situent les grandes zones, quelle est la direction dominante. Le **H1 situe l''exécution** — où placer l''entrée, où poser le stop. Les deux ne votent pas : ils répondent à deux questions différentes.

CASE: La même journée, deux découpages
**En H1** : 24 bougies, amplitude moyenne d''environ 18 pips, une dizaine d''alternances entre bougies haussières et baissières.
**En H4** : 6 bougies, amplitude moyenne d''environ 45 pips, le plus souvent une seule direction lisible.
Les données sont les mêmes à la virgule près. Le nombre de moments où l''on peut se croire obligé d''agir a été divisé par quatre.

ERR: L''erreur classique
Descendre en unité de temps quand on est indécis. Le réflexe paraît raisonnable — regarder de plus près pour mieux voir. Le résultat est mécanique : davantage de bougies, davantage de mouvements, davantage de justifications disponibles pour entrer. Or l''étude de l''AMF est sans ambiguïté sur ce point : plus un client passe d''ordres, plus il perd.

KEY: À retenir
- H4 pose le contexte, H1 situe l''exécution. Deux rôles, jamais deux avis.
- Une unité plus courte n''ajoute pas d''information : elle ajoute du bruit.
- Face au doute, monte d''une unité de temps. Jamais l''inverse.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, '3.3', 'Sommets, creux et structure', 'HOOK:
Retire tout du graphique. Il te reste des sommets et des creux. C''est suffisant pour répondre à la seule question qui précède toute décision : ce marché va-t-il quelque part, ou tourne-t-il en rond ?

P: Un **sommet** est une bougie dont le plus haut dépasse celui des bougies qui l''entourent. Un **creux** est son symétrique vers le bas. Ce sont des faits observables, sans marge d''interprétation.

P: De leur enchaînement découlent trois états, et trois seulement. La **tendance haussière** : des sommets de plus en plus hauts *et* des creux de plus en plus hauts. La **tendance baissière** : des sommets de plus en plus bas *et* des creux de plus en plus bas. Et l''**absence de tendance**, dès que la double condition n''est pas remplie.

P: Ce troisième état mérite une attention particulière, parce qu''il est le plus fréquent et le plus mal traité. L''absence de tendance n''est pas une phase intermédiaire à interpréter finement en attendant que la direction se précise : c''est un état à part entière, celui où le débutant perd le plus, précisément parce qu''il y cherche une direction qui n''existe pas encore.

CASE: Une structure lue sans rien d''autre que des nombres
Séquence relevée sur EUR/USD en H4 :
creux 1,0790 · sommet 1,0865 · creux 1,0812 · sommet 1,0898 · creux 1,0844.
Les creux montent : 1,0790 < 1,0812 < 1,0844. Les sommets montent : 1,0865 < 1,0898.
La double condition est remplie : **structure haussière**, sans ambiguïté et sans le moindre outil.
Ce qui suit se lit d''avance : un prochain creux au-dessus de 1,0844 confirme la structure ; un creux en dessous ouvre le doute.

ERR: L''erreur classique
Forcer la lecture. Sur un graphique sans structure, on trouve toujours deux points qui montent — à condition de bien choisir lesquels. Le test est binaire et il ne se négocie pas : si tu dois hésiter sur les points à retenir, la réponse est « absence de tendance ». L''hésitation est l''information.

KEY: À retenir
- Trois états possibles : haussier, baissier, aucun. Le troisième est le plus courant.
- Une tendance exige les sommets *et* les creux dans le même sens.
- Si la lecture demande un effort d''interprétation, c''est qu''il n''y a rien à lire.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, '3.4', 'Zones de support et de résistance', 'HOOK:
Une ligne tracée sur un graphique n''exerce aucun pouvoir sur le marché. Ce qui en exerce, c''est le fait que des milliers de participants observent la même zone et y ont laissé des ordres.

P: Un **support** est une zone située sous le prix où des acheteurs sont déjà intervenus par le passé. Une **résistance** est son symétrique au-dessus. Le mot important est *zone* : le prix ne réagit pas à un chiffre exact mais à une bande de quelques pips, parce que les participants ne placent pas tous leurs ordres au même endroit.

P: Trois critères déterminent la crédibilité d''une zone : le nombre de fois où le prix y a réagi, la netteté du rejet — c''est-à-dire la longueur des mèches laissées — et sa fraîcheur. Une zone qui n''a pas été visitée depuis six mois décrit un marché qui n''existe plus.

P: Une précision qui évite beaucoup de déceptions : une zone n''arrête pas le prix. Elle désigne un endroit où quelque chose est *susceptible* de se produire, ce qui n''a rien à voir avec un endroit où quelque chose *va* se produire. La différence entre ces deux formulations est exactement la différence entre un repère et une prédiction.

CASE: Une zone qui s''use
EUR/USD en H4, zone comprise entre 1,0800 et 1,0812. Le prix y est descendu trois fois.
**Premier passage** : mèche basse de 18 pips — rejet franc.
**Deuxième passage** : mèche de 12 pips.
**Troisième passage** : mèche de 4 pips.
La zone tient toujours, mais la réaction s''affaiblit à chaque visite : les vendeurs y rencontrent de moins en moins d''opposition. Une zone testée trop souvent finit par céder, et l''affaiblissement des mèches est le signal avancé de cette usure.

ERR: L''erreur classique
Tracer dix zones. Un graphique couvert de lignes garantit qu''il y en aura toujours une à proximité du prix, donc toujours une justification disponible au moment où l''envie d''entrer se présente. Deux zones par unité de temps suffisent : la plus proche au-dessus, la plus proche en dessous. Au-delà, tu ne construis plus une lecture, tu fabriques des permissions.

KEY: À retenir
- Une zone, pas une ligne. Quelques pips de large, jamais un chiffre exact.
- Sa crédibilité tient au nombre et à la netteté des réactions passées.
- Deux zones au maximum par unité de temps.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, '3.5', 'Pourquoi aucun indicateur', 'HOOK:
Tu viens de lire quatre chapitres consacrés à la lecture de graphique sans croiser une seule moyenne mobile. Ce n''est pas un oubli, et ce n''est pas une position idéologique. C''est une question d''ordre.

P: Un **indicateur technique** est une formule appliquée aux quatre nombres que tu sais désormais lire. Une moyenne mobile calcule une moyenne de clôtures ; un oscillateur compare des amplitudes récentes. Aucun n''accède à une donnée que le graphique ne contient pas. Par construction, un indicateur ne peut donc pas ajouter d''information : il en retire, puisque son rôle est de résumer.

P: Le problème n''est pas l''outil, qui a sa place. Le problème est l''ordre dans lequel il arrive. Posé sur une lecture solide, un indicateur filtre : il élimine des configurations que tu aurais prises à tort. Posé sur rien, il **remplace** la lecture par une couleur, et transforme une question difficile en réponse binaire rassurante.

P: S''y ajoute un effet documenté et systématique : multiplier les outils ne produit pas de meilleures décisions, mais de meilleures justifications. Avec suffisamment d''indicateurs à l''écran, il s''en trouve toujours un pour approuver ce que tu avais envie de faire.

CASE: L''arithmétique de la justification
Prends trois indicateurs, chacun dans l''un des deux états possibles — favorable à l''achat ou à la vente. Cela produit **huit combinaisons**.
Une seule est un accord complet à l''achat. Une seule est un accord complet à la vente. Les **six autres** sont des désaccords.
Autrement dit, dans 75 % des cas, l''outillage ne tranche pas. En pratique, le trader qui souhaite acheter retient les deux indicateurs qui vont dans son sens et qualifie le troisième de « en retard ».
Les trois outils n''ont rien réglé. Ils ont fourni le matériau de la justification.

ERR: L''erreur classique
Chercher la combinaison d''indicateurs et de réglages qui aurait correctement lu les six derniers mois. Cette combinaison existe toujours — sur un historique donné, on finit forcément par en trouver une — et elle ne survit presque jamais au mois suivant. Le parcours Intermédiaire revient sur cette question avec la seule chose qui la rende sérieuse : une méthode pour tester au lieu d''espérer.

KEY: À retenir
- Un indicateur ne crée pas d''information : il en résume, donc il en perd.
- Le graphique nu d''abord. Les outils ensuite, sur une lecture qui tient déjà.
- Plus d''outils signifie plus de justifications disponibles, pas plus de justesse.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 3, 'EX', 'Lecture à froid', 'EXF: Compétence évaluée
Objectifs 3, 4 et 7 : lire un chandelier, justifier le choix d''une unité de temps, identifier une structure et deux zones sur un graphique nu.

EXF: Consigne
Un graphique EUR/USD en H4 t''est présenté, sans aucun outil.
**1.** Qualifie la structure — haussière, baissière, ou aucune — et place les deux points qui justifient ta réponse.
**2.** Trace la zone la plus proche au-dessus du prix, et la plus proche en dessous.
**3.** Réponds : en H1, verrais-tu la même chose ?

EXF: Ce que la plateforme doit fournir
- Un graphique H4 nu de 60 bougies sur EUR/USD, présentant une structure haussière lisible avec une correction en partie droite. Aucun indicateur, aucune annotation préexistante.
- Un outil « marquer un point » limité à deux usages, et un outil « tracer une zone » limité à deux usages, avec largeur ajustable. Ces limites sont volontaires et font partie de l''enseignement : l''outil doit refuser la troisième zone.
- Une bascule H1 / H4 **verrouillée** jusqu''à la validation des questions 1 et 2. L''utilisateur ne doit pas pouvoir aller chercher en H1 la confirmation de ce qu''il n''a pas su lire en H4.
- Un QCM à trois options pour la question 3.

EXF: Correction commentée
**Question 1.** Structure haussière. Les deux points attendus sont les **deux derniers creux**, et non les sommets.
C''est le point pédagogique central de l''exercice : la majorité des utilisateurs marque les sommets, parce que ce sont eux que l''œil remarque. Or une tendance haussière ne se casse pas par ses sommets, elle se casse par ses creux — et c''est exactement là que se placera le stop calculé au module 2. Marquer les sommets, c''est regarder la partie du graphique qui n''entre dans aucune décision.
**Question 2.** Une zone au-dessus, une en dessous, avec une tolérance de ±10 pips. Toute tentative d''en tracer une troisième est refusée par l''outil, sans message d''erreur autre que la limite affichée.
**Question 3.** En H1, la partie droite du graphique paraît neutre, voire baissière. C''est le piège attendu, et la bonne réponse n''est pas « le H1 se trompe ». La bonne réponse est : **le H1 ne répond pas à cette question**. Une correction à l''intérieur d''une tendance haussière ressemble toujours à une tendance baissière quand on la regarde de trop près. Les deux unités ne sont pas en désaccord : elles n''ont pas été interrogées sur le même sujet.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, '4.1', 'Scénario, invalidation, objectif', 'HOOK:
« Je pense que ça va monter » n''est pas un scénario. C''est une opinion — et une opinion ne peut pas avoir tort, elle peut seulement être déçue. La différence n''est pas rhétorique : elle décide de ce que tu feras dans deux heures.

P: Un scénario exploitable comporte trois éléments, tous écrits **avant** l''entrée. Ce que tu attends, formulé en termes de prix et non d''intention. Le niveau qui prouvera que tu t''es trompé, appelé **invalidation**. Le niveau où tu prends ton gain, appelé objectif.

P: La propriété qui distingue un scénario d''une opinion est la falsifiabilité : il doit exister un prix précis dont l''atteinte signifie « j''avais tort ». Sans ce prix, tu n''as rien écrit d''exploitable, et tu découvriras ta position perdante sans jamais pouvoir dire à quel moment elle a cessé d''être valable.

P: La conséquence pratique est une chaîne, et l''ordre des maillons n''est pas négociable. L''invalidation détermine le stop. Le stop détermine la taille — c''est la formule du module 2. L''objectif détermine le ratio du chapitre suivant. Tout découle de trois lignes écrites à froid.

CASE: Un scénario complet, du premier au dernier nombre
EUR/USD en H4, structure haussière, dernier creux à 1,0844. Prix actuel : 1,0868.
**Scénario** : le prix revient dans la zone 1,0844–1,0850 et repart vers le dernier sommet, 1,0898.
**Invalidation** : clôture H4 sous 1,0838, c''est-à-dire sous le creux qui soutient la structure.
**Entrée** : 1,0852. **Objectif** : 1,0895.
Risque : 14 pips. Gain visé : 43 pips.
Taille pour 1 % sur 1 000 € : 10 € ÷ 14 = 0,71 € par pip, soit environ **7 100 unités**.
Aucun de ces nombres n''a été choisi par confort. Chacun découle du précédent.

ERR: L''erreur classique
Écrire l''objectif en premier. Le débutant décide combien il veut gagner, puis cherche l''entrée qui rendrait ce gain possible. L''ordre correct part de l''invalidation, seul élément que le marché fournit — les deux autres viennent de toi, et l''un d''eux vient surtout de ton envie.

KEY: À retenir
- Trois lignes écrites avant l''entrée : attente, invalidation, objectif.
- Un scénario qu''aucun prix ne peut démentir n''est pas un scénario.
- L''invalidation vient du graphique. L''objectif s''en déduit. Jamais l''inverse.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, '4.2', 'Ratio gain/risque et seuil d''équilibre', 'HOOK:
Avoir raison souvent ne suffit pas. On peut gagner sept trades sur dix et terminer l''année en perte. Deux minutes de calcul suffisent à comprendre pourquoi — et à ne plus jamais juger une méthode sur son taux de réussite.

P: Le **ratio gain/risque**, noté R/R, rapporte le gain visé au risque accepté. Un trade qui risque 10 € pour en viser 30 est un trade à 3R. C''est une donnée connue avant l''entrée, contrairement au résultat.

P: De ce ratio se déduit une valeur beaucoup plus intéressante : le taux de réussite minimal en dessous duquel tu perds de l''argent. La formule est courte.

CARD: Le seuil d''équilibre
**Taux de réussite minimal = 1 ÷ (1 + R/R)**
En dessous de ce taux, une méthode perd. Au-dessus, elle gagne. Le calcul se fait avant d''entrer, pas après cent trades.

TABLE: 40,60 || Ratio gain/risque | Taux de réussite nécessaire pour être à l''équilibre
1R | 50 %
1,5R | 40 %
2R | 33 %
3R | 25 %
5R | 17 %

CASE: Ce que le tableau signifie vraiment
À **3R**, tu peux te tromper trois fois sur quatre et rester à l''équilibre. C''est une marge d''erreur considérable, et elle est offerte par la structure du trade, pas par ta perspicacité.
À **0,5R**, il te faut 67 % de réussite — un niveau que presque personne ne tient sur la durée.
Et ces seuils sont **bruts** : ils ignorent le spread et les frais de report du module 1. Une fois ces coûts intégrés, un trade théoriquement à l''équilibre est un trade réellement perdant.

ERR: L''erreur classique
Viser petit pour « sécuriser ». Prendre systématiquement 5 pips de gain en risquant 20 pips produit une longue série de trades gagnants et un compte qui descend. La sensation est excellente — on a raison presque à chaque fois — et le relevé est mauvais. C''est le piège le plus confortable du métier, parce que rien dans l''expérience vécue ne signale l''erreur.

KEY: À retenir
- Taux de réussite minimal = 1 ÷ (1 + R/R). Calcule-le avant d''entrer.
- En dessous de 1,5R, les frais absorbent l''avantage.
- Un fort taux de réussite avec un R/R faible est une manière lente de perdre.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, '4.3', 'L''espérance', 'HOOK:
Quelqu''un qui a raison 40 % du temps peut gagner de l''argent chaque année. Quelqu''un qui a raison 70 % du temps peut se ruiner. La différence tient dans une multiplication que tu peux poser en trente secondes.

P: L''**espérance** est le gain moyen que produit un trade, tous résultats confondus. Elle réunit les deux variables que les débutants examinent séparément : la fréquence des gains et leur ampleur.

CARD: La formule
**Espérance = (taux de réussite × gain moyen) − (taux d''échec × perte moyenne)**
Exprimée en R, elle donne directement ce que rapporte un trade en moyenne. C''est le seul chiffre qui décrive un système complet.

CASE: Deux profils, deux conclusions inverses
**Profil A** — 40 % de réussite, gain moyen 3R, perte moyenne 1R.
(0,40 × 3) − (0,60 × 1) = 1,20 − 0,60 = **+0,60 R par trade**.
**Profil B** — 70 % de réussite, gain moyen 0,4R, perte moyenne 1R.
(0,70 × 0,4) − (0,30 × 1) = 0,28 − 0,30 = **−0,02 R par trade**.
Sur 200 trades : A se trompe 120 fois et gagne environ 120 R. B a raison 140 fois et perd, avant même de compter le spread.
Le profil qui donne la meilleure impression au quotidien est celui qui vide le compte.

ERR: L''erreur classique
Juger une méthode sur son taux de réussite. C''est le chiffre le plus visible, le plus facile à raconter, et le moins informatif de tous. Isolé, il ne dit strictement rien : il n''a de sens qu''accompagné du R moyen.

KEY: À retenir
- Espérance = (réussite × gain moyen) − (échec × perte moyenne), en R.
- Une espérance faiblement positive et répétée bat une méthode brillante et rare.
- Ne juge jamais un système sur son taux de réussite seul.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, '4.4', 'La checklist pré-ordre', 'HOOK:
Le moment où tu es le moins capable de juger est précisément celui où ton doigt est sur le bouton. La checklist existe pour que la décision soit déjà prise quand ce moment arrive.

P: Son rôle n''est pas d''améliorer tes trades : c''est d''éliminer ceux que tu prends par réflexe. Elle déplace la décision d''un instant chargé émotionnellement vers un moment froid, où les critères ont été fixés sans enjeu.

UL:
- La structure est-elle lisible en H4 ? Si la réponse est « aucune tendance », je n''entre pas.
- Où se situe mon invalidation, en prix ?
- Quelle taille ce stop impose-t-il pour un risque de 1 % ?
- Quel est le ratio gain/risque ? En dessous de 1,5, je n''entre pas.
- Ce trade ressemble-t-il à mes trades précédents, ou est-ce une exception ?
- Combien de trades ai-je déjà pris aujourd''hui ?

P: La règle d''usage est brutale et c''est ce qui la rend efficace : **une seule réponse manquante annule le trade**. Pas de pondération, pas de compensation entre critères, pas de « presque ».

CASE: Un bon trade refusé
Évaluation d''une configuration réelle, question par question.
Structure H4 lisible : **oui**, haussière. Invalidation : **oui**, 1,0838. Taille pour 1 % : **oui**, 7 100 unités. Ratio gain/risque : **oui**, 43 ÷ 14 = 3,1. Conforme aux trades précédents : **oui**.
Trades déjà pris aujourd''hui : **4**, pour une limite fixée à 3. **Non.**
Résultat : **trade refusé**.
Ce trade était peut-être gagnant. La règle n''existe pas pour optimiser celui-ci : elle existe pour supprimer les trente trades du même type qui suivront, dont la plupart ne vaudront rien.

ERR: L''erreur classique
Adapter la checklist au trade. Dès qu''une réponse manque, la tentation est de reformuler la question plutôt que de renoncer. Une checklist modifiée pendant une session ne filtre plus rien : elle se contente d''enregistrer ce que tu avais décidé de faire.

KEY: À retenir
- Six questions, toutes obligatoires. Une seule manquante annule le trade.
- Elle se remplit avant le clic, pas pendant.
- Elle ne se modifie qu''en dehors des heures de marché.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, '4.5', 'Le trade que tu ne prends pas', 'HOOK:
L''étude de l''AMF a mesuré une relation d''une simplicité désarmante sur 14 799 clients : plus ils passaient d''ordres, plus ils perdaient. Pas de seuil, pas d''exception, pas de catégorie épargnée. Une droite.

P: Ne pas entrer est une décision, pas une absence de décision. Elle a un coût nul et une valeur mesurable : elle évite l''espérance négative des configurations moyennes, qui constituent l''écrasante majorité de ce que tu verras.

P: La sélectivité est donc une variable de performance au même titre que le R/R. Sur une vingtaine de configurations repérées dans une semaine, trois ou quatre passent réellement la checklist. Les seize autres ne sont pas des occasions manquées : ce sont des trades à espérance faible que tu as eu la chance de ne pas prendre.

P: Reste l''obstacle réel, qui n''est pas technique. Une séance sans trade donne l''impression de n''avoir rien fait. C''est une illusion complète : la sélectivité *est* le travail, et elle est même la partie la plus difficile à tenir.

CASE: Deux semaines, même méthode, même personne
**Semaine 1** — 4 trades, tous conformes : +2R, −1R, +3R, −1R. Résultat : **+3R**.
**Semaine 2** — 14 trades, dont 10 pris par ennui. Les 4 conformes produisent le même +3R. Les 10 autres rapportent en moyenne −0,2R chacun, soit −2R, auxquels s''ajoute le spread de dix allers-retours.
Résultat : **+1R au mieux**.
Les dix trades supplémentaires ont coûté les deux tiers de la performance de la semaine. Ils ont aussi occupé l''essentiel du temps passé devant l''écran.

ERR: L''erreur classique
Mesurer sa journée au nombre de trades pris. Personne ne se sent productif après quatre heures d''observation sans un seul ordre. C''est pourtant, très souvent, la séance la plus rentable de la semaine — et la seule qui ne laisse aucune trace dans le relevé.

KEY: À retenir
- Ne pas entrer est une décision, et elle se consigne comme les autres.
- Trois à quatre configurations conformes par semaine, pas quatorze.
- Une séance sans trade n''est pas une séance perdue.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 4, 'EX', 'Le plan avant le clic', 'EXF: Compétence évaluée
Objectifs 8, 9 et 10 : calculer un ratio gain/risque, rédiger un plan de trade complet, refuser un trade en nommant la règle qui le refuse.

EXF: Consigne
Un graphique EUR/USD t''est présenté en H4 et en H1.
**1.** Remplis le plan de trade : scénario, entrée, invalidation, objectif.
**2.** Vérifie le ratio gain/risque calculé automatiquement.
**3.** Passe la checklist en six points, puis prends ta décision finale.

EXF: Ce que la plateforme doit fournir
- Un écran scindé, H4 en haut et H1 en bas, sur le même actif et la même période.
- Un formulaire à quatre champs : scénario en texte libre (200 caractères), puis entrée, invalidation et objectif — ces trois derniers saisis au clavier ou en cliquant directement sur le graphique.
- Un affichage en direct de la taille de position et du R/R dès que les trois prix sont renseignés. L''utilisateur doit voir le R/R évoluer pendant qu''il déplace son objectif : c''est la meilleure façon d''installer le chapitre 4.2.
- Les six items de la checklist en cases à cocher, avec un compteur « trades pris aujourd''hui » **préréglé à 3** et non modifiable.
- Un bouton de décision finale à deux issues : « Je prends » / « Je ne prends pas ».

EXF: Correction commentée
Le R/R attendu est d''au moins 1,5 et la taille doit correspondre à un risque de 1 % sur 1 000 €. Ces deux points sont vérifiés automatiquement et ne constituent pas la difficulté de l''exercice.
La difficulté est ailleurs, et elle est délibérée. Le compteur est à 3, donc la sixième question de la checklist échoue, donc **le trade doit être refusé** — même si les cinq autres réponses sont excellentes, et elles le sont.
La majorité des utilisateurs valide quand même. Non par distraction, mais parce que le trade est objectivement bon et que la règle paraît accessoire à cet instant précis. C''est exactement la situation que la règle existe pour couvrir : elle n''a aucune utilité face aux mauvais trades, que tu écarterais de toute façon. Elle n''a d''utilité que face aux beaux.
Un bon plan de trade refusé reste un bon plan de trade. Il se consigne au journal avec la mention « non pris », et il compte dans tes statistiques du module 6.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 5, '5.1', 'L''effet de disposition', 'HOOK:
Tu clôtures un gain de 12 € avec soulagement. Tu laisses courir une perte de 40 € en te disant que ça va revenir. Ce comportement porte un nom, il a été mesuré sur dix mille comptes, et il te concerne — la question n''est pas de savoir si tu y échapperas, mais quelle règle tu lui opposeras.

P: L''**effet de disposition** désigne la tendance à réaliser ses gains trop tôt et à différer la réalisation de ses pertes. Terrance Odean l''a établi en 1998 sur dix mille comptes de courtage : à situation comparable, les investisseurs vendent leurs positions gagnantes une fois et demie à deux fois plus souvent que leurs positions perdantes.

P: Le mécanisme est asymétrique et parfaitement compréhensible. Une position gagnante non clôturée est une source d''inquiétude permanente ; la clôturer convertit une incertitude désagréable en certitude agréable. Une position perdante non clôturée, elle, reste une perte « sur le papier » — la fermer la rend définitive, et surtout, la rend vraie.

P: L''effet produit est mécanique : des gains moyens systématiquement plus petits que les pertes moyennes. Autrement dit, une dégradation structurelle du ratio gain/risque, indépendante de la qualité de l''analyse. Le module 4 démontrait qu''un R/R dégradé suffit à faire perdre une méthode juste. C''est exactement ce qui se produit ici.

CASE: Une méthode rentable, rendue perdante par son exécution
Vingt trades, méthode correcte, stop à 1R et objectif à 3R, taux de réussite de 40 %.
**Exécution conforme** : 8 gains à 3R, 12 pertes à 1R, soit 24 − 12 = **+12 R**.
**Exécution avec effet de disposition** : les gains sont coupés en moyenne à 1,2R, et deux pertes sont laissées filer jusqu''à 2,5R.
8 × 1,2 = 9,6 R. Pertes : 10 × 1 + 2 × 2,5 = 15 R. Résultat : **−5,4 R**.
La méthode n''a pas changé d''un iota. L''analyse était identique. Seule l''exécution a bougé, et elle a transformé +12 R en −5,4 R.

ERR: L''erreur classique
Appeler cela de la prudence. « Je sécurise mes gains » est la formulation présentable d''un comportement qui, une fois mesuré, détruit l''espérance. La prudence a toute sa place en trading — elle s''exerce dans la taille de position, décidée avant l''entrée. Pas dans la sortie anticipée, décidée sous tension.

KEY: À retenir
- Tu couperas tes gains et tu laisseras courir tes pertes. C''est documenté, pas hypothétique.
- L''effet de disposition dégrade le R/R sans jamais toucher à l''analyse.
- Seule contre-mesure fiable : objectif et stop fixés avant l''entrée, non renégociés après.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 5, '5.2', 'Surtrading et excès de confiance', 'HOOK:
Sur 14 799 clients français, ceux qui passaient le plus d''ordres perdaient le plus. Sur 66 465 ménages américains, les plus actifs ont sous-performé le marché de plus de six points par an. Deux échantillons, deux continents, deux décennies d''écart, la même droite.

P: Barber et Odean ont examiné les comptes de 66 465 ménages américains entre 1991 et 1996. Le ménage moyen obtient 16,4 % par an ; le quintile le plus actif, 11,4 % ; le marché, 17,9 %. L''écart ne s''explique pas par de mauvais choix de titres : il s''explique par le **volume d''activité lui-même**.

P: L''explication retenue par les auteurs est l''excès de confiance. Chacun surestime la qualité de son information et sous-estime la part du hasard dans ses réussites — ce qui conduit à agir plus souvent que ne le justifierait l''information réellement détenue.

P: S''y ajoute un mécanisme d''auto-renforcement particulièrement difficile à désamorcer. Un gain est attribué à la compétence ; une perte, aux circonstances. L''échantillon des souvenirs est donc biaisé dans une seule direction, et la confiance continue de monter alors même que le relevé de compte descend. Les deux courbes se croisent sans jamais se rencontrer.

CASE: Les trois mesures de l''AMF vont dans le même sens
Sur les 14 799 clients suivis quatre ans :
Ceux ayant passé **au moins 250 ordres** représentent 52 % de la population étudiée et perdent en moyenne **18 741 €**.
Ceux dont la **taille moyenne d''ordre dépasse 10 000 €** représentent 62 % de la population et perdent en moyenne **14 876 €**.
Nombre d''ordres, taille moyenne, volume cumulé : les trois mesures donnent le même résultat, et aucune sous-population n''y échappe.

ERR: L''erreur classique
Interpréter une bonne série comme une montée de niveau. C''est le moment précis où la taille des positions augmente, « puisque ça marche ». Statistiquement, cette augmentation intervient juste avant le retour à la moyenne — c''est-à-dire au pire moment possible, et pour une raison qui semble excellente.

KEY: À retenir
- L''activité elle-même est corrélée à la perte. Le nombre d''ordres est une variable de risque.
- Une bonne série n''est pas une preuve de compétence : c''est un échantillon court.
- Fixe ta taille et ton nombre de trades hors séance, quand rien n''est en jeu.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 5, '5.3', 'La spirale après une perte', 'HOOK:
La perte de 10 € ne t''a rien fait. Ce qui t''a fait quelque chose, c''est de constater que tu t''étais trompé. Les vingt minutes qui suivent sont, statistiquement, les plus coûteuses de ta journée.

P: La séquence est stéréotypée et se déroule en quatre temps. La perte. Le besoin de réparation immédiate. L''entrée hors checklist, sur une configuration qui n''aurait pas passé le filtre une heure plus tôt. Et l''augmentation de taille, destinée à « compenser en un seul trade ».

P: Chaque étape est individuellement défendable. C''est l''enchaînement qui vide un compte, et il est d''autant plus difficile à interrompre que chaque maillon paraît raisonnable pris isolément.

P: Le point de bascule est identifiable et il est **linguistique**. Tant que tu penses « −1 R », tu es à l''intérieur du système : la perte a une unité, une place dans une série, une signification statistique. Dès que tu penses « −10 €, il me faut 10 € », tu es sorti du système et tu poursuis une somme. Le changement d''unité précède toujours le changement de comportement.

CASE: Quarante minutes
**Trade 1**, conforme, prévu au plan : **−1 R**.
**Trade 2**, six minutes plus tard, hors checklist, taille doublée pour rattraper : **−2 R**.
**Trade 3**, quinze minutes après, taille quadruplée : **−4 R**.
Total : **−7 R**, soit sept séances normales de travail effacées en quarante minutes.
Le seul des trois qui faisait partie du plan est celui qui a coûté le moins cher.

ERR: L''erreur classique
Croire qu''on saura reconnaître cet état au moment où il se produit. On ne le reconnaît pas — c''est la définition même de l''état. La contre-mesure ne peut donc pas prendre la forme d''une décision prise pendant. Elle doit être une règle mécanique, posée avant, et qui s''applique sans que tu aies à juger de sa pertinence sur le moment.

KEY: À retenir
- Après une perte, la contre-mesure est un délai, pas un effort de volonté : aucun ordre pendant trente minutes.
- Deux pertes dans la séance : la séance est terminée. Sans exception, sans évaluation.
- Si tu comptes en euros et non en R, tu n''es déjà plus en train de trader.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 5, '5.4', 'Des règles qui tiennent', 'HOOK:
Toutes les règles de ce module partagent une propriété : elles s''écrivent quand le marché est fermé et s''appliquent sans jugement quand il est ouvert. Une règle qui exige une évaluation au moment de s''appliquer n''est pas une règle — c''est une intention.

P: Le principe est simple à formuler et difficile à tenir : externaliser la décision hors de l''état émotionnel qui la fausse. Les règles qui survivent à l''usage partagent trois propriétés — elles sont **numériques**, **vérifiables sans interprétation**, et **posées à l''avance**.

UL:
- Risque fixe de 1 % par trade, jamais ajusté en cours de séance.
- Trois trades au maximum par séance.
- Deux pertes : la séance est terminée.
- Trente minutes d''attente après toute perte.
- Aucun ordre sans les six réponses de la checklist.
- Objectif et stop non renégociables une fois la position ouverte.
- Drawdown de 10 % sur le mois : arrêt complet et revue du journal.

P: Ces sept règles ne constituent pas une méthode. Elles n''ont aucune prétention à générer un gain. Leur fonction est plus modeste et plus décisive : permettre à une méthode, quelle qu''elle soit, d''être testée sur un échantillon suffisant avant que le compte ne disparaisse.

CASE: Ce que coûte l''absence de la septième règle
Capital de 1 000 €, risque de 1 %, trois trades par séance, arrêt à deux pertes. La perte maximale d''une séance est donc de 2 %.
**Sans règle mensuelle** : vingt séances consécutivement perdantes ramènent le capital à 667 €, soit un drawdown de **−33 %**.
**Avec la règle des 10 %** : l''arrêt se déclenche à la sixième séance perdante, drawdown contenu autour de **−11 %**.
Même méthode, même série de malchance, même risque par trade. La seule différence est une ligne écrite un dimanche soir.

ERR: L''erreur classique
Écrire les règles sans écrire ce qui se passe quand on les enfreint. Une règle sans conséquence attachée est un souhait. La conséquence n''a pas besoin d''être punitive — consigner l''infraction dans le journal suffit largement, à condition que ce soit systématique et que le chiffre soit relu à la fin du mois.

KEY: À retenir
- Une règle utile est numérique, vérifiable, et écrite marché fermé.
- Sept règles suffisent. Au-delà, aucune n''est réellement appliquée.
- Attache à chaque règle une conséquence écrite, même minime.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 5, 'EX', 'Quatre situations, une règle', 'EXF: Compétence évaluée
Objectifs 10 et 12 : refuser un trade en nommant la règle qui le refuse ; reconnaître un biais documenté dans une situation concrète.

EXF: Consigne
Quatre situations te sont présentées l''une après l''autre. Pour chacune : **je prends** ou **je ne prends pas**, puis sélectionne dans la liste la règle qui justifie ta décision.

EXF: Ce que la plateforme doit fournir
- Quatre cartes séquentielles, sans retour en arrière possible. L''impossibilité de revenir fait partie de l''exercice : elle reproduit la condition réelle.
- Chaque carte comporte un mini-graphique H1 statique, et un bandeau d''état affichant en permanence : capital, nombre de trades pris aujourd''hui, résultat de la séance en cours, minutes écoulées depuis le dernier trade.
- Deux boutons de décision, puis une liste déroulante contenant les sept règles du module. La règle doit être choisie **après** la décision, jamais avant.
- Aucune indication de ce qu''a fait le marché ensuite. Cet exercice évalue une décision, pas un résultat.

EXF: Correction commentée
- **Situation 1** — configuration conforme, aucun trade pris, séance à l''équilibre. Réponse : *je prends*. Règle invoquée : checklist complète. C''est la seule des quatre où entrer est correct.
- **Situation 2** — configuration conforme, deux pertes déjà encaissées dans la séance. Réponse : *je ne prends pas*. Règle : deux pertes, séance terminée. La configuration proposée est objectivement la meilleure des quatre, et c''est entièrement délibéré : une règle qui ne résiste pas à une belle configuration ne sert à rien, puisque c''est le seul moment où elle est mise à l''épreuve.
- **Situation 3** — configuration moyenne, ratio gain/risque à 1,2, aucun trade pris. Réponse : *je ne prends pas*. Règle : ratio minimum de 1,5. Le piège ici est l''absence de tout autre obstacle : rien dans le bandeau d''état ne s''oppose au trade, et il faut aller chercher le seul chiffre qui le disqualifie.
- **Situation 4** — configuration conforme, dernier trade perdant il y a huit minutes. Réponse : *je ne prends pas*. Règle : trente minutes d''attente. Rien n''interdit ce trade sur le fond ; seul le délai le bloque. C''est la situation que les utilisateurs valident le plus souvent, et c''est précisément la deuxième marche de la séquence décrite au chapitre 5.3.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, '6.1', 'Le journal de trading', 'HOOK:
L''AMF a isolé 1 881 clients actifs quatre années de suite. Leur taux de perte n''a pas baissé : 87,56 %. L''expérience seule n''enseigne rien — c''est mesuré. Ce qui enseigne, c''est la trace écrite qu''on en garde.

P: La mémoire ne suffit pas, et pour une raison précise : elle est reconstruite. Tu te souviens de la conclusion, pas de la décision — et la conclusion contamine rétrospectivement le souvenir de la décision. Un trade gagnant devient une bonne idée ; un trade perdant, une erreur. Dans les deux cas, la reconstruction efface l''information utile.

P: Le relevé de compte ne suffit pas davantage : il donne les résultats, jamais les raisons. Sept champs, en revanche, suffisent — à condition de les remplir au bon moment.

UL:
- Date et heure d''entrée.
- Actif et unité de temps.
- Scénario en une phrase, **écrit avant l''entrée**.
- Invalidation et objectif, en prix.
- Taille de position et risque en R.
- Résultat en R, jamais en euros.
- Conformité : le trade respectait-il les six questions de la checklist ? Oui ou non.

P: Le septième champ est le seul qui produise de l''apprentissage. Les six premiers décrivent ; celui-là juge le processus, indépendamment de ce qu''a fait le marché. C''est aussi le plus facile à négliger, précisément parce qu''il est le seul à pouvoir te donner tort quand tu as gagné.

CASE: Une entrée complète
*12/03, 14 h 20 · EUR/USD H1 · Retour dans la zone 1,0850–1,0844 en tendance H4 haussière, reprise attendue vers 1,0898 · Invalidation 1,0838, objectif 1,0895 · 7 100 unités, 1 R = 10 € · Résultat : −1 R · Conforme : oui.*
Ce trade est **perdant et conforme**. Il n''appelle aucune correction, aucune remise en question, aucun ajustement de méthode.
C''est la distinction que développe le chapitre suivant, et c''est la plus difficile à accepter du parcours entier.

ERR: L''erreur classique
Consigner les résultats en euros. « −40 € » ne se compare à rien : ni à tes autres trades, dont le risque variait, ni à ton capital d''il y a six mois, qui n''était pas le même. « −1 R » se compare à tout. Le journal en euros produit de l''émotion ; le journal en R produit des statistiques.

KEY: À retenir
- Sept champs, dont un seul porte sur le processus. C''est celui qui compte.
- Le scénario s''écrit avant l''entrée, sinon il est réécrit par le résultat.
- Tout se note en R. Jamais en euros.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, '6.2', 'Décision et résultat', 'HOOK:
Quatre trades, quatre issues. Deux méritent une correction, deux n''en méritent aucune — et ce ne sont pas les deux perdants.

P: Croiser la conformité de la décision et la nature du résultat produit quatre cas, dont deux sont contre-intuitifs. C''est cette grille, et non le solde du compte, qui indique sur quoi travailler le mois suivant.

TABLE: 34,33,33 || | Résultat gagnant | Résultat perdant
**Décision conforme** | Rien à faire. Répéter. | Rien à corriger. C''est le coût normal de l''activité.
**Décision non conforme** | Le cas dangereux : le résultat récompense l''infraction. | Le cas facile : la douleur et l''erreur coïncident.

P: La case la plus mal traitée est « conforme et perdant ». Elle représente la majorité de tes trades — un système à 40 % de réussite en produit six sur dix — et c''est celle que tout le monde s''acharne à corriger, parce qu''elle fait mal.

P: La case la plus coûteuse est « non conforme et gagnant ». Rien ne signale l''erreur : le compte monte, la sensation est bonne, et le comportement s''inscrit dans les habitudes. On appelle *resulting* le fait de juger une décision à son issue. Sur un échantillon court, l''issue est majoritairement du bruit.

CASE: Un mois de quarante trades
**Trente trades conformes** : 12 gagnants à +3R, 18 perdants à −1R, soit 36 − 18 = **+18 R**.
**Dix trades non conformes** : 4 gagnants à +1,5R, 6 perdants à −2,2R — les stops ayant été déplacés. Soit 6 − 13,2 = **−7,2 R**.
Bilan du mois : **+10,8 R**.
Les dix trades hors cadre ont retiré 40 % de la performance. Et les quatre gagnants qu''ils contiennent sont exactement la raison pour laquelle ils seront répétés le mois suivant.

ERR: L''erreur classique
Réviser sa méthode après une série de pertes conformes. C''est la réaction la plus fréquente et la plus destructrice qui soit : elle remplace un système à espérance positive par un système non testé, au moment précis où le premier traversait sa variance normale. Deux mois plus tard, la même chose recommence avec le nouveau.

KEY: À retenir
- Conforme et perdant : aucune correction. C''est le coût de l''activité.
- Non conforme et gagnant : à traiter en priorité, malgré le résultat.
- Ne change jamais de méthode sur la base d''une série courte.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, '6.3', 'Lire ses propres statistiques', 'HOOK:
Après trente trades, ton journal contient plus d''information sur toi que n''importe quelle formation. Encore faut-il savoir quels trois nombres en extraire, et dans quel ordre les lire.

P: Trois nombres, et pas un de plus.

UL:
- **Le taux de conformité** — trades conformes divisés par trades totaux. La seule mesure que tu contrôles entièrement, donc la première à corriger. Vise au-delà de 90 %.
- **Le R moyen par trade** — l''espérance du module 4, calculée exclusivement sur les trades conformes. C''est la mesure de ta méthode, à condition qu''elle porte sur des trades qui l''appliquaient vraiment.
- **La série de pertes maximale** — à comparer avec ta limite de drawdown. Si elle en approche, ce n''est pas la méthode qui est en cause : c''est ton risque par trade qui est trop élevé pour elle.

P: L''ordre de lecture n''est pas négociable, et il découle du premier point : tant que la conformité est basse, le R moyen ne mesure pas ta méthode, il mesure ton indiscipline. Sous **30 trades conformes**, aucune des trois valeurs n''est interprétable — c''est la limite la plus systématiquement ignorée par les débutants.

CASE: Un relevé de quarante-cinq trades
Conformité : 31 / 45 = **69 %**.
R moyen sur l''ensemble des 45 trades : **+0,05 R** — soit à peu près rien.
R moyen sur les 31 trades conformes : **+0,52 R**.
Série de pertes maximale : 6.
Lecture : la méthode possède une espérance nettement positive, et quatorze trades hors cadre l''ont ramenée à zéro. Le travail du mois suivant ne porte donc pas sur la méthode — elle fonctionne. Il porte entièrement sur les quatorze.

ERR: L''erreur classique
Calculer ses statistiques sur l''ensemble des trades. Mélanger conformes et non conformes produit une moyenne qui ne décrit aucun système existant : ni celui que tu as conçu, ni celui que tu as appliqué. On en conclut alors que « la méthode ne marche pas », alors qu''elle n''a jamais été mise à l''épreuve.

KEY: À retenir
- Trois mesures : conformité, R moyen sur les conformes, série de pertes maximale.
- Rien n''est interprétable sous 30 trades conformes.
- Corrige la conformité avant de toucher à la méthode.', 32);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, '6.4', 'La pratique délibérée', 'HOOK:
Répéter mille trades n''apprend rien : c''est mesuré, sur quatre ans en France et sur trois années de cohortes au Brésil. Ce qui apprend, c''est une répétition avec correction immédiate et objectif étroit. La différence entre les deux tient dans l''organisation, pas dans le talent.

P: La **pratique délibérée** désigne la répétition d''une tâche précise, située à la limite de sa compétence actuelle, assortie d''un retour immédiat portant sur l''exécution et non sur le résultat. C''est le seul régime d''entraînement dont l''efficacité soit établie dans les disciplines complexes.

P: Appliquée au trading, cette définition exclut deux pratiques extrêmement répandues : trader « pour voir », et travailler plusieurs compétences en même temps. Dans les deux cas, le retour d''information devient inexploitable, puisqu''on ne sait plus ce qu''il évalue.

UL:
- Une seule compétence par session — repérer des creux, *ou* calculer une taille, jamais les deux.
- Vingt répétitions au minimum sur données historiques rejouées.
- Correction après chaque répétition, jamais à la fin de la session.
- Aucune tenue de score en euros pendant l''entraînement.
- Une note écrite en fin de session : ce qui a été difficile, en une phrase.

P: Le simulateur est ce qui rend cette structure possible. Il compresse en une heure un échantillon de situations qui demanderait des mois à se présenter en temps réel — et il autorise l''erreur, ce qu''aucun compte réel ne fait.

CASE: Deux façons de dépenser dix heures
**Option A** — dix heures de trading en simulation, toutes compétences mêlées. Environ **25 décisions**, chacune évaluée sur son résultat, aucune isolée.
**Option B** — dix sessions d''une heure, une compétence par session. Environ **200 répétitions**, chacune corrigée immédiatement.
Même temps investi. Huit fois plus de répétitions, et un retour qui porte sur l''exécution plutôt que sur le hasard.
C''est la différence entre jouer et s''entraîner.

ERR: L''erreur classique
Confondre temps d''écran et entraînement. Observer un marché pendant quatre heures sans tâche définie ne produit aucun apprentissage mesurable, quel que soit le sérieux de l''observateur. La durée n''est pas la variable qui compte : c''est la densité de corrections.

KEY: À retenir
- Une compétence par session, vingt répétitions minimum, correction immédiate.
- Le simulateur sert à densifier les répétitions, pas à simuler des gains.
- Temps d''écran et entraînement ne sont pas la même chose.', 33);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, '6.5', 'Après ce parcours', 'HOOK:
Tu sais maintenant calculer un risque, lire une structure et refuser un trade. Il te manque la seule chose qu''aucun texte ne pourra jamais te donner : un échantillon.

P: **Étape 1 — trente trades conformes en simulation, sans objectif de gain.** Le seul chiffre suivi est le taux de conformité. Le résultat n''a aucune importance à ce stade, et le regarder serait même contre-productif.

P: **Étape 2 — mesure du R moyen sur ces trente trades conformes.** S''il est négatif, la méthode se révise. S''il est positif, l''échantillon s''étend à cent trades avant toute conclusion, parce que trente ne suffisent pas à distinguer une méthode d''une série de chance.

P: **Étape 3 — le parcours Intermédiaire**, qui introduit les indicateurs techniques accompagnés de la seule chose qui les rende exploitables : une méthode pour les tester. La question laissée ouverte au chapitre 3.5 y trouve sa réponse.

P: Et ce que ce parcours n''a délibérément pas traité, pour que tu saches ce qu''il te reste à chercher ailleurs : le choix d''un courtier, la fiscalité, les conditions d''un éventuel passage en réel, et tous les produits autres que les paires de devises et les cryptomonnaies au comptant.

CASE: Le calendrier, sans arrondi favorable
À trois trades conformes par semaine — le rythme qu''impose la sélectivité du module 4 — trente trades demandent environ **dix semaines**. Cent trades en demandent **trente-trois**.
Toute promesse de compétence en trente jours entre en contradiction directe avec cette division. Ce n''est pas une position morale sur le sérieux des formations : c''est le résultat de 30 ÷ 3.

ERR: L''erreur classique
Passer en réel dès que la simulation devient rentable. Une rentabilité constatée sur trente trades est majoritairement du bruit. Et l''exécution en argent réel réintroduit d''un coup l''intégralité du module 5 — effet de disposition, surtrading, spirale après perte — qui n''a strictement rien à voir avec la qualité de ton analyse.

KEY: À retenir
- Trente trades conformes avant toute conclusion, cent avant toute confiance.
- Le seul chiffre à suivre au départ est le taux de conformité.
- Dix semaines au minimum. Le calcul est arithmétique, pas moral.', 34);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'fr', 6, 'EX', 'Le trade que tu ne corrigeras pas', 'EXF: Compétence évaluée
Objectifs 11 et 12 : consigner un trade et en extraire une erreur de processus, distincte d''un mauvais résultat.

EXF: Consigne
Quatre trades déjà exécutés te sont présentés, avec leur graphique et leur résultat.
**1.** Complète les champs manquants du journal pour chacun.
**2.** Place chaque trade dans la grille conformité / résultat.
**3.** Désigne le seul trade qui exige une correction, et écris cette correction en une phrase.

EXF: Ce que la plateforme doit fournir
- Quatre rejouages courts de 30 bougies H1, avec les niveaux d''entrée, de stop, d''objectif et la sortie effective tracés sur le graphique.
- Un formulaire de journal à sept champs, dont cinq préremplis en lecture seule. Deux champs restent à saisir : la conformité (oui / non) et le résultat en R.
- Une grille 2 × 2 en glisser-déposer pour le classement.
- Un champ de texte de 150 caractères pour la correction, et un seul — l''exercice consiste aussi à n''en désigner qu''un.

EXF: Correction commentée
- **Trade A** — conforme, perdant, −1 R. Aucune correction. C''est le trade que la grande majorité des utilisateurs veut corriger, et c''est le cœur de l''exercice : rien n''a échoué. Le stop a fonctionné exactement comme prévu, le scénario a été démenti par le marché, le processus était intact.
- **Trade B** — conforme, gagnant, +3 R. Aucune correction. Facile.
- **Trade C** — non conforme, stop déplacé après l''entrée, perdant, −2,4 R. Tout le monde trouve celui-ci : la faute et la douleur coïncident.
- **Trade D** — non conforme, quatrième trade de la journée alors que la limite est de trois, **gagnant, +2 R**. C''est la seule bonne réponse à la troisième question.
Le résultat est positif, donc rien ne signale l''erreur : ni le solde, ni la sensation, ni le graphique. C''est exactement pour cette raison qu''elle sera répétée — et qu''elle finira par tomber sur une série défavorable. La correction attendue porte sur la règle enfreinte, jamais sur le résultat obtenu.
Si tu as désigné le trade C, tu as trouvé une erreur réelle mais déjà évidente. Si tu as désigné le trade D, tu viens d''utiliser le journal pour ce à quoi il sert.', 35);

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 1, '1.1', 'Trente trades, et ce qu''ils ne disent pas', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 1, '1.2', 'Série ou signal', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 1, '1.3', 'Segmenter son journal', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 1, '1.4', 'Ce que tu ne peux pas conclure', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 1, 'EX', 'Ce que dit vraiment ton relevé', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, '2.1', 'Une hypothèse, pas une intuition', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, '2.2', 'L''échantillon', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, '2.3', 'Couper ses données en deux', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, '2.4', 'Le surapprentissage', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, '2.5', 'Le critère d''abandon', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 2, 'EX', 'Le test que tu ne truques pas', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, '3.1', 'Ce qu''un indicateur calcule', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, '3.2', 'Mesurer n''est pas prédire', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, '3.3', 'Le filtre', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, '3.4', 'Passer un outil au protocole', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, '3.5', 'Le coût de chaque outil', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 3, 'EX', 'L''outil que tu jettes', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, '4.1', 'Le trade ne s''arrête pas à l''entrée', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, '4.2', 'La sortie partielle', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, '4.3', 'Le stop suiveur', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, '4.4', 'La mise à l''équilibre', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, '4.5', 'Choisir et tenir', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 4, 'EX', 'Trois gestions, une seule série', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 5, '5.1', 'Trois positions à 1 %, un risque à 3 %', 'HOOK:
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
- Trois positions qui perdent dans le même scénario sont un seul pari, et leurs risques s''additionnent.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 5, '5.2', 'La corrélation', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 5, '5.3', 'Risque de séance, risque de portefeuille', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 5, '5.4', 'La règle d''exposition cumulée', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 5, 'EX', 'Ce que tu risques vraiment', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, '6.1', 'Ce qu''est un système', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, '6.2', 'Le document de système', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, '6.3', 'La revue mensuelle', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, '6.4', 'Quand modifier, quand ne rien faire', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, '6.5', 'Ce qui t''attend au parcours Expérimenté', 'HOOK:
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
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'fr', 6, 'EX', 'Écris ton système', 'EXF: Compétence évaluée
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

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 1, '1.1', 'Ce que la simulation ne t''a jamais facturé', 'HOOK:
Ton relevé affiche 140 trades conformes et un R moyen positif. Il repose sur une hypothèse que tu n''as jamais eu l''occasion de vérifier : que le prix demandé et le prix obtenu sont le même nombre.

P: Le **slippage**, ou **écart d''exécution**, est la différence entre le prix auquel tu demandes une transaction et celui auquel elle est conclue. En simulation il vaut zéro par construction. En réel il vaut ce qu''il vaut, et personne ne peut te dire à l''avance combien.

P: Le Débutant t''a fait payer deux coûts : le spread au chapitre 1.2, les frais de report au chapitre 1.4. Il en manquait un troisième, invisible tant qu''un moteur de simulation te sert le prix affiché. Celui-là ne se déduit d''aucune grille tarifaire : il se mesure.

P: Un **ordre au marché** s''exécute au meilleur prix disponible à l''instant où il arrive, quel qu''il soit. Ton stop-loss est un ordre au marché muni d''un déclencheur. Le prix que tu inscris dessus est l''endroit où il se réveille, pas l''endroit où il te sert.

CASE: Ce qu''un pip vaut sur ton trade
Capital 1 000 €, risque 1 % : **1 R = 10 €**. EUR/USD, stop à 20 pips de l''entrée.
Taille = 10 € ÷ 0,0020 = **5 000 unités**.
Un pip sur 5 000 unités vaut 5 000 × 0,0001 = **0,50 €**, soit **0,05 R**.
Un pip perdu à l''entrée et un pip perdu à la sortie coûtent donc **0,10 R par aller-retour**. Sur 100 trades : **10 R**, soit 100 €.
Si ton R moyen simulé vaut +0,15 R, tes 100 trades valaient +15 R. Il en reste **+5 R**.
Ce calcul n''estime pas ton slippage : il mesure ta **sensibilité** à lui. Remplace « un pip » par ce que tu auras mesuré au chapitre 1.2.

ERR: L''erreur classique
Raisonner en pourcentage du prix. Un pip sur EUR/USD représente environ 0,009 % du cours — un chiffre rassurant, et sans rapport avec la question posée. Ce qui compte est l''écart rapporté à ton stop, pas au prix : avec un stop à 20 pips, un pip vaut **5 % de ton risque**. Le même écart, sur un stop à 100 pips, en vaudrait 1 %.

KEY: À retenir
- L''écart d''exécution se compte en fraction de ton stop, jamais en pourcentage du prix.
- Stop à 20 pips : un pip vaut 0,05 R. Dix pips valent la moitié d''un trade perdant.
- Un stop est un ordre au marché muni d''un déclencheur, pas une garantie de prix.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 1, '1.2', 'Le mesurer au lieu de le croire', 'HOOK:
Tu ne trouveras le chiffre ni ici ni ailleurs : les seules mesures publiques viennent d''entreprises qui vendent leur exécution. La tienne s''obtient en vingt-cinq trades, et c''est la seule qui te concerne.

P: Ajoute au journal un **neuvième champ** : l''écart d''exécution en R, signé. Il se calcule à partir de deux prix que ta plateforme connaît déjà — celui que tu as demandé, celui que tu as obtenu — et il se note comme tout le reste, en R.

P: Mesure l''entrée et la sortie **séparément**. Ce ne sont pas les mêmes événements : à l''entrée tu choisis ton moment et rien ne t''attend. Au stop, tu es exécuté à la seconde précise où le prix se déplace contre toi, dans une file d''attente qui penche toute du même côté.

P: Cette asymétrie est une conséquence de la mécanique, pas le résultat d''une étude. Ne la crois pas sur parole : tes deux colonnes te diront en vingt-cinq trades si elle apparaît chez toi, à ton heure, sur ta taille.

CASE: Six exécutions, un chiffre
Même système, stop à 20 pips, donc 1 pip = 0,05 R.
**À l''entrée** — écarts relevés : 0, −1, +1, 0, −1, +1 pip. Somme : **0 pip**.
**À la sortie au stop** — écarts relevés : −1, −4, 0, −2, −1, −9 pips. Somme : **−17 pips**, soit −0,85 R sur six trades, soit **−0,14 R par trade**.
Ton R moyen simulé de +0,20 R devient **+0,06 R** (0,20 − 0,14).
Maintenant retire le −9 : les cinq autres sorties coûtent −8 pips, soit −0,08 R par trade. **Un seul trade sur six porte la moitié du coût total.**

ERR: L''erreur classique
Prendre la médiane. Elle vaut −1,5 pip dans ce relevé et donne une image confortable et fausse. L''espérance est une moyenne : c''est la moyenne qui entre dans son calcul. La médiane sert à autre chose, et c''est utile aussi — elle t''apprend que ton coût habituel n''est pas ton coût moyen, et donc qu''un mois sans mauvaise exécution ne prouve rien du tout.

KEY: À retenir
- Neuvième champ du journal : l''écart d''exécution en R, signé, entrée et sortie séparées.
- La moyenne entre dans l''espérance. La médiane te dit seulement à quoi ressemble un jour ordinaire.
- Vingt-cinq trades suffisent pour ce chiffre-là. Le chapitre 2.1 explique pourquoi si peu.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 1, '1.3', 'Les moments où le prix saute', 'HOOK:
Un stop te protège d''un mouvement. Il ne te protège pas d''un trou. La différence entre les deux se rencontre une ou deux fois par an, et elle se règle en une seconde.

P: Un **saut de cotation** est un intervalle de prix dans lequel aucune transaction n''a eu lieu : le marché cote 40 000, puis 38 800, et rien entre les deux. Ton stop placé au milieu n''a pas été ignoré. Il a été déclenché, puis exécuté au premier prix disponible.

P: Ce n''est pas un accident de marché exotique. Andersen, Bollerslev, Diebold et Vega ont établi en 2003 que les surprises d''annonce macroéconomique produisent des sauts de moyenne conditionnelle sur le change au comptant, en quelques minutes, avec un effet plus marqué pour les mauvaises nouvelles.

P: Trois familles couvrent la quasi-totalité des cas : les annonces programmées, dont tu connais l''heure à l''avance ; l''ouverture hebdomadaire du change, qui digère un week-end d''informations ; les heures creuses en crypto, où le marché reste ouvert sans rester liquide.

CASE: Le stop qui n''a pas servi
BTC/USD à 40 000. Capital 1 000 €, risque 1 % : 1 R = 10 €. Stop à 400 sous l''entrée.
Taille = 10 ÷ 400 = **0,025 BTC**. À cette taille, 400 de mouvement valent bien 1 R.
Une heure creuse, le prix passe de 40 000 à 38 800 sans qu''aucune transaction n''ait lieu entre les deux. Ton stop à 39 600 est déclenché, puis exécuté à 38 800.
Perte = 0,025 × 1 200 = **30 €**, soit **3 R**.
Trois fois le risque calculé, sur un trade parfaitement conforme. La huitième règle de l''Intermédiaire plafonne l''exposition cumulée à 2 % : ce trade seul vient d''en coûter 3 %.

ERR: L''erreur classique
Croire que le stop borne la perte. Il la borne quand le prix traverse tous les niveaux, ce qui est le cas l''immense majorité du temps — et c''est exactement pour cela que la croyance survit si bien. Les jours où il ne borne rien sont, par construction, les jours où le mouvement est grand. La protection disparaît au moment précis où elle servirait.

KEY: À retenir
- Un saut de cotation traverse ton stop sans s''y arrêter. Ta perte n''est plus bornée par ton calcul.
- Trois familles : annonces programmées, ouverture hebdomadaire, heures creuses en crypto.
- L''exposition cumulée et le saut sont deux risques distincts. Aucune règle ne couvre les deux.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 1, '1.4', 'Ton espérance, recalculée', 'HOOK:
Tu as un R moyen, un critère d''abandon et 140 trades. Il te manque une soustraction — et elle suffit à faire passer ton système du bon au mauvais côté de ton propre critère.

P: L''**espérance nette** est ton espérance brute diminuée du coût d''exécution moyen que tu as mesuré. C''est elle, et elle seule, qui décrit ce que ton système produirait en réel. La brute décrit ce qu''il a produit dans un environnement qui ne facture rien.

P: Le critère d''abandon du chapitre 2.5 de l''Intermédiaire a été écrit sur la grandeur brute, faute d''autre chose. Il doit être réécrit sur la nette, et cette réécriture est une modification du document de système : elle incrémente la version et remet le compteur de trades à zéro.

CASE: Le même système, deux fois
**Espérance brute** : +0,18 R sur 140 trades conformes. Critère d''abandon : +0,10 R. Le système passe.
**Coût d''exécution mesuré** : 0,14 R par trade, entrée et sortie confondues.
**Espérance nette** : 0,18 − 0,14 = **+0,04 R**. Le système ne passe plus.
**Et l''incertitude** : avec un écart-type de 1,2 R sur 140 trades, l''erreur-type vaut 1,2 ÷ √140 = **0,10 R**.
+0,04 R plus ou moins 0,10 R ne se distingue pas de zéro. La conclusion n''est donc pas « mon système est mauvais ». C''est **« je ne sais pas »**, que le chapitre 1.4 de l''Intermédiaire décrit comme le résultat le plus fréquent d''une analyse honnête.

ERR: L''erreur classique
Retrancher le coût et conserver le critère. Celui-ci a été écrit pour une grandeur brute ; l''appliquer tel quel à une grandeur nette le durcit d''un coup, sans que tu l''aies décidé ni daté. C''est une modification de système déguisée en calcul — la forme la plus discrète de la modification non tracée du chapitre 6.2 de l''Intermédiaire.

KEY: À retenir
- Espérance nette = espérance brute − coût d''exécution mesuré. C''est elle qui se compare au critère.
- Réécris le critère sur la nette, incrémente la version, remets le compteur à zéro.
- Un résultat net contenu dans son erreur-type ne conclut rien, dans aucun sens.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 1, 'EX', 'Le même trade, deux prix', 'EXF: Compétence évaluée
Objectifs 25 et 26 : mesurer l''écart entre prix demandé et prix obtenu et l''exprimer en R ; recalculer l''espérance d''un système en y intégrant ce coût, et conclure.

EXF: Consigne
**Étape A.** Douze décisions te sont présentées et exécutées en simulation parfaite. Relève le R moyen du relevé.
**Étape B.** Les douze mêmes décisions sont rejouées, à l''identique, avec une exécution dégradée. Pour chacune, relève l''écart entre prix demandé et prix obtenu, à l''entrée puis à la sortie, et convertis-le en R.
**Étape C.** Calcule l''espérance nette, compare-la au critère d''abandon fourni, et choisis ta conclusion parmi trois formulations imposées.

EXF: Ce que la plateforme doit fournir
- Un moteur d''exécution dégradée paramétrable, **asymétrique** entre l''entrée et la sortie au stop, tirant les écarts dans une distribution à queue épaisse : au moins l''un des douze trades doit porter un écart très supérieur aux onze autres.
- Deux colonnes affichées en permanence, **prix demandé** et **prix obtenu**, et une troisième calculée automatiquement en R.
- Un champ de saisie pour l''écart moyen en R, tolérance ±0,02 R, et un second pour l''espérance nette.
- Étape C : trois conclusions sélectionnables — « passe le critère », « ne passe pas le critère », « ne conclut rien » — l''erreur-type étant affichée à côté.
- **Repli** si l''exécution dégradée n''est pas disponible : deux relevés pré-calculés présentés côte à côte, la soustraction restant à la charge de l''utilisateur. L''énoncé doit alors dire explicitement que l''écart est lu et non vécu, et que c''est une perte pédagogique.

EXF: Correction commentée
**Étape B.** Le piège est le trade à écart extrême. Beaucoup d''utilisateurs le traitent comme une anomalie et le retirent du calcul — geste naturel, et faux : c''est un coût réellement subi, et l''écarter revient à mesurer son exécution en excluant les moments où elle est mauvaise. Le relevé est construit pour que ce seul trade porte environ la moitié du coût total.
**Étape C.** La bonne réponse est **« ne conclut rien »**. L''espérance nette calculée est positive, mais inférieure à son erreur-type. « Passe le critère » est tentant parce que le nombre est du bon côté ; « ne passe pas » l''est tout autant chez les lecteurs prudents. Les deux commettent la même faute — conclure sur un chiffre plus petit que son incertitude — et le module 1 de l''Intermédiaire l''interdit depuis 100 trades.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 2, '2.1', 'La première taille n''est pas la taille du système', 'HOOK:
Ton document de système dit 1 %. Il a été rédigé par quelqu''un qui n''avait jamais payé un écart d''exécution de sa vie. Ce quelqu''un, c''est toi, il y a quelques mois.

P: Un **palier de démarrage** est une période initiale pendant laquelle le risque par trade est volontairement inférieur à celui de ton système écrit, dans le seul but de mesurer ton coût d''exécution. Il a une question, une seule, et il se termine quand elle a sa réponse.

P: Ce n''est pas une période d''essai, pas un galop d''entraînement, pas une mise en jambes. Ces trois formulations ont en commun de suggérer que le palier prépare quelque chose. Il ne prépare rien : il mesure une grandeur, et cette grandeur peut parfaitement conclure qu''il n''y a pas de suite.

P: Le choix de la question n''est pas libre. Il découle d''un fait arithmétique désagréable, que le module 2 de l''Intermédiaire a déjà établi sous une autre forme : certaines grandeurs se mesurent en quelques semaines, d''autres ne se mesureront jamais.

CASE: Vingt-cinq trades, ou mille six cents
L''erreur-type vaut la dispersion divisée par la racine du nombre d''observations. Pour la ramener à une valeur voulue, il faut donc **le carré** du rapport entre les deux.
**Mesurer ton coût d''exécution** — dispersion des écarts : 0,15 R. Précision voulue : 0,03 R. n = (0,15 ÷ 0,03)² = **25 trades**.
**Mesurer ton espérance** — dispersion des résultats : 1,2 R. Même précision voulue : 0,03 R. n = (1,2 ÷ 0,03)² = **1 600 trades**.
Soixante-quatre fois plus, pour la même précision. À trois trades conformes par semaine : **huit semaines** dans le premier cas, **plus de dix ans** dans le second.
Le palier mesure la première grandeur. Il ne mesurera jamais la seconde.

ERR: L''erreur classique
Attendre du palier qu''il dise si le système fonctionne en réel. C''est la question que tout le monde se pose et la seule à laquelle vingt-cinq trades ne répondront pas — ni deux cents, ni cinq cents. Un palier qui prétend y répondre n''est plus une mesure : c''est une période d''observation sans critère, et le module 2 de l''Intermédiaire a un nom pour ça.

KEY: À retenir
- Le palier mesure l''exécution : 25 trades. Il ne mesure pas l''espérance : il en faudrait 1 600.
- Un palier a une question unique et une fin définie par cette question.
- Ce qui met fin à un palier est une mesure obtenue, jamais une impression acquise.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 2, '2.2', 'Le palier de démarrage', 'HOOK:
Quatre lignes, écrites avant le premier ordre, datées. Écrites après, ce ne sont plus des règles : ce sont des commentaires sur ce qui s''est passé.

P: Quatre éléments, et pas un de plus. **La fraction** du risque de ton système. **Le nombre de trades** minimal. **La grandeur mesurée**, nommée précisément. **Ce qui met fin au palier**, formulé de façon qu''un tiers puisse constater la fin sans t''interroger.

P: La fraction est ton choix, mais elle n''est pas libre pour autant : elle doit passer un test. Le pire cas du palier — tous les trades perdants — doit rester sous le seuil d''arrêt que la septième règle du Débutant t''impose déjà. Une fraction qui échoue à ce test transformerait la mesure en incident.

CASE: Le palier écrit, et son pire cas
Système : risque 1 % par trade, soit 1 R = 10 €. **Palier au quart** : 2,50 € par trade.
Durée : **25 trades conformes au minimum**, soit environ huit semaines.
Grandeur mesurée : écart d''exécution à l''entrée et au stop, en R, relevés séparément.
Pire cas borné : 25 trades tous perdants coûteraient 25 × 2,50 = **62,50 €**, soit **6,25 % du capital**.
La septième règle du Débutant arrête tout à 10 % de drawdown mensuel. Le pire cas du palier passe donc **sous** ton propre seuil d''arrêt. C''est le critère qui valide une fraction, et c''est le seul.

ERR: L''erreur classique
Choisir la fraction d''après le montant qu''on se sent prêt à perdre. Le raisonnement paraît prudent, et il est inversé. La fraction se déduit d''un seuil que tu as déjà écrit et daté ; le montant qui semble supportable, lui, change avec la semaine, la fatigue et le dernier résultat. Tu as passé un an à te doter de règles pour ne plus décider comme ça.

KEY: À retenir
- Quatre lignes : fraction, nombre de trades, grandeur mesurée, fin du palier.
- Le pire cas du palier doit rester sous ton seuil de drawdown. C''est ce qui valide la fraction.
- La fin du palier n''autorise rien. Elle date un recalcul.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 2, '2.3', 'Ce que ce palier mesure, et ce qu''il ne mesure pas', 'HOOK:
Vingt-cinq trades te donneront un chiffre solide et une illusion. Le chiffre, c''est ton coût d''exécution. L''illusion, c''est absolument tout le reste.

P: Ce qu''il mesure vraiment : l''écart d''exécution à l''entrée, l''écart au stop, le comportement du spread à l''heure où tu opères, et une chose qu''aucune documentation ne te dira — si ta plateforme fait bien ce que tu crois qu''elle fait quand le prix se déplace vite.

P: Ce qu''il ne mesure pas : ton espérance, le chapitre précédent l''a chiffré à 1 600 trades. Ni l''usure de ton système, qui est le sujet du module 5. Ni ton comportement sous perte réelle, et c''est le manque le plus sérieux des trois, parce que c''est celui que tu croiras avoir comblé.

CASE: Ce que vingt-cinq trades ne contiennent pas
Système à 45 % de trades gagnants. Probabilité que cinq trades consécutifs soient tous perdants : 0,55⁵ = **5,0 %**.
Sur une séquence de 25 trades, la probabilité de voir apparaître au moins une telle série vaut **43 %**.
Autrement dit : **plus d''un palier sur deux se déroule sans que tu rencontres ta pire série ordinaire.**
Et si elle apparaît, elle coûte 5 × 2,50 = 12,50 €, soit 1,25 % du capital. Tu ne l''auras pas vraiment ressentie non plus.
Sur une année complète à trois trades par semaine — 156 trades — cette même série a en revanche **98 %** de chances de survenir. Elle t''attend. Elle n''était simplement pas dans l''échantillon.

ERR: L''erreur classique
Conclure du calme du palier que le passage s''est bien passé. Vingt-cinq trades à un quart de taille produisent une expérience émotionnelle proche de zéro, et c''est voulu : le palier est conçu pour être supportable. Le prendre comme la preuve que le réel te convient revient à juger d''un vaccin sur l''absence de maladie pendant la semaine du rappel.

KEY: À retenir
- Le palier mesure l''exécution, le spread à ton heure, et le comportement réel de ta plateforme.
- Il ne mesure ni ton espérance, ni l''usure du système, ni ton comportement sous perte.
- Un palier calme n''est pas une information. C''est le résultat attendu par construction.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 2, '2.4', 'Rester en simulation est une réponse', 'HOOK:
Sur les trois issues possibles d''un palier, deux s''écrivent « pas maintenant ». Ce n''est pas un travers de prudence pédagogique : c''est ce que produit l''arithmétique des deux chapitres précédents.

P: Une décision de ne rien faire est une décision. Elle se date, elle s''écrit, elle nomme la mesure sur laquelle elle s''appuie, et elle dit ce qui devrait changer pour être revue. Sans ces quatre éléments, ce n''est pas une décision : c''est un report, et un report se rediscute chaque semaine.

P: Sur 14 799 clients français suivis quatre ans par l''AMF, **89 % perdent de l''argent**. Rien de ce que tu viens de mesurer ne t''extrait de cette proportion. Tu as mesuré ton exécution — un paramètre technique, sur vingt-cinq trades. Tu n''as rien mesuré d''autre.

CASE: Trois relevés, trois décisions
**Relevé A** — brute +0,12 R, coût d''exécution mesuré 0,16 R, nette **−0,04 R**. Le système perd une fois exécuté. Décision : **retour en simulation**. Le palier a fait exactement son travail, pour 62,50 € au pire.
**Relevé B** — brute +0,22 R, coût 0,09 R, nette **+0,13 R** sur 25 trades. Erreur-type : 1,2 ÷ √25 = **0,24 R**. Le chiffre est deux fois plus petit que son incertitude. Décision : **rien ne se conclut**.
**Relevé C** — même résultat net, mais sur 140 trades. Erreur-type : 1,2 ÷ √140 = **0,10 R**. Le signe est établi. Décision : la mesure **ne s''oppose pas** à ce que tu engages de l''argent. Elle ne te le conseille pas, et elle ne dit rien de ce que tu peux te permettre de perdre — cette question-là n''appartient pas à ce document.

ERR: L''erreur classique
Lire la fin du palier comme un feu vert. Un palier ne délivre pas d''autorisation ; il retire une objection sur les cinq ou six que tu devrais avoir. Les autres — ton épargne, tes charges, ton horizon, ce que la perte totale de la somme changerait à ta vie — ne sont ni techniques ni mesurables ici, et aucun cours n''a les éléments pour en juger à ta place.

KEY: À retenir
- Deux issues sur trois, à ce stade, s''écrivent « pas maintenant ». C''est la proportion normale.
- Une mesure favorable lève une objection parmi plusieurs. Elle n''en lève aucune autre.
- Rester en simulation se décide, se date et s''écrit comme n''importe quelle autre décision.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 2, 'EX', 'Le palier que tu écris', 'EXF: Compétence évaluée
Objectif 27 : définir un palier de démarrage en taille réduite et écrire le critère de mesure — non de résultat — qui autorise sa réévaluation.

EXF: Consigne
**Étape A.** À partir de ton document de système, rédige ton palier : fraction, nombre de trades, grandeur mesurée, fin du palier.
**Étape B.** Trois fractions te sont proposées avec ton seuil de drawdown. Dis lesquelles passent le test du pire cas, et pour celles qui échouent, donne le nombre de trades maximal qui les rendrait acceptables.
**Étape C.** Trois relevés de fin de palier te sont présentés. Choisis pour chacun l''une des trois décisions, et justifie en citant la grandeur qui tranche.

EXF: Ce que la plateforme doit fournir
- Étape A : un formulaire à quatre champs, **120 caractères maximum** chacun, avec le document de système de l''utilisateur affiché en permanence à côté. Le champ « fin du palier » refuse toute saisie contenant un mot de résultat — « si ça marche », « si je suis à l''aise », « si je gagne » — et affiche pourquoi.
- Étape B : trois fractions, le seuil de drawdown repris du profil, et un calculateur de pire cas visible mais **non pré-rempli**.
- Étape C : trois relevés affichant espérance brute, coût d''exécution, nombre de trades et erreur-type calculée, avec trois décisions sélectionnables — « retour en simulation », « rien ne se conclut », « la mesure ne s''y oppose pas ».
- Si le document de système de l''utilisateur existe, l''étape A pré-remplit le risque de référence. **Repli** : champs vides et un palier d''exemple consultable en permanence, avec un document de système fictif complet.

EXF: Correction commentée
**Étape B.** La fraction la plus grande échoue, et beaucoup d''utilisateurs la valident quand même parce que le montant en euros reste modeste. C''est le raisonnement inversé du chapitre 2.2 : le test ne porte pas sur ce qui semble supportable, il porte sur un seuil déjà écrit. La seconde partie de la question — le nombre de trades qui rendrait la fraction acceptable — est celle qui distingue une règle comprise d''une règle apprise.
**Étape C.** Le relevé B est celui qui piège. Son espérance nette est franchement positive et le lecteur veut conclure ; son erreur-type est deux fois plus grande que lui. Répondre « la mesure ne s''y oppose pas » sur le relevé B est l''erreur la plus fréquente de tout ce module, et c''est exactement l''erreur du chapitre 1.1 de l''Intermédiaire, commise un an plus tard sur un enjeu réel.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 3, '3.1', 'Ce que 1 R devient quand c''est de l''argent', 'HOOK:
Dix euros ne sont rien. Sauf que ce ne sont plus dix euros : c''est la première preuve datée que ta méthode peut te coûter quelque chose, et elle porte ton nom.

P: En simulation, R était une unité de compte. Elle rendait les résultats comparables et les émotions absentes — c''était même son objet, et le Débutant l''a introduite pour ça au chapitre 2.1. En réel, la même unité devient un signal, et un signal se traite, qu''on le veuille ou non.

P: Le module 5 du Débutant t''a décrit trois comportements documentés, que tu as ensuite repérés dans ton journal, un par un, à froid, plusieurs jours après. C''est la seule façon dont la simulation pouvait te les faire rencontrer. Ce n''est pas la façon dont ils se présentent.

CASE: La série qui t''attend
Système à 45 % de trades gagnants. Probabilité que cinq trades consécutifs soient tous perdants : 0,55⁵ = **5,0 %**.
Sur les 25 trades d''un palier : **43 %** de chances d''en rencontrer une.
Sur 156 trades — une année à trois par semaine : **98 %**.
Cinq pertes consécutives à 1 % coûtent **5 R**, soit 50 € sur un capital de 1 000 €. Le montant est petit et l''événement est ordinaire.
Ce n''est pas le montant qui pose problème. C''est qu''il arrive accompagné de la conviction que quelque chose vient de casser — et cette conviction-là n''était pas dans ta simulation.

ERR: L''erreur classique
Traiter la première série réelle comme une information sur le système. Elle n''en est pas une : le module 1 de l''Intermédiaire a établi qu''une série de cette longueur relève de la variance et ne se distingue de rien du tout. Ce qu''elle t''apprend est ailleurs — sur toi — et ça ne se lit dans aucun relevé.

KEY: À retenir
- Cinq pertes consécutives : 5 % de chances à chaque trade, 98 % sur une année complète.
- La série est prévue par ton système. Ce qui ne l''était pas, c''est son effet sur toi.
- Une série de cette longueur ne dit rien du système. L''Intermédiaire l''a chiffré au module 1.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 3, '3.2', 'Les trois biais ne reviennent pas séparément', 'HOOK:
Les trois biais arrivent ensemble, dans la même séance, et dans un ordre qui a sa logique. Tu les avais rencontrés un par un dans ton journal, à froid, plusieurs jours après les faits.

P: La chaîne commence toujours pareil. Une perte conforme, sans faute. Le trade suivant part bien, et tu le refermes tôt pour « sécuriser » — c''est l''effet de disposition, et il paraît raisonnable puisqu''il transforme un gain flottant en gain acquis.

P: Sauf qu''un gain de 0,4 R ne compense pas une perte de 1,0 R. L''écart restant demande un troisième trade, qui n''était pas dans le plan de la séance : c''est le surtrading. Et quand celui-là échoue à son tour, la taille du quatrième devient la seule variable qui puisse encore refermer l''écart avant la fermeture.

P: Chaque maillon se présente comme la réparation raisonnable du précédent. C''est ce qui les rend difficiles à voir de l''intérieur : au moment où tu les commets, tu n''es pas en train de céder, tu es en train de corriger.

CASE: Une séance, quatre trades
**Trade 1** — conforme, sans faute. Résultat : **−1,0 R**.
**Trade 2** — entrée conforme, objectif écrit à +2,0 R, refermé à **+0,4 R** pour sécuriser. Effet de disposition.
**Trade 3** — hors checklist, pris pour revenir à l''équilibre. **−1,0 R**. Surtrading.
**Trade 4** — taille doublée. **−2,0 R**. Spirale.
Séance : −1,0 + 0,4 − 1,0 − 2,0 = **−3,6 R**, soit 3,6 % du capital.
Ce que tes règles prévoyaient : « deux pertes, la séance est terminée » fermait la journée après le trade 3, à **−1,6 R**.
Écart entre la séance vécue et la séance prévue : **2,0 R**, soit ce qu''un système à +0,18 R produit en moyenne sur onze trades.

ERR: L''erreur classique
Chercher laquelle des trois erreurs a coûté le plus cher. La question est mal posée : elles ne s''additionnent pas, elles s''enchaînent. Le trade 4 n''existe que parce que le 3 a échoué, et le 3 n''existe que parce que le 2 a rapporté 0,4 R au lieu de 2,0 R. Corriger le dernier maillon ne fait que déplacer le point de rupture d''un cran.

KEY: À retenir
- Les trois biais du module 5 du Débutant forment une chaîne, pas une liste.
- Chaque maillon se présente comme la réparation raisonnable du précédent.
- La règle qui coupe la chaîne est la plus ancienne : deux pertes, la séance est terminée.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 3, '3.3', 'Le protocole d''arrêt : seuil, durée, reprise', 'HOOK:
Tes huit règles ferment une séance. Aucune ne ferme un compte. Tant que tout se déroulait en simulation, cette différence n''avait aucune conséquence.

P: Un **protocole d''arrêt** est une règle écrite à l''avance qui suspend toute activité réelle au-delà d''un seuil, pour une durée fixée, avec une condition de reprise qu''un tiers pourrait vérifier. Trois éléments, tous chiffrés ou datés, aucun laissé à l''appréciation du moment. C''est la **neuvième règle**, et elle complète la septième sans la remplacer : celle-ci dit quand s''arrêter, la neuvième dit pour combien de temps et à quelle condition on reprend.

P: Le seuil est la partie difficile, et l''erreur y est systématiquement dans le même sens : trop serré. Un seuil placé à l''intérieur de la dispersion ordinaire de ton système se déclenchera sur un système parfaitement sain, régulièrement, et tu finiras par le contourner — puis par le supprimer.

CASE: Deux seuils, un seul qui tient
Système dont les résultats ont un écart-type de 1,2 R par trade. Sur une fenêtre de 20 trades, l''écart-type de la **somme** vaut 1,2 × √20 = **5,4 R**.
**Seuil A — arrêt à −5 R.** Il se situe à l''intérieur d''un écart-type de dispersion ordinaire. Il se déclenchera sur du bruit, souvent, et sans rien signaler.
**Seuil B — arrêt à −10 R**, soit 10 % du capital : le seuil que la septième règle du Débutant t''impose déjà. À près de deux écarts-types, il ne répond plus au bruit.
Et le coût de l''arrêt : durée fixée, plus la condition de reprise. Vingt trades conformes en simulation, à trois par semaine, font **près de sept semaines**.
Un seuil trop serré te met à l''arrêt en permanence. C''est le stop dans le bruit du chapitre 2.4 du Débutant, transposé à l''échelle du compte.

ERR: L''erreur classique
Écrire la condition de reprise en termes d''état intérieur. « Je reprends quand je me sens à nouveau lucide » n''est pas vérifiable, et sera vérifié favorablement dès le lendemain matin. Une condition de reprise est un acte constatable de l''extérieur : un nombre de trades conformes en simulation, une revue écrite, une date. Exactement le critère de transmissibilité du chapitre 6.1 de l''Intermédiaire.

KEY: À retenir
- Trois éléments : un seuil, une durée, une condition de reprise vérifiable de l''extérieur.
- Un seuil à moins d''un écart-type de la dispersion se déclenche sur du bruit.
- La condition de reprise est un acte daté, jamais un état ressenti.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 3, '3.4', 'Les règles que le réel oblige à réécrire', 'HOOK:
Sur les huit règles que tu appliques, six passent en réel sans changer d''une virgule. Les deux autres cessent de protéger sans prévenir — et ce ne sont pas celles auxquelles on pense.

TABLE: 56,44 || Règle | Ce que le réel en fait
Risque fixe de 1 % par trade | Inchangée
Trois trades au maximum par séance | Inchangée
Deux pertes : la séance est terminée | Inchangée, et devient la plus utile des huit
Trente minutes d''attente après toute perte | **À rechiffrer** : le déclencheur change
Aucun ordre sans les réponses de la checklist | Inchangée — la checklist, elle, passe à huit questions
Objectif et stop non renégociables | Inchangée
Drawdown de 10 % sur le mois : arrêt complet | **Complétée** par la neuvième règle, chapitre 3.3
Exposition cumulée maximale de 2 % | Inchangée, et toujours aveugle au saut de cotation

P: La règle des trente minutes a été écrite pour une perte qui ne coûtait rien. Son déclencheur est le fait de perdre. En réel, ce qui détermine le temps dont tu as besoin n''est pas le fait de perdre : c''est le montant perdu, et il varie d''un facteur trois dans une même journée.

CASE: La règle des trente minutes, mesurée
Relève dans ton journal le délai entre la clôture d''un trade perdant et l''ordre suivant.
**En simulation** : délai médian de 34 minutes. La règle est respectée sans effort, parce que rien ne pousse à la contourner.
**En réel, sur les journées à deux pertes** : délai médian de 9 minutes. La règle n''a pas été abandonnée — elle a été contournée une fois, puis à chaque fois.
Le correctif n''est pas d''allonger la durée, qui serait contournée pareil. C''est de changer le déclencheur : **trente minutes après une perte de 1 R, la séance entière après 2 R cumulés dans la journée.**
Ce chiffre, tu ne l''obtiens qu''en relevant le délai. C''est un dixième champ de journal — et celui-là est facultatif, contrairement au neuvième.

ERR: L''erreur classique
Réécrire les huit règles d''un coup au moment du passage. Une règle réécrite avant d''avoir été mise en défaut est une règle écrite sur une supposition. Six des huit tiennent telles quelles ; les modifier toutes ensemble revient à changer le système sur huit points sans échantillon, ce que le chapitre 6.4 de l''Intermédiaire interdit déjà pour un seul.

KEY: À retenir
- Six règles sur huit passent en réel sans modification. N''y touche pas.
- La règle des trente minutes change de déclencheur : le montant perdu, pas le fait de perdre.
- La septième règle est complétée par la neuvième : seuil, durée, condition de reprise.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 3, 'EX', 'Ta séance, dégradée', 'EXF: Compétence évaluée
Objectifs 28 et 29 : reconnaître dans son propre journal un comportement du module 5 du Débutant réapparu sous contrainte réelle et nommer la règle qui le couvre ; rédiger un protocole d''arrêt et l''appliquer à une séance dégradée.

EXF: Consigne
**Étape A.** Une séance de quatre trades se déroule en temps contraint, avec exécution dégradée et un résultat courant affiché en euros, pas en R. À chaque décision, tu choisis. La séance ne se met pas en pause.
**Étape B.** La séance terminée, ton propre journal du parcours Débutant est ouvert à côté du relevé de la séance. Identifie dans les deux le même comportement, et nomme la règle qui le couvre.
**Étape C.** Rédige ton protocole d''arrêt — seuil, durée, condition de reprise — puis rejoue la séance de l''étape A avec ce protocole actif.

EXF: Ce que la plateforme doit fournir
- Étape A : une séance **non interruptible**, chronométrée, avec le résultat courant affiché **en euros**. C''est le seul écran de tout le parcours où le R disparaît, et c''est délibéré : le module 3 porte sur ce que fait cette conversion.
- Une exécution dégradée active, dont l''un des quatre trades subit un écart marqué à la sortie au stop.
- Étape B : import du journal Débutant de l''utilisateur, avec surlignage des trades dont le résultat s''écarte de l''objectif écrit. **Repli** si le journal est absent ou compte moins de 30 trades conformes : un journal fourni, présenté comme celui d''un autre utilisateur, avec la même mécanique — reprise exacte du repli de l''exercice 1 de l''Intermédiaire.
- Étape C : formulaire à trois champs, le champ « reprise » refusant les formulations d''état, et un calculateur d''écart-type de la somme sur 20 trades, affiché mais non pré-rempli.
- **Repli** si l''exécution dégradée n''est pas disponible : la séance se joue en exécution parfaite, chronomètre et affichage en euros conservés. L''essentiel du module 3 survit ; l''écart d''exécution du trade 4, non.

EXF: Correction commentée
**Étape A.** La séance est construite pour que la sortie anticipée du trade 2 soit **récompensée immédiatement** : le prix revient effectivement contre la position juste après. C''est le piège central, et il est honnête — l''effet de disposition n''est pas une bêtise, c''est un geste qui a raison souvent et qui coûte quand même. Le relevé montre ensuite le prix atteignant l''objectif quarante minutes plus tard.
**Étape B.** L''erreur fréquente est de nommer la spirale, qui est spectaculaire et arrive en dernier. Le comportement présent **dans les deux journaux** est l''effet de disposition, beaucoup plus discret, et c''est le premier maillon. Un utilisateur qui ne trouve rien dans son journal Débutant a probablement cherché une faute grave là où il fallait chercher un écart de 0,3 R répété quinze fois.
**Étape C.** Un seuil sous 6 R déclenche l''arrêt dès la séance de l''étape A, ce qui semble être le bon résultat et ne l''est pas : le calculateur montre qu''à 1,2 R d''écart-type, ce seuil se déclencherait aussi sur une série ordinaire. La bonne réponse arrête la séance par la règle des deux pertes, pas par le protocole. Le protocole, lui, ne sert jamais dans une seule séance.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 4, '4.1', 'Quand trois catégories ne suffisent plus', 'HOOK:
Avec trois positions, tu as trois paires à examiner et tu le fais de tête en cinq secondes. Avec sept, tu en as vingt et une — et tu ne le fais plus du tout.

P: Le chapitre 5.2 de l''Intermédiaire t''a donné trois catégories de corrélation et une règle qui s''applique à une paire. Elle était suffisante parce qu''à deux ou trois positions, le nombre de paires reste inférieur au nombre de positions. Cette propriété s''arrête à trois, et elle s''arrête brutalement.

P: Ce qui remplace l''examen des paires n''est pas un calcul plus fin. Un **groupe d''exposition** réunit les positions qui perdent dans le même scénario — c''est la question posée au chapitre 5.1 de l''Intermédiaire, transformée en outil de classement. Un scénario, contrairement à un coefficient, ne change pas de valeur pendant que tu le regardes.

CASE: Trois paires, ou vingt et une
Nombre de paires à examiner = n(n − 1) ÷ 2. **3 positions** : 3 paires. **5 positions** : 10. **7 positions** : **21**.
À vingt secondes par paire, sept positions demandent **sept minutes de vérification avant chaque ordre**. Tu ne les feras pas, et tu auras raison de ne pas les faire.
La méthode qui la remplace tient en trois lignes :
**1.** Groupe tes positions par scénario perdant commun.
**2.** Dans un groupe, **les risques s''additionnent** — trois positions à 1 % qui perdent ensemble exposent 3 %, comme le disait déjà le chapitre 5.1 de l''Intermédiaire.
**3.** Entre groupes, applique les catégories : au-dessus de +0,3 le plus petit compte pour moitié, en dessous ils s''additionnent, et des sens opposés se retranchent.

ERR: L''erreur classique
Étendre la règle des paires à cinq positions en l''appliquant paire après paire. On obtient alors autant de résultats que d''ordres d''examen possibles, et c''est le plus flatteur qui finit par l''emporter — sans mauvaise foi, simplement parce qu''il arrive en dernier et qu''on s''arrête quand le chiffre passe. Le groupement, lui, ne dépend pas de l''ordre dans lequel tu regardes.

KEY: À retenir
- Le nombre de paires croît comme le carré. Sept positions : vingt et une paires.
- Dans un groupe qui perd ensemble, les risques s''additionnent. Sans exception.
- Entre groupes seulement, les trois catégories de corrélation s''appliquent.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 4, '4.2', 'La corrélation bouge quand le marché bouge', 'HOOK:
Tu as classé tes deux positions à +0,15 au moment de passer les ordres. Elles ont touché leur stop dans la même heure. Les deux affirmations sont exactes, et c''est ça le problème.

P: Une corrélation se mesure sur une fenêtre. Elle décrit ce qui s''est passé dans cette fenêtre, et elle décrira le régime précédent pendant toute la durée du suivant. Ce n''est pas un défaut de la mesure : c''est ce qu''une moyenne fait.

P: Mancini, Ranaldo et Wrampelmeyer ont établi en 2013 que les épisodes d''illiquidité surviennent **simultanément** sur les paires de change, avec une forte communalité. Autrement dit, le moment où ta diversification devrait servir est précisément celui où elle est la moins présente.

CASE: Le classement qui change de camp
**Au moment des ordres** — long EUR/USD 1 %, long BTC/USD 1 %. Corrélation mesurée sur 90 jours : **+0,15**. Deux groupes distincts, on additionne : exposition annoncée **2 %**.
**Trois semaines plus tard** — un épisode de tension fait monter le dollar et se vider les carnets. Les deux positions touchent leur stop dans la même heure. Elles n''étaient pas deux groupes : c''étaient deux paris contre le dollar.
Perte réalisée : **2 %**. L''addition avait donc donné le bon chiffre.
Ce qui aurait été faux, c''est de la remplacer par une demi-somme au vu du +0,15. Le coefficient n''était pas erroné — la fenêtre sur laquelle il était calculé ne contenait simplement pas l''épisode.

ERR: L''erreur classique
Allonger la fenêtre de calcul pour obtenir un coefficient « plus stable ». Une fenêtre longue ne stabilise pas la corrélation : elle ralentit son estimation, et te décrira le régime d''avant pendant tout celui d''après. Le chapitre 5.2 de l''Intermédiaire avait déjà tranché sur la précision ; ce chapitre ajoute que la lenteur se paie au pire moment.

KEY: À retenir
- Une corrélation décrit le passé de la fenêtre sur laquelle elle est calculée.
- L''illiquidité arrive simultanément sur les paires. La diversification manque quand elle servirait.
- Groupe par scénario partagé. Un scénario ne se réévalue pas pendant que le marché bouge.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 4, '4.3', 'Refuser une position : l''ordre de priorité', 'HOOK:
Ta limite est atteinte et un très bon trade se présente. La question n''est pas de savoir s''il est bon : il l''est. C''est de savoir lequel des cinq tu refuses — et cette réponse doit exister avant la question.

P: Trois règles de refus sont défendables, et il faut en choisir une seule. **Le dernier arrivé** : le trade qui se présente. **Le moins bon ratio** : celui dont le gain visé rapporté au risque est le plus faible. **Le plus gros groupe** : celui qui viendrait grossir le bloc le plus exposé.

P: La première a un avantage que les deux autres n''ont pas : elle ne rouvre aucune position en cours. Les deux autres t''obligent à réévaluer des trades déjà ouverts, avec leur objectif et leur stop, au moment où un autre trade te fait envie. C''est la sixième règle du Débutant qui meurt là, pas ailleurs.

CASE: Cinq positions, une limite
Ouvertes : long EUR/USD 0,6 % · long GBP/USD 0,6 % · long BTC/USD 0,5 % · short USD/JPY 0,4 %.
Groupe « le dollar baisse » : EUR/USD, GBP/USD et le short USD/JPY sont trois paris identiques. Somme : 0,6 + 0,6 + 0,4 = **1,6 %**.
Groupe « crypto », faiblement corrélé au premier : **0,5 %**.
Exposition totale : **2,1 %**. La limite de 2 % est dépassée **avant** que le cinquième trade ne se présente.
Le cinquième ne se discute donc pas. Ce qui se discute, c''est ce que tu fais des 0,1 % en trop — et si ta réponse est « je réduis une position ouverte », relis la ligne précédente.

ERR: L''erreur classique
Faire de la place en réduisant une position en cours. L''arithmétique semble neutre : même exposition totale, un trade de plus. Elle ne l''est pas. Tu viens de renégocier une position ouverte au profit d''une position qui n''existe pas encore, et tu l''as fait avec un calcul plutôt qu''avec une émotion — ce qui la rend beaucoup plus difficile à repérer dans ton journal.

KEY: À retenir
- L''ordre de refus s''écrit avant, jamais au moment où un bon trade se présente.
- Par défaut : le dernier arrivé. C''est le seul refus qui ne rouvre rien.
- Réduire une position ouverte pour en loger une autre, c''est renégocier. La règle 6 l''interdit.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 4, '4.4', 'Le plafond que tu ne peux plus vérifier à l''œil', 'HOOK:
« Vérifiable en cinq secondes avant chaque ordre », disait l''Intermédiaire de sa huitième règle. C''était vrai à trois positions. La règle ne dit nulle part ce qu''il faut faire quand ce n''est plus vrai.

P: Un **tableau d''exposition** est une feuille tenue par toi, hors de la plateforme, avec une ligne par position ouverte et quatre colonnes : actif, sens, risque en pourcentage, groupe. Plus une ligne de total. Il se met à jour avant l''ordre, comme la taille de position.

P: La huitième règle ne change pas et la huitième question de la checklist non plus. Ce qui change, c''est d''où vient la réponse : d''un tableau tenu, et non plus d''un souvenir. À trois positions, le souvenir suffisait ; à cinq, il produit systématiquement le chiffre le plus bas.

CASE: Le tableau, et ce qu''il coûte
Quatre colonnes, une ligne par position, une ligne de total.
Mise à jour avant chaque ordre : **une ligne à écrire et une somme à refaire**, soit une vingtaine de secondes, quel que soit le nombre de positions.
Sept minutes pour l''examen par paires du chapitre 4.1, vingt secondes pour le tableau : un rapport de **1 à 21**.
Et surtout, un coût qui ne croît pas. C''est la seule propriété qui compte ici : une vérification dont le coût augmente avec le nombre de positions sera abandonnée exactement au moment où elle devient nécessaire.

ERR: L''erreur classique
Tenir le tableau dans l''interface du courtier. Elle affiche un risque position par position et ne connaît pas tes groupes — le chapitre 5.1 de l''Intermédiaire l''avait déjà établi. Elle a un second défaut, propre au réel : elle ne t''appartient pas. Le jour où tu changes de prestataire, ton tableau disparaît, et avec lui l''historique qui te dirait depuis quand ta limite est dépassée.

KEY: À retenir
- Quatre colonnes : actif, sens, risque, groupe. Et une ligne de total.
- Vingt secondes avant chaque ordre, quel que soit le nombre de positions ouvertes.
- Le tableau reste chez toi. Ce que tient la plateforme du courtier ne t''appartient pas.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 4, 'EX', 'Cinq positions, une limite', 'EXF: Compétence évaluée
Objectifs 30 et 31 : calculer l''exposition d''un portefeuille de plus de trois positions en tenant compte du sens et des groupes ; décider quelle position refuser quand la limite est atteinte, en citant la règle qui tranche.

EXF: Consigne
**Étape A.** Un portefeuille de six positions t''est présenté. Constitue les groupes, puis calcule l''exposition totale.
**Étape B.** Le même portefeuille t''est présenté trois semaines plus tard, avec une matrice de corrélation qui a changé de catégorie sur deux couples. Recalcule, et dis si ta décision d''origine aurait été différente.
**Étape C.** Un septième trade se présente alors que la limite est atteinte. Applique ta règle de refus, écrite à l''étape précédente, et nomme la règle du Débutant ou de l''Intermédiaire qui interdit les deux autres solutions.

EXF: Ce que la plateforme doit fournir
- Un écran portefeuille à six positions avec actif, **sens**, risque en pourcentage, et une zone de groupement par glisser-déposer — l''utilisateur constitue lui-même les groupes, la plateforme ne les propose jamais.
- Une matrice de corrélation en trois couleurs, comme à l''exercice 5 de l''Intermédiaire, et un bouton « trois semaines plus tard » qui la modifie sans modifier les positions.
- Un champ pour l''exposition totale, tolérance ±0,1 point, et un compteur du temps passé sur l''étape A, affiché seulement à la fin.
- Étape C : trois solutions proposées — refuser le dernier arrivé, réduire une position ouverte, refuser le plus mauvais ratio — et un champ pour nommer la règle violée par la solution intermédiaire.
- **Repli** si le glisser-déposer n''est pas disponible : groupes constitués par cases à cocher, mécanique et correction identiques.

EXF: Correction commentée
**Étape A.** Le piège est le short au milieu des longs, comme à l''Intermédiaire — mais il est ici inversé : le short USD/JPY **rejoint** le groupe des paris contre le dollar au lieu de le compenser, parce que c''est le dollar qui est vendu dans les deux cas. Un utilisateur qui applique mécaniquement « sens opposés, on retranche » se trompe de 0,8 point. Le sens se lit sur le scénario, pas sur le libellé de la paire.
**Étape B.** La réponse attendue est que la décision d''origine **ne change pas**, et c''est contre-intuitif : deux couples ont changé de catégorie, donc quelque chose devrait bouger. Rien ne bouge, parce que les groupes ont été constitués sur des scénarios et que les scénarios n''ont pas changé. C''est tout l''enseignement du chapitre 4.2, et il ne se démontre qu''en le faisant deux fois.
**Étape C.** « Réduire une position ouverte » est choisi par une large part des utilisateurs, parce que c''est la seule solution qui permette de prendre le bon trade. La règle violée est la sixième du Débutant — objectif et stop non renégociables — et la difficulté de l''exercice est de la nommer alors qu''aucun objectif ni aucun stop n''a été explicitement déplacé.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, '5.1', 'Série défavorable ou dégradation : la question mal posée', 'HOOK:
Trente trades sans rien gagner. Tu veux savoir si ton avantage a disparu. Cette question n''a pas de réponse — pas parce qu''elle est difficile, parce qu''elle est posée après.

P: Une **dégradation** est la disparition durable de l''avantage d''un système. Une série défavorable est une suite de résultats négatifs qui relève de la variance. Les deux produisent le même relevé, le même sentiment et la même envie de faire quelque chose.

P: Rien dans tes données ne les sépare. C''est un fait arithmétique, pas un manque de méthode, et il ne se corrige pas en regardant mieux. Ce qui les sépare est ailleurs : dans le fait qu''un seuil ait été écrit avant, ou ne l''ait pas été.

CASE: Cinquante trades qui ne prouvent rien
Système à **+0,15 R** d''espérance nette, écart-type de **1,2 R** par trade.
Sur 50 trades, la somme attendue vaut 50 × 0,15 = **+7,5 R**, et l''écart-type de cette somme vaut 1,2 × √50 = **8,5 R**.
Une séquence de 50 trades qui se termine à **0 R** se situe donc à 0,9 écart-type sous l''attendu. Parfaitement ordinaire.
Combien de trades pour détecter une chute de +0,15 R à zéro ? En reprenant le tableau du chapitre 2.2 de l''Intermédiaire : environ **640 trades**, soit plus de **quatre ans** à trois trades par semaine.
La conclusion est à accepter une fois pour toutes : **tu ne détecteras jamais statistiquement la disparition de ton propre avantage.** Ce module porte sur ce qu''on fait en le sachant.

ERR: L''erreur classique
Chercher la réponse dans un découpage du journal. Segmenter jusqu''à trouver le mois où ça s''est gâté produira toujours une date, puisqu''il en existe forcément une. Le chapitre 1.3 de l''Intermédiaire a nommé ce geste ; ici il est aggravé, parce que la date trouvée sert ensuite à justifier un arrêt ou son report, et que les deux se paient comptant.

KEY: À retenir
- Série et dégradation expliquent les mêmes données. Rien dans le relevé ne les sépare.
- Détecter la disparition d''un avantage de 0,15 R demanderait plus de quatre ans.
- Ce qui tranche n''est pas dans les données. C''est la date à laquelle le seuil a été écrit.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, '5.2', 'Ce que la recherche établit sur la durée de vie d''un avantage', 'HOOK:
Ton avantage va se réduire. Ce n''est pas un pronostic sur toi : c''est le résultat le mieux documenté du domaine, mesuré sur des centaines de stratégies, et il a un ordre de grandeur.

P: On appelle **décote hors échantillon** la perte de performance constatée quand une règle est appliquée à des données qui n''ont pas servi à la construire. McLean et Pontiff l''ont mesurée en 2016 sur les 97 variables dont la littérature affirmait qu''elles prédisaient les rendements d''actions : **−26 %** hors échantillon, **−58 %** après publication.

P: Falck, Rej et Thesmar ont prolongé le travail en 2021. L''année de publication explique à elle seule **30 %** de la variance de cette décote, chaque année ajoutant environ cinq points. Autrement dit, l''usure n''est ni rare ni accidentelle : elle est la règle, et elle s''accélère.

P: Ces travaux portent sur des anomalies actions publiées, pas sur ton système, et rien n''autorise à transporter leur coefficient tel quel. Ils donnent un ordre de grandeur — voilà à quoi ressemble une décote ordinaire quand on passe des données d''hier à celles de demain — et pas une valeur.

CASE: Une décote appliquée, et ce qu''elle vaut
Ton système : espérance brute mesurée **+0,18 R**, coût d''exécution mesuré **0,14 R**.
Applique la décote hors échantillon de 26 % : 0,18 × 0,74 = **+0,133 R**.
Retranche le coût d''exécution : 0,133 − 0,14 = **−0,007 R**.
Trois chiffres, deux opérations, et le résultat change de signe.
**Ce calcul n''est pas une prédiction.** C''est un test de sensibilité : il dit qu''une décote de l''ordre de celle qu''on observe partout ailleurs suffirait à annuler ton avantage. Il ne dit pas qu''elle surviendra.

ERR: L''erreur classique
Transformer le test de sensibilité en pronostic — ou, tout aussi souvent, écarter la décote parce qu''« elle ne porte pas sur mon marché ». Les deux gestes ont la même cause : vouloir un chiffre là où il n''y a qu''un ordre de grandeur. Le premier te fait arrêter un système qui va bien, le second t''en fait garder un qui ne va plus.

KEY: À retenir
- McLean et Pontiff, 2016 : −26 % hors échantillon, −58 % après publication, sur 97 variables.
- Ce n''est pas un coefficient à appliquer à ton système. C''est un ordre de grandeur.
- Un avantage qui ne survit pas à une décote de 26 % n''a aucune marge.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, '5.3', 'Le test écrit avant l''observation', 'HOOK:
Un critère d''arrêt sans taux de fausse alarme n''est pas un critère : c''est une phrase. Le calculer prend deux minutes et change presque toujours le seuil qu''on s''apprêtait à écrire.

P: Quatre éléments, comme le critère d''abandon du chapitre 2.5 de l''Intermédiaire, mais sur un autre objet. **La grandeur** mesurée. **Le seuil** chiffré. **La fenêtre** sur laquelle on mesure. **L''action** déclenchée, écrite au présent de l''indicatif.

P: Le **taux de fausse alarme** d''un critère est la probabilité qu''il se déclenche alors que le système est sain. Il dépend du seuil, mais aussi de la fenêtre — celle qu''on ne pense jamais à écrire — et le chapitre suivant montre que la seconde pèse plus lourd que le premier.

CASE: Le taux de fausse alarme d''un seuil
Critère envisagé : « si le R moyen net des **100 derniers trades conformes** passe sous **0 R**, j''arrête. »
Système sain à +0,15 R d''espérance nette, écart-type 1,2 R. Sur 100 trades, l''erreur-type de la moyenne vaut 1,2 ÷ √100 = **0,12 R**.
Le seuil se trouve donc à (0,15 − 0) ÷ 0,12 = **1,25 erreur-type** sous l''espérance. La probabilité de le franchir par pur hasard vaut environ **10,6 %**.
Une chance sur neuf, **à chaque fois que tu regardes**. En regardant tous les mois sur une fenêtre glissante, tu arrêteras un système parfaitement sain à peu près une fois par an.
Le correctif ne porte pas sur le seuil. Il porte sur la fenêtre.

ERR: L''erreur classique
Écrire le critère au moment où on en a besoin. Un critère rédigé pendant une série défavorable est toujours calibré pour ne pas se déclencher tout de suite : c''est ce qu''on cherche à cet instant, et c''est ce qu''on obtient. Le critère d''abandon de l''Intermédiaire s''écrit avant le test pour exactement la même raison, et le module 2 avait déjà refusé de rendre le bouton actif sans lui.

KEY: À retenir
- Quatre éléments : la grandeur, le seuil, la fenêtre, l''action.
- Tout seuil a un taux de fausse alarme. Calcule-le avant de l''écrire, pas après.
- Un critère rédigé pendant une série défavorable est calibré pour ne pas se déclencher.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, '5.4', 'Le critère d''arrêt de système', 'HOOK:
Le critère d''abandon tue une hypothèse en test, et ça ne coûte rien. Le critère d''arrêt ferme un système en production, et ça coûte trente-trois semaines. Confondre les deux revient à payer le second prix pour la première décision.

P: Le **critère d''arrêt de système** porte sur un système qui tourne, avec de l''argent engagé et un journal en cours. Le critère d''abandon portait sur une idée en cours d''évaluation, dont l''échec ne laissait qu''une ligne datée dans le journal des tests.

P: La différence de coût impose une différence de calibrage. Un critère d''abandon peut se permettre d''être sévère : jeter une bonne idée coûte une idée. Un critère d''arrêt sévère jette un système et huit mois de simulation avant toute reprise.

CASE: Des fenêtres qui ne se recouvrent pas
Une **fenêtre disjointe** est une fenêtre d''évaluation qui ne partage aucun trade avec la précédente.
Même critère, même seuil. Une seule modification : il n''est évalué **qu''une fois par tranche de 100 nouveaux trades**, jamais sur une fenêtre glissante.
À 156 trades par an, cela fait **1,56 évaluation par an**.
Fausses alarmes attendues : 1,56 × 10,6 % = **0,17 par an**, soit un arrêt injustifié tous les **six ans** environ — contre un par an avec la fenêtre glissante.
Le seuil n''a pas bougé d''un centième. Le taux de fausse alarme a été divisé par plus de sept, uniquement parce qu''on a cessé de regarder en permanence.
Et le prix d''un arrêt, lui, ne bouge pas non plus : 100 trades conformes en simulation avant toute reprise, soit les **33 semaines** du chapitre 6.4 de l''Intermédiaire.

ERR: L''erreur classique
Arrêter le système et laisser courir les positions ouvertes. L''arrêt porte sur la décision d''ouvrir, pas sur ce qui est déjà engagé — c''est vrai, et c''est insuffisant. Trois positions qui courent sous un système arrêté produisent exactement la situation du module 3 : des décisions de gestion prises sans règle active, sur des trades qu''on n''ouvrirait plus aujourd''hui. Le critère doit dire ce qu''il advient d''elles.

KEY: À retenir
- Critère d''abandon : une hypothèse en test. Critère d''arrêt : un système en production.
- Évalue sur des fenêtres qui ne se recouvrent pas. Le seuil ne change pas, la fausse alarme si.
- Le critère écrit ce qu''il advient des positions déjà ouvertes. Sinon elles décident seules.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, '5.5', 'Arrêter n''est pas échouer', 'HOOK:
Un système arrêté peut être retesté l''an prochain. Un capital perdu ne revient pas par le même chemin, et l''arithmétique de ce retour figure dans les annexes du Débutant depuis ton premier jour.

P: Les deux erreurs possibles n''ont pas le même prix, et c''est ce déséquilibre qui doit gouverner ton seuil. Arrêter à tort coûte des semaines, un chiffre connu et borné à l''avance. Ne pas arrêter à temps coûte du capital, et cette dépense-là n''a pas de borne écrite.

CASE: Le prix de l''hésitation
Le tableau des annexes du Débutant donne le gain nécessaire pour revenir au point de départ.
Arrêt à **−10 %** : il faut ensuite **+11 %**. Le retour est presque symétrique.
Attendre **−33 %** : il faut **+50 %**. Attendre **−50 %** : il faut **+100 %**.
Entre les deux premières lignes, l''écart n''est pas de 23 points de perte. C''est le passage d''un retour presque symétrique à un retour qui exige la moitié du capital en plus.
Un arrêt injustifié coûte 33 semaines de simulation, tous les six ans environ. Un arrêt trop tardif coûte un capital qu''aucune règle ne reconstitue.

ERR: L''erreur classique
Traiter l''arrêt comme une remise en cause de l''année écoulée. Le système arrêté t''a laissé un document daté, un journal complet et une mesure d''exécution qui te sont acquis — le chapitre 6.4 de l''Intermédiaire appelle précisément cela un déclencheur légitime. Ce qui se perdrait, c''est de ne pas arrêter et de ne plus pouvoir dire, dans un an, ce qui fonctionnait.

KEY: À retenir
- Les deux erreurs n''ont pas le même prix : l''une coûte des semaines, l''autre du capital.
- Un arrêt injustifié : 33 semaines, tous les six ans. C''est un prix connu et borné.
- Revenir en simulation après un arrêt est le déroulement prévu, pas un accident de parcours.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 5, 'EX', 'Le système que tu arrêtes', 'EXF: Compétence évaluée
Objectifs 32 et 33 : distinguer une série défavorable d''une dégradation au moyen d''un test écrit avant l''observation ; écrire et dater un critère d''arrêt de système, distinct du critère d''abandon.

EXF: Consigne
**Étape A.** Deux séquences de 60 trades te sont présentées, sans étiquette. L''une provient d''un système sain traversant une série défavorable, l''autre d''un système dont l''espérance a réellement chuté. Dis laquelle est laquelle.
**Étape B.** Rédige ton critère d''arrêt : grandeur, seuil, fenêtre, action. Le calculateur affiche le taux de fausse alarme de ce que tu écris, en direct.
**Étape C.** Ton propre relevé — ou celui fourni en repli — est passé au critère que tu viens d''écrire, sur fenêtre glissante puis sur fenêtres disjointes. Compare les deux réponses.

EXF: Ce que la plateforme doit fournir
- Deux séquences de 60 trades générées avec des espérances réellement différentes, affichées en courbe de capital et en relevé. Aucune étiquette, aucun indice, et un bouton « je ne peux pas savoir ».
- Étape B : quatre champs, plus un calculateur de taux de fausse alarme qui prend l''écart-type du système de l''utilisateur et se met à jour à chaque frappe. Le champ « fenêtre » propose glissante ou disjointe, sans valeur par défaut.
- Étape C : les statistiques réelles de l''utilisateur — R moyen net, écart-type, nombre de trades sur la version en cours. **Repli** si elles sont absentes ou portent sur moins de 100 trades : un relevé fourni de 240 trades, présenté comme celui d''un autre utilisateur, et l''exercice se déroule à l''identique.
- Un export du critère rédigé, daté, directement ajoutable au document de système de l''Intermédiaire.

EXF: Correction commentée
**Étape A.** La bonne réponse est **« je ne peux pas savoir »**, et c''est le seul exercice de tout le parcours dont la bonne réponse est un refus de répondre. Les deux séquences sont construites pour être indiscernables sur 60 trades : le chapitre 5.1 a montré qu''il en faudrait environ 640. Un utilisateur qui tranche a nécessairement tranché sur autre chose que les données — le plus souvent sur la forme de la courbe, qui est exactement ce que le module 1 de l''Intermédiaire lui apprenait déjà à ne pas lire.
**Étape B.** Le seuil spontanément écrit est presque toujours trop haut, et le calculateur affiche alors un taux de fausse alarme supérieur à 25 %. La correction ne dit pas quel seuil écrire : elle demande de le baisser jusqu''à ce que le taux soit acceptable **pour toi**, et de noter la valeur retenue. C''est ta tolérance qui est le paramètre libre, pas la statistique.
**Étape C.** Les deux fenêtres donnent des réponses différentes sur le même relevé dans une majorité des cas. C''est le résultat attendu et il est déstabilisant : il montre qu''une part de ta décision d''arrêt tient à la fréquence à laquelle tu regardes, et non à ce que fait ton système. Choisir la fenêtre disjointe n''est pas une astuce pour arrêter moins souvent — c''est refuser que la fréquence d''observation entre dans la décision.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, '6.1', 'Le courtier : ce que tu peux vérifier toi-même', 'HOOK:
Aucun nom ne figure dans ce chapitre, et ce n''est pas une précaution juridique. C''est que le bon critère n''a jamais été l''identité du prestataire : c''est ce que tu peux vérifier de lui sans le croire sur parole.

P: Sept vérifications, toutes réalisables avant d''ouvrir quoi que ce soit, toutes documentaires. Aucune ne demande d''avis, aucune ne demande de comparateur, et chacune se conclut par oui ou par non.

UL:
- **Agrément** : le régulateur et le numéro, vérifiés dans la base publique tenue par ce régulateur — pas sur le site du prestataire.
- **Ségrégation des fonds clients** : dans quel document contractuel elle est écrite, et sous quelle formulation exacte.
- **Protection contre le solde négatif** : contractuelle ou seulement réglementaire, et pour quel statut de client.
- **Avertissement standardisé** : le pourcentage de comptes perdants que le prestataire publie lui-même.
- **Politique d''exécution** : est-elle publiée, et que dit-elle des ordres stop en cas de saut de cotation.
- **Frais de report** : où sont-ils publiés, sous quelle forme, et avec quel préavis de modification.
- **Historique** : combien de temps le relevé reste consultable et exportable après la clôture d''une position.

P: Ce que tu ne peux pas vérifier avant d''avoir ouvert, c''est la qualité d''exécution. Elle ne figure dans aucun document, et les chiffres publiés sur le sujet viennent d''entreprises qui vendent cette exécution. C''est l''autre fonction du palier du module 2 : ses vingt-cinq trades mesurent aussi ton prestataire.

ERR: L''erreur classique
Choisir sur le spread affiché. C''est le seul chiffre mis en avant partout, et le chapitre 1.1 a montré qu''il ne représente qu''une part du coût. Un spread annoncé serré avec un écart d''exécution large coûte plus cher qu''un spread moyen bien exécuté — et cette comparaison-là, tu ne peux la faire qu''après avoir ouvert le compte, jamais avant.

KEY: À retenir
- Sept vérifications documentaires, toutes réalisables avant d''ouvrir, toutes en oui ou non.
- L''agrément se vérifie chez le régulateur, jamais sur le site du prestataire.
- La qualité d''exécution ne se vérifie pas à l''avance. Elle se mesure, et ça prend 25 trades.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, '6.2', 'Les protections réglementaires, et ce qu''elles ne couvrent pas', 'HOOK:
Il existe une règle européenne qui ferme automatiquement tes positions pour te protéger. Sur un capital de 1 000 €, elle se déclenche quand tu as perdu 91,7 % de ce capital.

P: L''ESMA a arrêté en 2018 quatre mesures applicables aux contrats à effet de levier proposés aux particuliers, reprises ensuite dans les droits nationaux. Elles ne se ressemblent pas et ne protègent pas de la même chose.

UL:
- **Levier plafonné** : 30:1 sur les paires de devises majeures, 20:1 sur les non-majeures, 5:1 sur les actions, **2:1 sur les cryptomonnaies**.
- **Clôture automatique** des positions lorsque les fonds du compte tombent à 50 % de la marge minimale requise.
- **Protection contre le solde négatif**, compte par compte : tu ne peux pas devoir plus que ce que tu as déposé.
- **Avertissement standardisé** : chaque prestataire publie le pourcentage de ses comptes clients particuliers qui perdent de l''argent.

P: La troisième n''est pas une précaution abstraite. Le 15 janvier 2015, l''abandon du plancher entre l''euro et le franc suisse a laissé des comptes clients en négatif : FXCM a annoncé 225 millions de dollars de soldes débiteurs, et Alpari UK a été placée en administration quatre jours plus tard.

CASE: La protection qui arrive après
Capital 1 000 €. EUR/USD, position de 5 000 unités — celle du chapitre 1.1.
Marge requise au levier maximal de 30:1 : 5 000 ÷ 30 = **166,67 €**.
Clôture automatique à 50 % de cette marge : **83,33 €**.
Ton compte est donc fermé d''office lorsqu''il ne reste plus que 83,33 €, c''est-à-dire après avoir perdu **916,67 €** — soit **91,7 % du capital**.
En R : **91,7 R**. Ta règle du 1 % se sera déclenchée quatre-vingt-onze fois avant que la protection réglementaire ne se manifeste une seule.

ERR: L''erreur classique
Lire ces mesures comme une gestion du risque. Elles bornent ce que tu peux **devoir**, pas ce que tu peux **perdre**, et elles ont été calibrées pour éviter une catastrophe de place, pas pour préserver ton capital. Les seules règles qui protègent ton capital sont les neuf que tu appliques toi-même, et elles se déclenchent toutes bien avant.

KEY: À retenir
- Quatre mesures : levier plafonné, clôture à 50 % de la marge, solde négatif, avertissement publié.
- Elles bornent ce que tu peux devoir. Elles ne bornent pas ce que tu peux perdre.
- Sur 1 000 €, la clôture automatique intervient à −91,7 %. Tes règles agissent à −10 %.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, '6.3', 'Tenue de registre : ce que ton journal ne suffit pas à produire', 'HOOK:
Ton journal sert à apprendre. Il ne sert pas à répondre à quelqu''un qui te demandera, dans trois ans, ce que tu as fait au mois de mars.

P: Un **registre** est le relevé exhaustif et daté de toutes tes opérations, tenu pour un tiers : une administration, un professionnel du chiffre, ou toi-même dans trois ans. Il ne remplace pas le journal, et le journal ne le remplace pas.

P: Trois différences les séparent. Le registre est **exhaustif** — il contient aussi les trades non conformes, que ton journal filtre. Il est **factuel** — ni scénario, ni conformité, ni commentaire. Et il est **exportable**, ce qui est sa raison d''être.

UL:
- Date et heure d''ouverture, date et heure de clôture.
- Actif et sens.
- Taille de la position.
- Prix d''ouverture obtenu.
- Prix de clôture obtenu.
- Frais : spread, commissions, frais de report.
- Résultat, dans la devise du compte.

CASE: Ce que trois ans représentent
Trois trades par semaine pendant trois ans : **468 trades**.
Sept champs par trade : **3 276 valeurs**, sans compter les mouvements du compte.
Reconstituer cela après coup, sans export, n''est pas difficile — c''est impossible.
Et ton prestataire n''est pas tenu de conserver indéfiniment un historique consultable. La durée figure parmi les sept vérifications du chapitre 6.1 : contrôle-la avant, pas le jour où tu en as besoin.
Un export mensuel coûte deux minutes. Sur trente-six mois, une heure douze. C''est le meilleur rapport de tout ce parcours.

ERR: L''erreur classique
N''en tenir qu''un seul, en pensant que l''autre en découlera. Le journal filtré sur les trades conformes est inutilisable comme registre : il omet exactement les opérations les plus pénibles à reconstituer. Le registre est inutilisable comme journal : il ne contient ni scénario ni conformité, c''est-à-dire aucun des deux champs qui produisent de l''apprentissage depuis le chapitre 6.1 du Débutant.

KEY: À retenir
- Le registre est exhaustif, factuel et exportable. Le journal est filtré, interprété et privé.
- Sept champs, exportés une fois par mois. Deux minutes.
- La durée de conservation de l''historique se vérifie avant d''ouvrir, pas après.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, '6.4', 'La fiscalité : les questions, jamais les réponses', 'HOOK:
Ce chapitre ne contient aucun taux, aucun seuil et aucun régime : une règle fiscale citée dans un document et lue deux ans plus tard est une information fausse. Ce qu''il contient, ce sont les sept questions qui rendent une consultation utile, et le document à emporter avec elles.

P: Trois raisons rendent toute réponse impossible ici. Les règles changent, parfois d''une année sur l''autre. Elles dépendent de ton pays de résidence fiscale. Et elles dépendent d''éléments personnels — statut, autres revenus, caractère occasionnel ou habituel de l''activité — qu''aucun cours ne connaît.

WARN: Ce qui suit est daté
Cette page est à jour de septembre 2026, et sa seule affirmation stable est celle-ci : **les règles fiscales applicables changent et dépendent de ton pays.** Toute liste de taux ou de seuils, ici ou ailleurs, doit être considérée comme périmée jusqu''à vérification auprès d''un professionnel ou de l''administration compétente.

P: Ce que ce chapitre peut te donner, en revanche, ce sont les questions. Elles se posent une fois, à un professionnel, avec ton registre du chapitre 6.3 sous le bras — et une consultation préparée coûte moins cher qu''une consultation improvisée.

UL:
- Quel régime s''applique à ces instruments, dans mon pays de résidence fiscale, cette année-ci ?
- L''imposition intervient-elle à la clôture de chaque position ou à la clôture de l''exercice ?
- Les pertes sont-elles imputables ? Sur quoi, et pendant combien d''années ?
- Quelles obligations déclaratives, sur quels formulaires, à quelles échéances ?
- Un compte ouvert hors de mon pays de résidence crée-t-il une obligation supplémentaire ?
- Quels justificatifs dois-je conserver, et pendant combien de temps ?
- À partir de quand mon activité cesse-t-elle d''être considérée comme occasionnelle ?

ERR: L''erreur classique
Chercher la réponse sur un forum. Les réponses y sont sincères, souvent exactes pour celui qui les écrit, et sans valeur pour toi : elles dépendent d''un pays, d''une année et d''une situation personnelle qui ne sont pas les tiens. Le coût d''une consultation est connu à l''avance ; celui d''une déclaration inexacte ne l''est pas.

KEY: À retenir
- Aucun taux, aucun seuil : ils changent et dépendent de ton pays. Cette page est datée.
- Sept questions, une consultation, ton registre sous le bras.
- Une consultation préparée coûte moins cher qu''une consultation improvisée.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, '6.5', 'Ce que tu décides maintenant', 'HOOK:
Ce document ne t''a jamais dit d''engager de l''argent, et il ne le fera pas dans les lignes qui restent. Tu arrives pourtant au bout de trois parcours et d''environ un an de pratique.

P: Le seul livrable de ce parcours est une décision datée. Elle tient en cinq lignes, elle se verse au document de système comme n''importe quelle autre décision, et elle nomme ce qui devrait changer pour être revue.

CASE: La décision, écrite
**1.** Espérance brute mesurée, et sur combien de trades conformes.
**2.** Coût d''exécution mesuré, et sur combien de trades.
**3.** Espérance nette, et son erreur-type.
**4.** Ce que dit mon critère : au-dessus, en dessous, ou dans l''incertitude.
**5.** Ma décision, et ce qui devrait changer pour que je la revoie.
Rempli : brute +0,18 R sur 140 trades · coût 0,14 R sur 25 trades · nette **+0,04 R**, erreur-type 0,10 R · **dans l''incertitude** · *je reste en simulation, je reverrai cette décision à 300 trades conformes.*

P: Sur 14 799 clients français suivis quatre ans par l''AMF, **89 % perdent de l''argent**. Ce chiffre ouvrait le parcours Débutant, il ferme celui-ci, et rien dans les trois documents ne t''en a extrait : ils t''ont appris à mesurer, pas à gagner.

P: Rester en simulation n''est pas le lot de consolation de ce parcours. Pour la plupart des lecteurs qui arrivent ici, c''est sa conclusion correcte — et elle n''a besoin d''aucune justification supplémentaire que la ligne 3 de la fiche ci-dessus.

ERR: L''erreur classique
Traiter la lecture de ce document comme une étape franchie. Rien n''a été franchi : tu as lu six modules, et tu disposes au mieux de six mesures de plus qu''avant. Il n''existe dans ces trois parcours aucun moment où quelqu''un te dit que tu es prêt, et l''absence de ce moment est la chose la plus délibérée de tout l''ouvrage.

KEY: À retenir
- Le livrable de ce parcours est une décision datée, pas un compte ouvert.
- Cinq lignes : brute, coût, nette et son incertitude, ce que dit le critère, la décision.
- « Je reste en simulation » est une réponse complète. C''est la plus fréquente, et elle est juste.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'fr', 6, 'EX', 'Ta décision, datée', 'EXF: Compétence évaluée
Objectifs 34, 35 et 36 : énumérer les critères de choix vérifiables d''un prestataire ; constituer une tenue de registre et les questions à poser à un professionnel ; formuler une décision datée et argumentée sur des mesures.

EXF: Consigne
**Étape A.** Trois fiches de prestataires anonymisées te sont présentées. Pour chacune, dis lesquelles des sept vérifications du chapitre 6.1 sont possibles avec les éléments fournis, et lesquelles ne le sont pas.
**Étape B.** Un export brut de relevé t''est donné. Constitue le registre à sept champs, puis dresse la liste des questions que ce registre permet de poser à un professionnel.
**Étape C.** Rédige ta décision en cinq lignes, à partir de tes propres mesures, et date-la.

EXF: Ce que la plateforme doit fournir
- Trois fiches **entièrement fictives**, sans nom, sans logo, sans lien : uniquement les éléments documentaires listés au chapitre 6.1, dont certains volontairement absents. Aucune fiche ne doit être « la bonne ».
- Étape B : un export brut réaliste — lignes en désordre, colonnes surnuméraires, frais dans une colonne séparée — et une grille à sept champs à remplir par glisser-déposer des colonnes.
- Étape C : un formulaire à cinq lignes, pré-rempli avec les mesures réelles de l''utilisateur issues des exercices 1, 2 et 5, et un bouton d''export daté vers son document de système.
- **Repli** si les mesures de l''utilisateur sont indisponibles : les trois jeux de mesures des relevés A, B et C du chapitre 2.4, l''utilisateur choisissant celui qu''il traite. La décision produite est alors marquée « exercice » et n''est pas versée au document de système.
- Aucun écran de ce parcours ne doit proposer de lien, de bouton ou de suggestion menant à l''ouverture d''un compte réel. Cette interdiction est un élément de conception, pas une préférence.

EXF: Correction commentée
**Étape A.** Aucune des trois fiches ne permet les sept vérifications, et c''est le résultat attendu. La fiche la plus attrayante — spread le plus serré, présentation la plus soignée — est aussi celle où la politique d''exécution est absente. Les utilisateurs qui la classent première ont refait, sur un écran d''exercice, exactement l''erreur du chapitre 6.1.
**Étape B.** Le piège est la colonne des frais, séparée du résultat dans l''export brut. Un registre qui la laisse de côté paraît complet et ne l''est pas : c''est la seule colonne qui manquera au moment où quelqu''un demandera un chiffre net. Les questions au professionnel, elles, ne sont pas notées — leur existence suffit.
**Étape C.** Il n''y a pas de bonne décision, et la correction ne juge pas celle qui est prise. Elle vérifie une seule chose : que la ligne 5 nomme un fait mesurable qui la ferait revoir. « Je reverrai quand je serai plus à l''aise » est refusé, pour la raison exacte du chapitre 3.3 — une condition qu''on ne peut pas constater de l''extérieur sera constatée favorablement dès qu''on en aura envie.', 32);

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.1', 'What you are actually buying', 'HOOK:
You open the app. EUR/USD shows 1.0850. You click "Buy". Simple question, and almost nobody can answer it on day one: what exactly did you just buy?

P: Not euros. There is no vault, no banknotes, nothing that belongs to you. You have just entered into a contract with your broker: if the euro rises against the dollar, he owes you money; if it falls, you owe him. That is all.

P: Two words you will read hundreds of times. A **position** is that contract for as long as it is open. A **trade** is the whole operation: the entry, the wait, the exit. A trade is judged once it is closed, never while it is running.

P: The price on the screen is not a value either. It is the last agreement struck between a buyer and a seller, a fraction of a second ago. You are not "taking a view on the euro": you are betting that another human being, later, will accept a different price.

P: And there is not one price, there are two. A price at which you can buy, another at which you can sell, always a little lower. The gap between them is called the **spread**. You always enter on the wrong side of it.

CASE: What the first second costs
EUR/USD shows 1.08495 to sell and 1.08505 to buy. You buy, so at 1.08505.
You change your mind within the second and sell back: at 1.08495. The market has not moved a hair, and you have lost **1 pip** — the pip is the fourth decimal of a currency pair, that is 0.0001 on EUR/USD. It is the unit distances are counted in on this market.
On a position of 10,000 units, 1 pip is worth about $1. Twenty round trips in a day: $20. Twenty trading days: **$400**.
On capital of $1,000, you have to make 40% in the year just to cover your costs.

ERR: The classic mistake
The beginner watches *the* price, not *the two* prices. He believes he is level as soon as his order is filled. In reality every trade starts at a loss equal to the spread — and he never adds up what that comes to over a month.

KEY: Key points
- You hold nothing: you have a contract against your broker.
- There are always two prices. You buy at the higher one, you sell at the lower one.
- Every trade starts at a loss. The more you open, the more that loss piles up.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.2', 'Who is on the other side', 'HOOK:
Your broker gives you a platform, real-time charts, sometimes a welcome bonus and someone at the end of a phone. Nobody does that out of philanthropy. So: where does the money come from?

P: From three places. Commissions taken on every transaction. The spread, that gap between the two prices. And overnight financing charges, billed for every night you keep a position open.

P: None of that is illegitimate: it is a service, and it is paid for. What matters is the shape of the cost. It is **certain and regular**, while your gain is uncertain and irregular. The broker earns when you trade. Not when you win.

P: Now, a distinction you will hear nowhere else, and one that takes away your favourite excuse before you have even invented it. The AMF measured the share of fees in client losses: **14.2%**. The rest — the other 85.8% — comes from the client''s own decisions. Your broker is not your main problem. You are.

CASE: What waiting costs
You keep a $10,000 position open for 30 nights. The overnight charge is 0.02% a night, that is $2.
30 nights × $2 = **$60**.
On capital of $1,000, that is 6% of the account. The market has not moved. You have done nothing wrong. You have just waited.

ERR: The classic mistake
Holding a losing position "until it comes back". Every night adds a cost, and the position whose recovery you are hoping for is the one you pay for longest. In leveraged trading, time is not neutral: it is billed.

KEY: Key points
- Your broker is paid for activity, not for your performance.
- Fees explain 14.2% of losses. The rest is decisions.
- A position held for a long time costs money every night, even standing still.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.3', 'The numbers nobody shows you', 'HOOK:
Before you learn anything at all, you need to know which statistic you have just joined. This chapter is the most unpleasant in the track. It is also the only one I ask you never to forget.

P: In 2014 the AMF did what nobody had done before: it asked brokers licensed in France for their clients'' actual results. Not fraudulent brokers — legal, regulated firms, the ones whose adverts you see.

P: 14,799 active clients. Four years. The result: **89% lose money**. Average loss per client: €10,887. Total loss across the sample: €161 million.

P: The average lies a little, and in a direction that concerns you. It is dragged down by a few disasters. The figure to remember is the **median: €1,843**. That is the fate of the ordinary client — the one who did nothing crazy, who simply played for a few months and stopped. You are far more likely to be that one.

CASE: The shape of the distribution
Out of the 14,799 clients in the study:
722 clients (4.9%) lost **more than €50,000** each, for a total of €102 million.
121 clients (0.8%) made **more than €24,000** each, for a total of about €10 million.
The tail of losses weighs **ten times** the tail of gains. This is not an even game whose side you pick at random: the rare big winners do not come close to offsetting the rare big losers.

ERR: The classic mistake
"Those people didn''t know what they were doing. I''m going to learn properly." The study isolated the 1,881 clients who were active *every year* for four years — the most experienced in the sample. Result: 87.56% losing, with an average loss of €26,745. The longer they lasted, the more they lost. The AMF concludes that there is no learning effect.

KEY: Key points
- 89% of French clients lose. The median client loses €1,843.
- Experience on its own improves nothing: that is measured, not assumed.
- This track does not claim to reverse those numbers. It gives you the few variables you can actually act on.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.4', 'Leverage', 'HOOK:
A broker offers to let you deposit €1,000 and move €30,000 on the market. Put like that, it sounds like a gift. It is an accelerator — and an accelerator works in both directions.

P: **Leverage** is the ratio between the size of your position and the money you have actually deposited. Leverage 30: €1,000 drives €30,000. The consequence is pure arithmetic, there is nothing to interpret: a 1% move in the market becomes 30% of your capital.

P: Here is the point almost everyone misses. Leverage does not change the probability that you are right. It makes your analysis neither better nor worse. It changes one thing only: **how fast you are wiped out when you are wrong**.

P: In Europe, your broker closes your positions automatically when your account falls below a regulatory threshold. That mechanism does not protect you from loss. It protects you from debt. An important distinction.

P: Look at what exactly the same market move — a 1% fall — produces at different levels of leverage, on capital of €1,000.

TABLE: Leverage | Position for €1,000 | Loss if the market falls 1%
×1 | €1,000 | €10, or 1% of capital
×5 | €5,000 | €50, or 5%
×30 | €30,000 | €300, or 30%
×100 | €100,000 | €1,000, or all of it

CASE: The order of magnitude that matters
EUR/USD covers on average **0.5% to 0.7% in an ordinary day**. Not a crash, not a surprise announcement: a dull session.
At ×100 leverage, that dull session is 50% to 70% of your capital.
So you need neither an analytical error nor an exceptional event to disappear. A Tuesday is enough.

ERR: The classic mistake
Picking maximum leverage because it is available. Leverage is not a performance setting you push to the top like the volume on a speaker. It is the **result** of a calculation you will learn in the next module — never a default, never a preference.

KEY: Key points
- Leverage ×30: 1% of market becomes 30% of your capital.
- Leverage does not change how right you are, only how fast you are wiped out.
- You never choose a leverage. You calculate a position size, and the leverage follows from it.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.5', 'What this track will — and will not — teach you', 'HOOK:
In the pages that follow you will find no signals, no winning setup, no indicator said to be secret. So let me tell you straight away what is going to replace all that.

P: Five skills, and every one of them is checkable. Work out what you are risking before you click. Read a bare chart. Write a scenario that a specific price can disprove. Turn down a trade and name the rule that turned it down. Keep a journal and pull a process error out of it.

P: What you will not find: a method that wins, technical indicators, exotic chart patterns, or the slightest opinion on what you should buy. Indicators arrive in the Intermediate track, together with the only thing that makes them useful — a way to test them.

CASE: Look at how the time is split
Of the 70 minutes in this track: **13 minutes** go to reading a chart, and **35 minutes** to risk, decision and behaviour.
That is the exact opposite of the average course, which spends most of its volume on entering a position — that is, on the one moment in the process that has never separated a surviving account from a dead one.

ERR: The classic mistake
Jumping straight to module 3 because "charts are the real trading". The data in chapter 1.3 says otherwise, and it says so across 14,799 people: what separates the survivors from the rest is not the sharpness of their analysis, it is the size of their positions.

KEY: Key points
- No indicators in this track. The bare chart first.
- The order of the modules *is* the content: risk, then reading, then decision.
- Everything happens in simulation. The only capital at stake here is your attention.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, 'EX', 'The cost of starting', 'EXF: Skill assessed
Goals 1 and 2: explain what a price, a spread and a contract against the broker are; calculate the impact of a 1% market move at three levels of leverage.

EXF: Instructions
**Part A.** Six statements are shown to you one at a time. For each: true or false.
**Part B.** Your capital is €1,000. For three levels of leverage, calculate the loss in euros and as a percentage of capital if the market falls 1%.

EXF: What the platform must provide
- A screen with no chart. This exercise must contain no market data at all: it is about mechanisms, not about reading.
- Part A: six true/false cards shown in sequence, no going back, with the correction displayed after each answer.
- Part B: a three-row table (leverage ×5, ×30, ×100) and two numeric input columns — loss in €, loss in %. Validation with a tolerance of ±€1 and ±0.5 points.
- The €1,000 capital is shown at all times in a top bar, and cannot be edited.

EXF: Worked correction
**Part A.** The six statements and their answers:
- *"By buying EUR/USD, I own euros."* — False. You hold a contract against your broker. Tempting because the platform''s vocabulary says "buy".
- *"If the market does not move, I lose nothing."* — False. The spread is taken at entry, the financing charge every night.
- *"The broker wins when I lose."* — False in the general case, and this is the one most often got wrong. The broker is paid for activity: commissions, spread, overnight charges. Your result concerns him only indirectly.
- *"Fees explain most of clients'' losses."* — False: 14.2% according to the AMF. Tempting because it is the most comfortable explanation.
- *"The most experienced clients lose markedly less."* — False. 87.56% losing among clients active four years running.
- *"Leverage improves my chances of being right."* — False. It acts on size alone, never on probability.
**Part B.** Leverage ×5: €50, or 5%. Leverage ×30: €300, or 30%. Leverage ×100: €1,000, or 100%.
The third row is the only one that really counts. Plenty of users compute it correctly and draw exactly the wrong conclusion: "so I just need to not be wrong". No. It means that an **ordinary day** on EUR/USD — no crash, no surprise — is enough to wipe out the account. The question is not how to avoid being wrong. It is how to survive the normal.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.1', 'The only question that matters', 'HOOK:
Two people take exactly the same trade. Same asset, same second, same price. Six months later one has doubled the account and the other has emptied it. They had the same analysis. They did not have the same position size.

P: The beginner asks "where is it going?". That question has no reliable answer: nobody, anywhere, knows. And yet it takes up 95% of the content you will find on the subject.

P: The professional question is a different one: **"how much do I lose if I am wrong?"**. It has an exact answer, known before you click, independent of anything the market does. It is the only thing you genuinely control.

P: You control exactly three variables: the amount you risk, the level at which you give up, and whether you enter or stay out. You control nothing else. Least of all the price: that one does not belong to you.

P: We call **R** the sum you lose if your scenario is wrong. It is your unit of account for the rest of this track.

CASE: Your unit of measurement
Capital: €1,000. Chosen risk: 1% per trade.
1 R = **€10**.
Whether you trade EUR/USD or BTC/USD, whether the leverage is 5 or 30, whether it is your first trade or your hundredth: a trade puts €10 at stake. Not 9, not 40.
It is the one constant in this track. Everything else adjusts around it.

ERR: The classic mistake
Thinking in position size — "I''ll put in €500" — instead of thinking in risk — "I''m risking €10". Those two sentences have nothing to do with each other. A €500 position with a stop 2% away risks only €10. The same position with no stop risks €500. Size tells you nothing about risk.

KEY: Key points
- The question is not "where is it going", but "how much do I lose if I am wrong".
- Your risk is expressed as a percentage of capital, never as a position size.
- 1 R = the loss accepted on one trade. Count in R from now on.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.2', 'The 1% rule', 'HOOK:
Everyone repeats "never risk more than 1%". Almost nobody explains where that figure comes from. It comes out of a multiplication you can do yourself, and it takes two minutes.

P: Starting point: even a sound method strings losses together. That is not an accident, it is arithmetic. With a one-in-two chance of winning, a run of seven consecutive losses comes up roughly once every 128 trades — several times a year for someone who trades regularly.

P: So the question is not "how do I avoid losing runs" — you cannot. It is: **"what size of risk makes a losing run survivable?"**

TABLE: 30,35,35 || Risk per trade | Capital after 10 losses | Cumulative loss
1% | €904 | −9.6%
2% | €817 | −18.3%
5% | €599 | −40.1%
10% | €349 | −65.1%

CASE: The trap in the last row
The 10% row does not merely require you to win back the €651 you lost.
To get back to €1,000 starting from €349, you have to make **+186%**.
The 1% row needs +10.6% to break even. The difference at the start was nine points of risk. The difference at the finish is 176 points of performance to produce.

ERR: The classic mistake
Increasing the risk after a losing run, to "win it back". The arithmetic runs exactly the other way: it is precisely when capital is low that every euro risked weighs most heavily as a percentage. Doubling up after four losses is accelerating just as the road narrows.

KEY: Key points
- A run of seven losses is normal. It tells you nothing about your method.
- At 1% per trade, ten losses cost 9.6% of capital. At 10%, they cost 65%.
- The deeper the loss, the more disproportionate the gain needed to erase it.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.3', 'Calculating a position size', 'HOOK:
This is the one compulsory calculation in the track. Three numbers go in, one number comes out, and that number decides your survival more surely than all the analysis you will do this year.

P: The formula fits on one line:

CARD: The formula
**Position size = (Capital × Risk in %) ÷ Distance to the stop**
The result is a quantity — a number of currency units, a fraction of a bitcoin. Not an amount in euros.

P: You first have to translate the distance to the stop into money. On EUR/USD the unit is the **pip**: the fourth decimal, that is 0.0001. For a position of 10,000 units, 1 pip is worth about $1. On BTC/USD there is no pip: you work directly in dollars per unit of bitcoin.

CASE: Two markets, one calculation
**EUR/USD.** Capital €1,000, risk 1% = €10. Entry at 1.0850, stop at 1.0820: the distance is **30 pips**.
€10 ÷ 30 pips = €0.33 per pip, that is a position of about **3,300 units**.
**BTC/USD.** Capital €1,000, risk 1% = €10. Entry at 62,000, stop at 61,000: the distance is **$1,000**.
€10 ÷ $1,000 = **0.01 BTC**, that is a position of about $620.
Two markets with nothing in common. Same risk: €10.

ERR: The classic mistake
Choosing the size first and the stop afterwards. That is the right order reversed. The beginner decides "I''ll put in €200", places his stop wherever looks reasonable, and discovers his risk after the fact — often after the loss. Size is a **result**, not a decision.

KEY: Key points
- Size = (Capital × Risk) ÷ Distance to the stop. No exceptions, no asset exempt.
- The stop is chosen before the size, never the other way round.
- A wider stop does not increase your risk: it reduces your size.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.4', 'Where to put a stop', 'HOOK:
You put your stop €20 away, because €20 is what you are willing to lose today. The market does not know your budget. It just passed through, and took you out on the way.

P: A **stop-loss** is an automatic order that closes your position at a level set in advance. Its function is not to cap an amount: it is to mark the point beyond which **your scenario is wrong**. If price reaches it, your reason for being in the trade has gone.

P: Two symmetrical errors. The stop that is too tight: you are taken out by the market''s normal breathing, when your idea was good. The stop that is too wide: your scenario died long ago and you are still paying.

P: A useful order of magnitude: on EUR/USD in H1, an ordinary candle covers 15 to 25 pips. A stop placed 5 pips away will be hit by **noise** — movement with no meaning — not by an invalidation.

CASE: Two stops for the same idea
You buy at 1.0850. The last low visible on the chart is at 1.0822.
**Stop at 1.0845 (5 pips).** Hit within the hour by an unremarkable swing. You were right about the direction and you were taken out anyway. Loss: €10.
**Stop at 1.0818 (32 pips, below the low).** Hit only if the market''s structure genuinely breaks. Matching size: €10 ÷ 32 = €0.31 per pip, that is 3,100 units. Loss if hit: €10.
The second stop is six times wider and **no riskier**. Size absorbed the difference.

ERR: The classic mistake
Moving the stop when price approaches it. That single gesture is what turns a €10 loss into a €200 loss. It always justifies itself beautifully in the moment — "the level was badly placed", "it''ll bounce right after". A stop that has been moved is no longer a stop. It is hope with an order''s name.

KEY: Key points
- The stop goes where your scenario becomes wrong, not where your budget runs out.
- Below the last low for a buy, above the last high for a sell.
- A stop is never moved in the direction of the loss. Never.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.5', 'Drawdown', 'HOOK:
Your account does not rise in a straight line, and it does not fall in one either. In between there is a trough. It is in that trough that most people give up, or do something stupid.

P: **Drawdown** is the gap between the highest level your capital has reached and where it stands now, as a percentage. It measures what you endure, not what you produce.

P: Its unpleasant property is asymmetry. Losing 50% does not require making 50% to get back: it requires making 100. Loss and recovery are not symmetrical, and the gap between them widens fast.

TABLE: 50,50 || Drawdown endured | Gain needed to break even
−10% | +11%
−20% | +25%
−33% | +50%
−50% | +100%
−65% | +186%

CASE: What the 1% really buys you
At 1% risk per trade, it takes about **69 consecutive net losses** to reach a −50% drawdown.
At 10% risk per trade, it takes **7**.
Seven. That is the number of losses in a row a sound method produces regularly, as we saw in chapter 2.2. At 10% risk, the normal run becomes a terminal event.

ERR: The classic mistake
Measuring your progress solely by the account balance. Two accounts both showing €1,100 are in no way comparable if the first never went below €980 and the second passed through €400. The second got lucky, and worse: it does not know it. It will credit that result to its method.

KEY: Key points
- Drawdown measures what you endure. The balance measures what you show.
- −50% demands +100% to get back. The asymmetry is the real opponent.
- Set your drawdown limit before you need it, not during.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, 'EX', 'Three positions, one risk', 'EXF: Skill assessed
Goals 5 and 6: calculate a position size from a capital, a 1% risk and a stop distance; place a stop at a level justified by the structure of the chart.

EXF: Instructions
**Part A.** You are given three situations. For each one, calculate the position size that corresponds to 1% risk on capital of €1,000.
**Part B.** You are shown a EUR/USD H1 chart with three proposed stop levels. Choose one, then select the reason for your choice.

EXF: What the platform must provide
- Part A: a calculator with four fields — capital (pre-filled at €1,000, locked), risk in % (pre-filled at 1, locked), entry price, stop price — and a free input field for the size. Validation with a tolerance of ±5%.
- The intermediate calculation (distance in pips or dollars) is displayed automatically as soon as entry and stop are entered. The user must see the distance, not guess it.
- Part B: a bare EUR/USD H1 chart, no indicators, showing about thirty candles with one clearly identifiable low. Three stop levels A, B and C drawn as dotted lines. Single selection, then a three-option multiple choice for the justification.
- No display of the market''s future outcome until the answer has been submitted.

EXF: Worked correction
**Part A.**
- *Case 1 — EUR/USD, entry 1.0850, stop 1.0820.* 30 pips. Size: 3,300 units.
- *Case 2 — EUR/USD, entry 1.0850, stop 1.0790.* 60 pips. Size: 1,650 units. This is the case that counts: the stop doubled, the size was halved, and the risk did not move by a cent. Most users expect the risk to double.
- *Case 3 — BTC/USD, entry 62,000, stop 61,000.* $1,000. Size: 0.01 BTC.
**Part B.** The right answer is the stop placed **below the low**.
Why the other two are tempting: the tight stop allows a much bigger position, which makes the trade more exciting, and it shows a smaller loss figure on screen — two immediate rewards for a bad decision. The very wide stop, for its part, feels safe: you feel "protected from being taken out". In reality it pays for an invalidation that has already happened. In both cases the feeling and the arithmetic point in opposite directions.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.1', 'The candlestick', 'HOOK:
A candlestick does not tell you where price is going. It tells you who won the last battle, and by how much. That is infinitely less seductive, and infinitely more useful.

P: Each candlestick sums up four values and nothing else: the **open**, the **close**, the **high** and the **low** reached during the period. The central rectangle — the body — represents the distance between the open and the close. The lines sticking out of it — the wicks — mark the extremes.

P: The useful reading is in what the wicks say. A wick marks a place price went to and **was pushed back from**. It is a refusal, not a passage. The market tested a level there and failed to settle on it.

P: The body, for its part, measures conviction. A full body means one side held from the beginning of the period to the end. A tiny body framed by two long wicks means the opposite: plenty of movement, no decision.

CASE: One hour of market, read properly
H1 candle on EUR/USD. Open 1.0840 · high 1.0872 · low 1.0836 · close 1.0842.
Price rose **32 pips**, then gave the whole move back to close 2 pips above its open.
Range covered: 36 pips. Net progress: 2 pips.
Reading: the buyers spent a full hour for almost nothing, and they left behind a 30-pip upper wick. That level, 1.0872, has just been refused. It will serve as a marker.

ERR: The classic mistake
Naming the patterns before reading the numbers. The beginner learns "hammer", "doji", "engulfing", then hunts for those shapes on the chart — and finds them, inevitably, because they are everywhere. A single candle predicts nothing: it describes. The productive question is not "which pattern is this?" but "where was price refused?".

KEY: Key points
- Four numbers are enough: open, high, low, close.
- A wick marks a refusal. Price went there and did not stay.
- Describe the candle before you name it. The description is richer than the label.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.2', 'The timeframe', 'HOOK:
The same market, at the same second, can be in an uptrend and a downtrend at once. All it takes is a change of timeframe. That is not the market contradicting itself, it is a question of the scale you observe it at.

P: The **timeframe** is the length of time each candle sums up. In H1 a candle covers one hour; in H4, four hours. The underlying data is rigorously identical: only the level of aggregation changes.

P: What does change is the ratio between signal and noise. The shorter the timeframe, the more movements you watch that will have no consequence at all. You are not seeing more things: you are seeing the same things sliced more finely, and therefore more apparent occasions to act.

P: The working convention adopted in this track gives each timeframe a distinct role. **H4 sets the context** — where the major zones are, what the dominant direction is. **H1 places the execution** — where to enter, where to put the stop. The two do not vote: they answer two different questions.

CASE: The same day, two slicings
**In H1**: 24 candles, average range around 18 pips, roughly ten alternations between up candles and down candles.
**In H4**: 6 candles, average range around 45 pips, most often a single readable direction.
The data is the same to the decimal. The number of moments at which you might feel obliged to act has been divided by four.

ERR: The classic mistake
Dropping to a lower timeframe when you are undecided. The reflex looks reasonable — look closer to see better. The result is mechanical: more candles, more movement, more available justifications for entering. And the AMF study is unambiguous on this point: the more orders a client places, the more he loses.

KEY: Key points
- H4 sets the context, H1 places the execution. Two roles, never two opinions.
- A shorter timeframe adds no information: it adds noise.
- When in doubt, go up a timeframe. Never the other way.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.3', 'Highs, lows and structure', 'HOOK:
Strip everything off the chart. You are left with highs and lows. That is enough to answer the one question that comes before any decision: is this market going somewhere, or round in circles?

P: A **high** is a candle whose top exceeds that of the candles around it. A **low** is its mirror image downwards. These are observable facts, with no room for interpretation.

P: From the way they follow one another come three states, and only three. The **uptrend**: higher highs *and* higher lows. The **downtrend**: lower highs *and* lower lows. And **no trend**, the moment that double condition is not met.

P: That third state deserves particular attention, because it is the most frequent and the most badly handled. No trend is not an in-between phase to be read subtly while waiting for the direction to firm up: it is a state in its own right, and it is where the beginner loses most, precisely because he goes looking for a direction that does not exist yet.

CASE: A structure read with nothing but numbers
Sequence recorded on EUR/USD in H4:
low 1.0790 · high 1.0865 · low 1.0812 · high 1.0898 · low 1.0844.
The lows are rising: 1.0790 < 1.0812 < 1.0844. The highs are rising: 1.0865 < 1.0898.
The double condition is met: **uptrend structure**, unambiguously and without a single tool.
What follows can be read in advance: a next low above 1.0844 confirms the structure; a low below it opens the door to doubt.

ERR: The classic mistake
Forcing the reading. On a chart with no structure you can always find two points that rise — provided you choose which ones carefully. The test is binary and not negotiable: if you have to hesitate over which points to keep, the answer is "no trend". The hesitation is the information.

KEY: Key points
- Three possible states: up, down, none. The third is the most common.
- A trend requires the highs *and* the lows to point the same way.
- If the reading takes an effort of interpretation, there is nothing there to read.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.4', 'Support and resistance zones', 'HOOK:
A line drawn on a chart exerts no power over the market. What does exert power is the fact that thousands of participants are watching the same zone and have left orders in it.

P: A **support** is a zone below price where buyers have already stepped in in the past. A **resistance** is its mirror image above. The important word is *zone*: price does not react to an exact number but to a band a few pips wide, because participants do not all place their orders in the same spot.

P: Three criteria decide a zone''s credibility: how many times price reacted there, how clean the rejection was — that is, how long the wicks left behind are — and how fresh it is. A zone that has not been visited for six months describes a market that no longer exists.

P: One clarification that saves a lot of disappointment: a zone does not stop price. It marks a place where something *may* happen, which has nothing to do with a place where something *will* happen. The difference between those two phrasings is exactly the difference between a marker and a prediction.

CASE: A zone wearing out
EUR/USD in H4, zone between 1.0800 and 1.0812. Price has come down into it three times.
**First visit**: 18-pip lower wick — clean rejection.
**Second visit**: 12-pip wick.
**Third visit**: 4-pip wick.
The zone is still holding, but the reaction weakens with every visit: sellers are meeting less and less opposition there. A zone tested too often eventually gives way, and the shrinking wicks are the leading signal of that wear.

ERR: The classic mistake
Drawing ten zones. A chart covered in lines guarantees there will always be one near price, and therefore always a justification available at the moment the urge to enter turns up. Two zones per timeframe are enough: the nearest above, the nearest below. Past that, you are no longer building a reading, you are manufacturing permissions.

KEY: Key points
- A zone, not a line. A few pips wide, never an exact number.
- Its credibility rests on how many past reactions there were and how clean they were.
- Two zones per timeframe, maximum.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.5', 'Why no indicators', 'HOOK:
You have just read four chapters on reading charts without meeting a single moving average. That is not an oversight, and it is not an ideological stance. It is a question of order.

P: A **technical indicator** is a formula applied to the four numbers you now know how to read. A moving average computes an average of closes; an oscillator compares recent ranges. Neither reaches any data the chart does not already contain. By construction an indicator therefore cannot add information: it removes some, since its job is to summarise.

P: The problem is not the tool, which has its place. The problem is the order in which it arrives. Laid on top of a solid reading, an indicator filters: it removes setups you would have taken wrongly. Laid on top of nothing, it **replaces** the reading with a colour, and turns a hard question into a reassuring binary answer.

P: On top of that comes a documented and systematic effect: piling on tools does not produce better decisions, it produces better justifications. With enough indicators on screen, there is always one that approves of what you already wanted to do.

CASE: The arithmetic of justification
Take three indicators, each in one of two possible states — in favour of buying or of selling. That produces **eight combinations**.
Exactly one is full agreement to buy. Exactly one is full agreement to sell. The **other six** are disagreements.
In other words, in 75% of cases the tooling does not settle anything. In practice, the trader who wants to buy keeps the two indicators that agree with him and describes the third as "lagging".
The three tools settled nothing. They supplied the raw material for the justification.

ERR: The classic mistake
Hunting for the combination of indicators and settings that would have read the last six months correctly. That combination always exists — on any given history you are bound to find one in the end — and it almost never survives the following month. The Intermediate track comes back to this question with the only thing that makes it serious: a way to test instead of hope.

KEY: Key points
- An indicator creates no information: it summarises, so it loses some.
- The bare chart first. Tools afterwards, on a reading that already stands up.
- More tools means more available justifications, not more accuracy.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, 'EX', 'Cold reading', 'EXF: Skill assessed
Goals 3, 4 and 7: read a candlestick, justify the choice of a timeframe, identify a structure and two zones on a bare chart.

EXF: Instructions
You are shown a EUR/USD chart in H4, with no tools at all.
**1.** Name the structure — up, down, or none — and place the two points that justify your answer.
**2.** Draw the nearest zone above price, and the nearest one below.
**3.** Answer this: in H1, would you see the same thing?

EXF: What the platform must provide
- A bare 60-candle H4 chart on EUR/USD, showing a readable uptrend structure with a pullback on the right-hand side. No indicators, no pre-existing annotations.
- A "mark a point" tool limited to two uses, and a "draw a zone" tool limited to two uses, with adjustable width. Those limits are deliberate and are part of the teaching: the tool must refuse the third zone.
- An H1 / H4 toggle **locked** until questions 1 and 2 have been submitted. The user must not be able to go looking in H1 for confirmation of what he could not read in H4.
- A three-option multiple choice for question 3.

EXF: Worked correction
**Question 1.** Uptrend structure. The two expected points are the **last two lows**, not the highs.
This is the central teaching point of the exercise: most users mark the highs, because the highs are what the eye notices. But an uptrend does not break at its highs, it breaks at its lows — and that is exactly where the stop calculated in module 2 will go. Marking the highs means looking at the part of the chart that enters into no decision at all.
**Question 2.** One zone above, one below, with a tolerance of ±10 pips. Any attempt to draw a third is refused by the tool, with no error message beyond the limit already shown.
**Question 3.** In H1 the right-hand part of the chart looks neutral, even bearish. That is the intended trap, and the right answer is not "H1 is wrong". The right answer is: **H1 does not answer that question**. A pullback inside an uptrend always looks like a downtrend when you look at it too closely. The two timeframes are not in disagreement: they were not asked about the same thing.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.1', 'Scenario, invalidation, target', 'HOOK:
"I think it''s going up" is not a scenario. It is an opinion — and an opinion cannot be wrong, it can only be disappointed. The difference is not rhetorical: it decides what you will do two hours from now.

P: A usable scenario has three elements, all of them written down **before** you enter. What you expect, stated in terms of price and not of intention. The level that will prove you were wrong, called the **invalidation**. The level where you take your profit, called the target.

P: What separates a scenario from an opinion is falsifiability: there must be a specific price whose being reached means "I was wrong". Without that price you have written nothing usable, and you will discover your position is losing without ever being able to say when it stopped being valid.

P: The practical consequence is a chain, and the order of its links is not negotiable. The invalidation determines the stop. The stop determines the size — that is the formula from module 2. The target determines the ratio in the next chapter. Everything follows from three lines written in cold blood.

CASE: A complete scenario, from the first number to the last
EUR/USD in H4, uptrend structure, last low at 1.0844. Current price: 1.0868.
**Scenario**: price comes back into the 1.0844–1.0850 zone and sets off again towards the last high, 1.0898.
**Invalidation**: an H4 close below 1.0838, that is, below the low holding the structure up.
**Entry**: 1.0852. **Target**: 1.0895.
Risk: 14 pips. Gain sought: 43 pips.
Size for 1% on €1,000: €10 ÷ 14 = €0.71 per pip, that is about **7,100 units**.
Not one of these numbers was chosen for comfort. Each follows from the one before.

ERR: The classic mistake
Writing the target first. The beginner decides how much he wants to make, then looks for the entry that would make that gain possible. The correct order starts from the invalidation, the only element the market supplies — the other two come from you, and one of them comes mostly from what you want.

KEY: Key points
- Three lines written before entry: expectation, invalidation, target.
- A scenario no price can contradict is not a scenario.
- The invalidation comes from the chart. The target is deduced from it. Never the reverse.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.2', 'Reward-to-risk and the break-even hit rate', 'HOOK:
Being right often is not enough. You can win seven trades out of ten and end the year down. Two minutes of arithmetic are enough to see why — and to stop ever judging a method by its hit rate.

P: The **reward-to-risk ratio**, written R/R, compares the gain sought to the risk accepted. A trade risking €10 to aim for €30 is a 3R trade. It is a figure known before entry, unlike the outcome.

P: From that ratio comes a far more interesting value: the minimum hit rate below which you lose money. The formula is short.

CARD: The break-even hit rate
**Minimum hit rate = 1 ÷ (1 + R/R)**
Below that rate a method loses. Above it, it wins. The calculation is done before entering, not after a hundred trades.

TABLE: 40,60 || Reward-to-risk ratio | Hit rate needed to break even
1R | 50%
1.5R | 40%
2R | 33%
3R | 25%
5R | 17%

CASE: What the table really means
At **3R** you can be wrong three times out of four and still break even. That is a considerable margin for error, and it is handed to you by the structure of the trade, not by your insight.
At **0.5R** you need a 67% hit rate — a level almost nobody sustains over time.
And these thresholds are **gross**: they ignore the spread and the overnight charges from module 1. Once those costs are folded in, a trade that breaks even in theory is a losing trade in fact.

ERR: The classic mistake
Aiming small to "lock it in". Systematically taking 5 pips of profit while risking 20 produces a long run of winning trades and an account that goes down. The feeling is excellent — you are right almost every time — and the statement is bad. It is the most comfortable trap in the business, because nothing in the lived experience flags the error.

KEY: Key points
- Minimum hit rate = 1 ÷ (1 + R/R). Work it out before you enter.
- Below 1.5R, costs eat the edge.
- A high hit rate with a low R/R is a slow way to lose.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.3', 'Expectancy', 'HOOK:
Someone who is right 40% of the time can make money every year. Someone who is right 70% of the time can go broke. The difference lies in a multiplication you can do in thirty seconds.

P: **Expectancy** is the average result a trade produces, winners and losers taken together. It brings together the two variables beginners look at separately: how often the gains come and how big they are.

CARD: The formula
**Expectancy = (hit rate × average gain) − (miss rate × average loss)**
Expressed in R, it gives you directly what a trade returns on average. It is the only figure that describes a whole system.

CASE: Two profiles, two opposite conclusions
**Profile A** — 40% hit rate, average gain 3R, average loss 1R.
(0.40 × 3) − (0.60 × 1) = 1.20 − 0.60 = **+0.60 R per trade**.
**Profile B** — 70% hit rate, average gain 0.4R, average loss 1R.
(0.70 × 0.4) − (0.30 × 1) = 0.28 − 0.30 = **−0.02 R per trade**.
Over 200 trades: A is wrong 120 times and makes about 120 R. B is right 140 times and loses, before the spread is even counted.
The profile that feels better day to day is the one that empties the account.

ERR: The classic mistake
Judging a method by its hit rate. It is the most visible figure, the easiest to tell a story about, and the least informative of them all. On its own it says strictly nothing: it only means something alongside the average R.

KEY: Key points
- Expectancy = (hit rate × average gain) − (miss rate × average loss), in R.
- A small positive expectancy repeated beats a brilliant, rare method.
- Never judge a system on its hit rate alone.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.4', 'The pre-order checklist', 'HOOK:
The moment you are least able to judge is exactly the moment your finger is on the button. The checklist exists so that the decision is already made when that moment arrives.

P: Its job is not to improve your trades: it is to remove the ones you take on reflex. It moves the decision out of an emotionally loaded instant and into a cold one, where the criteria were set with nothing at stake.

UL:
- Is the structure readable in H4? If the answer is "no trend", I do not enter.
- Where is my invalidation, in price?
- What size does that stop impose for a 1% risk?
- What is the reward-to-risk ratio? Below 1.5, I do not enter.
- Does this trade look like my previous trades, or is it an exception?
- How many trades have I already taken today?

P: The rule of use is brutal, and that is what makes it work: **a single missing answer cancels the trade**. No weighting, no trading one criterion off against another, no "almost".

CASE: A good trade turned down
Assessment of a real setup, question by question.
H4 structure readable: **yes**, up. Invalidation: **yes**, 1.0838. Size for 1%: **yes**, 7,100 units. Reward-to-risk: **yes**, 43 ÷ 14 = 3.1. Consistent with previous trades: **yes**.
Trades already taken today: **4**, against a limit set at 3. **No.**
Result: **trade refused**.
That trade might well have won. The rule does not exist to optimise this one: it exists to remove the thirty trades of the same kind that will follow, most of which will be worth nothing.

ERR: The classic mistake
Adapting the checklist to the trade. As soon as an answer is missing, the temptation is to reword the question rather than give up. A checklist modified during a session no longer filters anything: it merely records what you had decided to do.

KEY: Key points
- Six questions, all compulsory. One missing answer cancels the trade.
- It is filled in before the click, not during.
- It is only ever modified outside market hours.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.5', 'The trade you do not take', 'HOOK:
The AMF study measured a disarmingly simple relationship across 14,799 clients: the more orders they placed, the more they lost. No threshold, no exception, no category spared. A straight line.

P: Not entering is a decision, not the absence of one. It costs nothing and has a measurable value: it avoids the negative expectancy of average setups, which make up the overwhelming majority of what you will see.

P: Selectivity is therefore a performance variable in exactly the same way as R/R. Out of twenty or so setups spotted in a week, three or four genuinely pass the checklist. The other sixteen are not missed opportunities: they are low-expectancy trades you were lucky enough not to take.

P: What remains is the real obstacle, and it is not technical. A session with no trade feels like a session where you did nothing. That is a complete illusion: selectivity *is* the work, and it is in fact the hardest part to hold to.

CASE: Two weeks, same method, same person
**Week 1** — 4 trades, all compliant: +2R, −1R, +3R, −1R. Result: **+3R**.
**Week 2** — 14 trades, 10 of them taken out of boredom. The 4 compliant ones produce the same +3R. The other 10 return an average of −0.2R each, that is −2R, plus the spread on ten round trips.
Result: **+1R at best**.
The ten extra trades cost two thirds of the week''s performance. They also took up most of the time spent in front of the screen.

ERR: The classic mistake
Measuring your day by the number of trades taken. Nobody feels productive after four hours of watching without a single order. And yet that is very often the most profitable session of the week — and the only one that leaves no trace in the statement.

KEY: Key points
- Not entering is a decision, and it is recorded like any other.
- Three to four compliant setups a week, not fourteen.
- A session with no trade is not a wasted session.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, 'EX', 'The plan before the click', 'EXF: Skill assessed
Goals 8, 9 and 10: calculate a reward-to-risk ratio, write a complete trade plan, turn down a trade by naming the rule that turns it down.

EXF: Instructions
You are shown a EUR/USD chart in H4 and in H1.
**1.** Fill in the trade plan: scenario, entry, invalidation, target.
**2.** Check the reward-to-risk ratio calculated automatically.
**3.** Go through the six-point checklist, then make your final decision.

EXF: What the platform must provide
- A split screen, H4 on top and H1 below, on the same asset over the same period.
- A four-field form: scenario as free text (200 characters), then entry, invalidation and target — those last three typed in or set by clicking directly on the chart.
- A live display of position size and R/R as soon as the three prices are filled in. The user must see the R/R change while he moves his target: that is the best way to make chapter 4.2 stick.
- The six checklist items as tick boxes, with a "trades taken today" counter **preset to 3** and not editable.
- A final decision button with two outcomes: "I take it" / "I don''t take it".

EXF: Worked correction
The expected R/R is at least 1.5 and the size must correspond to 1% risk on €1,000. Both are checked automatically and are not where the difficulty lies.
The difficulty is elsewhere, and it is deliberate. The counter stands at 3, so the sixth checklist question fails, so **the trade must be refused** — even though the other five answers are excellent, and they are.
Most users validate it anyway. Not out of carelessness, but because the trade is objectively good and the rule feels incidental at that particular moment. That is exactly the situation the rule exists to cover: it is of no use at all against bad trades, which you would discard anyway. It is only of use against the beautiful ones.
A good trade plan that is turned down is still a good trade plan. It goes into the journal marked "not taken", and it counts in your statistics in module 6.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.1', 'The disposition effect', 'HOOK:
You close a €12 gain with relief. You let a €40 loss run, telling yourself it will come back. That behaviour has a name, it has been measured across ten thousand accounts, and it applies to you — the question is not whether you will escape it, but which rule you will set against it.

P: The **disposition effect** is the tendency to realise your gains too early and to put off realising your losses. Terrance Odean established it in 1998 across ten thousand brokerage accounts: in comparable situations, investors sell their winning positions one and a half to two times more often than their losing ones.

P: The mechanism is asymmetrical and perfectly understandable. An open winning position is a permanent source of worry; closing it converts an unpleasant uncertainty into a pleasant certainty. An open losing position, on the other hand, is a loss "on paper" — closing it makes it final, and above all, makes it true.

P: The effect produced is mechanical: average gains systematically smaller than average losses. In other words a structural deterioration of the reward-to-risk ratio, independent of the quality of the analysis. Module 4 showed that a degraded R/R is enough to make a sound method lose. That is exactly what happens here.

CASE: A profitable method, made losing by its execution
Twenty trades, sound method, stop at 1R and target at 3R, 40% hit rate.
**Compliant execution**: 8 gains at 3R, 12 losses at 1R, that is 24 − 12 = **+12 R**.
**Execution with the disposition effect**: gains are cut at an average of 1.2R, and two losses are allowed to run to 2.5R.
8 × 1.2 = 9.6 R. Losses: 10 × 1 + 2 × 2.5 = 15 R. Result: **−5.4 R**.
The method has not changed one iota. The analysis was identical. Only the execution moved, and it turned +12 R into −5.4 R.

ERR: The classic mistake
Calling it prudence. "I''m locking in my gains" is the presentable name for a behaviour that, once measured, destroys expectancy. Prudence has every place in trading — it is exercised in the position size, decided before entry. Not in an early exit, decided under pressure.

KEY: Key points
- You will cut your gains and let your losses run. That is documented, not hypothetical.
- The disposition effect degrades the R/R without ever touching the analysis.
- The only reliable countermeasure: target and stop fixed before entry, not renegotiated afterwards.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.2', 'Overtrading and overconfidence', 'HOOK:
Across 14,799 French clients, those who placed the most orders lost the most. Across 66,465 American households, the most active underperformed the market by more than six points a year. Two samples, two continents, two decades apart, the same straight line.

P: Barber and Odean examined the accounts of 66,465 American households between 1991 and 1996. The average household returns 16.4% a year; the most active quintile, 11.4%; the market, 17.9%. The gap is not explained by poor stock picking: it is explained by the **volume of activity itself**.

P: The explanation the authors settle on is overconfidence. Everyone overestimates the quality of their information and underestimates the part luck played in their successes — which leads to acting more often than the information actually held would justify.

P: On top of that comes a self-reinforcing mechanism that is particularly hard to defuse. A gain is credited to skill; a loss, to circumstances. The sample of memories is therefore biased in one direction only, and confidence keeps rising even as the account statement falls. The two curves cross without ever meeting.

CASE: The AMF''s three measures all point the same way
Across the 14,799 clients tracked for four years:
Those who placed **at least 250 orders** make up 52% of the population studied and lose an average of **€18,741**.
Those whose **average order size exceeds €10,000** make up 62% of the population and lose an average of **€14,876**.
Number of orders, average size, cumulative volume: all three measures give the same result, and no sub-population escapes it.

ERR: The classic mistake
Reading a good run as a step up in level. That is the precise moment position sizes increase, "since it''s working". Statistically, that increase comes in just before the return to the mean — that is, at the worst possible moment, and for a reason that seems excellent.

KEY: Key points
- Activity itself is correlated with loss. The number of orders is a risk variable.
- A good run is not proof of skill: it is a short sample.
- Set your size and your number of trades outside the session, when nothing is at stake.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.3', 'The spiral after a loss', 'HOOK:
The €10 loss did nothing to you. What did something to you was realising you had been wrong. The twenty minutes that follow are, statistically, the most expensive of your day.

P: The sequence is stereotyped and unfolds in four beats. The loss. The need for immediate repair. The entry outside the checklist, on a setup that would not have passed the filter an hour earlier. And the increase in size, meant to "make it back in a single trade".

P: Each step is individually defensible. It is the chain that empties an account, and it is all the harder to break because every link looks reasonable taken on its own.

P: The tipping point is identifiable and it is **linguistic**. As long as you think "−1 R", you are inside the system: the loss has a unit, a place in a series, a statistical meaning. The moment you think "−€10, I need €10", you have left the system and you are chasing a sum. The change of unit always comes before the change of behaviour.

CASE: Forty minutes
**Trade 1**, compliant, planned: **−1 R**.
**Trade 2**, six minutes later, outside the checklist, size doubled to catch up: **−2 R**.
**Trade 3**, fifteen minutes after that, size quadrupled: **−4 R**.
Total: **−7 R**, that is seven normal working sessions wiped out in forty minutes.
The only one of the three that was part of the plan is the one that cost the least.

ERR: The classic mistake
Believing you will recognise that state at the moment it happens. You do not recognise it — that is the very definition of the state. So the countermeasure cannot take the form of a decision made during. It has to be a mechanical rule, set beforehand, that applies without your having to judge whether it is appropriate at the time.

KEY: Key points
- After a loss the countermeasure is a delay, not an act of will: no orders for thirty minutes.
- Two losses in the session: the session is over. No exceptions, no assessment.
- If you are counting in euros rather than in R, you have already stopped trading.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.4', 'Rules that hold', 'HOOK:
Every rule in this module shares one property: it is written when the market is closed and applied without judgement when it is open. A rule that requires an assessment at the moment it applies is not a rule — it is an intention.

P: The principle is easy to state and hard to hold to: move the decision outside the emotional state that distorts it. The rules that survive contact with use share three properties — they are **numerical**, **checkable without interpretation**, and **set in advance**.

UL:
- Fixed risk of 1% per trade, never adjusted mid-session.
- Three trades maximum per session.
- Two losses: the session is over.
- Thirty minutes'' wait after any loss.
- No order without all six answers on the checklist.
- Target and stop not renegotiable once the position is open.
- Drawdown of 10% on the month: full stop and review of the journal.

P: These seven rules are not a method. They make no claim to generate a profit. Their function is more modest and more decisive: to let a method, whatever it is, be tested on a large enough sample before the account disappears.

CASE: What the absence of the seventh rule costs
Capital €1,000, risk 1%, three trades per session, stop at two losses. The maximum loss in a session is therefore 2%.
**Without a monthly rule**: twenty consecutive losing sessions bring capital down to €667, a drawdown of **−33%**.
**With the 10% rule**: the stop triggers on the sixth losing session, drawdown contained at around **−11%**.
Same method, same run of bad luck, same risk per trade. The only difference is one line written on a Sunday evening.

ERR: The classic mistake
Writing the rules without writing what happens when you break them. A rule with no consequence attached is a wish. The consequence does not have to be punitive — recording the breach in the journal is quite enough, provided it is systematic and the count is read back at the end of the month.

KEY: Key points
- A useful rule is numerical, checkable, and written with the market closed.
- Seven rules are enough. Beyond that, none of them is genuinely applied.
- Attach a written consequence to every rule, however small.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, 'EX', 'Four situations, one rule', 'EXF: Skill assessed
Goals 10 and 12: turn down a trade by naming the rule that turns it down; recognise a documented bias in a concrete situation.

EXF: Instructions
Four situations are shown to you one after the other. For each: **I take it** or **I don''t take it**, then select from the list the rule that justifies your decision.

EXF: What the platform must provide
- Four sequential cards, with no going back. Not being able to go back is part of the exercise: it reproduces the real condition.
- Each card carries a small static H1 chart and a status bar permanently showing: capital, number of trades taken today, result of the current session, minutes elapsed since the last trade.
- Two decision buttons, then a drop-down list containing the module''s seven rules. The rule must be chosen **after** the decision, never before.
- No indication of what the market did next. This exercise assesses a decision, not an outcome.

EXF: Worked correction
- **Situation 1** — compliant setup, no trades taken, session flat. Answer: *I take it*. Rule cited: complete checklist. It is the only one of the four where entering is correct.
- **Situation 2** — compliant setup, two losses already taken in the session. Answer: *I don''t take it*. Rule: two losses, session over. The setup offered is objectively the best of the four, and that is entirely deliberate: a rule that does not hold up against a beautiful setup is useless, since that is the only moment it is ever tested.
- **Situation 3** — average setup, reward-to-risk at 1.2, no trades taken. Answer: *I don''t take it*. Rule: minimum ratio of 1.5. The trap here is the absence of any other obstacle: nothing in the status bar stands in the way of the trade, and you have to go looking for the single figure that disqualifies it.
- **Situation 4** — compliant setup, last trade lost eight minutes ago. Answer: *I don''t take it*. Rule: thirty minutes'' wait. Nothing rules this trade out on its merits; only the delay blocks it. It is the situation users validate most often, and it is precisely the second step in the sequence described in chapter 5.3.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.1', 'The trading journal', 'HOOK:
The AMF isolated 1,881 clients active four years running. Their loss rate did not fall: 87.56%. Experience on its own teaches nothing — that is measured. What teaches is the written record you keep of it.

P: Memory is not enough, and for a precise reason: it is reconstructed. You remember the conclusion, not the decision — and the conclusion retrospectively contaminates the memory of the decision. A winning trade becomes a good idea; a losing trade, a mistake. In both cases the reconstruction erases the useful information.

P: The account statement is no better: it gives the results, never the reasons. Seven fields, on the other hand, are enough — provided you fill them in at the right moment.

UL:
- Date and time of entry.
- Asset and timeframe.
- Scenario in one sentence, **written before entry**.
- Invalidation and target, in price.
- Position size and risk in R.
- Result in R, never in euros.
- Compliance: did the trade respect the six checklist questions? Yes or no.

P: The seventh field is the only one that produces learning. The first six describe; that one judges the process, independently of what the market did. It is also the easiest to skip, precisely because it is the only one that can tell you that you were wrong when you won.

CASE: A complete entry
*12/03, 2:20 p.m. · EUR/USD H1 · Pullback into the 1.0850–1.0844 zone in an H4 uptrend, resumption expected towards 1.0898 · Invalidation 1.0838, target 1.0895 · 7,100 units, 1 R = €10 · Result: −1 R · Compliant: yes.*
This trade is **losing and compliant**. It calls for no correction, no soul-searching, no adjustment of method.
That is the distinction the next chapter develops, and it is the hardest to accept in the whole track.

ERR: The classic mistake
Recording results in euros. "−€40" compares to nothing: not to your other trades, whose risk varied, nor to your capital six months ago, which was not the same. "−1 R" compares to everything. A journal in euros produces emotion; a journal in R produces statistics.

KEY: Key points
- Seven fields, only one of which is about the process. That is the one that counts.
- The scenario is written before entry, otherwise it is rewritten by the result.
- Everything is recorded in R. Never in euros.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.2', 'Decision and outcome', 'HOOK:
Four trades, four outcomes. Two deserve a correction, two deserve none — and they are not the two losers.

P: Crossing the compliance of the decision with the nature of the outcome produces four cases, two of which are counter-intuitive. It is this grid, and not the account balance, that tells you what to work on next month.

TABLE: 34,33,33 || | Winning outcome | Losing outcome
**Compliant decision** | Nothing to do. Repeat. | Nothing to correct. It is the normal cost of the activity.
**Non-compliant decision** | The dangerous case: the outcome rewards the breach. | The easy case: the pain and the error coincide.

P: The worst-handled cell is "compliant and losing". It represents the majority of your trades — a system with a 40% hit rate produces six out of ten — and it is the one everybody sets about correcting, because it hurts.

P: The most expensive cell is "non-compliant and winning". Nothing flags the error: the account rises, the feeling is good, and the behaviour settles into habit. Judging a decision by its outcome is called *resulting*. On a short sample, the outcome is mostly noise.

CASE: A month of forty trades
**Thirty compliant trades**: 12 winners at +3R, 18 losers at −1R, that is 36 − 18 = **+18 R**.
**Ten non-compliant trades**: 4 winners at +1.5R, 6 losers at −2.2R — the stops having been moved. That is 6 − 13.2 = **−7.2 R**.
Month''s total: **+10.8 R**.
The ten out-of-framework trades removed 40% of the performance. And the four winners among them are exactly why they will be repeated next month.

ERR: The classic mistake
Revising your method after a run of compliant losses. It is the most frequent and most destructive reaction there is: it replaces a system with positive expectancy by an untested one, at the precise moment the first was passing through its normal variance. Two months later the same thing starts again with the new one.

KEY: Key points
- Compliant and losing: no correction. It is the cost of the activity.
- Non-compliant and winning: deal with it first, despite the outcome.
- Never change method on the basis of a short run.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.3', 'Reading your own statistics', 'HOOK:
After thirty trades, your journal holds more information about you than any course. You just have to know which three numbers to pull out of it, and in what order to read them.

P: Three numbers, and not one more.

UL:
- **The compliance rate** — compliant trades divided by total trades. The only measure you control entirely, and therefore the first to fix. Aim for above 90%.
- **The average R per trade** — the expectancy from module 4, calculated exclusively on compliant trades. It measures your method, provided it is computed on trades that actually applied it.
- **The longest losing run** — to be compared with your drawdown limit. If it comes close, the method is not what is at fault: your risk per trade is too high for it.

P: The order of reading is not negotiable, and it follows from the first point: as long as compliance is low, the average R does not measure your method, it measures your indiscipline. Below **30 compliant trades**, none of the three values can be interpreted — it is the limit beginners ignore most systematically.

CASE: A statement of forty-five trades
Compliance: 31 / 45 = **69%**.
Average R across all 45 trades: **+0.05 R** — that is, near enough nothing.
Average R across the 31 compliant trades: **+0.52 R**.
Longest losing run: 6.
Reading: the method has a clearly positive expectancy, and fourteen out-of-framework trades brought it back to zero. So next month''s work is not about the method — it works. It is entirely about the fourteen.

ERR: The classic mistake
Calculating your statistics across all trades. Mixing compliant and non-compliant produces an average that describes no existing system: neither the one you designed, nor the one you applied. You then conclude that "the method doesn''t work", when it has never actually been tested.

KEY: Key points
- Three measures: compliance, average R on compliant trades, longest losing run.
- Nothing can be interpreted below 30 compliant trades.
- Fix compliance before touching the method.', 32);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.4', 'Deliberate practice', 'HOOK:
Repeating a thousand trades teaches nothing: that is measured, over four years in France and over three years of cohorts in Brazil. What teaches is repetition with immediate correction and a narrow objective. The difference between the two lies in the organisation, not in talent.

P: **Deliberate practice** means repeating a specific task, sitting at the edge of your current competence, with immediate feedback on the execution rather than the outcome. It is the only training regime whose effectiveness is established in complex disciplines.

P: Applied to trading, that definition rules out two extremely widespread practices: trading "to see", and working on several skills at once. In both cases the feedback becomes unusable, since you no longer know what it is assessing.

UL:
- One skill per session — spotting lows, *or* calculating a size, never both.
- Twenty repetitions minimum on replayed historical data.
- Correction after each repetition, never at the end of the session.
- No scorekeeping in euros during training.
- One written note at the end of the session: what was difficult, in a sentence.

P: The simulator is what makes that structure possible. It compresses into an hour a sample of situations that would take months to occur in real time — and it allows error, which no real account does.

CASE: Two ways to spend ten hours
**Option A** — ten hours of simulated trading, all skills mixed together. About **25 decisions**, each judged on its outcome, none isolated.
**Option B** — ten one-hour sessions, one skill per session. About **200 repetitions**, each corrected immediately.
The same time invested. Eight times as many repetitions, and feedback that bears on the execution rather than on luck.
That is the difference between playing and training.

ERR: The classic mistake
Confusing screen time with training. Watching a market for four hours with no defined task produces no measurable learning, however serious the observer. Duration is not the variable that counts: the density of corrections is.

KEY: Key points
- One skill per session, twenty repetitions minimum, immediate correction.
- The simulator is there to concentrate repetitions, not to simulate profits.
- Screen time and training are not the same thing.', 33);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.5', 'After this track', 'HOOK:
You now know how to calculate a risk, read a structure and turn down a trade. You are missing the one thing no text can ever give you: a sample.

P: **Step 1 — thirty compliant trades in simulation, with no profit objective.** The only figure tracked is the compliance rate. The result does not matter at this stage, and looking at it would be actively counterproductive.

P: **Step 2 — measure the average R across those thirty compliant trades.** If it is negative, the method gets revised. If it is positive, the sample extends to a hundred trades before any conclusion, because thirty is not enough to tell a method from a lucky run.

P: **Step 3 — the Intermediate track**, which introduces technical indicators together with the only thing that makes them usable: a way to test them. The question left open in chapter 3.5 finds its answer there.

P: And what this track has deliberately not covered, so that you know what is left to look for elsewhere: choosing a broker, taxation, the conditions for any move to real money, and every product other than currency pairs and spot cryptocurrencies.

CASE: The calendar, with no favourable rounding
At three compliant trades a week — the pace the selectivity of module 4 imposes — thirty trades take about **ten weeks**. A hundred trades take **thirty-three**.
Any promise of competence in thirty days is in direct contradiction with that division. This is not a moral position on how serious courses are: it is the result of 30 ÷ 3.

ERR: The classic mistake
Going live as soon as the simulation becomes profitable. Profitability observed over thirty trades is mostly noise. And execution with real money brings the whole of module 5 back at a stroke — disposition effect, overtrading, the spiral after a loss — which has strictly nothing to do with the quality of your analysis.

KEY: Key points
- Thirty compliant trades before any conclusion, a hundred before any confidence.
- The only figure to track at the start is the compliance rate.
- Ten weeks minimum. The calculation is arithmetic, not moral.', 34);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, 'EX', 'The trade you will not correct', 'EXF: Skill assessed
Goals 11 and 12: record a trade and pull a process error out of it, distinct from a bad outcome.

EXF: Instructions
You are shown four trades that have already been executed, with their chart and their result.
**1.** Complete the missing journal fields for each one.
**2.** Place each trade in the compliance / outcome grid.
**3.** Name the one trade that requires a correction, and write that correction in a single sentence.

EXF: What the platform must provide
- Four short replays of 30 H1 candles, with the entry, stop, target and actual exit drawn on the chart.
- A seven-field journal form, five of them pre-filled and read-only. Two fields remain to be entered: compliance (yes / no) and the result in R.
- A 2 × 2 drag-and-drop grid for the classification.
- A 150-character text field for the correction, and only one — part of the exercise is naming only one.

EXF: Worked correction
- **Trade A** — compliant, losing, −1 R. No correction. This is the trade the vast majority of users want to correct, and it is the heart of the exercise: nothing failed. The stop worked exactly as intended, the scenario was contradicted by the market, the process was intact.
- **Trade B** — compliant, winning, +3 R. No correction. Easy.
- **Trade C** — non-compliant, stop moved after entry, losing, −2.4 R. Everyone finds this one: the fault and the pain coincide.
- **Trade D** — non-compliant, fourth trade of the day when the limit is three, **winning, +2 R**. This is the only right answer to the third question.
The result is positive, so nothing flags the error: not the balance, not the feeling, not the chart. That is exactly why it will be repeated — and why it will eventually land on an unfavourable run. The expected correction is about the rule that was broken, never about the result obtained.
If you named trade C, you found a real error, but an already obvious one. If you named trade D, you have just used the journal for what it is for.', 35);

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.1', 'Thirty trades, and what they do not say', 'HOOK:
You have thirty compliant trades and a positive average R. The Beginner track asked you to wait for this moment before concluding anything. It lied to you by omission: thirty trades conclude nothing. They only entitle you to start looking.

P: The reason lies in an asymmetry between the two figures you track. The **compliance rate** depends on you alone: thirty observations are more than enough to know whether you apply your rules. The **average R** depends on the market, and the market is noisy. Over thirty trades it produces a number, not a measurement.

P: That is exactly why chapter 6.3 of the Beginner track made you fix compliance first. It was not a matter of moral discipline: it was the only one of the two quantities a small sample lets you measure.

P: The tool that separates them is called the **standard error**: the uncertainty left on an average, given the number of observations. It equals the standard deviation of the results divided by the square root of the number of trades.

CASE: Your average R, with its margin
On a series with 1R losses and 3R gains, the standard deviation of results is about **1.9 R**. That is the figure to remember; it is used throughout this track.
**Over 30 trades**: standard error = 1.9 ÷ √30 = **0.35 R**. For a displayed average R of +0.52 R, the interval at two standard errors runs from **−0.18 to +1.22 R**. It contains zero. Your system could be losing.
**Over 100 trades**: standard error = 1.9 ÷ √100 = **0.19 R**. The same +0.52 R gives an interval of **+0.14 to +0.90 R**. The sign is finally established.
The displayed figure has not moved. What has changed is what you are entitled to say about it.

ERR: The classic mistake
Announcing your average R as a fact. Thirty trades give an exact number — that is indeed what happened — and a false measurement — that is not what will happen. Both statements are true at once, and mistaking the first for the second is the founding error of this level.

KEY: Key points
- Thirty trades measure your compliance, not your expectancy.
- Standard error = standard deviation ÷ square root of n. Quadrupling the sample halves the uncertainty.
- As long as your interval contains zero, you have demonstrated nothing.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.2', 'Run or signal', 'HOOK:
Six losses in a row. You change something. That is where most people destroy a system that was working — and the arithmetic says they were wrong to move.

P: Chapter 6.2 of the Beginner track asked you not to change method on a short run. It asked in the name of common sense. You can now check it instead of believing it.

P: The principle: before you attach meaning to a pattern, ask how many chances that pattern had to occur. A run of six losses is spectacular when it happens to you. It is unremarkable once you count the number of places it could have started.

P: The exact calculation is tedious; an approximation is quite enough for what we do with it here, and it gives the right order of magnitude.

CASE: What variance produces on its own
A system with a 40% hit rate, so 60% losses. Over a sequence of 100 trades:
Probability that a run of **at least 6 consecutive losses** appears somewhere: about **84%**.
Probability for a run of **at least 8**: about **47%**.
In other words: a run of six is near enough guaranteed over a hundred trades, and a run of eight is a coin flip. These are not accidents. They are the patterns a perfectly healthy system produces.
*(Poisson approximation on the expected number of runs. The order of magnitude is reliable, the decimal is not.)*

ERR: The classic mistake
Looking for an explanation for a run. The brain is excellent at finding causes, and it will find them: a change in volatility, some news, a lapse in attention. Those explanations are plausible, free, and usually wrong. The only valid test is the number of chances.

KEY: Key points
- A run of six losses over a hundred trades is expected in more than eight cases out of ten.
- Before interpreting a pattern, count how many chances it had to occur.
- The warning sign is never a run: it is a gap that persists across a whole subsample.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.3', 'Segmenting your journal', 'HOOK:
Your overall average R is a blend. It adds your buys to your sells, your two assets, your mornings and your evenings. Separating that blend once teaches you more than three months of extra trades.

P: **Segmentation** means cutting your sample by a single criterion and comparing the subsamples you get. The useful criteria at this level are few: the direction of the position, the asset, the time of day, the market regime, compliance.

P: One constraint governs the whole exercise: **one criterion at a time**. Two crossed criteria over sixty trades produce cells of fifteen, where chapter 1.1 showed you the uncertainty far exceeds the effect you are looking for.

P: And a gap between two subsamples is not compared to zero. It is compared to the standard error of the difference, which is the standard deviation multiplied by the square root of the sum of the reciprocals of the two counts.

CASE: A gap that may not be one
Journal of 60 compliant trades, overall average R **+0.45 R**.
Segmented by direction: **buys** (34 trades) **+0.78 R** · **sells** (26 trades) **+0.02 R**.
Apparent gap: **0.76 R**. Impressive.
Standard error of the difference: 1.9 × √(1/34 + 1/26) = 1.9 × 0.26 = **0.49 R**.
So the gap is worth **1.5 standard errors**. That is suggestive. It is not established — that would take two standard errors, meaning a gap of 0.98 R.
Conclusion: write the hypothesis down, change nothing, and test it in the next module.

ERR: The classic mistake
Segmenting until you find something. Cut for long enough and a brilliant subsample always turns up in the end. It is the overfitting of module 2 applied to your own journal — and it is its most seductive form, because this is your data and you trust it.

KEY: Key points
- One segmentation criterion at a time. Never two crossed.
- A gap is compared to its standard error, never to zero.
- A segmentation produces a hypothesis. It does not produce a decision.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.4', 'What you cannot conclude', 'HOOK:
The most frequent result of a good journal analysis is "I don''t know yet". That is not a failure of the analysis. It is what it is supposed to produce most of the time.

P: Three conclusions are possible at the end of an analysis. An **established effect** — rare. A **hypothesis to test** — frequent. And **nothing** — the most common case of all. Being able to name the third is the skill of this module.

P: The difficulty is not technical, it is psychological. You have just spent time on this analysis, and the temptation is to produce a conclusion in proportion to the effort. An hour of work seems to deserve better than "nothing".

P: What that restraint buys you is considerable, though: it leaves your system intact long enough for it to become measurable. It is the Beginner track''s compliance, transposed to the scale of a month.

CASE: A whole module, zero decisions
Take the three analyses run here.
**The average R over 30 trades**: interval containing zero. No decision.
**The run of six losses**: expected in 84% of cases. No decision.
**The segmentation by direction**: gap at 1.5 standard errors. A hypothesis, not a decision.
Three analyses, a module''s worth of work, **zero changes**. One line to write: *"hypothesis: sells underperform buys, to be tested"*.
That is the normal yield of this work. It looks meagre. It is far better than the yield of an unjustified change.

ERR: The classic mistake
Turning a hypothesis into a rule. Between "sells seem to work less well" and "I no longer sell" lies exactly the protocol of the next module. Skipping that step means adding an untested rule to a system that had seven tested ones.

KEY: Key points
- Three possible conclusions: established effect, hypothesis to test, nothing. The third dominates.
- An analysis that concludes nothing has done its job.
- Write the hypothesis. Do not change the rule.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, 'EX', 'What your statement really says', 'EXF: Skill assessed
Goals 13 and 14: determine whether a gap is variance or a real effect; segment a journal by a single criterion and compare the subsamples.

EXF: Instructions
**Step A.** You are given a journal of 60 trades. Calculate the average R and its standard error, then say whether the sign of the result is established.
**Step B.** Segment that journal by one criterion of your choice out of three. Compare the two subsamples and express the gap in standard errors.
**Step C.** Apply the same approach to your own journal from the Beginner track, then choose your conclusion from three set wordings.

EXF: What the platform must provide
- A supplied journal of 60 trades in a sortable table, carrying the seven fields from the Beginner track plus two columns: direction of the position and session.
- A built-in calculator showing average R, standard deviation and standard error as soon as the selection changes. The user chooses the selection, the machine does the sums: the skill assessed is interpretation, not arithmetic.
- Only one segmentation criterion active at a time. The interface **refuses** the second and says why.
- Step C: import of the user''s Beginner journal. **Fallback required** if that journal is unavailable or holds fewer than 30 compliant trades — a second supplied journal, presented as another user''s, with the same mechanics. The exercise must stay complete in both cases.
- Three selectable conclusion wordings — "established effect", "hypothesis to test", "nothing conclusive" — plus a 120-character free field.

EXF: Worked correction
**Step A.** Average R +0.45 R, standard error 0.25 R, interval from −0.04 to +0.94 R. The sign is **not** established. Most users answer that it is, because the number is positive and sixty trades feel like a lot. Sixty trades are not a lot.
**Step B.** By direction, the gap is worth 1.5 standard errors: a hypothesis. By asset, the gap is small: nothing. By session, the trap is elsewhere — the "evening" subsample holds only 9 trades, and its standard error exceeds 0.6 R. Choosing that criterion and drawing a conclusion from it is the expected error, and the interface must display the count large enough that the user cannot claim not to have seen it.
**Step C.** For almost every user, the only correct answers are "hypothesis to test" or "nothing conclusive". Ticking "established effect" on thirty to sixty trades is wrong whatever figure came out — and that holds even if the figure is excellent. Especially if it is excellent.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.1', 'A hypothesis, not a hunch', 'HOOK:
"Sells work less well" is not testable. "On EUR/USD in H1, my sells have an average R at least 0.3 R below my buys" is. Three specifics separate the two sentences.

P: A usable hypothesis has a **scope** — which asset, which timeframe, under what conditions — a **measured quantity** — average R, hit rate, compliance rate — and a **numerical threshold**.

P: The threshold is the one people forget, and it is the only one that makes the test real. Without it, any result confirms: an improvement of 0.01 R will be enough for you to say it works.

P: You recognise the property. Chapter 4.1 of the Beginner track demanded that a scenario be contradictable by a specific price. It is the same demand, applied to a rule rather than a trade: a hypothesis no result can refute is not a hypothesis.

CASE: The same idea, three times
**"The RSI helps."** No scope, no quantity, no threshold. Nothing to test.
**"The RSI improves my results."** A vague quantity, no threshold. Any positive result will confirm it, including +0.01 R.
**"On EUR/USD in H4, filtering my buys by an RSI above 50 raises my average R by at least 0.25 R over 100 trades."** Scope, quantity, threshold, sample. Refutable, therefore testable.
The third wording takes twenty seconds longer to write. It is the only one that will produce information.

ERR: The classic mistake
Framing the hypothesis after looking at the data. It is the most discreet error at this level: you look at your journal, you notice something, you frame it, then you "test" it — on the very data that suggested the idea. The test can only confirm. It measures nothing except your ability to spot a pattern you have just spotted.

KEY: Key points
- A testable hypothesis = scope + measured quantity + numerical threshold.
- Without a threshold, every result confirms.
- The hypothesis is written before you look at the data that will test it.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.2', 'The sample', 'HOOK:
Thirty trades, a hundred trades, five hundred. These numbers circulate without justification. Here is where they come from — and above all why the one you need depends entirely on the size of the effect you are looking for.

P: The logic is that of chapter 1.1, turned around. You know the uncertainty on an average is two standard errors. For an effect to be detectable, that effect must therefore exceed two standard errors.

P: That gives a simple condition: **n greater than (2 × standard deviation ÷ effect)²**. With the standard deviation of 1.9 R established in module 1, you can work it out in your head.

TABLE: 40,30,30 || Effect you are looking for | Trades needed | Time at 3 trades/week
0.5 R | 58 | 5 months
0.3 R | 160 | 1 year
0.2 R | 361 | 2 and a half years
0.1 R | 1,444 | 9 years

CASE: The row that should make you give up
An effect of **0.1 R** needs about **1,444 trades**. At three compliant trades a week, that is **nine years**.
That effect may well exist. It may even be real and stable. You will never verify it: the time it would take you to establish it exceeds the lifespan of most methods, and of most retail traders.
The conclusion is not discouraging, it is liberating: you can stop hunting for refinements. Only coarse effects are within your reach.

ERR: The classic mistake
Hunting for small edges. The intermediate level is drawn to fine-tuning — a filter that adds 0.1 R, an extra condition that improves things "a bit". Even if perfectly real, those effects are unverifiable at your scale. An edge you cannot measure is not an edge, it is a belief.

KEY: Key points
- n > (2 × standard deviation ÷ effect)². Remember the shape, not the formula.
- An effect of 0.3 R needs about 160 trades, that is a year at your pace.
- Below 0.2 R, nothing is measurable at your scale. Do not go looking.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.3', 'Cutting your data in two', 'HOOK:
You build your rule on some data. You test it on the same data. It works. Of course it works: you made it to.

P: The defence takes two words. The **build sample** is where you search, where you tune, where you are allowed to be wrong as many times as you like. The **control sample** is where you check — and you look at it once.

P: That once is the whole rule. If you go back and tune your rule after seeing the control, it stops being a control: it joins the build sample, and you have nothing left to check anything with.

P: The cut is made **by time**, never at random. Markets behave differently in different periods; a random split mixes the periods and systematically flatters the result, because every piece contains a bit of everything.

CASE: The gap that measures your tuning
200 replayed situations on EUR/USD, cut chronologically: the first 140 for building, the last 60 for control.
Rule tuned on the build sample: **+0.61 R**.
The same rule applied to the control: **+0.12 R**.
The gap between them is not an accident: it is the measure of what your tuning manufactured. Of the 0.61 R obtained, about 0.49 R was noise cut to fit.
That leaves 0.12 R. Over 60 trades, the standard error is 0.25 R. That residue is indistinguishable from zero.

ERR: The classic mistake
Starting again after a bad control. "I''ll adjust it slightly and retest." At that precise second your control is dead and you have no way left to check the new version. What you need then is new data, not new settings — and you have no data in reserve.

KEY: Key points
- Build and control. The cut is made by time, never at random.
- The control is looked at once. After that, it no longer exists.
- The gap between the two measures exactly what your tuning manufactured.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.4', 'Overfitting', 'HOOK:
Bailey and his co-authors established a figure that ought to appear on the splash screen of every backtesting program: with five years of data, forty-five attempts are enough to produce a brilliant and perfectly empty strategy.

P: **Overfitting** means tuning a rule to the noise of a sample rather than to its structure. The mechanism is mechanical: every configuration tried raises the probability that at least one of them looks excellent by pure chance.

P: The exact statement, from their work: *"If only five years of data are available, no more than forty-five independent model configurations should be tried or we are almost guaranteed to produce strategies with an annualized Sharpe ratio in-sample of 1 but an expected Sharpe ratio out-of-sample of zero."*

P: The practical consequence is brutal. **The number of attempts is part of the test''s data**, exactly like the result. A test where the number of configurations tried is unknown is not interpretable — not "less reliable": not interpretable at all.

P: Two other pieces of work confirm the order of magnitude. Bajgrowicz and Scaillet tested **7,846 rules** over 114 years of the Dow Jones: no investor could have picked the future best ones in advance, and the measured performance is entirely wiped out by even modest transaction costs. Harvey, Liu and Zhu, across 316 factors, show that a customary statistical threshold becomes inadequate as soon as the tests multiply.

CASE: Count your attempts, you will be surprised
You decide to test "a moving average". A single idea, apparently.
Periods tried: 20, 50, 100, 200. → **4**
Timeframes: H1 and H4. → × 2 = **8**
Filter above or below the average. → × 2 = **16**
Two assets: EUR/USD and BTC/USD. → × 2 = **32**
You have tested "only a moving average", and you have just made **32 attempts**. Bailey''s limit for five years of data is 45. You are nearly there, and you have not yet added a single other tool.

ERR: The classic mistake
Not counting the attempts you abandoned. Every configuration you tried and then set aside counts, without exception. It is precisely because they were set aside that the one left standing looks good — it is the winner of a competition whose entrants you forgot to count.

KEY: Key points
- The number of configurations tried is part of the test''s data. Write it down before you start.
- Five years of data, forty-five attempts: past that, the result is dressed-up noise.
- An abandoned configuration counts as much as a retained one.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.5', 'The abandonment criterion', 'HOOK:
Write down what would make you give up, before you start. Without that line you are testing nothing: you are looking for a reason to carry on, and you will end up finding one.

P: The **abandonment criterion** is the value, set in advance, below which the idea is thrown away. Its function is to make the test symmetrical: without it, only favourable results trigger a conclusion, and the others trigger another round of tuning.

P: It covers three things at once, and all three are decided beforehand: the **result threshold**, the **sample size**, and the **number of attempts allowed**. Exceeding any one of the three voids the test.

P: It is the invalidation from chapter 4.1 of the Beginner track, moved up a level. There, you wrote the price that would prove you wrong on a trade. Here, you write the figure that will prove you wrong on an idea.

CASE: Four lines worth more than the test
**Hypothesis** — on EUR/USD H4, filtering buys by a 50-period moving average raises the average R by at least 0.3 R.
**Sample** — 200 situations, cut 140 / 60 in chronological order.
**Attempts allowed** — 4 periods maximum. Past that, the test is void and not restarted.
**Abandonment criterion** — if the control gives less than +0.15 R of improvement, the idea is thrown away and not retried for six months.
Those four lines take three minutes. They are worth more than the two hours of testing that follow, because they alone stop the test turning into a hunt for confirmation.

ERR: The classic mistake
Loosening the criterion when the result comes close to it. "0.14 R is nearly 0.15 R." A criterion loosened once will never constrain anything again, and you have just spent 200 irreplaceable situations for nothing. The threshold was set in cold blood precisely so that this argument would not happen in the heat of the moment.

KEY: Key points
- Write the threshold, the sample and the number of attempts allowed before you start.
- A test with no abandonment criterion is not a test.
- Note the date you abandoned an idea. That is what stops you retrying it in three weeks.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, 'EX', 'The test you do not rig', 'EXF: Skill assessed
Goals 15, 16, 17 and 18: frame a testable hypothesis, separate build from control, count your attempts, write and respect an abandonment criterion.

EXF: Instructions
**Step A.** Frame your hypothesis: scope, measured quantity, threshold.
**Step B.** Set the sample, the number of attempts allowed and the abandonment criterion.
**Step C.** The simulator replays 140 situations. You apply your rule to each one.
**Step D.** The simulator replays the 60 control situations. Once only.
**Step E.** Conclude: I keep it, or I abandon it — with the figure.
Then the platform compares your result to what chance would have produced on the same sample.

EXF: What the platform must provide
- A hypothesis form with three constrained fields. The submit button stays **disabled as long as the numerical threshold is empty**.
- An attempt counter shown at all times, incremented automatically on every parameter change and **never resettable**.
- The replay of 140 build situations: for each, the user decides "I take it / I don''t take it", and the result in R appears after the answer.
- The replay of the 60 control situations, available **once only**, permanently locked after being viewed.
- **The comparison to chance**, which is the heart of the exercise: the platform replays the same control sample with a random decision, 200 times, and displays the distribution of average R obtained. The user''s result is placed within that distribution.
- **Fallback** if the interactive replay of 200 situations is too heavy: a set of 200 pre-computed results, the user deciding on static situations presented in series. The comparison to chance must be kept in every case — without it the exercise loses all of its teaching.

EXF: Worked correction
The control gives a result clearly below the build sample. It is built that way, and it is representative.
The turning point is the comparison to chance. Across the 200 random draws, the distribution of average R typically spreads from −0.4 to +0.4 R. The user''s result almost always falls inside it — meaning it is indistinguishable from a decision taken at random on the same situations.
The expected conclusion is **I abandon it**. Most users nevertheless write "I keep it", for two reasons that add up: the figure is positive, and the exercise cost them time. That is exactly the bias the abandonment criterion exists to neutralise — and that criterion had been written at step B, by the user, twenty minutes earlier.
The second lesson is in the counter. Most users reach step D with more than twenty attempts on it, without having noticed. The platform reminds them on the final screen, alongside the limit of 45 from chapter 2.4.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.1', 'What an indicator calculates', 'HOOK:
Three indicators, three formulas, three lines. You are about to see that none of them contains information you have not had in front of you since module 3 of the Beginner track.

P: A **moving average** of period n is the average of the last n closes. An **RSI** of period n compares the average of the rises to the average of the falls over those n periods and maps the ratio onto a 0 to 100 scale. An **ATR** — *average true range* — is the average true range of the last n candles.

P: What they have in common is obvious the moment you write them down: each is a function of the four numbers from chapter 3.1 of the Beginner track. None reaches any extra data, and each loses some — that is the definition of a summary.

P: What separates them matters more. The moving average and the RSI claim to say something about the direction to come. The ATR claims nothing: it measures a past distance. That is what makes it the only one of the three usable without a protocol.

CASE: A moving average''s lag, in hours
A 50-period moving average on H4 candles sums up 50 × 4 = **200 hours**, about eight trading days.
Price moves; the average follows it with a structural lag of roughly half its period, that is **about four days**.
Direct consequence: a moving average **cannot** signal a reversal. It can only confirm that a move has been going on for a while.
This is not a setting problem a better parameter would fix. It is the definition of an average.

ERR: The classic mistake
Hunting for the right setting. The question "50-period or 200-period?" assumes there is an answer that holds over time. What it mostly does is generate attempts — and chapter 2.4 has just told you what each attempt costs against the credit of your final result.

KEY: Key points
- Moving average, RSI and ATR are functions of the same four numbers. None adds information.
- A moving average lags by about half its period. That is structural, not adjustable.
- A tool that measures and a tool that claims to predict are not used the same way.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.2', 'Measuring is not predicting', 'HOOK:
The ATR will never tell you where price is going. It tells you how much it usually moves — and that piece of information you can use today, with no test first.

P: Chapter 2.4 of the Beginner track put the stop below the last low. That placement is still correct and is not revised. It simply ignores one variable: the same distance in pips does not carry the same risk of being hit depending on how volatile things are at the time.

P: The ATR supplies that variable. The rule of use fits in one comparison: a stop less than **1 ATR** away will be hit by ordinary noise; a stop beyond **3 ATR** pays for an invalidation that is too far off. Between the two, the distance is consistent with what the market is currently doing.

P: A word about **volume**, since you will see it everywhere else. On BTC/USD, traded volume is real data, measured by the exchanges. On spot EUR/USD there is no centralised volume at all: what your chart shows is **tick volume**, that is, the number of price changes recorded by your broker alone. It is a measure of activity at one intermediary, not a market volume. This track builds nothing on it, and you now know why.

CASE: The same stop, two different markets
EUR/USD in H1, **ATR 14 = 22 pips**.
Stop 12 pips away = **0.55 ATR** — it will be hit by an ordinary candle, without any invalidation having occurred.
Stop 32 pips away = **1.45 ATR**, placed below the last low. Consistent with both criteria.
Stop 80 pips away = **3.6 ATR** — the structure does not justify it; you are paying for somebody else''s uncertainty.
Three weeks later the ATR falls to 11 pips. That same 32-pip stop is now worth **2.9 ATR**: too wide for the context. Your distance has not moved, the market has.

ERR: The classic mistake
Fixing a stop distance once and for all. "I always use 30 pips" ignores that 30 pips is 1.4 ATR one day and 3 ATR another. The Beginner track taught you not to set your stop by your budget; this level adds one prohibition: do not set it by habit either.

KEY: Key points
- The ATR measures a usual distance. It predicts nothing, and that is exactly its virtue.
- Always compare your stop to the current ATR: between 1 and 3, or justify it.
- The volume shown in forex is not a market volume. Build no rule on it.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.3', 'The filter', 'HOOK:
An indicator does not tell you what to take. At best it tells you what not to take — which is already considerable, since chapter 4.5 of the Beginner track showed that selectivity is a performance variable in its own right.

P: A **filter** is a condition that removes trades from a set your reading has already produced. It never creates a trade, and that constraint is not decorative: it is what stops the tool turning back into a signal.

P: The correct sequence is fixed, and the filter comes last in it. Reading the structure (Beginner 3.3), then scenario and invalidation (4.1), then checklist (4.4), then filter. Nothing moves up that order.

P: That position has a methodological consequence people forget every time. A filter cannot be judged on the winning trades it brings in — it brings in none. It is judged on what it **removes**: were the deleted trades worse than average?

CASE: What a filter removes, and what it costs
Sample of 100 trades, average R **+0.40 R**.
The filter removes **30** of them.
The 30 removed trades had an average R of **−0.10 R**. The 70 remaining: **+0.61 R**.
So the filter worked on this sample. Whether that result survives chapter 2.3 remains to be seen, and it is not a given.
Note the price too: 30% of the opportunities gone. At three compliant trades a week you drop to 2.1 — and the time needed to measure anything at all rises by a third.

ERR: The classic mistake
Using a filter to enter. The moment you catch yourself thinking "the RSI has just crossed back above 50, I''m buying", you have reversed the sequence. The filter has become a trigger, and you have just contradicted everything module 3 of the Beginner track established. The reversal is easy to spot: it happens when the tool gives you an idea instead of taking one away.

KEY: Key points
- A filter subtracts. It never adds a trade.
- It is judged on the quality of what it removes, not on what it lets through.
- It costs opportunities, therefore measuring time. Count that cost before adopting it.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.4', 'Putting a tool through the protocol', 'HOOK:
Here is the complete test, from first step to last, on a real case. It takes an hour. It is the only hour in this track that will tell you whether a tool deserves to stay on your screen.

P: The protocol takes module 2 whole, in order: hypothesis, sample and cut, attempts allowed, abandonment criterion, build, control looked at once, written decision. Seven steps, none optional.

P: What follows is a real test in its full unfolding, including its conclusion — which is the most frequent conclusion of all tests of this kind.

CASE: A test, end to end
**Hypothesis** — on EUR/USD H4, taking buys only when price is above its 50-period moving average raises the average R by at least 0.3 R.
**Sample** — 200 situations, 140 for building, 60 for control, cut by time.
**Attempts allowed** — 3 periods: 20, 50, 100.
**Abandonment criterion** — less than +0.15 R on the control and the idea is thrown away, not retried for six months.
**Build** — 20-period: +0.18 R · 50-period: **+0.44 R** · 100-period: +0.31 R. Three attempts spent, the 50 is kept.
**Control**, looked at once: **+0.09 R**.
**Decision** — below the criterion. **Thrown away**, with the date, in the test log.

ERR: The classic mistake
Keeping it anyway, "because 0.09 is still positive". Over 60 control trades the standard error is about 0.25 R: a result of +0.09 R is rigorously indistinguishable from zero. The criterion was set at 0.15 R precisely so that this argument would not happen now, just after you have spent an hour on the test.

KEY: Key points
- Seven steps, in order, before a tool stays on your screen.
- Most ideas die at the control. That is normal operation, not failure.
- Note the date of abandonment. That is what stops you retesting the same thing on a loop.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.5', 'What each tool costs', 'HOOK:
Every tool you add has a price, and it is not paid in euros. It is paid in opportunities, attempts and attention — three currencies you hold in very limited quantity.

P: **Cost in opportunities.** A filter that removes 30% of trades lengthens the time needed to reach a given sample by about 43%. Chapter 2.2 showed you what that time amounts to.

P: **Cost in attempts.** Every tool multiplies the number of configurations to explore. Two tools with four settings each do not make eight combinations, they make sixteen — and the counter from chapter 2.4 rises accordingly.

P: **Cost in attention.** A crowded screen lengthens the decision and weakens the checklist, which chapter 4.4 of the Beginner track established is only worth anything if it applies mechanically. One more tool is one more question to answer under pressure.

CASE: The second filter you will not add
You have one filter in place. You are considering a second.
**Opportunities** — the first removes 30%, the second removes 25% of what is left. You are down to 52.5% of the trades: at three a week, that is **1.6**.
**Attempts** — 4 settings × 4 settings = **16 configurations**, against 4 before.
**Sample needed** to measure the second one''s effect: 160 trades for an effect of 0.3 R. At 1.6 trades a week, that is **two years**.
The second filter is not a bad idea. It is simply unverifiable at your scale — which, per chapter 2.2, comes to the same thing.

ERR: The classic mistake
Piling up because each addition looks reasonable on its own. No tool taken separately seems expensive. It is the product of the three costs that is, and that product stays invisible as long as you decide one addition at a time.

KEY: Key points
- Three costs: opportunities, attempts, attention. All three can be quantified.
- One tool at a time. Tested, then kept or thrown away, before considering another.
- If measuring an addition''s effect would take two years, you do not add it.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, 'EX', 'The tool you throw away', 'EXF: Skill assessed
Goals 19 and 20: describe what an indicator calculates and what it cannot do; put a filter through the full protocol and conclude.

EXF: Instructions
**Step A.** Choose one filter out of three and set its parameter.
**Step B.** Fill in the test sheet — hypothesis, sample, attempts allowed, abandonment criterion — before any access to the data.
**Step C.** Apply the filter to the build sample.
**Step D.** Look at the control. Once.
**Step E.** Decide, holding your result against the criterion you wrote at step B.

EXF: What the platform must provide
- Three filters on offer — moving average, RSI, position of price within the ATR — each with one parameter adjustable within a closed range.
- A four-field test sheet. The "run" button stays **disabled as long as the abandonment criterion is empty**.
- A visible attempt counter, incremented on every parameter change, not resettable.
- A sample of 200 pre-computed situations on EUR/USD H4, cut 140 / 60 in chronological order. The control locks after one viewing.
- A final screen showing, side by side: build average R, control average R, **standard error of the control**, and the criterion the user wrote at step B, copied out unchanged.

EXF: Worked correction
All three filters are calibrated to produce a control between +0.05 and +0.15 R — so at or below any reasonable criterion, and in every case indistinguishable from zero with a standard error of 0.25 R over sixty trades.
The right answer is **I abandon it**, for all three. This is not a trick: it is the real survival rate of ideas of this kind, and chapter 3.4 said so explicitly.
Two errors are expected. The first: keeping the filter that returned exactly +0.15 R, by rounding the criterion mentally in the convenient direction. The second, more serious: **running again with another parameter after a bad control**. The platform deliberately allows it, increments the counter, and points it out on the final screen — by that stage the control has been viewed, it no longer exists, and the second test is worth precisely nothing. It is the most effective demonstration of chapter 2.3, because the user has just produced it themselves.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.1', 'The trade does not stop at the entry', 'HOOK:
The Beginner track taught you to enter and to place a stop. It deliberately left aside everything that happens between the two. And yet a considerable share of your average R lives there.

P: With a position open, three interventions are possible: do nothing, reduce the position, move the stop. Each changes the expectancy, and none is neutral — including the first, which is a choice exactly like the others.

P: The principle governing this module fits in one sentence: **every intervention during a trade is paid for**. The question is never whether it costs, but whether what it earns exceeds what it costs. That question has a quantifiable answer, and the next four chapters quantify it.

P: One difficulty is peculiar to the subject: the intervention is decided with a position open, under pressure. Module 5 of the Beginner track documented what your judgement is worth at that moment. The conclusion follows on its own — the management rule is written **before** entry, along with the stop and the target.

CASE: The same trade, three managements
EUR/USD, entry 1.0852, stop 1.0838 — that is 14 pips, so 1 R — target 1.0895, that is 43 pips, so 3.1 R.
What happens: price rises to 1.0880, falls back to 1.0845, then reaches 1.0895.
**Management A, do nothing**: the initial stop is never hit, the target is reached. **+3.1 R**.
**Management B, exit half at +1.5 R**: (0.5 × 1.5) + (0.5 × 3.1) = **+2.3 R**.
**Management C, stop moved to entry as soon as +2 R is reached**: the return to 1.0845 passes below 1.0852. Hit. **0 R**.
Same trade, same reading, same market. From +3.1 R to zero.

ERR: The classic mistake
Judging a management style on this trade. Here, doing nothing wins. On the next trade — where price falls back to the initial stop without ever reaching the target — management C would have saved 1 R. A management style is judged over a series, never on one case, and that is precisely what the following chapters measure.

KEY: Key points
- Three possible interventions: nothing, reduce, move. None is neutral.
- The management rule is written before entry, exactly like the stop and the target.
- A management style is judged over a series. One trade proves nothing, however spectacular.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.2', 'The partial exit', 'HOOK:
Taking half off halfway. The gesture looks prudent, it justifies itself effortlessly, and its effect on your average R can be calculated exactly.

P: A **partial exit** means closing a fraction of the position before the target. It reduces variance and reduces expectancy: it is a trade-off, not an improvement.

P: What it buys: comfort, and a markedly higher share of trades finishing positive. What it sells: the right-hand side of your distribution, that is, the trades that were going a long way and that pay for everything else.

P: You recognise the mechanism. It is the disposition effect from chapter 5.1 of the Beginner track, in institutionalised form. The difference lies in one decisive detail: here the decision is taken in cold blood and applied uniformly, which makes it measurable.

CASE: What comfort costs, exactly
100 trades, stop at 1 R, target at 3 R, 40% hit rate.
**Without a partial exit**: (0.40 × 3) − (0.60 × 1) = **+0.60 R** per trade.
**With half taken off at +1.5 R**, given that a winner necessarily passes through 1.5 R before reaching 3 R, and assuming a quarter of the losers touch 1.5 R before returning to the stop:
winners: 0.40 × [(0.5 × 1.5) + (0.5 × 3)] = **+0.90**
losers that touched 1.5 R: 0.60 × 0.25 × [(0.5 × 1.5) + (0.5 × −1)] = **+0.04**
losers that touched nothing: 0.60 × 0.75 × (−1) = **−0.45**
Total: **+0.49 R** per trade.
The price of comfort: **18% of the expectancy**. What it buys: the share of trades finishing positive goes from 40% to 55%.

ERR: The classic mistake
Adopting the partial exit to "lock things in", without having done this calculation. The choice is perfectly defensible — if you know it costs you 18% of your expectancy and you judge the drop in variance more valuable. What is not defensible is adopting it in the belief that it improves the result.

KEY: Key points
- The partial exit swaps expectancy for comfort. It is a trade-off, not a gain.
- In a standard case it costs 18% of the average R and takes the share of positive trades from 40% to 55%.
- If you adopt it, apply it to every trade. Otherwise you are no longer measuring anything at all.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.3', 'The trailing stop', 'HOOK:
Kaminski and Lo established a counter-intuitive result: under a random walk, a stop rule always reduces expectancy; in the presence of momentum, it adds to it. So the trailing stop is neither good nor bad. It is conditional.

P: A **trailing stop** is a stop that moves in the direction of the trade, never the other way. Not to be confused with moving a stop in the direction of the loss, which chapter 2.4 of the Beginner track forbids and which stays forbidden without exception.

P: Kaminski and Lo''s result, transposed to your scale: if price behaves like a random walk, cutting a position part-way through removes expectancy, mechanically. If the market is in a persistent trend, the trailing stop captures that persistence and adds to it.

P: The operational consequence is clear. The trailing stop is applied according to the **regime**, not the mood. In a trend readable in the sense of chapter 3.3 of the Beginner track, it has a chance of adding. With no trend, it removes — and there is no setting that corrects that.

CASE: The value is in the condition, not in the tool
100 trades, two regimes.
**60 trades with no trend**: the trailing stop cuts at an average of +0.4 R trades that would have finished at +0.6 R. Cost: −0.2 R × 60 = **−12 R**.
**40 trades in a trend**: it lets them run and captures +2.8 R on average, against +2.2 R at the fixed target. Gain: +0.6 R × 40 = **+24 R**.
**Applied everywhere**: −12 + 24 = **+12 R** over 100 trades.
**Applied only in a trend**: **+24 R**, twice as much, for the same tool and the same setting.
The value does not lie in the trailing stop. It lies in the condition under which it is applied.

ERR: The classic mistake
Applying it in all circumstances because it "protects gains". On the 60 no-trend trades in the example it protected nothing: it converted average gains into small gains, which is the exact definition of the disposition effect — automated this time, and therefore applied without even the remorse that usually goes with it.

KEY: Key points
- The trailing stop adds in a trend and removes without one. That is not a preference, it is a result.
- It never moves in the direction of the loss. The Beginner track''s rule is unchanged.
- Its value rests on the condition under which it is applied, not on its setting.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.4', 'Moving the stop to break-even', 'HOOK:
Moving the stop up to your entry price as soon as the trade is in profit. It is called "getting safe", it seems to cost nothing, and it is the most expensive gesture in this module.

P: **Moving to break-even** puts a stop exactly where the market''s noise will come looking for it. The reason is structural: your entry price is a level the market has just passed through. It has no meaning for anyone but you, and price comes back to it very often before setting off again.

P: Chapter 2.4 of the Beginner track put the stop at the invalidation, that is, at a level justified by the structure. Moving to break-even replaces it with an arbitrary level — and it does so at the precise moment the trade starts working.

P: What it buys is real: the disappearance of loss risk on this trade. What it sells is just as real: a share of the trades that were going to the target.

CASE: Twenty-one losses avoided, twelve targets lost
100 trades, starting expectancy +0.60 R. Break-even triggered at +1 R.
Of the 40 winners, **30% come back through the entry price** before reaching the target: 12 trades go from +3 R to **0 R**.
Of the 60 losers, **35% reach +1 R** before falling back: 21 trades go from −1 R to **0 R**.
New count: 28 winners × 3 = +84 · 12 winners cut = 0 · 21 losers saved = 0 · 39 losers × (−1) = −39.
Total: **+45 R** over 100 trades, that is +0.45 R per trade, against +0.60 R doing nothing.
The feeling is excellent: 21 losses avoided and a third of trades finishing at zero. The count is **25% lower**.

ERR: The classic mistake
Validating this gesture on the memory of the losses avoided. You will remember the 21 times the break-even stop saved you — they produced clean, dated relief. You will not remember the 12 times it cost you 3 R, because those trades closed at zero and left no emotional trace. The journal, though, counted them.

KEY: Key points
- Your entry price has no structural meaning. Putting a stop there is putting it in the noise.
- In a standard case, moving to break-even costs about 25% of the expectancy.
- It leaves a favourable memory and an unfavourable statement. The statement is right.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.5', 'Choose one and hold to it', 'HOOK:
Three management styles, three figures. None is the right answer. The one certain mistake is changing between them every fortnight.

P: Alternating management styles makes the sample uninterpretable. Three styles applied over sixty trades produce three samples of twenty, and chapter 2.2 showed you that at that size nothing is measurable — neither separately nor together.

P: So the rule is: one management style, written down, applied to **every** trade, over a sufficient sample, then measured. To compare two styles you do not alternate them: you apply the first over a hundred trades, you measure it, then the second.

P: There is a shortcut, though, and it is an excellent one. Add an eighth field to the Beginner track''s journal: the **highest point the trade reached before it closed**, expressed in R. With that one number you can recompute after the fact what any management style would have produced, without having had to live through it.

CASE: The field worth three hundred trades
Beginner track journal: seven fields, one of them the result in R.
Add the eighth: **highest point reached, in R**, noted at closing. Three seconds per trade.
Over a hundred trades already taken, that field lets you recompute the expectancy that would have come from a partial exit at 1.5 R, a break-even stop at 1 R, and a trailing stop 1 R away.
Three management styles compared on a sample you already own, instead of three hundred extra trades and a two-year wait. It is the best effort-to-information ratio in the whole track.

ERR: The classic mistake
Changing management style after an unfavourable run. This is chapter 6.2 of the Beginner track applied to management: a short run says nothing, and the change resets your sample counter to zero. A year later you will have tried four styles and will know which one worked for none of the four.

KEY: Key points
- One management style, applied to every trade, measured over a sufficient sample.
- Add the highest point reached in R to the journal: it makes every management style testable after the fact.
- Alternating styles does not produce a comparison. It produces noise in three pieces.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, 'EX', 'Three management styles, one series', 'EXF: Skill assessed
Goals 21 and 22: calculate the effect of a partial exit on the average R; decide whether to apply a trailing stop according to the observed regime.

EXF: Instructions
**Step A.** On one replayed trade, watch the three management styles applied in parallel and note the R each one obtains.
**Step B.** Choose **one** style, then apply it to the 40 trades of a replayed series. The choice is locked for the whole series.
**Step C.** The platform recomputes what the other two would have produced on exactly the same series.
**Step D.** Name the regime of the series, and say whether the ranking obtained was predictable.

EXF: What the platform must provide
- Step A: a single replay with the three management styles computed in parallel and displayed side by side, R by R.
- Step B: 40 short replays at speed. The style is chosen before the first trade and **locked** until the last. This is the central teaching constraint of the exercise: without it the user alternates and the exercise teaches nothing.
- Automatic recording, for every trade, of the **highest point reached in R** — the eighth field from chapter 4.5.
- Step C: automatic recomputation of the two styles not chosen from the recorded highs, displaying the three expectancies **and the standard error over 40 trades**.
- Step D: a multiple choice for naming the regime — trend, no trend, mixed — then a question on whether that regime is consistent with the ranking obtained.

EXF: Worked correction
The series of 40 is built in a **mixed** regime: 24 trades with no trend, 16 in a trend.
Expected results: do nothing ≈ +0.58 R · trailing stop ≈ +0.61 R · break-even ≈ +0.44 R.
The ranking is not the point of the exercise. The point is the gap between the first two — 0.03 R — set against the standard error over 40 trades, which is about **0.30 R**. None of the three styles is distinguishable from the other two on this sample. Break-even trails, but even that gap stays inside the noise.
So the right answer at step D is: the regime was mixed, and 40 trades are not enough to settle it. Most users conclude that the style that came top is the best — reproducing, on management, the exact error module 1 diagnosed on the average R. That is deliberate: the same mistake, made twice three modules apart, is what makes it memorable.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.1', 'Three positions at 1%, a 3% risk', 'HOOK:
You have three positions open, each sized at 1% using the formula from chapter 2.3 of the Beginner track. You believe you are risking 1%. Depending on what you have opened, you are risking between 1% and 3%.

P: The Beginner track''s size calculation is correct. It covers one trade in isolation, and it becomes insufficient the second a second position opens. That is not a flaw in the previous track: a beginner holds one position at a time, and talking portfolios to them would have been premature.

P: **Cumulative exposure** is the loss you would take if all your open positions hit their stops in the same market move. It is a different quantity from the sum of the displayed risks, and often a very different one.

P: The question that settles it fits on one line: **can your positions lose together?** If the answer is yes, they are only one position, however your platform counts them.

CASE: Three portfolios, one display
**A** — long EUR/USD 1%, long GBP/USD 1%, long AUD/USD 1%. Three bets against the dollar. A rising dollar hits all three. Real exposure: close to **3%**.
**B** — long EUR/USD 1%, long BTC/USD 1%, short USD/JPY 1%. Three apparently different markets — and three positions that lose if the dollar rises. Real exposure: still high.
**C** — long EUR/USD 1%, short GBP/USD 1%. The two bets largely oppose each other. Real exposure: well below 2%, and so is the potential gain.
In all three cases your platform displays "risk: 1% per position". It is right position by position, and it does not answer the question being asked.

ERR: The classic mistake
Adding positions in the belief that you are diversifying. Opening three major pairs against the dollar is not diversification: it is tripling the stake on a single idea. The Beginner track established that the number of orders correlates with loss; this chapter supplies one precise mechanism for it.

KEY: Key points
- The Beginner track''s size formula is right for one isolated trade, insufficient as soon as there are two.
- Cumulative exposure is what you lose if all your positions hit their stops together.
- Three positions that lose in the same scenario are one bet, and their risks add up.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.2', 'Correlation', 'HOOK:
EUR/USD and GBP/USD move together with a coefficient commonly measured between +0.81 and +0.95. That figure alone turns two trades into one — and two 1% risks into a risk of almost 2%.

P: **Correlation** is a measure between −1 and +1 of how far two assets move together. At +1 they move identically. At 0 they are independent. At −1 they move in opposite directions.

P: The major pairs are correlated by construction, not by accident: EUR/USD and GBP/USD share the dollar as counterpart, so any move in the dollar shows up mechanically in both. On the crypto side, most pairs run between +0.6 and +0.9 with bitcoin — a portfolio of ten cryptocurrencies is a portfolio of one.

P: You do not need a coefficient to three decimals. Three categories are enough, and they save you from the order-of-magnitude error, which is the only one that costs real money.

CASE: The rule in three lines
**Above +0.7** — a single group. Two 1% trades on EUR/USD and GBP/USD lose together, so their risks **add up**: they count as **2%**, that is your whole limit. To open both and keep some room, cut each to 0.5%.
**Between +0.3 and +0.7** — the second counts half. Two 1% trades count as **1.5%**.
**Below +0.3** — add them normally. Two 1% trades count as **2%**.
And one correction that overrides everything: if the positions are in **opposite directions**, a high correlation **reduces** exposure instead of raising it.
This is not exact in the mathematical sense. It is enough never to be wrong by a factor of three.

ERR: The classic mistake
Chasing precision. Computing a coefficient over a rolling window gives a flattering impression of mastery — and that coefficient changes with the period chosen anyway, sometimes by a factor of two. Three categories applied systematically are worth more than an exact number applied one time in three.

KEY: Key points
- Above +0.7: one group, risks add up. Between +0.3 and +0.7: the second counts half. Below: add them.
- The major pairs share the dollar. They are correlated by construction.
- Opposite directions with a high correlation: exposure falls. Always look at the direction before the coefficient.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.3', 'Session risk, portfolio risk', 'HOOK:
The Beginner track''s seven rules cap what you lose during a session. None of them caps what you lose while you sleep with four positions open.

P: Two limits, two distinct objects. **Session risk** — two losses and the session is over — caps **sequential** losses, the ones that follow one another in time because you keep trading.

P: **Portfolio risk** caps **simultaneous** losses, the ones that arrive together without your having decided anything further. The Beginner track did not cover it because it was addressing someone who opened one position at a time.

P: Both are necessary and neither replaces the other. A perfectly respected session rule protects you not at all if your four positions hit their stops at three in the morning.

CASE: The hole in the seven rules
A perfectly compliant session: you open three positions at 1%, none hits its stop, you close your session. Zero loss, zero rule broken, nothing to reproach yourself with.
Overnight, an announcement pushes the dollar up. Your three positions — all long on pairs against the dollar — hit their stops.
Loss: **3%**. Not one of the seven rules was violated, because not one of the seven was built for this case.
So you need an eighth rule, and it covers what is **open simultaneously**, not what was decided in succession.

ERR: The classic mistake
Believing the seven rules cover everything. They covered the practice of a beginner with one position. Your practice has changed — that is what this level is — and a rule that does not evolve with the practice it governs stops protecting without warning.

KEY: Key points
- Session risk: losses that follow one another. Portfolio risk: those that arrive together.
- The Beginner track''s seven rules cover only the first.
- Your practice has changed. Your rules have to change with it.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.4', 'The cumulative exposure rule', 'HOOK:
One rule, one number, checkable in five seconds before every order. It is the eighth, and it completes the seven from chapter 5.4 of the Beginner track without modifying any of them.

CARD: The eighth rule
**Maximum cumulative exposure: 2%.**
It is worked out by applying the three correlation categories to every open position, plus the one you are considering, and taking the direction of each into account.

P: The choice of 2% is not arbitrary. It allows two independent positions at 1%, or four correlated positions at 0.5%, and it caps the simultaneous loss at twice the loss of a single trade — an order of magnitude the drawdown of chapter 2.5 of the Beginner track makes bearable.

P: The calculation is done **before** the order, like the position size. It becomes the seventh question on your checklist, and it obeys the same rule as the other six: no answer, no trade.

CASE: Four positions, a five-second calculation
Open: long EUR/USD 0.5% · long GBP/USD 0.5% · long BTC/USD 0.5%.
EUR/USD and GBP/USD, correlation above +0.7, same direction: one group, whose risks add up — **1%** for the two of them.
BTC/USD, weakly correlated with both: adds **0.5%**.
Current exposure: **1.5%**.
You are considering a long AUD/USD at 1%. Correlated above +0.7 with the first two and in the same direction, it joins their group: that group would go to 2%, and total exposure to **2.5%**.
Decision: either you take it at **0.5%** — the group goes to 1.5%, exposure to exactly 2% — or you do not take it. There is no third option.

ERR: The classic mistake
Working out the exposure after opening. As with position size in chapter 2.3 of the Beginner track, the order of operations is half the rule: an exposure checked after the order protects nothing, it observes.

KEY: Key points
- Maximum cumulative exposure: 2%. That is the eighth rule.
- Apply the three correlation categories to everything open, plus what you are considering.
- The calculation is done before the order. It becomes the seventh question on your checklist.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, 'EX', 'What you are actually risking', 'EXF: Skill assessed
Goal 23: calculate the cumulative exposure of a set of open positions, taking their correlation and their direction into account.

EXF: Instructions
**Step A.** You are shown a portfolio of four open positions. Calculate its cumulative exposure.
**Step B.** A fifth trade is offered. Say whether it passes the 2% rule and, if not, at what size it would.
**Step C.** You are given three portfolios all displaying "1% per position". Rank them from most to least exposed.

EXF: What the platform must provide
- A portfolio screen listing four positions with asset, **direction**, and risk as a percentage. The direction must be as visible as the amount: that is where the exercise''s trap lies.
- A correlation matrix displayed **in three colours** — above +0.7, between +0.3 and +0.7, below — and not as numerical coefficients. The exercise assesses applying the rule, not reading a table of numbers.
- An input field for the calculated exposure, with a tolerance of ±0.25 points.
- Step B: two fields — "passes / does not pass" and "maximum acceptable size".
- Step C: three portfolios to rank by drag and drop, all displaying the same risk per position.

EXF: Worked correction
**Step A.** The trap is the short position. A short GBP/USD in among long EUR/USD **reduces** exposure, even though the matrix shows a high correlation between the two pairs. Strong correlation plus opposite directions equals reduced exposure. It is the most frequent error in the exercise, and it comes from applying the colour rule without looking at the "direction" column.
**Step B.** The fifth trade does not pass at 1% and does pass at 0.5%. Answering "does not pass" without giving the size is incomplete: the skill assessed is precisely knowing what size it would pass at, because that is the answer that lets you take the trade instead of giving it up.
**Step C.** The three portfolios display the same risk per position and have real exposures of **1%, 2% and 3.5%**. The ranking is the only result that matters here, and its lesson fits in one sentence: your platform''s display does not answer the question you have to ask.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.1', 'What a system is', 'HOOK:
A system fits on one page. If yours takes five, it is not a system: it is a collection of exceptions, and you will never be able to test it.

P: A **system** is a set of rules small enough to be applied identically across a whole sample, and precise enough that two people reading it take the same decision in front of the same chart.

P: The quality test is empirical and final: give your system to somebody else. If they cannot take the same decisions as you, your system is not written down — it is in your head, and what is in your head cannot be measured.

P: Six elements make it up: scope, entry condition, invalidation, management, exposure, abandonment criterion. What it does not contain matters just as much: no exceptions, no "unless", no appeal to judgement.

CASE: The transmissibility test
**Version A** — *"I buy when the H4 structure is bullish and price comes back to a zone."*
Two readers, two outcomes. Which zone? How close? With what confirmation? Each will fill the gaps their own way, and you first of all, differently depending on the day.
**Version B** — *"EUR/USD and BTC/USD, structure in H4, entry in H1. I buy if the last two H4 lows are rising and price comes back within 10 pips of a zone that has produced at least two reactions. Invalidation below the low. Stop between 1 and 3 ATR. Management: no intervention. Maximum cumulative exposure 2%."*
Two readers, the same decisions in the great majority of cases. Version B is no longer. It is more precise.

ERR: The classic mistake
Confusing precision with complexity. Adding rules does not make a system more precise: most often it multiplies the situations where two of them contradict each other, and your mood at the time settles it — which is exactly what the system existed to prevent.

KEY: Key points
- A system is transmissible: another reader takes the same decisions as you.
- Six elements: scope, entry, invalidation, management, exposure, abandonment criterion.
- Precision and complexity are not the same thing. Aim for the first.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.2', 'The system document', 'HOOK:
One page, six sections, a date. This document is the only deliverable of the Intermediate track, and it is worth more than everything you have read so far.

UL:
- **Scope** — assets, timeframes, times of day when you operate.
- **Entry** — the condition, worded so that a third party can check it.
- **Invalidation and stop** — where, and within what ATR range.
- **Management** — one only, applied to every trade.
- **Exposure** — the cumulative limit and the correlation categories.
- **Abandonment criterion** — the average R below which the system is reviewed, and over what sample.

P: To those six sections are added two pieces of header information that turn a descriptive document into a measuring instrument: the **date last modified** and the **number of trades since**.

P: Without them you do not know how many trades your current version has been applied over — and module 2 established that with no known sample, no figure is interpretable.

CASE: The header that changes everything
*Version 4 · Modified 12/03 · 47 trades since the last modification · Abandonment criterion: average R below +0.10 R at 100 trades.*
That single line answers three questions immediately: what am I measuring on, since when, and from what point do I start worrying.
Without it, a system modified three times in two months produces a journal of 120 trades that measures **none** of the three versions. The figure exists, it describes nothing.

ERR: The classic mistake
Modifying the document without incrementing the version or resetting the counter. It is the system-level equivalent of the unrecorded trade: the change did happen, it is untraceable, and you will never be able to say what it produced.

KEY: Key points
- Six sections, one page, plus a modification date and a trade counter.
- Every modification increments the version and resets the counter to zero.
- With no counter, your journal measures no particular version.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.3', 'The monthly review', 'HOOK:
Once a month, market closed, three questions and one decision. It is short because that is the only way it gets done every month.

P: **First question: what is my compliance rate?** Below 90%, the review stops here and the decision is about discipline. The average R is not even examined — chapter 6.3 of the Beginner track established that it measures nothing while compliance is low.

P: **Second question: how many trades since the last modification?** Below 100, no modification of the system is allowed, whatever figure is showing. That rule is the hardest to hold to and the most profitable.

P: **Third question: is the average R below my abandonment criterion?** If yes, the system is reviewed. If no, nothing changes. And in every case, re-read the log of abandoned ideas from chapter 3.4 to check that none of them is quietly climbing back in through the window.

CASE: Three months, one revision
**Month 1** — compliance 78%, 40 trades, average R +0.31 R. → *Fix the discipline.* The average R is not discussed; it measures nothing at that level of compliance.
**Month 2** — compliance 94%, 71 trades, average R +0.08 R. → *Change nothing.* The figure is poor and the sample is insufficient. This is by far the hardest of the three decisions.
**Month 3** — compliance 96%, 112 trades, average R +0.04 R, criterion set at +0.10 R. → *Review the system.* Then, and only then, for the first time.
Three months of work, one revision, arriving after 112 trades. That is the normal pace.

ERR: The classic mistake
Revising in month 2. The figure is discouraging, the sample insufficient, and the temptation at its peak precisely because the two combine. Revising at that moment destroys the 71 trades accumulated and starts again from zero — for a system you will now never know worked or not.

KEY: Key points
- Three questions in order: compliance, sample, result. No step is skipped.
- Below 100 trades since the last modification, no modification. No exceptions.
- A review produces one written decision, never two.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.4', 'When to modify, when to do nothing', 'HOOK:
The question is not whether your system should evolve — it should. The question is which event authorises a modification, and there are only three.

P: **First trigger**: the abandonment criterion is met on a sufficient sample. That is the anticipated case, the one the criterion was written for.

P: **Second trigger**: a hypothesis has passed the module 2 protocol, control included. That is the rare case — most hypotheses die before it.

P: **Third trigger**: your practice has changed to the point that the rules no longer cover it. The cumulative exposure of module 5 is the exact example: it did not exist while you had only one position open.

P: Everything else — a run of losses, an article you read, an idea you heard, a disappointing month — authorises nothing at all. And every modification resets the counter to zero: that is the price, and it must be paid knowingly.

CASE: What a modification costs, in weeks
At three compliant trades a week, a hundred trades take **33 weeks**.
A system modified **every two months** never reaches its measuring sample. After a year: six versions, zero measurements, and the sincere conviction of having worked hard.
A system modified **once a year** produces about 78 trades per version. Still insufficient, but the order of magnitude is finally right.
Conclusion: the highest modification frequency compatible with measurement is on the order of **once a year**. That figure surprises everyone, and it comes out of a simple division.

ERR: The classic mistake
Modifying "just one small parameter". A small change resets the counter exactly like a large one: the system applied afterwards is no longer the one from before, and the trades from the two periods do not add up. There is no such thing as a modification that preserves the sample.

KEY: Key points
- Three legitimate triggers: criterion met, hypothesis validated, practice changed.
- Every modification resets the counter and costs 33 weeks.
- One modification a year is the maximum frequency compatible with measurement.', 32);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.5', 'What awaits you in the Experienced track', 'HOOK:
You have a written system, a method for testing it and a rule for revising it. What is missing now is no longer knowledge: it is contact with an environment that does not forgive approximations.

P: The Experienced track deals first with **going live with real money**: slippage, execution quality, the gap between the price asked and the price obtained, and the protocol for reducing size at the start. These are problems simulation cannot set you.

P: It then deals with what real money brings back all at once: the whole of module 5 of the Beginner track — disposition effect, overtrading, the spiral after a loss — this time under conditions where the error costs immediately.

P: What the Intermediate track has not covered, so that you know where to look: choosing a broker, taxation, products other than currency pairs and spot cryptocurrencies, and managing a portfolio beyond three positions.

P: The entry condition for the Experienced track is not a formality: a written system, **100 compliant trades on the current version**, and an average R above your abandonment criterion. Without those three, the Experienced track would be dealing with problems you do not have yet.

CASE: The honest calendar, extended
The Beginner track put **10 weeks** on reaching 30 compliant trades.
The Intermediate track asks for 100 trades on a stable version, so **33 further weeks** at least — and that calculation assumes no revision happens in between, which is optimistic.
From the first chapter of the Beginner track to the end of a properly practised Intermediate: **about a year**.
That duration is not a teaching pose meant to make you wait. It is the result of dividing chapter 2.2 by your rate of trades.

ERR: The classic mistake
Moving to the next level by reading rather than by practice. You can read the Experienced track tomorrow morning, nothing stops you. It will be of no use to you until you have the 100 trades on a stable version — for exactly the same reason the module 2 protocol is of no use without a sample.

KEY: Key points
- Entry condition for the Experienced level: written system, 100 compliant trades, average R above the criterion.
- Going live brings all the behaviour back, under harsher conditions.
- Beginner and Intermediate properly practised: about a year.', 33);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, 'EX', 'Write your system', 'EXF: Skill assessed
Goal 24: write a one-page system document and run a monthly review ending in a written decision.

EXF: Instructions
**Step A.** Write your system document: six sections, one page.
**Step B.** You are shown three situations. For each, re-read your own document and say what decision it imposes on you.
**Step C.** You are given a month of journal. Run the review: three questions, one decision.

EXF: What the platform must provide
- Step A: a six-section form, **250 characters maximum per section**. That limit is pedagogical, not technical: it makes the system-with-exceptions materially impossible. An automatic header generates version, date and trade counter.
- Step B: three chart situations, with the user''s document **shown permanently alongside**. For each, two buttons — "I take it", "I don''t take it" — and a third, essential one: "**my document does not settle this**".
- Step C: a supplied month of journal showing compliance, number of trades since modification and average R, then three possible decisions of which only one is selectable.
- If the user''s Beginner journal is available, step A pre-fills scope and management from their real trades. **Fallback**: empty sections and an example document available at all times.

EXF: Worked correction
**Step B.** The three situations are chosen so that at least one is not settled by a typical document. So the expected outcome is not a right answer: it is the third button. The correction then asks the user to complete the document on that precise point — and that is the real deliverable of the exercise. A user who never presses "my document does not settle this" has probably answered from intuition rather than from their text.
**Step C.** The supplied month shows compliance 94%, 71 trades since modification, average R +0.08 R, criterion at +0.10 R. The right decision is **change nothing**, because the sample is below 100.
It is an exact reproduction of "month 2" from chapter 6.3, and it is the decision most users refuse to take: the figure is below the criterion, and everything pushes towards acting. The sample rule exists to cover this case and no other — it is never needed when the figures are good.', 34);

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.1', 'What simulation never charged you for', 'HOOK:
Your statement shows 140 compliant trades and a positive average R. It rests on an assumption you have never had the chance to check: that the price asked and the price obtained are the same number.

P: **Slippage**, or **execution gap**, is the difference between the price at which you request a transaction and the price at which it is concluded. In simulation it is zero by construction. In real trading it is whatever it is, and nobody can tell you in advance how much.

P: The Beginner track made you pay two costs: the spread in chapter 1.2, the overnight charges in chapter 1.4. A third was missing, invisible for as long as a simulation engine hands you the displayed price. That one cannot be deduced from any fee schedule: it has to be measured.

P: A **market order** executes at the best price available the instant it arrives, whatever that price is. Your stop-loss is a market order with a trigger attached. The price you write on it is where it wakes up, not where it serves you.

CASE: What one pip is worth on your trade
Capital €1,000, risk 1%: **1 R = €10**. EUR/USD, stop 20 pips from the entry.
Size = €10 ÷ 0.0020 = **5,000 units**.
One pip on 5,000 units is worth 5,000 × 0.0001 = **€0.50**, that is **0.05 R**.
One pip lost on entry and one pip lost on exit therefore cost **0.10 R per round trip**. Over 100 trades: **10 R**, that is €100.
If your simulated average R is +0.15 R, your 100 trades were worth +15 R. That leaves **+5 R**.
This calculation does not estimate your slippage: it measures your **sensitivity** to it. Replace "one pip" with whatever you measure in chapter 1.2.

ERR: The classic mistake
Thinking in percentage of price. One pip on EUR/USD is about 0.009% of the rate — a reassuring figure, and unrelated to the question being asked. What matters is the gap relative to your stop, not to the price: with a 20-pip stop, one pip is **5% of your risk**. The same gap, on a 100-pip stop, would be 1%.

KEY: Key points
- The execution gap is counted as a fraction of your stop, never as a percentage of the price.
- Stop at 20 pips: one pip is 0.05 R. Ten pips are half a losing trade.
- A stop is a market order with a trigger, not a guarantee of price.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.2', 'Measure it instead of believing it', 'HOOK:
You will find the figure neither here nor anywhere else: the only public measurements come from firms that sell their execution. Yours takes twenty-five trades to obtain, and it is the only one that concerns you.

P: Add a **ninth field** to the journal: the execution gap in R, signed. It is worked out from two prices your platform already knows — the one you asked for, the one you got — and it is recorded like everything else, in R.

P: Measure entry and exit **separately**. They are not the same events: on entry you choose your moment and nothing is waiting for you. At the stop, you are executed at the precise second price moves against you, in a queue that leans entirely one way.

P: That asymmetry is a consequence of the mechanics, not the result of a study. Do not take it on trust: your two columns will tell you within twenty-five trades whether it shows up for you, at your hours, at your size.

CASE: Six executions, one figure
Same system, 20-pip stop, so 1 pip = 0.05 R.
**On entry** — gaps recorded: 0, −1, +1, 0, −1, +1 pip. Sum: **0 pips**.
**On the stop exit** — gaps recorded: −1, −4, 0, −2, −1, −9 pips. Sum: **−17 pips**, that is −0.85 R over six trades, so **−0.14 R per trade**.
Your simulated average R of +0.20 R becomes **+0.06 R** (0.20 − 0.14).
Now take out the −9: the other five exits cost −8 pips, that is −0.08 R per trade. **One trade in six carries half the total cost.**

ERR: The classic mistake
Taking the median. It is −1.5 pips in this record and gives a comfortable, false picture. Expectancy is a mean: it is the mean that goes into its calculation. The median serves another purpose, and a useful one — it tells you your usual cost is not your average cost, and therefore that a month without a bad fill proves nothing at all.

KEY: Key points
- Ninth journal field: the execution gap in R, signed, entry and exit separately.
- The mean goes into the expectancy. The median only tells you what an ordinary day looks like.
- Twenty-five trades are enough for that figure. Chapter 2.1 explains why so few.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.3', 'The moments when price jumps', 'HOOK:
A stop protects you from a movement. It does not protect you from a hole. The difference between the two turns up once or twice a year, and it is settled in one second.

P: A **price gap** is a range of prices in which no transaction took place: the market quotes 40,000, then 38,800, and nothing in between. Your stop sitting in the middle was not ignored. It was triggered, then executed at the first available price.

P: This is no exotic market accident. Andersen, Bollerslev, Diebold and Vega established in 2003 that macroeconomic announcement surprises produce conditional mean jumps in spot exchange rates, within minutes, with a more pronounced effect for bad news.

P: Three families cover almost every case: scheduled announcements, whose timing you know in advance; the weekly foreign-exchange open, which digests a weekend of news; the quiet hours in crypto, where the market stays open without staying liquid.

CASE: The stop that did not serve
BTC/USD at 40,000. Capital €1,000, risk 1%: 1 R = €10. Stop 400 below the entry.
Size = 10 ÷ 400 = **0.025 BTC**. At that size, 400 of movement is indeed worth 1 R.
In a quiet hour, price goes from 40,000 to 38,800 with no transaction in between. Your stop at 39,600 is triggered, then executed at 38,800.
Loss = 0.025 × 1,200 = **€30**, that is **3 R**.
Three times the calculated risk, on a perfectly compliant trade. The Intermediate track''s eighth rule caps cumulative exposure at 2%: this one trade has just cost 3%.

ERR: The classic mistake
Believing the stop bounds the loss. It bounds it when price passes through every level, which is the case the overwhelming majority of the time — and that is exactly why the belief survives so well. The days when it bounds nothing are, by construction, the days when the move is large. The protection disappears at the precise moment it would be useful.

KEY: Key points
- A price gap goes straight through your stop without stopping. Your loss is no longer bounded by your calculation.
- Three families: scheduled announcements, the weekly open, quiet hours in crypto.
- Cumulative exposure and price gaps are two distinct risks. No rule covers both.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.4', 'Your expectancy, recalculated', 'HOOK:
You have an average R, an abandonment criterion and 140 trades. What you are missing is one subtraction — and it is enough to move your system from the good to the bad side of your own criterion.

P: **Net expectancy** is your gross expectancy less the average execution cost you have measured. It, and it alone, describes what your system would produce with real money. The gross figure describes what it produced in an environment that charges nothing.

P: The abandonment criterion in chapter 2.5 of the Intermediate track was written on the gross quantity, for want of anything else. It has to be rewritten on the net one, and that rewriting is a modification of the system document: it increments the version and resets the trade counter to zero.

CASE: The same system, twice
**Gross expectancy**: +0.18 R over 140 compliant trades. Abandonment criterion: +0.10 R. The system passes.
**Measured execution cost**: 0.14 R per trade, entry and exit together.
**Net expectancy**: 0.18 − 0.14 = **+0.04 R**. The system no longer passes.
**And the uncertainty**: with a standard deviation of 1.2 R over 140 trades, the standard error is 1.2 ÷ √140 = **0.10 R**.
+0.04 R give or take 0.10 R is not distinguishable from zero. So the conclusion is not "my system is bad". It is **"I don''t know"**, which chapter 1.4 of the Intermediate track describes as the most frequent result of an honest analysis.

ERR: The classic mistake
Subtracting the cost and keeping the criterion. That criterion was written for a gross quantity; applying it unchanged to a net one tightens it at a stroke, without your having decided or dated the change. It is a system modification disguised as a calculation — the most discreet form of the untracked modification from chapter 6.2 of the Intermediate track.

KEY: Key points
- Net expectancy = gross expectancy − measured execution cost. That is what is compared to the criterion.
- Rewrite the criterion on the net figure, increment the version, reset the counter.
- A net result contained within its standard error concludes nothing, in either direction.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, 'EX', 'The same trade, two prices', 'EXF: Skill assessed
Goals 25 and 26: measure the gap between price asked and price obtained and express it in R; recalculate a system''s expectancy with that cost included, and conclude.

EXF: Instructions
**Step A.** Twelve decisions are shown to you and executed in perfect simulation. Note the average R of the record.
**Step B.** The same twelve decisions are replayed, identically, with degraded execution. For each, note the gap between price asked and price obtained, on entry then on exit, and convert it into R.
**Step C.** Calculate the net expectancy, compare it to the supplied abandonment criterion, and choose your conclusion from three set wordings.

EXF: What the platform must provide
- A configurable degraded-execution engine, **asymmetric** between entry and stop exit, drawing gaps from a fat-tailed distribution: at least one of the twelve trades must carry a gap far larger than the other eleven.
- Two columns shown at all times, **price asked** and **price obtained**, and a third computed automatically in R.
- An input field for the average gap in R, tolerance ±0.02 R, and a second one for the net expectancy.
- Step C: three selectable conclusions — "passes the criterion", "does not pass the criterion", "concludes nothing" — with the standard error displayed alongside.
- **Fallback** if degraded execution is not available: two pre-computed records shown side by side, the subtraction left to the user. The instructions must then say explicitly that the gap is read rather than lived, and that this is a teaching loss.

EXF: Worked correction
**Step B.** The trap is the trade with the extreme gap. Many users treat it as an anomaly and remove it from the calculation — a natural gesture, and a wrong one: it is a cost genuinely incurred, and setting it aside amounts to measuring your execution while excluding the moments when it is bad. The record is built so that this single trade carries about half the total cost.
**Step C.** The right answer is **"concludes nothing"**. The net expectancy computed is positive, but smaller than its standard error. "Passes the criterion" is tempting because the number is on the right side; "does not pass" is just as tempting for cautious readers. Both commit the same error — concluding on a figure smaller than its uncertainty — and module 1 of the Intermediate track has forbidden it for the last 100 trades.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.1', 'The first size is not the system''s size', 'HOOK:
Your system document says 1%. It was written by someone who had never paid an execution gap in their life. That someone is you, a few months ago.

P: A **starting stage** is an initial period during which the risk per trade is deliberately below that of your written system, for the sole purpose of measuring your execution cost. It has one question, only one, and it ends when that question has its answer.

P: It is not a trial period, not a warm-up, not a way of easing in. What those three phrasings have in common is that they suggest the stage is preparing something. It prepares nothing: it measures a quantity, and that quantity may perfectly well conclude that there is no next step.

P: The choice of question is not free. It follows from an unpleasant arithmetical fact, which module 2 of the Intermediate track already established in another form: some quantities can be measured in a few weeks, others will never be measured at all.

CASE: Twenty-five trades, or one thousand six hundred
The standard error is the dispersion divided by the square root of the number of observations. To bring it down to a wanted value you therefore need **the square** of the ratio between the two.
**Measuring your execution cost** — dispersion of the gaps: 0.15 R. Precision wanted: 0.03 R. n = (0.15 ÷ 0.03)² = **25 trades**.
**Measuring your expectancy** — dispersion of results: 1.2 R. Same precision wanted: 0.03 R. n = (1.2 ÷ 0.03)² = **1,600 trades**.
Sixty-four times more, for the same precision. At three compliant trades a week: **eight weeks** in the first case, **more than ten years** in the second.
The stage measures the first quantity. It will never measure the second.

ERR: The classic mistake
Expecting the stage to tell you whether the system works with real money. That is the question everyone asks and the one twenty-five trades will not answer — nor two hundred, nor five hundred. A stage that claims to answer it is no longer a measurement: it is an observation period with no criterion, and module 2 of the Intermediate track has a name for that.

KEY: Key points
- The stage measures execution: 25 trades. It does not measure expectancy: that would take 1,600.
- A stage has a single question and an end defined by that question.
- What ends a stage is a measurement obtained, never an impression acquired.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.2', 'The starting stage', 'HOOK:
Four lines, written before the first order, dated. Written afterwards they are no longer rules: they are commentary on what happened.

P: Four elements, not one more. **The fraction** of your system''s risk. **The minimum number of trades**. **The quantity measured**, named precisely. **What ends the stage**, worded so that a third party can see the end without asking you.

P: The fraction is your choice, but it is not free for all that: it has to pass a test. The stage''s worst case — every trade a loser — must stay below the stop threshold the Beginner track''s seventh rule already imposes on you. A fraction that fails that test would turn the measurement into an incident.

CASE: The stage written down, and its worst case
System: 1% risk per trade, so 1 R = €10. **Stage at a quarter**: €2.50 per trade.
Length: **25 compliant trades minimum**, that is about eight weeks.
Quantity measured: execution gap on entry and at the stop, in R, recorded separately.
Worst case bounded: 25 trades all losing would cost 25 × €2.50 = **€62.50**, that is **6.25% of capital**.
The Beginner track''s seventh rule stops everything at 10% monthly drawdown. The stage''s worst case therefore falls **below** your own stop threshold. That is the criterion that validates a fraction, and it is the only one.

ERR: The classic mistake
Choosing the fraction from the amount you feel ready to lose. The reasoning looks prudent, and it is back to front. The fraction is deduced from a threshold you have already written and dated; the amount that feels bearable, on the other hand, changes with the week, with tiredness, with the last result. You spent a year giving yourself rules precisely so as to stop deciding that way.

KEY: Key points
- Four lines: fraction, number of trades, quantity measured, end of the stage.
- The stage''s worst case must stay below your drawdown threshold. That is what validates the fraction.
- The end of the stage authorises nothing. It dates a recalculation.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.3', 'What this stage measures, and what it does not', 'HOOK:
Twenty-five trades will give you one solid figure and one illusion. The figure is your execution cost. The illusion is absolutely everything else.

P: What it really measures: the execution gap on entry, the gap at the stop, how the spread behaves at the hours you operate, and one thing no documentation will tell you — whether your platform does what you think it does when price moves fast.

P: What it does not measure: your expectancy, which the previous chapter put at 1,600 trades. Nor your system''s decay, which is the subject of module 5. Nor your behaviour under real loss, and that is the most serious of the three gaps, because it is the one you will believe you have filled.

CASE: What twenty-five trades do not contain
System with 45% winning trades. Probability that five consecutive trades all lose: 0.55⁵ = **5.0%**.
Over a sequence of 25 trades, the probability of at least one such run appearing is **43%**.
In other words: **more than one stage in two runs its course without your meeting your ordinary worst run.**
And if it does appear, it costs 5 × €2.50 = €12.50, that is 1.25% of capital. You will not really have felt it either.
Over a full year at three trades a week — 156 trades — that same run has a **98%** chance of occurring. It is waiting for you. It simply was not in the sample.

ERR: The classic mistake
Concluding from a calm stage that the move went well. Twenty-five trades at a quarter size produce an emotional experience close to zero, and that is intended: the stage is designed to be bearable. Taking it as proof that real money suits you is like judging a vaccine on the absence of illness during the week of the booster.

KEY: Key points
- The stage measures execution, the spread at your hours, and how your platform actually behaves.
- It measures neither your expectancy, nor the system''s decay, nor your behaviour under loss.
- A calm stage is not information. It is the outcome expected by construction.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.4', 'Staying in simulation is an answer', 'HOOK:
Of the three possible outcomes of a stage, two are written "not now". That is not a quirk of teacherly caution: it is what the arithmetic of the two previous chapters produces.

P: A decision to do nothing is a decision. It is dated, it is written down, it names the measurement it rests on, and it says what would have to change for it to be reviewed. Without those four elements it is not a decision: it is a postponement, and a postponement gets reopened every week.

P: Across 14,799 French clients tracked for four years by the AMF, **89% lose money**. Nothing you have just measured takes you out of that proportion. You measured your execution — a technical parameter, over twenty-five trades. You measured nothing else.

CASE: Three records, three decisions
**Record A** — gross +0.12 R, measured execution cost 0.16 R, net **−0.04 R**. The system loses once executed. Decision: **back to simulation**. The stage did exactly its job, for €62.50 at worst.
**Record B** — gross +0.22 R, cost 0.09 R, net **+0.13 R** over 25 trades. Standard error: 1.2 ÷ √25 = **0.24 R**. The figure is half the size of its uncertainty. Decision: **nothing is concluded**.
**Record C** — same net result, but over 140 trades. Standard error: 1.2 ÷ √140 = **0.10 R**. The sign is established. Decision: the measurement **does not stand in the way** of your committing money. It does not advise it, and it says nothing about what you can afford to lose — that question does not belong to this document.

ERR: The classic mistake
Reading the end of the stage as a green light. A stage issues no authorisation; it removes one objection out of the five or six you ought to have. The others — your savings, your outgoings, your horizon, what losing the whole sum would change in your life — are neither technical nor measurable here, and no course has the material to judge them for you.

KEY: Key points
- Two outcomes out of three, at this stage, are written "not now". That is the normal proportion.
- A favourable measurement lifts one objection among several. It lifts no others.
- Staying in simulation is decided, dated and written down like any other decision.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, 'EX', 'The stage you write', 'EXF: Skill assessed
Goal 27: define a reduced-size starting stage and write the measurement criterion — not a result criterion — that authorises its reassessment.

EXF: Instructions
**Step A.** From your system document, write your stage: fraction, number of trades, quantity measured, end of the stage.
**Step B.** Three fractions are offered along with your drawdown threshold. Say which ones pass the worst-case test, and for those that fail, give the maximum number of trades that would make them acceptable.
**Step C.** Three end-of-stage records are shown to you. Choose one of the three decisions for each, and justify it by naming the quantity that settles it.

EXF: What the platform must provide
- Step A: a four-field form, **120 characters maximum** each, with the user''s system document shown permanently alongside. The "end of the stage" field refuses any entry containing a result word — "if it works", "if I''m comfortable", "if I''m winning" — and says why.
- Step B: three fractions, the drawdown threshold taken from the profile, and a worst-case calculator that is visible but **not pre-filled**.
- Step C: three records showing gross expectancy, execution cost, number of trades and computed standard error, with three selectable decisions — "back to simulation", "nothing is concluded", "the measurement does not stand in the way".
- If the user''s system document exists, step A pre-fills the reference risk. **Fallback**: empty fields and an example stage available at all times, with a complete fictional system document.

EXF: Worked correction
**Step B.** The largest fraction fails, and many users validate it anyway because the amount in euros stays modest. That is the back-to-front reasoning of chapter 2.2: the test is not about what feels bearable, it is about a threshold already written down. The second part of the question — the number of trades that would make the fraction acceptable — is what separates a rule understood from a rule learned.
**Step C.** Record B is the one that traps people. Its net expectancy is clearly positive and the reader wants to conclude; its standard error is twice as large. Answering "the measurement does not stand in the way" on record B is the most frequent error in this whole module, and it is exactly the error of chapter 1.1 of the Intermediate track, committed a year later with something real at stake.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.1', 'What 1 R becomes when it is money', 'HOOK:
Ten euros is nothing. Except that it is no longer ten euros: it is the first dated proof that your method can cost you something, and it has your name on it.

P: In simulation, R was a unit of account. It made results comparable and emotions absent — that was its very purpose, and the Beginner track introduced it for that in chapter 2.1. With real money the same unit becomes a signal, and a signal gets processed whether you like it or not.

P: Module 5 of the Beginner track described three documented behaviours to you, which you then spotted in your journal, one at a time, in cold blood, several days later. That was the only way simulation could have you meet them. It is not the way they present themselves.

CASE: The run that is waiting for you
System with 45% winning trades. Probability that five consecutive trades all lose: 0.55⁵ = **5.0%**.
Over the 25 trades of a stage: a **43%** chance of meeting one.
Over 156 trades — a year at three a week: **98%**.
Five consecutive losses at 1% cost **5 R**, that is €50 on capital of €1,000. The amount is small and the event is ordinary.
The amount is not the problem. The problem is that it arrives accompanied by the conviction that something has just broken — and that conviction was not in your simulation.

ERR: The classic mistake
Treating the first real run as information about the system. It is not: module 1 of the Intermediate track established that a run of that length is variance and is distinguishable from nothing at all. What it teaches you is elsewhere — about you — and it appears in no statement.

KEY: Key points
- Five consecutive losses: a 5% chance at every trade, 98% over a full year.
- The run is anticipated by your system. What was not anticipated is its effect on you.
- A run of that length says nothing about the system. The Intermediate track put numbers on that in module 1.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.2', 'The three biases do not come back separately', 'HOOK:
The three biases arrive together, in the same session, and in an order that has its own logic. You had met them one at a time in your journal, in cold blood, several days after the fact.

P: The chain always starts the same way. A compliant loss, no fault. The next trade starts well, and you close it early to "lock it in" — that is the disposition effect, and it looks reasonable since it turns a floating gain into a realised one.

P: Except that a gain of 0.4 R does not offset a loss of 1.0 R. The remaining gap calls for a third trade, which was not in the session''s plan: that is overtrading. And when that one fails in turn, the size of the fourth becomes the only variable that can still close the gap before the close.

P: Every link presents itself as the reasonable repair of the one before. That is what makes them hard to see from the inside: at the moment you commit them, you are not giving in, you are correcting.

CASE: One session, four trades
**Trade 1** — compliant, no fault. Result: **−1.0 R**.
**Trade 2** — compliant entry, target written at +2.0 R, closed at **+0.4 R** to lock it in. Disposition effect.
**Trade 3** — outside the checklist, taken to get back to even. **−1.0 R**. Overtrading.
**Trade 4** — size doubled. **−2.0 R**. The spiral.
Session: −1.0 + 0.4 − 1.0 − 2.0 = **−3.6 R**, that is 3.6% of capital.
What your rules anticipated: "two losses, the session is over" closed the day after trade 3, at **−1.6 R**.
Gap between the session lived and the session planned: **2.0 R**, which is what a system at +0.18 R produces on average over eleven trades.

ERR: The classic mistake
Asking which of the three errors cost the most. The question is badly put: they do not add up, they chain together. Trade 4 exists only because trade 3 failed, and trade 3 exists only because trade 2 returned 0.4 R instead of 2.0 R. Fixing the last link only moves the breaking point back one notch.

KEY: Key points
- The three biases from module 5 of the Beginner track form a chain, not a list.
- Every link presents itself as the reasonable repair of the one before.
- The rule that cuts the chain is the oldest one: two losses, the session is over.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.3', 'The stopping protocol: threshold, duration, resumption', 'HOOK:
Your eight rules close a session. None of them closes an account. As long as everything happened in simulation, that difference had no consequence.

P: A **stopping protocol** is a rule written in advance that suspends all real activity beyond a threshold, for a fixed duration, with a resumption condition a third party could check. Three elements, all of them numerical or dated, none left to judgement in the moment. It is the **ninth rule**, and it completes the seventh without replacing it: the seventh says when to stop, the ninth says for how long and on what condition you resume.

P: The threshold is the hard part, and the error there is systematically in the same direction: too tight. A threshold set inside your system''s ordinary dispersion will fire on a perfectly healthy system, regularly, and you will end up going round it — and then deleting it.

CASE: Two thresholds, only one that holds
System whose results have a standard deviation of 1.2 R per trade. Over a window of 20 trades, the standard deviation of the **sum** is 1.2 × √20 = **5.4 R**.
**Threshold A — stop at −5 R.** It sits inside one standard deviation of ordinary dispersion. It will fire on noise, often, and signal nothing.
**Threshold B — stop at −10 R**, that is 10% of capital: the threshold the Beginner track''s seventh rule already imposes on you. At close to two standard deviations, it no longer responds to noise.
And the cost of stopping: the fixed duration, plus the resumption condition. Twenty compliant trades in simulation, at three a week, is **nearly seven weeks**.
A threshold that is too tight leaves you permanently stopped. It is the stop-in-the-noise of chapter 2.4 of the Beginner track, transposed to the scale of the account.

ERR: The classic mistake
Writing the resumption condition in terms of an inner state. "I resume when I feel clear-headed again" is not checkable, and will be checked favourably the very next morning. A resumption condition is an act observable from outside: a number of compliant trades in simulation, a written review, a date. Exactly the transmissibility criterion of chapter 6.1 of the Intermediate track.

KEY: Key points
- Three elements: a threshold, a duration, a resumption condition checkable from outside.
- A threshold less than one standard deviation from the dispersion fires on noise.
- The resumption condition is a dated act, never a felt state.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.4', 'The rules real money forces you to rewrite', 'HOOK:
Of the eight rules you apply, six pass into real trading without a comma changing. The other two stop protecting without warning — and they are not the ones you would think.

TABLE: 56,44 || Rule | What real money does to it
Fixed risk of 1% per trade | Unchanged
Three trades maximum per session | Unchanged
Two losses: the session is over | Unchanged, and becomes the most useful of the eight
Thirty minutes'' wait after any loss | **To be re-quantified**: the trigger changes
No order without the checklist answers | Unchanged — the checklist itself goes to eight questions
Target and stop not renegotiable | Unchanged
Drawdown of 10% on the month: full stop | **Completed** by the ninth rule, chapter 3.3
Maximum cumulative exposure of 2% | Unchanged, and still blind to price gaps

P: The thirty-minute rule was written for a loss that cost nothing. Its trigger is the fact of losing. With real money, what determines the time you need is not the fact of losing: it is the amount lost, and that varies by a factor of three within a single day.

CASE: The thirty-minute rule, measured
Take from your journal the delay between closing a losing trade and the next order.
**In simulation**: median delay of 34 minutes. The rule is respected effortlessly, because nothing pushes you to get round it.
**In real trading, on two-loss days**: median delay of 9 minutes. The rule was not abandoned — it was got round once, and then every time.
The fix is not to lengthen the duration, which would be got round just the same. It is to change the trigger: **thirty minutes after a loss of 1 R, the whole session after 2 R lost in the day.**
You only get that figure by recording the delay. It is a tenth journal field — and that one is optional, unlike the ninth.

ERR: The classic mistake
Rewriting all eight rules at once when you make the move. A rule rewritten before it has been found wanting is a rule written on a supposition. Six of the eight hold as they are; changing them all together amounts to altering the system on eight points with no sample, which chapter 6.4 of the Intermediate track already forbids for a single one.

KEY: Key points
- Six rules out of eight pass into real trading unmodified. Leave them alone.
- The thirty-minute rule changes trigger: the amount lost, not the fact of losing.
- The seventh rule is completed by the ninth: threshold, duration, resumption condition.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, 'EX', 'Your session, degraded', 'EXF: Skill assessed
Goals 28 and 29: recognise in your own journal a behaviour from module 5 of the Beginner track reappearing under real constraint and name the rule that covers it; write a stopping protocol and apply it to a degraded session.

EXF: Instructions
**Step A.** A four-trade session runs under time pressure, with degraded execution and a running result displayed in euros, not in R. At each decision, you choose. The session does not pause.
**Step B.** Once the session is over, your own Beginner-track journal opens beside the session record. Identify the same behaviour in both, and name the rule that covers it.
**Step C.** Write your stopping protocol — threshold, duration, resumption condition — then replay the step A session with that protocol active.

EXF: What the platform must provide
- Step A: a **non-interruptible** session, timed, with the running result displayed **in euros**. It is the only screen in the whole track where R disappears, and that is deliberate: module 3 is about what that conversion does.
- Degraded execution active, with one of the four trades taking a marked gap on the stop exit.
- Step B: import of the user''s Beginner journal, highlighting trades whose result departs from the written target. **Fallback** if the journal is missing or holds fewer than 30 compliant trades: a supplied journal, presented as another user''s, with the same mechanics — the exact fallback from exercise 1 of the Intermediate track.
- Step C: a three-field form, the "resumption" field refusing state-based wordings, and a calculator for the standard deviation of the sum over 20 trades, displayed but not pre-filled.
- **Fallback** if degraded execution is unavailable: the session runs with perfect execution, timer and euro display kept. The essentials of module 3 survive; the execution gap on trade 4 does not.

EXF: Worked correction
**Step A.** The session is built so that closing trade 2 early is **rewarded immediately**: price does indeed come back against the position right afterwards. That is the central trap, and it is an honest one — the disposition effect is not stupidity, it is a gesture that is right often and costs anyway. The record then shows price reaching the target forty minutes later.
**Step B.** The frequent error is to name the spiral, which is spectacular and comes last. The behaviour present **in both journals** is the disposition effect, far more discreet, and it is the first link. A user who finds nothing in their Beginner journal has probably looked for a serious fault where they should have looked for a 0.3 R gap repeated fifteen times.
**Step C.** A threshold below 6 R fires the stop during the step A session, which looks like the right result and is not: the calculator shows that at 1.2 R of standard deviation, that threshold would also fire on an ordinary run. The right answer stops the session by the two-loss rule, not by the protocol. The protocol is never what serves within a single session.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.1', 'When three categories are no longer enough', 'HOOK:
With three positions you have three pairs to examine and you do it in your head in five seconds. With seven you have twenty-one — and you no longer do it at all.

P: Chapter 5.2 of the Intermediate track gave you three correlation categories and a rule that applies to a pair. It was sufficient because at two or three positions the number of pairs stays below the number of positions. That property stops at three, and it stops abruptly.

P: What replaces examining pairs is not a finer calculation. An **exposure group** brings together the positions that lose in the same scenario — it is the question asked in chapter 5.1 of the Intermediate track, turned into a sorting tool. A scenario, unlike a coefficient, does not change value while you are looking at it.

CASE: Three pairs, or twenty-one
Number of pairs to examine = n(n − 1) ÷ 2. **3 positions**: 3 pairs. **5 positions**: 10. **7 positions**: **21**.
At twenty seconds a pair, seven positions demand **seven minutes of checking before every order**. You will not do them, and you will be right not to.
The method that replaces it fits in three lines:
**1.** Group your positions by shared losing scenario.
**2.** Within a group, **risks add up** — three positions at 1% that lose together expose 3%, as chapter 5.1 of the Intermediate track already said.
**3.** Between groups, apply the categories: above +0.3 the smaller counts half, below that they add up, and opposite directions subtract.

ERR: The classic mistake
Extending the pairs rule to five positions by applying it pair after pair. You then get as many results as there are possible orders of examination, and the most flattering one ends up winning — not through bad faith, simply because it comes last and you stop when the figure passes. Grouping, by contrast, does not depend on the order you look in.

KEY: Key points
- The number of pairs grows as the square. Seven positions: twenty-one pairs.
- Within a group that loses together, risks add up. No exceptions.
- Between groups only, the three correlation categories apply.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.2', 'Correlation moves when the market moves', 'HOOK:
You classed your two positions at +0.15 when you placed the orders. They hit their stops within the same hour. Both statements are accurate, and that is the problem.

P: A correlation is measured over a window. It describes what happened in that window, and it will describe the previous regime for the whole duration of the next one. That is not a defect in the measurement: it is what an average does.

P: Mancini, Ranaldo and Wrampelmeyer established in 2013 that illiquidity episodes occur **simultaneously** across currency pairs, with strong commonality. In other words, the moment your diversification ought to serve is precisely the moment it is least present.

CASE: The classification that switches sides
**When the orders are placed** — long EUR/USD 1%, long BTC/USD 1%. Correlation measured over 90 days: **+0.15**. Two distinct groups, so add: exposure announced at **2%**.
**Three weeks later** — an episode of stress lifts the dollar and empties the books. Both positions hit their stops within the same hour. They were not two groups: they were two bets against the dollar.
Realised loss: **2%**. So the addition had given the right figure.
What would have been wrong is replacing it with a half-sum on the strength of that +0.15. The coefficient was not mistaken — the window it was computed over simply did not contain the episode.

ERR: The classic mistake
Lengthening the calculation window to get a "more stable" coefficient. A long window does not stabilise the correlation: it slows its estimate down, and will describe the previous regime to you throughout the next one. Chapter 5.2 of the Intermediate track already settled the question of precision; this chapter adds that slowness is paid for at the worst moment.

KEY: Key points
- A correlation describes the past of the window it is computed over.
- Illiquidity arrives simultaneously across pairs. Diversification is missing when it would serve.
- Group by shared scenario. A scenario is not re-estimated while the market moves.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.3', 'Refusing a position: the order of priority', 'HOOK:
Your limit is reached and a very good trade turns up. The question is not whether it is good: it is. It is which of the five you refuse — and that answer has to exist before the question.

P: Three refusal rules are defensible, and you have to choose exactly one. **The last to arrive**: the trade in front of you. **The worst ratio**: the one whose gain sought relative to risk is lowest. **The biggest group**: the one that would swell the most exposed block.

P: The first has an advantage the other two do not: it reopens no existing position. The other two force you to reassess trades that are already open, with their target and their stop, at the moment another trade appeals to you. That is where the Beginner track''s sixth rule dies, not anywhere else.

CASE: Five positions, one limit
Open: long EUR/USD 0.6% · long GBP/USD 0.6% · long BTC/USD 0.5% · short USD/JPY 0.4%.
Group "the dollar falls": EUR/USD, GBP/USD and the short USD/JPY are three identical bets. Sum: 0.6 + 0.6 + 0.4 = **1.6%**.
Group "crypto", weakly correlated with the first: **0.5%**.
Total exposure: **2.1%**. The 2% limit is exceeded **before** the fifth trade even turns up.
So the fifth is not up for discussion. What is up for discussion is what you do about the 0.1% too many — and if your answer is "I''ll cut an open position", read the previous line again.

ERR: The classic mistake
Making room by cutting an open position. The arithmetic looks neutral: same total exposure, one more trade. It is not. You have just renegotiated an open position in favour of a position that does not exist yet, and you did it with a calculation rather than an emotion — which makes it far harder to spot in your journal.

KEY: Key points
- The order of refusal is written beforehand, never at the moment a good trade turns up.
- By default: the last to arrive. It is the only refusal that reopens nothing.
- Cutting an open position to make room for another is renegotiating. Rule 6 forbids it.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.4', 'The ceiling you can no longer check by eye', 'HOOK:
"Checkable in five seconds before every order," said the Intermediate track of its eighth rule. That was true at three positions. The rule says nothing anywhere about what to do when it stops being true.

P: An **exposure table** is a sheet you keep yourself, outside the platform, with one row per open position and four columns: asset, direction, risk as a percentage, group. Plus a total row. It is updated before the order, like the position size.

P: The eighth rule does not change and neither does the eighth checklist question. What changes is where the answer comes from: a table you keep, no longer a memory. At three positions memory was enough; at five it systematically produces the lowest figure.

CASE: The table, and what it costs
Four columns, one row per position, one total row.
Update before every order: **one row to write and one sum to redo**, about twenty seconds, whatever the number of positions.
Seven minutes for the pair-by-pair examination of chapter 4.1, twenty seconds for the table: a ratio of **1 to 21**.
And above all, a cost that does not grow. That is the only property that matters here: a check whose cost rises with the number of positions will be abandoned at exactly the moment it becomes necessary.

ERR: The classic mistake
Keeping the table inside the broker''s interface. It displays risk position by position and knows nothing of your groups — chapter 5.1 of the Intermediate track already established that. It has a second flaw, particular to real trading: it does not belong to you. The day you change provider, your table disappears, and with it the history that would tell you how long your limit has been exceeded.

KEY: Key points
- Four columns: asset, direction, risk, group. Plus a total row.
- Twenty seconds before every order, whatever the number of open positions.
- The table stays with you. What the broker''s platform holds does not belong to you.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, 'EX', 'Five positions, one limit', 'EXF: Skill assessed
Goals 30 and 31: calculate the exposure of a portfolio of more than three positions taking direction and groups into account; decide which position to refuse when the limit is reached, naming the rule that settles it.

EXF: Instructions
**Step A.** You are shown a portfolio of six positions. Form the groups, then calculate the total exposure.
**Step B.** The same portfolio is shown to you three weeks later, with a correlation matrix that has changed category on two pairings. Recalculate, and say whether your original decision would have been different.
**Step C.** A seventh trade turns up with the limit already reached. Apply your refusal rule, written at the previous step, and name the Beginner or Intermediate rule that forbids the other two solutions.

EXF: What the platform must provide
- A six-position portfolio screen with asset, **direction**, risk as a percentage, and a drag-and-drop grouping area — the user forms the groups themselves, the platform never proposes them.
- A correlation matrix in three colours, as in exercise 5 of the Intermediate track, and a "three weeks later" button that changes it without changing the positions.
- A field for total exposure, tolerance ±0.1 points, and a timer for step A, displayed only at the end.
- Step C: three solutions offered — refuse the last to arrive, cut an open position, refuse the worst ratio — and a field for naming the rule broken by the middle solution.
- **Fallback** if drag and drop is unavailable: groups formed by tick boxes, mechanics and correction identical.

EXF: Worked correction
**Step A.** The trap is the short among the longs, as in the Intermediate track — but here it is inverted: the short USD/JPY **joins** the group of bets against the dollar instead of offsetting it, because the dollar is what is being sold in both cases. A user who mechanically applies "opposite directions, subtract" is out by 0.8 points. Direction is read off the scenario, not off the name of the pair.
**Step B.** The expected answer is that the original decision **does not change**, and that is counter-intuitive: two pairings changed category, so something ought to move. Nothing moves, because the groups were formed on scenarios and the scenarios have not changed. That is the whole teaching of chapter 4.2, and it can only be demonstrated by doing it twice.
**Step C.** "Cut an open position" is chosen by a large share of users, because it is the only solution that lets you take the good trade. The rule broken is the Beginner track''s sixth — target and stop not renegotiable — and the difficulty of the exercise is naming it when no target and no stop has been explicitly moved.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.1', 'Bad run or decay: the badly put question', 'HOOK:
Thirty trades without gaining anything. You want to know whether your edge has gone. That question has no answer — not because it is hard, but because it is asked afterwards.

P: **Decay** is the lasting disappearance of a system''s edge. A bad run is a sequence of negative results that comes down to variance. Both produce the same statement, the same feeling and the same urge to do something.

P: Nothing in your data separates them. That is an arithmetical fact, not a shortage of method, and it is not fixed by looking harder. What separates them is elsewhere: in whether a threshold was written beforehand, or was not.

CASE: Fifty trades that prove nothing
System at **+0.15 R** of net expectancy, standard deviation **1.2 R** per trade.
Over 50 trades, the expected sum is 50 × 0.15 = **+7.5 R**, and the standard deviation of that sum is 1.2 × √50 = **8.5 R**.
A sequence of 50 trades finishing at **0 R** therefore sits 0.9 standard deviations below expectation. Perfectly ordinary.
How many trades to detect a fall from +0.15 R to zero? Using the table from chapter 2.2 of the Intermediate track: about **640 trades**, that is more than **four years** at three trades a week.
The conclusion has to be accepted once and for all: **you will never statistically detect the disappearance of your own edge.** This module is about what you do knowing that.

ERR: The classic mistake
Looking for the answer in a slicing of the journal. Segmenting until you find the month it went wrong will always produce a date, since one necessarily exists. Chapter 1.3 of the Intermediate track named that gesture; here it is worse, because the date found then serves to justify a stop or a postponement, and both are paid for in cash.

KEY: Key points
- A run and decay explain the same data. Nothing in the statement separates them.
- Detecting the loss of a 0.15 R edge would take more than four years.
- What settles it is not in the data. It is the date the threshold was written.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.2', 'What the research establishes about the lifespan of an edge', 'HOOK:
Your edge is going to shrink. That is not a prediction about you: it is the best-documented result in the field, measured across hundreds of strategies, and it has an order of magnitude.

P: The loss of performance observed when a rule is applied to data that did not serve to build it is called the **out-of-sample decline**. McLean and Pontiff measured it in 2016 across the 97 variables the literature claimed predicted stock returns: **−26%** out of sample, **−58%** after publication.

P: Falck, Rej and Thesmar extended the work in 2021. The year of publication alone explains **30%** of the variance in that decline, with each year adding about five points. In other words, decay is neither rare nor accidental: it is the rule, and it is accelerating.

P: This work concerns published equity anomalies, not your system, and nothing licenses carrying their coefficient across as it stands. They give an order of magnitude — this is what an ordinary decline looks like when you move from yesterday''s data to tomorrow''s — not a value.

CASE: A decline applied, and what it is worth
Your system: measured gross expectancy **+0.18 R**, measured execution cost **0.14 R**.
Apply the out-of-sample decline of 26%: 0.18 × 0.74 = **+0.133 R**.
Subtract the execution cost: 0.133 − 0.14 = **−0.007 R**.
Three figures, two operations, and the result changes sign.
**This calculation is not a prediction.** It is a sensitivity test: it says that a decline of the order observed everywhere else would be enough to wipe out your edge. It does not say it will happen.

ERR: The classic mistake
Turning the sensitivity test into a forecast — or, just as often, dismissing the decline because "it isn''t about my market". Both gestures have the same cause: wanting a figure where there is only an order of magnitude. The first makes you stop a system that is fine, the second makes you keep one that is not.

KEY: Key points
- McLean and Pontiff, 2016: −26% out of sample, −58% after publication, across 97 variables.
- It is not a coefficient to apply to your system. It is an order of magnitude.
- An edge that does not survive a 26% decline has no margin at all.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.3', 'The test written before the observation', 'HOOK:
A stopping criterion with no false-alarm rate is not a criterion: it is a sentence. Working it out takes two minutes and almost always changes the threshold you were about to write.

P: Four elements, like the abandonment criterion of chapter 2.5 of the Intermediate track, but on a different object. **The quantity** measured. **The threshold**, numerical. **The window** it is measured over. **The action** triggered, written in the present indicative.

P: A criterion''s **false-alarm rate** is the probability that it fires while the system is healthy. It depends on the threshold, but also on the window — the one nobody ever thinks to write down — and the next chapter shows the second weighs more than the first.

CASE: The false-alarm rate of a threshold
Criterion under consideration: "if the net average R of the **last 100 compliant trades** falls below **0 R**, I stop."
Healthy system at +0.15 R net expectancy, standard deviation 1.2 R. Over 100 trades, the standard error of the mean is 1.2 ÷ √100 = **0.12 R**.
The threshold therefore sits (0.15 − 0) ÷ 0.12 = **1.25 standard errors** below the expectancy. The probability of crossing it by pure chance is about **10.6%**.
One chance in nine, **every time you look**. Looking every month on a rolling window, you will stop a perfectly healthy system roughly once a year.
The fix is not about the threshold. It is about the window.

ERR: The classic mistake
Writing the criterion at the moment you need it. A criterion drafted during a bad run is always calibrated not to fire straight away: that is what you are after at that moment, and that is what you get. The Intermediate track''s abandonment criterion is written before the test for exactly the same reason, and module 2 already refused to enable the button without it.

KEY: Key points
- Four elements: the quantity, the threshold, the window, the action.
- Every threshold has a false-alarm rate. Work it out before writing it, not after.
- A criterion drafted during a bad run is calibrated not to fire.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.4', 'The system stopping criterion', 'HOOK:
The abandonment criterion kills a hypothesis under test, and that costs nothing. The stopping criterion closes a system in production, and that costs thirty-three weeks. Confusing the two means paying the second price for the first decision.

P: The **system stopping criterion** applies to a system that is running, with money committed and a journal in progress. The abandonment criterion applied to an idea under evaluation, whose failure left only a dated line in the test log.

P: The difference in cost imposes a difference in calibration. An abandonment criterion can afford to be severe: throwing away a good idea costs one idea. A severe stopping criterion throws away a system and eight months of simulation before any resumption.

CASE: Windows that do not overlap
A **disjoint window** is an evaluation window that shares no trade with the previous one.
Same criterion, same threshold. One single change: it is evaluated **only once per batch of 100 new trades**, never on a rolling window.
At 156 trades a year, that makes **1.56 evaluations a year**.
Expected false alarms: 1.56 × 10.6% = **0.17 a year**, that is one unjustified stop roughly every **six years** — against one a year with the rolling window.
The threshold has not moved by a hundredth. The false-alarm rate has been divided by more than seven, purely because you stopped looking all the time.
And the price of a stop does not move either: 100 compliant trades in simulation before any resumption, that is the **33 weeks** of chapter 6.4 of the Intermediate track.

ERR: The classic mistake
Stopping the system and letting the open positions run. The stop applies to the decision to open, not to what is already committed — that is true, and it is insufficient. Three positions running under a stopped system produce exactly the situation of module 3: management decisions taken with no rule active, on trades you would no longer open today. The criterion has to say what becomes of them.

KEY: Key points
- Abandonment criterion: a hypothesis under test. Stopping criterion: a system in production.
- Evaluate on windows that do not overlap. The threshold does not change, the false alarm does.
- The criterion states what becomes of positions already open. Otherwise they decide alone.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.5', 'Stopping is not failing', 'HOOK:
A stopped system can be retested next year. Lost capital does not come back by the same road, and the arithmetic of that return has been in the Beginner track''s appendices since your first day.

P: The two possible errors do not carry the same price, and it is that imbalance that must govern your threshold. Stopping wrongly costs weeks, a figure known and bounded in advance. Not stopping in time costs capital, and that expense has no written bound.

CASE: The price of hesitation
The table in the Beginner track''s appendices gives the gain needed to return to the starting point.
Stopping at **−10%**: you then need **+11%**. The return is almost symmetrical.
Waiting for **−33%**: you need **+50%**. Waiting for **−50%**: you need **+100%**.
Between the first two rows, the difference is not 23 points of loss. It is the shift from an almost symmetrical return to one that demands half the capital again.
An unjustified stop costs 33 weeks of simulation, roughly every six years. A stop that comes too late costs capital that no rule restores.

ERR: The classic mistake
Treating a stop as a repudiation of the year gone by. The stopped system left you a dated document, a complete journal and an execution measurement that are yours to keep — chapter 6.4 of the Intermediate track calls that precisely a legitimate trigger. What would be lost is not stopping, and no longer being able to say, a year from now, what worked.

KEY: Key points
- The two errors do not carry the same price: one costs weeks, the other costs capital.
- An unjustified stop: 33 weeks, every six years or so. That is a known, bounded price.
- Going back to simulation after a stop is the anticipated course, not a mishap.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, 'EX', 'The system you stop', 'EXF: Skill assessed
Goals 32 and 33: distinguish a bad run from decay by means of a test written before the observation; write and date a system stopping criterion, distinct from the abandonment criterion.

EXF: Instructions
**Step A.** Two sequences of 60 trades are shown to you, unlabelled. One comes from a healthy system going through a bad run, the other from a system whose expectancy has genuinely fallen. Say which is which.
**Step B.** Write your stopping criterion: quantity, threshold, window, action. The calculator displays the false-alarm rate of what you write, live.
**Step C.** Your own record — or the fallback one supplied — is run through the criterion you have just written, first on a rolling window then on disjoint windows. Compare the two answers.

EXF: What the platform must provide
- Two sequences of 60 trades generated with genuinely different expectancies, displayed as an equity curve and as a record. No labels, no clues, and an "I cannot know" button.
- Step B: four fields, plus a false-alarm-rate calculator that takes the standard deviation of the user''s system and updates on every keystroke. The "window" field offers rolling or disjoint, with no default value.
- Step C: the user''s real statistics — net average R, standard deviation, number of trades on the current version. **Fallback** if they are missing or cover fewer than 100 trades: a supplied record of 240 trades, presented as another user''s, with the exercise running identically.
- An export of the drafted criterion, dated, ready to add straight to the Intermediate track''s system document.

EXF: Worked correction
**Step A.** The right answer is **"I cannot know"**, and it is the only exercise in the whole track whose right answer is a refusal to answer. The two sequences are built to be indistinguishable over 60 trades: chapter 5.1 showed it would take about 640. A user who picks one has necessarily picked on something other than the data — most often on the shape of the curve, which is exactly what module 1 of the Intermediate track was already teaching them not to read.
**Step B.** The threshold written spontaneously is almost always too high, and the calculator then shows a false-alarm rate above 25%. The correction does not say which threshold to write: it asks you to lower it until the rate is acceptable **to you**, and to note the value chosen. Your tolerance is the free parameter, not the statistic.
**Step C.** The two windows give different answers on the same record in a majority of cases. That is the expected result and it is unsettling: it shows that part of your stopping decision comes down to how often you look, and not to what your system is doing. Choosing the disjoint window is not a trick for stopping less often — it is refusing to let the frequency of observation enter the decision.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.1', 'The broker: what you can check yourself', 'HOOK:
No name appears in this chapter, and that is not a legal precaution. It is that the right criterion was never the provider''s identity: it is what you can verify about them without taking their word for it.

P: Seven checks, all of them doable before you open anything, all of them documentary. None calls for an opinion, none calls for a comparison site, and each ends in a yes or a no.

UL:
- **Licence**: the regulator and the number, checked in the public register kept by that regulator — not on the provider''s own site.
- **Segregation of client funds**: which contractual document states it, and in exactly what wording.
- **Negative balance protection**: contractual or merely regulatory, and for which client status.
- **Standardised warning**: the percentage of losing accounts the provider publishes itself.
- **Execution policy**: is it published, and what does it say about stop orders in the event of a price gap.
- **Overnight charges**: where are they published, in what form, and with what notice of change.
- **History**: how long the statement stays viewable and exportable after a position is closed.

P: What you cannot check before opening is execution quality. It appears in no document, and the figures published on the subject come from firms that sell that execution. That is the other function of the module 2 stage: its twenty-five trades also measure your provider.

ERR: The classic mistake
Choosing on the displayed spread. It is the one figure pushed everywhere, and chapter 1.1 showed it is only part of the cost. A tight advertised spread with a wide execution gap costs more than an average spread well executed — and that comparison you can only make after opening the account, never before.

KEY: Key points
- Seven documentary checks, all doable before opening, all answered yes or no.
- The licence is checked with the regulator, never on the provider''s site.
- Execution quality cannot be checked in advance. It is measured, and that takes 25 trades.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.2', 'The regulatory protections, and what they do not cover', 'HOOK:
There is a European rule that automatically closes your positions to protect you. On capital of €1,000, it fires once you have lost 91.7% of that capital.

P: In 2018 ESMA adopted four measures applying to leveraged contracts offered to retail clients, subsequently carried into national law. They are not alike and they do not protect against the same thing.

UL:
- **Capped leverage**: 30:1 on major currency pairs, 20:1 on non-majors, 5:1 on shares, **2:1 on cryptocurrencies**.
- **Automatic close-out** of positions when account funds fall to 50% of the minimum required margin.
- **Negative balance protection**, account by account: you cannot owe more than you deposited.
- **Standardised warning**: every provider publishes the percentage of its retail client accounts that lose money.

P: The third is no abstract precaution. On 15 January 2015, the abandonment of the floor between the euro and the Swiss franc left client accounts in debit: FXCM announced $225 million of negative balances, and Alpari UK was placed in administration four days later.

CASE: The protection that arrives afterwards
Capital €1,000. EUR/USD, a position of 5,000 units — the one from chapter 1.1.
Margin required at the maximum 30:1 leverage: 5,000 ÷ 30 = **€166.67**.
Automatic close-out at 50% of that margin: **€83.33**.
So your account is closed for you when €83.33 is left, that is after losing **€916.67** — that is **91.7% of the capital**.
In R: **91.7 R**. Your 1% rule will have fired ninety-one times before the regulatory protection shows up once.

ERR: The classic mistake
Reading these measures as risk management. They bound what you can **owe**, not what you can **lose**, and they were calibrated to avoid a market-wide catastrophe, not to preserve your capital. The only rules that protect your capital are the nine you apply yourself, and every one of them fires far earlier.

KEY: Key points
- Four measures: capped leverage, close-out at 50% of margin, negative balance, published warning.
- They bound what you can owe. They do not bound what you can lose.
- On €1,000, automatic close-out comes at −91.7%. Your rules act at −10%.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.3', 'Record keeping: what your journal is not enough to produce', 'HOOK:
Your journal is there for learning. It is not there to answer somebody who asks you, three years from now, what you did in March.

P: A **record** is the exhaustive, dated statement of all your operations, kept for a third party: a tax authority, an accountant, or yourself in three years. It does not replace the journal, and the journal does not replace it.

P: Three differences separate them. The record is **exhaustive** — it also contains the non-compliant trades your journal filters out. It is **factual** — no scenario, no compliance, no commentary. And it is **exportable**, which is its whole reason for being.

UL:
- Date and time opened, date and time closed.
- Asset and direction.
- Position size.
- Opening price obtained.
- Closing price obtained.
- Costs: spread, commissions, overnight charges.
- Result, in the account currency.

CASE: What three years amounts to
Three trades a week for three years: **468 trades**.
Seven fields per trade: **3,276 values**, not counting account movements.
Reconstructing that after the fact, with no export, is not difficult — it is impossible.
And your provider is under no obligation to keep a viewable history indefinitely. That duration is among the seven checks of chapter 6.1: verify it beforehand, not on the day you need it.
A monthly export costs two minutes. Over thirty-six months, one hour twelve. It is the best ratio in the whole track.

ERR: The classic mistake
Keeping only one of them, thinking the other follows from it. A journal filtered on compliant trades is unusable as a record: it leaves out exactly the operations that are most painful to reconstruct. The record is unusable as a journal: it contains neither scenario nor compliance, that is, neither of the two fields that have produced learning since chapter 6.1 of the Beginner track.

KEY: Key points
- The record is exhaustive, factual and exportable. The journal is filtered, interpreted and private.
- Seven fields, exported once a month. Two minutes.
- How long the history is kept is checked before opening, not after.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.4', 'Tax: the questions, never the answers', 'HOOK:
This chapter contains no rate, no threshold and no regime: a tax rule quoted in a document and read two years later is false information. What it does contain are the seven questions that make a consultation useful, and the document to take with them.

P: Three reasons make any answer impossible here. The rules change, sometimes from one year to the next. They depend on your country of tax residence. And they depend on personal circumstances — status, other income, whether the activity is occasional or habitual — that no course can know.

WARN: What follows is dated
This page is current as of September 2026, and its only stable assertion is this: **the applicable tax rules change and depend on your country.** Any list of rates or thresholds, here or anywhere else, must be treated as out of date until checked with a professional or the relevant authority.

P: What this chapter can give you, on the other hand, are the questions. They are asked once, of a professional, with your chapter 6.3 record under your arm — and a prepared consultation costs less than an improvised one.

UL:
- Which regime applies to these instruments, in my country of tax residence, this year?
- Does tax fall due when each position closes or at the end of the tax year?
- Are losses offsettable? Against what, and for how many years?
- What reporting obligations, on which forms, by what deadlines?
- Does an account opened outside my country of residence create an additional obligation?
- What supporting documents must I keep, and for how long?
- At what point does my activity stop being treated as occasional?

ERR: The classic mistake
Looking for the answer on a forum. The answers there are sincere, often accurate for whoever wrote them, and worthless to you: they depend on a country, a year and a personal situation that are not yours. The cost of a consultation is known in advance; the cost of an inaccurate return is not.

KEY: Key points
- No rate, no threshold: they change and depend on your country. This page is dated.
- Seven questions, one consultation, your record under your arm.
- A prepared consultation costs less than an improvised one.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.5', 'What you decide now', 'HOOK:
This document has never told you to commit money, and it will not in the lines that remain. And yet you are reaching the end of three tracks and about a year of practice.

P: The only deliverable of this track is a dated decision. It fits in five lines, it goes into the system document like any other decision, and it names what would have to change for it to be reviewed.

CASE: The decision, written down
**1.** Gross expectancy measured, and over how many compliant trades.
**2.** Execution cost measured, and over how many trades.
**3.** Net expectancy, and its standard error.
**4.** What my criterion says: above, below, or inside the uncertainty.
**5.** My decision, and what would have to change for me to review it.
Filled in: gross +0.18 R over 140 trades · cost 0.14 R over 25 trades · net **+0.04 R**, standard error 0.10 R · **inside the uncertainty** · *I am staying in simulation, I will review this decision at 300 compliant trades.*

P: Across 14,799 French clients tracked for four years by the AMF, **89% lose money**. That figure opened the Beginner track, it closes this one, and nothing in the three documents has taken you out of it: they taught you to measure, not to win.

P: Staying in simulation is not this track''s consolation prize. For most readers who get here it is its correct conclusion — and it needs no justification beyond line 3 of the sheet above.

ERR: The classic mistake
Treating reading this document as a step completed. Nothing has been completed: you have read six modules, and you hold at best six more measurements than before. Nowhere in these three tracks does anyone tell you that you are ready, and the absence of that moment is the most deliberate thing in the whole work.

KEY: Key points
- The deliverable of this track is a dated decision, not an account opened.
- Five lines: gross, cost, net and its uncertainty, what the criterion says, the decision.
- "I am staying in simulation" is a complete answer. It is the most frequent one, and it is right.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, 'EX', 'Your decision, dated', 'EXF: Skill assessed
Goals 34, 35 and 36: list the checkable criteria for choosing a provider; build a record and the questions to put to a professional; state a dated decision argued from measurements.

EXF: Instructions
**Step A.** Three anonymised provider sheets are shown to you. For each, say which of the seven checks from chapter 6.1 are possible with the material supplied, and which are not.
**Step B.** You are given a raw statement export. Build the seven-field record, then draw up the list of questions that record lets you put to a professional.
**Step C.** Write your decision in five lines, from your own measurements, and date it.

EXF: What the platform must provide
- Three **entirely fictional** sheets, with no name, no logo, no link: only the documentary items listed in chapter 6.1, some of them deliberately missing. No sheet must be "the right one".
- Step B: a realistic raw export — rows out of order, surplus columns, costs in a separate column — and a seven-field grid to fill by dragging the columns.
- Step C: a five-line form, pre-filled with the user''s real measurements from exercises 1, 2 and 5, and a dated export button to their system document.
- **Fallback** if the user''s measurements are unavailable: the three sets of measurements from records A, B and C of chapter 2.4, the user choosing which one to work on. The decision produced is then marked "exercise" and is not added to the system document.
- No screen in this track may offer a link, a button or a suggestion leading to opening a real account. That prohibition is a design element, not a preference.

EXF: Worked correction
**Step A.** None of the three sheets allows all seven checks, and that is the expected result. The most attractive sheet — tightest spread, smartest presentation — is also the one where the execution policy is missing. Users who rank it first have reproduced, on an exercise screen, exactly the error of chapter 6.1.
**Step B.** The trap is the costs column, separated from the result in the raw export. A record that leaves it out looks complete and is not: it is the one column that will be missing the moment somebody asks for a net figure. The questions for the professional are not marked — their existence is enough.
**Step C.** There is no right decision, and the correction does not judge the one taken. It checks one thing only: that line 5 names a measurable fact that would make you review it. "I''ll review when I feel more comfortable" is refused, for the exact reason of chapter 3.3 — a condition nobody can observe from outside will be observed favourably as soon as you want it to be.', 32);

commit;
