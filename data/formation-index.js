// ============ INDEX DES PARCOURS DE FORMATION ============
// FICHIER GENERE — NE PAS MODIFIER A LA MAIN.
// Source   : formation/contenu/, contenu-inter/, contenu-experimente/
// Generateur : formation/build_index.py
// Regenerer  : python formation/build_index.py
// Genere le : 2026-09-02
//
// Ce fichier ne contient QUE des metadonnees publiques : titres, durees,
// structure. Le texte des chapitres n'y est pas — il vient de Supabase sous
// RLS, apres verification de l'abonnement cote base.

const FORMATION_INDEX = {
  "genere": "2026-09-02",
  "minutes": 240,
  "nbChapitres": 83,
  "parcours": [
    {
      "id": "debutant",
      "nom": "Débutant",
      "accroche": "Apprendre à lire un marché. Et à ne pas se ruiner en l'apprenant.",
      "page": "niveaux/debutant.html",
      "pdf": "formation/TapeSense_Parcours_Debutant.pdf",
      "minutes": 71,
      "nbModules": 6,
      "nbChapitres": 29,
      "modules": [
        {
          "n": 1,
          "titre": "Avant de toucher un graphique",
          "minutes": 11,
          "objectif": "comprendre à quoi tu joues, et pourquoi la grande majorité des gens y perd.",
          "exercice": "Le coût de départ",
          "chapitres": [
            {
              "num": "1.1",
              "titre": "Ce que tu achètes réellement"
            },
            {
              "num": "1.2",
              "titre": "Qui est en face de toi"
            },
            {
              "num": "1.3",
              "titre": "Les chiffres qu'on ne te montre pas"
            },
            {
              "num": "1.4",
              "titre": "L'effet de levier"
            },
            {
              "num": "1.5",
              "titre": "Ce que ce parcours va — et ne va pas — t'apprendre"
            }
          ]
        },
        {
          "n": 2,
          "titre": "Le risque avant la méthode",
          "minutes": 12,
          "objectif": "savoir combien tu risques avant même de savoir quoi acheter.",
          "exercice": "Trois positions, un seul risque",
          "chapitres": [
            {
              "num": "2.1",
              "titre": "La seule question qui compte"
            },
            {
              "num": "2.2",
              "titre": "La règle du 1 %"
            },
            {
              "num": "2.3",
              "titre": "Calculer une taille de position"
            },
            {
              "num": "2.4",
              "titre": "Où placer un stop"
            },
            {
              "num": "2.5",
              "titre": "Le drawdown"
            }
          ]
        },
        {
          "n": 3,
          "titre": "Lire un graphique nu",
          "minutes": 13,
          "objectif": "extraire de l'information d'un graphique sans le secours du moindre indicateur.",
          "exercice": "Lecture à froid",
          "chapitres": [
            {
              "num": "3.1",
              "titre": "Le chandelier japonais"
            },
            {
              "num": "3.2",
              "titre": "L'unité de temps"
            },
            {
              "num": "3.3",
              "titre": "Sommets, creux et structure"
            },
            {
              "num": "3.4",
              "titre": "Zones de support et de résistance"
            },
            {
              "num": "3.5",
              "titre": "Pourquoi aucun indicateur"
            }
          ]
        },
        {
          "n": 4,
          "titre": "Construire une décision",
          "minutes": 12,
          "objectif": "transformer une lecture de graphique en scénario chiffré, et ce scénario en décision.",
          "exercice": "Le plan avant le clic",
          "chapitres": [
            {
              "num": "4.1",
              "titre": "Scénario, invalidation, objectif"
            },
            {
              "num": "4.2",
              "titre": "Ratio gain/risque et seuil d'équilibre"
            },
            {
              "num": "4.3",
              "titre": "L'espérance"
            },
            {
              "num": "4.4",
              "titre": "La checklist pré-ordre"
            },
            {
              "num": "4.5",
              "titre": "Le trade que tu ne prends pas"
            }
          ]
        },
        {
          "n": 5,
          "titre": "Ce qui se passe dans ta tête",
          "minutes": 11,
          "objectif": "reconnaître dans ton propre relevé trois comportements documentés, et leur opposer une règle.",
          "exercice": "Quatre situations, une règle",
          "chapitres": [
            {
              "num": "5.1",
              "titre": "L'effet de disposition"
            },
            {
              "num": "5.2",
              "titre": "Surtrading et excès de confiance"
            },
            {
              "num": "5.3",
              "titre": "La spirale après une perte"
            },
            {
              "num": "5.4",
              "titre": "Des règles qui tiennent"
            }
          ]
        },
        {
          "n": 6,
          "titre": "Travailler comme un professionnel",
          "minutes": 12,
          "objectif": "installer la boucle de correction sans laquelle l'expérience n'enseigne rien.",
          "exercice": "Le trade que tu ne corrigeras pas",
          "chapitres": [
            {
              "num": "6.1",
              "titre": "Le journal de trading"
            },
            {
              "num": "6.2",
              "titre": "Décision et résultat"
            },
            {
              "num": "6.3",
              "titre": "Lire ses propres statistiques"
            },
            {
              "num": "6.4",
              "titre": "La pratique délibérée"
            },
            {
              "num": "6.5",
              "titre": "Après ce parcours"
            }
          ]
        }
      ]
    },
    {
      "id": "intermediaire",
      "nom": "Intermédiaire",
      "accroche": "Tu as des règles. Il te manque la méthode qui dit si elles marchent.",
      "page": "niveaux/intermediaire.html",
      "pdf": "formation/TapeSense_Parcours_Intermediaire.pdf",
      "minutes": 82,
      "nbModules": 6,
      "nbChapitres": 28,
      "modules": [
        {
          "n": 1,
          "titre": "Ce que ton journal sait déjà",
          "minutes": 13,
          "objectif": "faire parler les trente trades que tu as déjà, avant d'ajouter quoi que ce soit.",
          "exercice": "Ce que dit vraiment ton relevé",
          "chapitres": [
            {
              "num": "1.1",
              "titre": "Trente trades, et ce qu'ils ne disent pas"
            },
            {
              "num": "1.2",
              "titre": "Série ou signal"
            },
            {
              "num": "1.3",
              "titre": "Segmenter son journal"
            },
            {
              "num": "1.4",
              "titre": "Ce que tu ne peux pas conclure"
            }
          ]
        },
        {
          "n": 2,
          "titre": "Tester au lieu d'espérer",
          "minutes": 15,
          "objectif": "disposer d'un protocole qui tranche entre une idée qui fonctionne et une idée qui plaît.",
          "exercice": "Le test que tu ne truques pas",
          "chapitres": [
            {
              "num": "2.1",
              "titre": "Une hypothèse, pas une intuition"
            },
            {
              "num": "2.2",
              "titre": "L'échantillon"
            },
            {
              "num": "2.3",
              "titre": "Couper ses données en deux"
            },
            {
              "num": "2.4",
              "titre": "Le surapprentissage"
            },
            {
              "num": "2.5",
              "titre": "Le critère d'abandon"
            }
          ]
        },
        {
          "n": 3,
          "titre": "Les indicateurs, enfin",
          "minutes": 15,
          "objectif": "poser un outil sur une lecture qui tient déjà, et savoir lequel jeter.",
          "exercice": "L'outil que tu jettes",
          "chapitres": [
            {
              "num": "3.1",
              "titre": "Ce qu'un indicateur calcule"
            },
            {
              "num": "3.2",
              "titre": "Mesurer n'est pas prédire"
            },
            {
              "num": "3.3",
              "titre": "Le filtre"
            },
            {
              "num": "3.4",
              "titre": "Passer un outil au protocole"
            },
            {
              "num": "3.5",
              "titre": "Le coût de chaque outil"
            }
          ]
        },
        {
          "n": 4,
          "titre": "La gestion de position",
          "minutes": 14,
          "objectif": "décider ce qui se passe entre l'entrée et la sortie, et le mesurer au lieu de le ressentir.",
          "exercice": "Trois gestions, une seule série",
          "chapitres": [
            {
              "num": "4.1",
              "titre": "Le trade ne s'arrête pas à l'entrée"
            },
            {
              "num": "4.2",
              "titre": "La sortie partielle"
            },
            {
              "num": "4.3",
              "titre": "Le stop suiveur"
            },
            {
              "num": "4.4",
              "titre": "La mise à l'équilibre"
            },
            {
              "num": "4.5",
              "titre": "Choisir et tenir"
            }
          ]
        },
        {
          "n": 5,
          "titre": "L'exposition réelle",
          "minutes": 12,
          "objectif": "savoir ce que tu risques vraiment quand plusieurs positions sont ouvertes en même temps.",
          "exercice": "Ce que tu risques vraiment",
          "chapitres": [
            {
              "num": "5.1",
              "titre": "Trois positions à 1 %, un risque à 3 %"
            },
            {
              "num": "5.2",
              "titre": "La corrélation"
            },
            {
              "num": "5.3",
              "titre": "Risque de séance, risque de portefeuille"
            },
            {
              "num": "5.4",
              "titre": "La règle d'exposition cumulée"
            }
          ]
        },
        {
          "n": 6,
          "titre": "Ton système, écrit",
          "minutes": 13,
          "objectif": "transformer un ensemble de règles en système mesurable et révisable.",
          "exercice": "Écris ton système",
          "chapitres": [
            {
              "num": "6.1",
              "titre": "Ce qu'est un système"
            },
            {
              "num": "6.2",
              "titre": "Le document de système"
            },
            {
              "num": "6.3",
              "titre": "La revue mensuelle"
            },
            {
              "num": "6.4",
              "titre": "Quand modifier, quand ne rien faire"
            },
            {
              "num": "6.5",
              "titre": "Ce qui t'attend au parcours Expérimenté"
            }
          ]
        }
      ]
    },
    {
      "id": "experimente",
      "nom": "Expérimenté",
      "accroche": "Ce niveau ne t'apprend pas à passer en argent réel. Il t'apprend ce que ça change.",
      "page": "niveaux/experimente.html",
      "pdf": "formation/TapeSense_Parcours_Experimente.pdf",
      "minutes": 87,
      "nbModules": 6,
      "nbChapitres": 26,
      "modules": [
        {
          "n": 1,
          "titre": "Le prix que tu obtiens",
          "minutes": 14,
          "objectif": "mesurer ce que la simulation ne t'a jamais facturé, et refaire ton espérance avec.",
          "exercice": "Le même trade, deux prix",
          "chapitres": [
            {
              "num": "1.1",
              "titre": "Ce que la simulation ne t'a jamais facturé"
            },
            {
              "num": "1.2",
              "titre": "Le mesurer au lieu de le croire"
            },
            {
              "num": "1.3",
              "titre": "Les moments où le prix saute"
            },
            {
              "num": "1.4",
              "titre": "Ton espérance, recalculée"
            }
          ]
        },
        {
          "n": 2,
          "titre": "Commencer petit, et l'écrire",
          "minutes": 14,
          "objectif": "construire un palier de démarrage dont la fonction est de mesurer, et rien d'autre.",
          "exercice": "Le palier que tu écris",
          "chapitres": [
            {
              "num": "2.1",
              "titre": "La première taille n'est pas la taille du système"
            },
            {
              "num": "2.2",
              "titre": "Le palier de démarrage"
            },
            {
              "num": "2.3",
              "titre": "Ce que ce palier mesure, et ce qu'il ne mesure pas"
            },
            {
              "num": "2.4",
              "titre": "Rester en simulation est une réponse"
            }
          ]
        },
        {
          "n": 3,
          "titre": "Le comportement, sous contrainte réelle",
          "minutes": 15,
          "objectif": "reconnaître le retour simultané des trois biais du Débutant, et leur opposer un protocole d'arrêt.",
          "exercice": "Ta séance, dégradée",
          "chapitres": [
            {
              "num": "3.1",
              "titre": "Ce que 1 R devient quand c'est de l'argent"
            },
            {
              "num": "3.2",
              "titre": "Les trois biais ne reviennent pas séparément"
            },
            {
              "num": "3.3",
              "titre": "Le protocole d'arrêt : seuil, durée, reprise"
            },
            {
              "num": "3.4",
              "titre": "Les règles que le réel oblige à réécrire"
            }
          ]
        },
        {
          "n": 4,
          "titre": "Le portefeuille",
          "minutes": 14,
          "objectif": "tenir une limite d'exposition quand elle cesse d'être vérifiable de tête.",
          "exercice": "Cinq positions, une limite",
          "chapitres": [
            {
              "num": "4.1",
              "titre": "Quand trois catégories ne suffisent plus"
            },
            {
              "num": "4.2",
              "titre": "La corrélation bouge quand le marché bouge"
            },
            {
              "num": "4.3",
              "titre": "Refuser une position : l'ordre de priorité"
            },
            {
              "num": "4.4",
              "titre": "Le plafond que tu ne peux plus vérifier à l'œil"
            }
          ]
        },
        {
          "n": 5,
          "titre": "Un avantage qui disparaît",
          "minutes": 16,
          "objectif": "trancher entre variance et dégradation au moyen d'un test écrit avant l'observation.",
          "exercice": "Le système que tu arrêtes",
          "chapitres": [
            {
              "num": "5.1",
              "titre": "Série défavorable ou dégradation : la question mal posée"
            },
            {
              "num": "5.2",
              "titre": "Ce que la recherche établit sur la durée de vie d'un avantage"
            },
            {
              "num": "5.3",
              "titre": "Le test écrit avant l'observation"
            },
            {
              "num": "5.4",
              "titre": "Le critère d'arrêt de système"
            },
            {
              "num": "5.5",
              "titre": "Arrêter n'est pas échouer"
            }
          ]
        },
        {
          "n": 6,
          "titre": "L'infrastructure",
          "minutes": 14,
          "objectif": "traiter ce qui entoure le trade — prestataire, protections, registre, fiscalité — puis décider.",
          "exercice": "Ta décision, datée",
          "chapitres": [
            {
              "num": "6.1",
              "titre": "Le courtier : ce que tu peux vérifier toi-même"
            },
            {
              "num": "6.2",
              "titre": "Les protections réglementaires, et ce qu'elles ne couvrent pas"
            },
            {
              "num": "6.3",
              "titre": "Tenue de registre : ce que ton journal ne suffit pas à produire"
            },
            {
              "num": "6.4",
              "titre": "La fiscalité : les questions, jamais les réponses"
            },
            {
              "num": "6.5",
              "titre": "Ce que tu décides maintenant"
            }
          ]
        }
      ]
    }
  ]
};
