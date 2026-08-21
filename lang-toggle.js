// ============ TOGGLE DE LANGUE (FR/EN) ============
// Attend un élément #langToggle dans la page. S'appuie sur i18n.js (doit être chargé avant).
// Styles injectés en ligne (pas de dépendance à style.css) pour éviter tout souci de cache.

(function () {
  const container = document.getElementById("langToggle");
  if (!container) return;

  const currentLang = typeof ttGetLang === "function" ? ttGetLang() : "fr";

  const wrapStyle = "display:flex;gap:4px;background-color:#050605;border:1px solid #1c211c;border-radius:8px;padding:3px;position:relative;";
  const pillStyle = "position:absolute;top:3px;left:3px;width:34px;height:26px;background:#CDFC8A;border-radius:6px;transition:transform .3s cubic-bezier(.34,1.56,.64,1);z-index:0;";
  const btnBaseStyle = "position:relative;z-index:1;width:34px;background:none;border:none;font-family:'Oswald',sans-serif;font-size:0.72rem;letter-spacing:0.5px;padding:6px 0;cursor:pointer;transition:color .2s ease;";

  container.innerHTML = `
    <div style="${wrapStyle}" role="group" aria-label="Langue / Language">
      <div id="langPill" style="${pillStyle}${currentLang === "en" ? "transform:translateX(38px);" : ""}"></div>
      <button id="langBtnFr" type="button" style="${btnBaseStyle}color:${currentLang === "fr" ? "#06170a" : "#9aa39a"};">FR</button>
      <button id="langBtnEn" type="button" style="${btnBaseStyle}color:${currentLang === "en" ? "#06170a" : "#9aa39a"};">EN</button>
    </div>
  `;

  const pill = document.getElementById("langPill");
  const btnFr = document.getElementById("langBtnFr");
  const btnEn = document.getElementById("langBtnEn");

  function setActive(lang) {
    pill.style.transform = lang === "en" ? "translateX(38px)" : "translateX(0px)";
    btnFr.style.color = lang === "fr" ? "#06170a" : "#9aa39a";
    btnEn.style.color = lang === "en" ? "#06170a" : "#9aa39a";
    if (typeof ttSetLang === "function") ttSetLang(lang);
  }

  btnFr.addEventListener("click", () => setActive("fr"));
  btnEn.addEventListener("click", () => setActive("en"));
})();
