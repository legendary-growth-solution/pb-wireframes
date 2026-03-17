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

  var zipFlow = document.querySelector('[data-zip-flow]');
  if (zipFlow) {
    var zipInput = zipFlow.querySelector('[data-zip-input]');
    var zipCheck = zipFlow.querySelector('[data-zip-check]');
    var zipStatus = zipFlow.querySelector('[data-zip-status]');
    var zipError = zipFlow.querySelector('[data-zip-error]');
    var zipDetails = zipFlow.querySelector('[data-zip-details]');
    var zipEcho = zipFlow.querySelector('[data-zip-echo]');
    var zipTimer = null;

    function isFloridaZip(zip) {
      if (!/^\d{5}$/.test(zip)) return false;
      var parsed = Number(zip);
      return parsed >= 32000 && parsed <= 34999;
    }

    function resetFlowMessages() {
      if (zipStatus) zipStatus.hidden = true;
      if (zipError) zipError.hidden = true;
      zipFlow.classList.remove('is-loading');
    }

    function showZipError(message) {
      if (!zipError) return;
      zipError.textContent = message;
      zipError.hidden = false;
    }

    function runZipFlow() {
      if (!zipInput || !zipCheck) return;
      var zip = zipInput.value.trim();

      if (zipTimer) {
        clearTimeout(zipTimer);
        zipTimer = null;
      }

      resetFlowMessages();
      if (zipDetails) zipDetails.hidden = true;

      if (!/^\d{5}$/.test(zip)) {
        showZipError('Enter a valid 5-digit ZIP code.');
        return;
      }

      if (!isFloridaZip(zip)) {
        showZipError('We currently support Florida ZIP codes only.');
        return;
      }

      if (zipStatus) {
        zipStatus.textContent = 'Checking local cash buyers near ' + zip + '...';
        zipStatus.hidden = false;
      }
      zipFlow.classList.add('is-loading');
      zipCheck.disabled = true;

      zipTimer = window.setTimeout(function () {
        zipFlow.classList.remove('is-loading');
        if (zipStatus) zipStatus.hidden = true;
        if (zipEcho) zipEcho.textContent = zip;
        if (zipDetails) zipDetails.hidden = false;
        zipCheck.disabled = false;
      }, 1200);
    }

    if (zipCheck) {
      zipCheck.addEventListener('click', runZipFlow);
    }

    if (zipInput) {
      zipInput.addEventListener('input', function () {
        var digitsOnly = zipInput.value.replace(/\D/g, '').slice(0, 5);
        if (zipInput.value !== digitsOnly) {
          zipInput.value = digitsOnly;
        }
        resetFlowMessages();
        if (zipDetails) zipDetails.hidden = true;
      });

      zipInput.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
          event.preventDefault();
          runZipFlow();
        }
      });
    }
  }
})();
