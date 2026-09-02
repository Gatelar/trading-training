-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Partie 1 sur 3 : parcours debutant.
-- A executer dans l'ordre : la partie 1 vide la table.

begin;
delete from public.formation_chapitres;

insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, '1.1', 'Ce que tu achètes réellement', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, '1.2', 'Qui est en face de toi', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, '1.3', 'Les chiffres qu''on ne te montre pas', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, '1.4', 'L''effet de levier', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, '1.5', 'Ce que ce parcours va — et ne va pas — t''apprendre', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 1, 'EX', 'Le coût de départ', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, '2.1', 'La seule question qui compte', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, '2.2', 'La règle du 1 %', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, '2.3', 'Calculer une taille de position', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, '2.4', 'Où placer un stop', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, '2.5', 'Le drawdown', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 2, 'EX', 'Trois positions, un seul risque', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, '3.1', 'Le chandelier japonais', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, '3.2', 'L''unité de temps', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, '3.3', 'Sommets, creux et structure', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, '3.4', 'Zones de support et de résistance', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, '3.5', 'Pourquoi aucun indicateur', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 3, 'EX', 'Lecture à froid', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, '4.1', 'Scénario, invalidation, objectif', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, '4.2', 'Ratio gain/risque et seuil d''équilibre', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, '4.3', 'L''espérance', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, '4.4', 'La checklist pré-ordre', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, '4.5', 'Le trade que tu ne prends pas', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 4, 'EX', 'Le plan avant le clic', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 5, '5.1', 'L''effet de disposition', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 5, '5.2', 'Surtrading et excès de confiance', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 5, '5.3', 'La spirale après une perte', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 5, '5.4', 'Des règles qui tiennent', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 5, 'EX', 'Quatre situations, une règle', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, '6.1', 'Le journal de trading', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, '6.2', 'Décision et résultat', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, '6.3', 'Lire ses propres statistiques', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, '6.4', 'La pratique délibérée', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, '6.5', 'Après ce parcours', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('debutant', 6, 'EX', 'Le trade que tu ne corrigeras pas', 'EXF: Compétence évaluée
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

commit;
