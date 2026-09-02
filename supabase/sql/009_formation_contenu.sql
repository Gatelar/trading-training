-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.

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

insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 1, '1.1', 'Ce que la simulation ne t''a jamais facturé', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 1, '1.2', 'Le mesurer au lieu de le croire', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 1, '1.3', 'Les moments où le prix saute', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 1, '1.4', 'Ton espérance, recalculée', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 1, 'EX', 'Le même trade, deux prix', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 2, '2.1', 'La première taille n''est pas la taille du système', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 2, '2.2', 'Le palier de démarrage', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 2, '2.3', 'Ce que ce palier mesure, et ce qu''il ne mesure pas', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 2, '2.4', 'Rester en simulation est une réponse', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 2, 'EX', 'Le palier que tu écris', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 3, '3.1', 'Ce que 1 R devient quand c''est de l''argent', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 3, '3.2', 'Les trois biais ne reviennent pas séparément', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 3, '3.3', 'Le protocole d''arrêt : seuil, durée, reprise', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 3, '3.4', 'Les règles que le réel oblige à réécrire', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 3, 'EX', 'Ta séance, dégradée', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 4, '4.1', 'Quand trois catégories ne suffisent plus', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 4, '4.2', 'La corrélation bouge quand le marché bouge', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 4, '4.3', 'Refuser une position : l''ordre de priorité', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 4, '4.4', 'Le plafond que tu ne peux plus vérifier à l''œil', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 4, 'EX', 'Cinq positions, une limite', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, '5.1', 'Série défavorable ou dégradation : la question mal posée', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, '5.2', 'Ce que la recherche établit sur la durée de vie d''un avantage', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, '5.3', 'Le test écrit avant l''observation', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, '5.4', 'Le critère d''arrêt de système', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, '5.5', 'Arrêter n''est pas échouer', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 5, 'EX', 'Le système que tu arrêtes', 'EXF: Compétence évaluée
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, '6.1', 'Le courtier : ce que tu peux vérifier toi-même', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, '6.2', 'Les protections réglementaires, et ce qu''elles ne couvrent pas', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, '6.3', 'Tenue de registre : ce que ton journal ne suffit pas à produire', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, '6.4', 'La fiscalité : les questions, jamais les réponses', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, '6.5', 'Ce que tu décides maintenant', 'HOOK:
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
insert into public.formation_chapitres (parcours, module, numero, titre, corps, ordre) values
  ('experimente', 6, 'EX', 'Ta décision, datée', 'EXF: Compétence évaluée
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

commit;
