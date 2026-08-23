// ============ SYSTÈME DE TRADUCTION (FR/EN) ============
// Dictionnaire central + fonctions utilitaires, utilisé sur toutes les pages statiques.
// Le simulateur d'exercice (React) a son propre dictionnaire embarqué dans le bundle.

const I18N_DICT = {
  // ---- Top-bar / commun ----
  "nav.login": { fr: "Se connecter", en: "Log in" },
  "nav.account": { fr: "Mon compte", en: "My account" },
  "nav.subscription": { fr: "Abonnement", en: "Subscription" },
  "nav.logout": { fr: "Se déconnecter", en: "Log out" },
  "nav.backHome": { fr: "← Retour à l'accueil", en: "← Back to home" },
  "footer.legal": { fr: "Mentions légales", en: "Legal notice" },
  "footer.cgu": { fr: "CGU", en: "Terms of use" },
  "footer.privacy": { fr: "Confidentialité", en: "Privacy" },

  // ---- Accueil ----
  "home.eyebrow": { fr: "Entraînement au trading", en: "Trading training" },
  "home.heroTitle": { fr: "Le marché ne t'attendra pas.<br>Prépare-toi avant d'y entrer.", en: "The market won't wait for you.<br>Get ready before you step in." },
  "home.heroSubtitle": { fr: "Des scénarios de marché réalistes, générés pour ton niveau. Lis un graphique comme un pro, sans risquer un centime.", en: "Realistic market scenarios, generated for your level. Read a chart like a pro, without risking a cent." },
  "home.startTraining": { fr: "Commencer l'entraînement", en: "Start training" },
  "home.seeLevels": { fr: "Voir les niveaux", en: "See the levels" },
  "home.conceptEyebrow": { fr: "Le concept", en: "The concept" },
  "home.conceptTitle": { fr: "Un graphique. Une décision. Un résultat.", en: "One chart. One decision. One outcome." },
  "home.conceptBody": { fr: "Chaque exercice te place devant une période réelle du marché, choisie selon ton niveau. Analyse, décide, et découvre si tu avais raison.", en: "Each exercise puts you in front of a real market period, chosen for your level. Analyze, decide, and find out if you were right." },
  "home.levelsEyebrow": { fr: "3 niveaux", en: "3 levels" },
  "home.levelsTitle": { fr: "Choisis ton terrain d'entraînement", en: "Choose your training ground" },
  "home.level1Title": { fr: "Débutant", en: "Beginner" },
  "home.level1Desc": { fr: "Tendances nettes, peu de bruit. Idéal pour apprendre à lire un graphique.", en: "Clean trends, little noise. Ideal for learning to read a chart." },
  "home.level2Title": { fr: "Intermédiaire", en: "Intermediate" },
  "home.level2Desc": { fr: "Retournements et pullbacks. La tendance change en cours de route.", en: "Reversals and pullbacks. The trend changes along the way." },
  "home.level3Title": { fr: "Expérimenté", en: "Experienced" },
  "home.level3Desc": { fr: "Range, faux signaux, forte volatilité. Peu de structure évidente.", en: "Range, false signals, high volatility. Little obvious structure." },
  "home.ctaTitle": { fr: "Prêt à tester ton œil ?", en: "Ready to test your eye?" },
  "home.ctaButton": { fr: "Lancer un exercice", en: "Start an exercise" },
  "home.footerTag": { fr: "Trading Training", en: "Trading Training" },

  // ---- Authentification ----
  "auth.eyebrow": { fr: "Trading Training", en: "Trading Training" },
  "auth.signInTitle": { fr: "Connexion", en: "Log in" },
  "auth.signInSubtitle": { fr: "Reprends ton entraînement là où tu l'as laissé.", en: "Pick up your training where you left off." },
  "auth.emailPlaceholder": { fr: "Email", en: "Email" },
  "auth.passwordPlaceholder": { fr: "Mot de passe", en: "Password" },
  "auth.forgotPassword": { fr: "Mot de passe oublié ?", en: "Forgot password?" },
  "auth.signInButton": { fr: "Se connecter", en: "Log in" },
  "auth.googleButton": { fr: "Continuer avec Google", en: "Continue with Google" },
  "auth.signUpTitle": { fr: "Créer un compte", en: "Create an account" },
  "auth.signUpSubtitle": { fr: "Rejoins l'entraînement et progresse niveau par niveau.", en: "Join the training and progress level by level." },
  "auth.namePlaceholder": { fr: "Nom", en: "Name" },
  "auth.passwordMinPlaceholder": { fr: "Mot de passe (8 caractères min.)", en: "Password (min. 8 characters)" },
  "auth.signUpButton": { fr: "S'inscrire", en: "Sign up" },
  "auth.overlayLoginTitle": { fr: "Déjà un compte ?", en: "Already have an account?" },
  "auth.overlayLoginBody": { fr: "Connecte-toi pour reprendre ton entraînement là où tu l'avais laissé.", en: "Log in to pick up your training where you left off." },
  "auth.overlaySignupTitle": { fr: "Nouveau trader ?", en: "New trader?" },
  "auth.overlaySignupBody": { fr: "Crée ton compte et commence à t'entraîner sur des scénarios de marché réalistes.", en: "Create your account and start training on realistic market scenarios." },

  // ---- Abonnement ----
  "plan.eyebrow": { fr: "Abonnement", en: "Subscription" },
  "plan.title": { fr: "Passe à l'entraînement illimité", en: "Go unlimited on training" },
  "plan.subtitle": { fr: "Pour l'instant, seule la partie <strong>entraînement</strong> est disponible sur Trading Training — la formation complète arrive plus tard.", en: "For now, only the <strong>training</strong> part is available on Trading Training — full coursework is coming later." },
  "plan.freeBadge": { fr: "Gratuit", en: "Free" },
  "plan.freeTitle": { fr: "Découverte", en: "Discovery" },
  "plan.freeFeature1": { fr: "3 exercices par jour", en: "3 exercises per day" },
  "plan.featureLevels": { fr: "Accès aux 3 niveaux", en: "Access to all 3 levels" },
  "plan.featureFormation": { fr: "Formation complète (à venir)", en: "Full coursework (coming soon)" },
  "plan.currentPlan": { fr: "Ton offre actuelle", en: "Your current plan" },
  "plan.proBadge": { fr: "Illimité", en: "Unlimited" },
  "plan.proTitle": { fr: "Trader actif", en: "Active trader" },
  "plan.toggleMonthly": { fr: "Mensuel", en: "Monthly" },
  "plan.toggleAnnual": { fr: "Annuel", en: "Annual" },
  "plan.featureUnlimited": { fr: "Exercices illimités", en: "Unlimited exercises" },
  "plan.testNote": { fr: "Tarif de test (mode Stripe Test) — le prix définitif n'est pas encore fixé.", en: "Test price (Stripe Test mode) — the final price is not yet set." },
  "plan.subscribeButton": { fr: "S'abonner (mode test)", en: "Subscribe (test mode)" },
  "plan.perMonth": { fr: "/mois", en: "/month" },
  "plan.perYear": { fr: "/an", en: "/year" },
  "plan.redirecting": { fr: "Redirection...", en: "Redirecting..." },
  "plan.genericError": { fr: "Erreur lors de la création de la session de paiement.", en: "Error creating the payment session." },
  "plan.footnote": { fr: "Seul l'entraînement est proposé actuellement. La formation (cours, coaching) n'est pas encore disponible et sera ajoutée plus tard. Le paiement est actuellement en mode test Stripe — aucune carte réelle n'est débitée.", en: "Only training is currently offered. Coursework (lessons, coaching) is not yet available and will be added later. Payment is currently in Stripe test mode — no real card is charged." },

  // ---- Mon compte ----
  "account.eyebrow": { fr: "Mon compte", en: "My account" },
  "account.checkoutSuccess": { fr: "✓ Abonnement activé, bienvenue chez les traders actifs !", en: "✓ Subscription activated, welcome to the active traders!" },
  "account.currentPlanLabel": { fr: "Offre actuelle", en: "Current plan" },
  "account.viewSubscription": { fr: "Voir l'abonnement →", en: "View subscription →" },
  "account.exercisesToday": { fr: "Exercices aujourd'hui", en: "Exercises today" },
  "account.resetNote": { fr: "Réinitialisé chaque jour à minuit.", en: "Resets every day at midnight." },
  "account.logout": { fr: "Se déconnecter", en: "Log out" },

  // ---- Pages niveaux ----
  "level.stepLabel": { fr: "ÉTAPE 1 / 2", en: "STEP 1 / 2" },
  "level.backToLevels": { fr: "← Retour aux niveaux", en: "← Back to levels" },

  // ---- Quiz de définitions ----
  "quiz.intro": { fr: "Avant de commencer, montre que tu maîtrises le vocabulaire de ce niveau. Pas besoin d'une définition parfaite — retrouve juste les idées clés avec tes propres mots.", en: "Before you start, show that you've got the vocabulary for this level down. No need for a perfect definition — just capture the key ideas in your own words." },
  "quiz.placeholder": { fr: "Ta définition avec tes mots...", en: "Your definition, in your own words..." },
  "quiz.checkButton": { fr: "Vérifier", en: "Check" },
  "quiz.yourAnswer": { fr: "Ta réponse", en: "Your answer" },
  "quiz.referenceAnswer": { fr: "Définition de référence", en: "Reference definition" },
  "quiz.passed": { fr: "Validé", en: "Passed" },
  "quiz.notPassed": { fr: "Pas encore — réessaie", en: "Not quite — try again" },
  "quiz.progress": { fr: "termes validés", en: "terms passed" },
  "quiz.allPassedTitle": { fr: "Vocabulaire validé !", en: "Vocabulary validated!" },
  "quiz.allPassedBody": { fr: "Tu peux maintenant accéder aux exercices de ce niveau.", en: "You can now access this level's exercises." },
  "quiz.startExercises": { fr: "Commencer l'entraînement", en: "Start training" },
  "quiz.locked": { fr: "🔒 Termine le quiz de vocabulaire ci-dessus pour débloquer l'entraînement.", en: "🔒 Finish the vocabulary quiz above to unlock training." },
  "quiz.retryHint": { fr: "Retente autant de fois que tu veux, sans pénalité.", en: "Try again as many times as you like, no penalty." },
  "quiz.emptyAnswer": { fr: "Écris une réponse avant de vérifier.", en: "Write an answer before checking." },

  // ---- Pages légales ----
  "legal.eyebrow": { fr: "Informations légales", en: "Legal information" },
  "legal.mentionsTitle": { fr: "Mentions légales", en: "Legal Notice" },
  "legal.cguTitle": { fr: "Conditions Générales d'Utilisation", en: "Terms of Use" },
  "legal.privacyTitle": { fr: "Politique de confidentialité", en: "Privacy Policy" },
};

const I18N_STORAGE_KEY = "tt_lang";

function ttGetLang() {
  return localStorage.getItem(I18N_STORAGE_KEY) || "fr";
}

function ttSetLang(lang) {
  localStorage.setItem(I18N_STORAGE_KEY, lang);
  ttApplyTranslations(lang);
  document.documentElement.lang = lang;
}

function ttApplyTranslations(lang) {
  document.documentElement.lang = lang;
  document.querySelectorAll("[data-i18n]").forEach((el) => {
    const key = el.getAttribute("data-i18n");
    const entry = I18N_DICT[key];
    if (!entry) return;
    const text = entry[lang] || entry.fr;
    if (el.hasAttribute("data-i18n-html")) {
      el.innerHTML = text;
    } else if (el.hasAttribute("data-i18n-placeholder")) {
      el.setAttribute("placeholder", text);
    } else {
      el.textContent = text;
    }
  });
}

// Applique la langue sauvegardée dès que le DOM est prêt (avant même le rendu visuel si possible).
document.addEventListener("DOMContentLoaded", () => {
  ttApplyTranslations(ttGetLang());
});
