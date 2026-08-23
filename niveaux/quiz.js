// ============ QUIZ DE DÉFINITIONS PAR NIVEAU ============
// Nécessite data/glossary-terms.js et i18n.js chargés avant.

(function () {
  const container = document.getElementById("quizContainer");
  if (!container) return;

  const level = container.getAttribute("data-level");
  const terms = (typeof GLOSSARY_TERMS !== "undefined" && GLOSSARY_TERMS[level]) || [];
  const lang = typeof ttGetLang === "function" ? ttGetLang() : "fr";
  const passedKey = `tt_quiz_passed_${level}`;

  const passedTerms = new Set();

  function tt(key) {
    const l = typeof ttGetLang === "function" ? ttGetLang() : "fr";
    return typeof I18N_DICT !== "undefined" && I18N_DICT[key] ? I18N_DICT[key][l] || I18N_DICT[key].fr : key;
  }

  function renderTerm(termData, index) {
    const wrap = document.createElement("div");
    wrap.className = "quiz-term";
    wrap.innerHTML = `
      <p class="quiz-term-name">${termData.term[lang] || termData.term.fr}</p>
      <textarea class="quiz-input" rows="2" placeholder="${tt("quiz.placeholder")}" data-index="${index}"></textarea>
      <button class="btn-secondary quiz-check-btn" data-index="${index}">${tt("quiz.checkButton")}</button>
      <div class="quiz-feedback" data-index="${index}" style="display:none;"></div>
    `;
    return wrap;
  }

  function updateProgress() {
    const progressEl = document.getElementById("quizProgress");
    if (progressEl) {
      progressEl.textContent = `${passedTerms.size} / ${terms.length} ${tt("quiz.progress")}`;
    }
    if (passedTerms.size === terms.length && terms.length > 0) {
      unlockLevel();
    }
  }

  function unlockLevel() {
    try {
      localStorage.setItem(passedKey, "1");
    } catch (e) {}
    const unlockEl = document.getElementById("quizUnlock");
    const lockedMsg = document.getElementById("quizLockedMsg");
    if (unlockEl) unlockEl.style.display = "block";
    if (lockedMsg) lockedMsg.style.display = "none";
  }

  function checkTerm(index) {
    const termData = terms[index];
    const textarea = container.querySelector(`.quiz-input[data-index="${index}"]`);
    const feedback = container.querySelector(`.quiz-feedback[data-index="${index}"]`);
    const userAnswer = textarea.value;

    const keywordList = termData.keywords[lang] || termData.keywords.fr;
    const result = checkGlossaryAnswer(userAnswer, keywordList);

    if (result.passed) {
      passedTerms.add(index);
      textarea.style.borderColor = "var(--accent)";
    } else {
      textarea.style.borderColor = "#ff8080";
    }

    feedback.style.display = "block";
    feedback.innerHTML = `
      <p class="quiz-badge ${result.passed ? "is-passed" : "is-failed"}">
        ${result.passed ? "✓ " + tt("quiz.passed") : "○ " + tt("quiz.notPassed")}
      </p>
      <div class="quiz-compare">
        <div>
          <p class="quiz-compare-label">${tt("quiz.yourAnswer")}</p>
          <p class="quiz-compare-text">${userAnswer ? userAnswer.replace(/</g, "&lt;") : "—"}</p>
        </div>
        <div>
          <p class="quiz-compare-label">${tt("quiz.referenceAnswer")}</p>
          <p class="quiz-compare-text quiz-compare-ref">${termData.definition[lang] || termData.definition.fr}</p>
        </div>
      </div>
    `;

    updateProgress();
  }

  function render() {
    container.innerHTML = "";
    terms.forEach((termData, index) => {
      container.appendChild(renderTerm(termData, index));
    });

    const progressWrap = document.createElement("p");
    progressWrap.className = "quiz-progress-label";
    progressWrap.id = "quizProgress";
    progressWrap.textContent = `${passedTerms.size} / ${terms.length} ${tt("quiz.progress")}`;
    container.insertBefore(progressWrap, container.firstChild);

    container.addEventListener("click", (e) => {
      if (e.target.classList.contains("quiz-check-btn")) {
        checkTerm(parseInt(e.target.getAttribute("data-index"), 10));
      }
    });

    // Si déjà validé précédemment (localStorage), débloque directement.
    try {
      if (localStorage.getItem(passedKey) === "1") {
        terms.forEach((_, i) => passedTerms.add(i));
        unlockLevel();
        updateProgress();
      }
    } catch (e) {}
  }

  render();
})();
