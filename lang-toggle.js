// ============ TOGGLE DE LANGUE (FR/EN) ============
// Attend un élément #langToggle dans la page. S'appuie sur i18n.js (doit être chargé avant).

(function () {
  const container = document.getElementById("langToggle");
  if (!container) return;

  const currentLang = typeof ttGetLang === "function" ? ttGetLang() : "fr";

  container.innerHTML = `
    <div class="lang-toggle" role="group" aria-label="Langue / Language">
      <div class="lang-toggle-pill" id="langPill" style="transform: translateX(${currentLang === "en" ? 38 : 0}px);"></div>
      <button class="lang-toggle-btn${currentLang === "fr" ? " active" : ""}" id="langBtnFr" type="button">FR</button>
      <button class="lang-toggle-btn${currentLang === "en" ? " active" : ""}" id="langBtnEn" type="button">EN</button>
    </div>
  `;

  const pill = document.getElementById("langPill");
  const btnFr = document.getElementById("langBtnFr");
  const btnEn = document.getElementById("langBtnEn");

  function setActive(lang) {
    pill.style.transform = `translateX(${lang === "en" ? 38 : 0}px)`;
    btnFr.classList.toggle("active", lang === "fr");
    btnEn.classList.toggle("active", lang === "en");
    if (typeof ttSetLang === "function") ttSetLang(lang);
  }

  btnFr.addEventListener("click", () => setActive("fr"));
  btnEn.addEventListener("click", () => setActive("en"));
})();
