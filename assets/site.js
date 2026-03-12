(function () {
  var header = document.querySelector('.site-header');
  var toggle = document.querySelector('[data-menu-toggle]');
  var mobileMenu = document.querySelector('[data-mobile-menu]');

  function setScrolled() {
    if (!header) return;
    header.classList.toggle('is-scrolled', window.scrollY > 4);
  }

  setScrolled();
  window.addEventListener('scroll', setScrolled, { passive: true });

  if (toggle && mobileMenu) {
    toggle.addEventListener('click', function () {
      var open = mobileMenu.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
    });
  }
})();
