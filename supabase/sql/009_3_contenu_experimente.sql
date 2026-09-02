-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Partie 3 sur 3 : parcours experimente.
-- A executer dans l'ordre : la partie 1 vide la table.

begin;

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
