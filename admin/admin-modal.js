// ============ MODALE PARTAGÉE (promo, prolongation d'accès) ============
(function () {
    const backdrop = document.getElementById('adminModalBackdrop');
    const modal = document.getElementById('adminModal');

    window.adminOpenModal = function (html) {
        modal.innerHTML = html;
        backdrop.style.display = 'flex';
    };

    window.adminCloseModal = function () {
        backdrop.style.display = 'none';
        modal.innerHTML = '';
    };

    backdrop.addEventListener('click', (e) => {
        if (e.target === backdrop) window.adminCloseModal();
    });
})();
