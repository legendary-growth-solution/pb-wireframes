#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p assets \
  how-it-works sell-your-house locations \
  locations/pinellas-county locations/hillsborough-county locations/pasco-county locations/hernando-county \
  locations/st-petersburg locations/tampa locations/clearwater locations/brandon locations/wesley-chapel \
  situations situations/inherited-property situations/fire-damage situations/flood-damage situations/foundation-problems situations/foreclosure situations/landlord-with-tenants situations/divorce situations/code-violations \
  about about/meet-our-team about/reviews blog 'blog/[slug]' contact

cat > assets/styles.css <<'CSS'
:root {
  --color-primary: #1e78c8;
  --color-primary-dark: #0b5fa5;
  --color-orange: #ff9f1c;
  --color-green: #3bb44a;
  --color-ink: #14283f;
  --color-muted: #5f7389;
  --color-bg: #f5f8fc;
  --color-surface: #ffffff;
  --color-line: #d8e3ef;
  --color-soft-blue: #edf6ff;
  --color-soft-sand: #fff4d6;
  --radius-sm: 10px;
  --radius-md: 14px;
  --radius-lg: 18px;
  --shadow-sm: 0 6px 18px rgba(12, 45, 82, 0.08);
  --shadow-md: 0 12px 32px rgba(12, 45, 82, 0.12);
  --max: 1180px;
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  padding: 0;
}

body {
  font-family: "Open Sans", Arial, sans-serif;
  color: var(--color-ink);
  background: var(--color-bg);
  line-height: 1.6;
}

a {
  color: inherit;
  text-decoration: none;
}

img {
  max-width: 100%;
  display: block;
}

.container {
  width: min(var(--max), calc(100% - 2.5rem));
  margin-inline: auto;
}

.site-header {
  position: sticky;
  top: 0;
  z-index: 200;
  background: rgba(255, 255, 255, 0.97);
  border-bottom: 1px solid #e8eef5;
  backdrop-filter: blur(6px);
  transition: box-shadow 0.2s ease;
}

.site-header.is-scrolled {
  box-shadow: var(--shadow-sm);
}

.site-header-inner {
  min-height: 82px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1.1rem;
}

.site-brand {
  display: inline-flex;
  align-items: center;
  gap: 0.72rem;
}

.site-brand img {
  width: 58px;
  height: 58px;
  object-fit: contain;
}

.brand-text {
  display: grid;
  line-height: 1.1;
}

.brand-name {
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 800;
  font-size: 1rem;
  color: #15375b;
}

.brand-sub {
  font-size: 0.75rem;
  color: var(--color-muted);
}

.desktop-nav {
  display: flex;
  align-items: center;
  gap: 0.9rem;
}

.nav-list {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  align-items: center;
  gap: 0.2rem;
}

.nav-item {
  position: relative;
}

.nav-link {
  display: inline-flex;
  align-items: center;
  gap: 0.3rem;
  padding: 0.52rem 0.78rem;
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 600;
  color: #254564;
  border-radius: 8px;
}

.nav-link:hover {
  background: #f1f7ff;
}

.dropdown {
  position: absolute;
  top: calc(100% + 0.42rem);
  left: 0;
  min-width: 230px;
  background: #fff;
  border: 1px solid var(--color-line);
  border-radius: 12px;
  box-shadow: var(--shadow-md);
  padding: 0.52rem;
  opacity: 0;
  visibility: hidden;
  transform: translateY(6px);
  transition: opacity 0.15s ease, transform 0.15s ease;
}

.nav-item:hover .dropdown,
.nav-item:focus-within .dropdown {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}

.dropdown a {
  display: block;
  padding: 0.5rem 0.6rem;
  border-radius: 8px;
  color: #274b6f;
  font-size: 0.92rem;
}

.dropdown a:hover {
  background: #f2f8ff;
}

.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
  border: 1px solid transparent;
  padding: 0.78rem 1.2rem;
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 700;
  font-size: 0.92rem;
}

.btn-primary {
  background: var(--color-orange);
  color: #fff;
}

.btn-primary:hover {
  background: #f2b705;
}

.btn-secondary {
  background: #edf5ff;
  border-color: #c9dff5;
  color: #1f4f7a;
}

.btn-block {
  width: 100%;
}

.menu-toggle {
  display: none;
  border: 1px solid var(--color-line);
  background: #fff;
  border-radius: 10px;
  padding: 0.5rem 0.7rem;
  font-weight: 700;
  color: #274b6f;
}

.mobile-menu {
  display: none;
  border-top: 1px solid #e8eef5;
  background: #fff;
  padding: 1rem 0 1.2rem;
}

.mobile-menu.is-open {
  display: block;
}

.mobile-nav {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  gap: 0.75rem;
}

.mobile-nav > li {
  border: 1px solid var(--color-line);
  border-radius: 12px;
  padding: 0.72rem;
}

.mobile-nav a {
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 600;
  color: #244463;
}

.mobile-sub {
  margin: 0.4rem 0 0;
  padding-left: 1rem;
  color: var(--color-muted);
}

.page-wrap {
  padding: 1rem 0 4rem;
}

.breadcrumb {
  margin: 0.65rem 0 1rem;
  color: #63788f;
  font-size: 0.92rem;
}

.page-hero {
  background: #fff;
  border: 1px solid var(--color-line);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  padding: 2.1rem;
}

.eyebrow {
  margin: 0 0 0.45rem;
  color: var(--color-primary);
  text-transform: uppercase;
  letter-spacing: 0.08em;
  font-size: 0.8rem;
  font-weight: 700;
}

.page-hero h1 {
  margin: 0;
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 800;
  font-size: clamp(2rem, 4vw, 3rem);
  line-height: 1.15;
}

.page-lead {
  margin: 0.8rem 0 0;
  max-width: 820px;
  color: #4c6076;
  font-size: 1.05rem;
}

.section {
  margin-top: 1.2rem;
  background: #fff;
  border: 1px solid var(--color-line);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
  padding: 1.5rem;
}

.section.alt-blue {
  background: var(--color-soft-blue);
}

.section.alt-sand {
  background: var(--color-soft-sand);
}

.section h2 {
  margin: 0 0 0.55rem;
  font-family: "Poppins", Arial, sans-serif;
  font-size: clamp(1.4rem, 2.5vw, 2rem);
}

.section-intro {
  margin: 0 0 1rem;
  color: #54687e;
}

.split-2 {
  display: grid;
  grid-template-columns: minmax(0, 1.08fr) minmax(0, 0.92fr);
  gap: 1rem;
}

.grid {
  display: grid;
  gap: 1rem;
}

.grid-2 {
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.grid-3 {
  grid-template-columns: repeat(3, minmax(0, 1fr));
}

.grid-4 {
  grid-template-columns: repeat(4, minmax(0, 1fr));
}

.card {
  background: #fff;
  border: 1px solid #d2e0ed;
  border-radius: 12px;
  padding: 1rem;
}

.card h3,
.card h4 {
  margin: 0;
  font-family: "Poppins", Arial, sans-serif;
}

.card p {
  margin: 0.55rem 0 0;
  color: #4e6177;
}

.step-badge {
  width: 34px;
  height: 34px;
  border-radius: 999px;
  background: var(--color-orange);
  color: #fff;
  display: inline-grid;
  place-items: center;
  font-weight: 700;
  font-family: "Poppins", Arial, sans-serif;
  margin-bottom: 0.55rem;
}

.trust-list {
  display: grid;
  grid-template-columns: repeat(5, minmax(0, 1fr));
  gap: 0.8rem;
}

.trust-item {
  border: 1px solid #2d4d6f;
  border-radius: 10px;
  padding: 0.85rem;
  background: #193757;
  color: #fff;
  font-size: 0.9rem;
  font-weight: 600;
  text-align: center;
}

.icon-placeholder,
.avatar-placeholder,
.image-placeholder {
  border: 1px dashed #9cb8d3;
  border-radius: 10px;
  background: repeating-linear-gradient(
    -45deg,
    #eef4fb,
    #eef4fb 10px,
    #f6f9fd 10px,
    #f6f9fd 20px
  );
  color: #5c7591;
  font-size: 0.82rem;
  font-weight: 700;
  display: grid;
  place-items: center;
  text-align: center;
}

.icon-placeholder {
  width: 44px;
  height: 44px;
  border-radius: 999px;
  margin-bottom: 0.55rem;
}

.avatar-placeholder {
  width: 52px;
  height: 52px;
  border-radius: 999px;
  margin-bottom: 0.55rem;
}

.image-placeholder {
  width: 100%;
  min-height: 170px;
}

.image-placeholder.sm {
  min-height: 120px;
}

.image-placeholder.lg {
  min-height: 250px;
}

.form-shell {
  background: #fff;
  border: 1px solid #cfdeeb;
  border-radius: 14px;
  padding: 1rem;
}

.form-shell h3 {
  margin: 0;
  font-family: "Poppins", Arial, sans-serif;
}

.form-shell p {
  margin: 0.4rem 0 0.8rem;
  color: #5f7389;
}

.field {
  height: 48px;
  border: 1px solid #c8d7e5;
  border-radius: 8px;
  background: #fbfdff;
  color: #6a7f95;
  display: flex;
  align-items: center;
  padding: 0 0.8rem;
  font-size: 0.93rem;
  margin-top: 0.55rem;
}

.field.large {
  min-height: 92px;
  height: auto;
  align-items: flex-start;
  padding-top: 0.8rem;
}

.meta-chip-row {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-top: 0.8rem;
}

.meta-chip {
  border: 1px solid #c7d9eb;
  border-radius: 999px;
  padding: 0.26rem 0.6rem;
  font-size: 0.84rem;
  color: #4f6680;
  background: #f6fafe;
}

.cta-band {
  background: #1f4f7a;
  color: #fff;
  border-color: #285a87;
}

.cta-band p {
  color: rgba(255, 255, 255, 0.88);
}

.compare-table-wrap {
  overflow-x: auto;
}

.compare-table {
  width: 100%;
  border-collapse: collapse;
  background: #fff;
}

.compare-table th,
.compare-table td {
  border: 1px solid #cfdeeb;
  padding: 0.7rem;
  text-align: left;
}

.compare-table th {
  font-family: "Poppins", Arial, sans-serif;
  background: #f3f8fd;
}

.timeline {
  display: grid;
  gap: 0.82rem;
}

.timeline-item {
  display: grid;
  grid-template-columns: 50px 1fr;
  gap: 0.8rem;
  background: #fff;
  border: 1px solid #d2e0ed;
  border-radius: 12px;
  padding: 0.9rem;
}

.timeline-count {
  width: 40px;
  height: 40px;
  border-radius: 999px;
  display: grid;
  place-items: center;
  background: #ecf5ff;
  color: #1e5c94;
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 800;
}

.faq-item {
  border: 1px solid #d2e0ed;
  border-radius: 10px;
  background: #fff;
  padding: 0.8rem;
}

.faq-item + .faq-item {
  margin-top: 0.6rem;
}

.faq-item h3 {
  margin: 0;
  font-size: 1.02rem;
}

.faq-item p {
  margin: 0.4rem 0 0;
}

.sidebar-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.35fr) minmax(0, 0.65fr);
  gap: 1rem;
}

.sticky-side {
  position: sticky;
  top: 102px;
  display: grid;
  gap: 0.8rem;
  height: fit-content;
}

.site-footer {
  background: #0b5fa5;
  color: #fff;
  margin-top: 3rem;
}

.footer-top {
  padding: 2.2rem 0;
}

.footer-grid {
  display: grid;
  grid-template-columns: 1.2fr 1.15fr 1.1fr 1.35fr;
  gap: 1rem;
}

.footer-brand-logo {
  width: 62px;
  height: 62px;
  object-fit: contain;
  margin-bottom: 0.55rem;
}

.footer-col h3,
.footer-col h4 {
  margin: 0 0 0.6rem;
  font-family: "Poppins", Arial, sans-serif;
}

.footer-col p {
  margin: 0;
  color: rgba(255, 255, 255, 0.9);
}

.footer-col a {
  display: block;
  color: rgba(255, 255, 255, 0.94);
  margin-top: 0.38rem;
}

.footer-map {
  min-height: 160px;
  border-color: rgba(255, 255, 255, 0.5);
  color: #e8f4ff;
  background: rgba(255, 255, 255, 0.08);
}

.footer-bottom {
  background: #073d6e;
  padding: 0.88rem 0;
  font-size: 0.9rem;
}

.footer-bottom-inner {
  display: flex;
  justify-content: space-between;
  gap: 0.8rem;
  flex-wrap: wrap;
}

.mobile-sticky {
  display: none;
}

@media (max-width: 1199px) {
  .grid-4 {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }

  .trust-list {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }

  .footer-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 840px) {
  .desktop-nav {
    display: none;
  }

  .menu-toggle {
    display: inline-flex;
  }

  .split-2,
  .grid-2,
  .grid-3,
  .grid-4,
  .sidebar-layout,
  .timeline-item,
  .footer-grid,
  .trust-list {
    grid-template-columns: 1fr;
  }

  .timeline-item {
    gap: 0.55rem;
  }

  .timeline-count {
    margin-bottom: 0.3rem;
  }

  .container {
    width: min(var(--max), calc(100% - 1.2rem));
  }

  .site-brand img {
    width: 48px;
    height: 48px;
  }

  .brand-sub {
    display: none;
  }

  .page-wrap {
    padding-bottom: 5rem;
  }

  .mobile-sticky {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    display: grid;
    grid-template-columns: 1fr 1fr;
    z-index: 300;
    box-shadow: 0 -8px 22px rgba(12, 45, 82, 0.22);
  }

  .mobile-sticky a {
    min-height: 56px;
    display: grid;
    place-items: center;
    color: #fff;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: 700;
  }

  .mobile-sticky .call {
    background: #0b5fa5;
  }

  .mobile-sticky .offer {
    background: #ff9f1c;
  }
}
CSS

cat > assets/site.js <<'JS'
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
JS

render_page() {
  local dir="$1"
  local title="$2"
  local subtitle="$3"
  local breadcrumb="$4"
  local rel_prefix
  local body_file
  body_file=$(mktemp)
  cat > "$body_file"

  if [[ "$dir" == "." ]]; then
    rel_prefix="./"
  else
    local segment_count
    segment_count=$(awk -F'/' '{print NF}' <<< "$dir")
    rel_prefix=$(printf '../%.0s' $(seq 1 "$segment_count"))
  fi

  mkdir -p "$dir"
  cat > "$dir/index.html" <<HTML
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${title} | Paramount Bay Homebuyers</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&family=Poppins:wght@500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/assets/styles.css" />
</head>
<body>
  <header class="site-header">
    <div class="container site-header-inner">
      <a class="site-brand" href="/" aria-label="Paramount Bay Homebuyers Home">
        <img src="/assets/images/Logo.png" alt="Paramount Bay Homebuyers logo" />
        <span class="brand-text">
          <span class="brand-name">Paramount Bay Homebuyers</span>
          <span class="brand-sub">Local Cash Home Buyers • Tampa Bay</span>
        </span>
      </a>

      <nav class="desktop-nav" aria-label="Primary">
        <ul class="nav-list">
          <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="/how-it-works/">How It Works</a></li>
          <li class="nav-item"><a class="nav-link" href="/sell-your-house/">Sell Your House</a></li>
          <li class="nav-item"><a class="nav-link" href="/locations/">Areas We Serve</a></li>
          <li class="nav-item"><a class="nav-link" href="/about/">About</a></li>
          <li class="nav-item"><a class="nav-link" href="/contact/">Contact</a></li>
        </ul>
        <a class="btn btn-primary" href="/contact/">Get Cash Offer</a>
      </nav>

      <button class="menu-toggle" data-menu-toggle aria-expanded="false" aria-controls="mobile-menu">Menu</button>
    </div>

    <div class="mobile-menu" id="mobile-menu" data-mobile-menu>
      <div class="container">
        <ul class="mobile-nav">
          <li><a href="/">Home</a></li>
          <li><a href="/how-it-works/">How It Works</a></li>
          <li><a href="/sell-your-house/">Sell Your House</a></li>
          <li><a href="/locations/">Areas We Serve</a></li>
          <li><a href="/about/">About</a></li>
          <li><a href="/contact/">Contact</a></li>
          <li><a href="tel:+18135551234">Call (813) 555-1234</a></li>
          <li><a class="btn btn-primary btn-block" href="/contact/">Get Cash Offer</a></li>
        </ul>
      </div>
    </div>
  </header>

  <main class="page-wrap">
    <div class="container">
      ${breadcrumb}
      <section class="page-hero">
        <p class="eyebrow">Serving Tampa Bay Homeowners</p>
        <h1>${title}</h1>
        <p class="page-lead">${subtitle}</p>
      </section>

$(cat "$body_file")
    </div>
  </main>

  <footer class="site-footer">
    <div class="footer-top">
      <div class="container footer-grid">
        <section class="footer-col">
          <img class="footer-brand-logo" src="/assets/images/Logo.png" alt="Paramount Bay Homebuyers logo" />
          <h3>Paramount Bay Homebuyers</h3>
          <p>Friendly local cash buyer helping Tampa Bay homeowners sell quickly, simply, and with certainty.</p>
          <a href="/contact/">Get Offer</a>
          <a href="tel:+18135551234">(813) 555-1234</a>
          <a href="mailto:hello@paramountbayhomebuyers.com">hello@paramountbayhomebuyers.com</a>
        </section>

        <section class="footer-col">
          <h4>Main Navigation</h4>
          <a href="/how-it-works/">How It Works</a>
          <a href="/sell-your-house/">Sell Your House</a>
          <a href="/locations/">Locations</a>
          <a href="/situations/">Situations</a>
          <a href="/about/">About</a>
        </section>

        <section class="footer-col">
          <h4>Top Locations</h4>
          <a href="/locations/tampa/">Tampa</a>
          <a href="/locations/st-petersburg/">St Petersburg</a>
          <a href="/locations/clearwater/">Clearwater</a>
          <a href="/locations/brandon/">Brandon</a>
          <p style="margin-top:0.7rem;"><strong>Service Area:</strong> Hillsborough, Pinellas, Pasco, Hernando</p>
          <p style="margin-top:0.35rem;"><strong>Address:</strong> Tampa Bay, FL (Office location to be added)</p>
        </section>

        <section class="footer-col">
          <h4>Service Area Map</h4>
          <div class="image-placeholder footer-map">Service area map<br />Counties + key city pins</div>
        </section>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="container footer-bottom-inner">
        <span>Copyright 2026 Paramount Bay Homebuyers</span>
        <span><a href="#">Privacy Policy</a> • <a href="#">Terms of Use</a></span>
      </div>
    </div>
  </footer>

  <div class="mobile-sticky" aria-label="Sticky Mobile Actions">
    <a class="call" href="tel:+18135551234">Tap to Call</a>
    <a class="offer" href="/contact/">Get Offer</a>
  </div>

  <script src="/assets/site.js"></script>
</body>
</html>
HTML

  # Convert root-absolute links to depth-aware relative links so static hosting
  # works both locally and on GitHub Pages project paths.
  perl -0pi -e 's{(href|src)="/}{$1="'"$rel_prefix"'}g' "$dir/index.html"

  rm -f "$body_file"
}

# Home
render_page "." "Sell Your House Fast in Tampa Bay" "Get a fair cash offer in 24 hours, sell your home as-is, and close on your schedule with a trusted local team." "" <<'HTML'
      <section class="section">
        <div class="split-2">
          <article class="card">
            <p class="eyebrow">Serving Tampa Bay, FL</p>
            <h2>No Repairs. No Agents. No Waiting.</h2>
            <p>Homeowners can request a fair cash offer in minutes and choose a closing date that fits their timeline.</p>
            <div class="meta-chip-row">
              <span class="meta-chip">Offer in 24 Hours</span>
              <span class="meta-chip">Close in 7-21 Days</span>
              <span class="meta-chip">Zero Fees</span>
            </div>
            <p style="margin-top:1rem; display:flex; gap:0.6rem; flex-wrap:wrap;">
              <a class="btn btn-primary" href="/contact/">Get My Cash Offer</a>
              <a class="btn btn-secondary" href="/how-it-works/">See How It Works</a>
            </p>
            <p style="margin-top:0.9rem; color:#61778f;"><strong>Social Proof:</strong> 4.9/5 homeowner rating across Tampa Bay.</p>
          </article>

          <article class="form-shell">
            <h3>Get Your Free Cash Offer</h3>
            <p>No obligation. We will review your details and respond quickly.</p>
            <div class="field">Full Name *</div>
            <div class="field">Property Address *</div>
            <div class="field">Phone Number *</div>
            <div class="field">Email Address (Optional)</div>
            <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="/contact/">Get My Free Offer Now</a></p>
            <p style="margin-top:0.6rem; font-size:0.85rem; color:#667f98;">Privacy reassurance row with lock icon will live here.</p>
          </article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Trust Signals</h2>
        <div class="trust-list">
          <div class="trust-item">Offers in 24 Hours</div>
          <div class="trust-item">Close in 7 to 21 Days</div>
          <div class="trust-item">No Repairs Needed</div>
          <div class="trust-item">Zero Fees or Commissions</div>
          <div class="trust-item">5-Star Rated Local Buyer</div>
        </div>
      </section>

      <section class="section alt-blue">
        <h2>How It Works</h2>
        <p class="section-intro">Three simple steps help you sell quickly with less stress.</p>
        <div class="grid grid-3">
          <article class="card">
            <span class="step-badge">1</span>
            <h3>Tell Us About Your Home</h3>
            <p>Quick form or phone call. No open house prep and no lengthy listing process.</p>
          </article>
          <article class="card">
            <span class="step-badge">2</span>
            <h3>Get Your Cash Offer</h3>
            <p>Written offer delivered quickly so you can make a decision with zero pressure.</p>
          </article>
          <article class="card">
            <span class="step-badge">3</span>
            <h3>Pick Your Closing Date</h3>
            <p>Close fast or set a date that works better for your move and next steps.</p>
          </article>
        </div>
      </section>

      <section class="section">
        <h2>Any Situation, Any Condition</h2>
        <p class="section-intro">Situation card system includes icon area, title, summary, and destination link.</p>
        <div class="grid grid-4">
          <a class="card" href="/situations/inherited-property/"><div class="icon-placeholder">Icon</div><h3>Inherited Property</h3><p>Sell inherited homes without cleanup or delays.</p></a>
          <a class="card" href="/situations/fire-damage/"><div class="icon-placeholder">Icon</div><h3>Fire Damage</h3><p>As-is sale path for homes with major fire damage.</p></a>
          <a class="card" href="/situations/flood-damage/"><div class="icon-placeholder">Icon</div><h3>Flood Damage</h3><p>Skip restoration and move forward quickly.</p></a>
          <a class="card" href="/situations/foundation-problems/"><div class="icon-placeholder">Icon</div><h3>Foundation Problems</h3><p>Avoid costly structural repairs before selling.</p></a>
          <a class="card" href="/situations/foreclosure/"><div class="icon-placeholder">Icon</div><h3>Foreclosure</h3><p>Fast timeline options when urgency matters.</p></a>
          <a class="card" href="/situations/landlord-with-tenants/"><div class="icon-placeholder">Icon</div><h3>Landlord with Tenants</h3><p>Sell tenant-occupied properties with less friction.</p></a>
          <a class="card" href="/situations/divorce/"><div class="icon-placeholder">Icon</div><h3>Divorce</h3><p>Simple sale flow designed for sensitive transitions.</p></a>
          <a class="card" href="/situations/code-violations/"><div class="icon-placeholder">Icon</div><h3>Code Violations</h3><p>Sell without correcting every violation upfront.</p></a>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Ready to Get Your Cash Offer?</h2>
        <p>Start with a no-pressure offer and choose your ideal closing date.</p>
        <a class="btn btn-primary" href="/contact/">Get My Cash Offer</a>
      </section>

      <section class="section alt-sand">
        <h2>Cash Offer vs. Traditional Sale</h2>
        <div class="compare-table-wrap">
          <table class="compare-table">
            <thead>
              <tr><th>Category</th><th>Paramount Bay</th><th>Traditional Agent</th></tr>
            </thead>
            <tbody>
              <tr><td>Closing Time</td><td>7 to 21 days</td><td>Often 60+ days</td></tr>
              <tr><td>Repairs</td><td>Sell As-Is</td><td>Frequently required</td></tr>
              <tr><td>Agent Commission</td><td>None</td><td>Typically 5% to 6%</td></tr>
              <tr><td>Open Houses</td><td>Not needed</td><td>Usually required</td></tr>
              <tr><td>Deal Certainty</td><td>High</td><td>Can fall through</td></tr>
            </tbody>
          </table>
        </div>
      </section>

      <section class="section">
        <h2>Areas We Serve</h2>
        <div class="grid grid-4" style="margin-bottom:0.9rem;">
          <a class="card" href="/locations/tampa/"><h3>Tampa</h3><p>Fast local closings with neighborhood-specific support.</p></a>
          <a class="card" href="/locations/st-petersburg/"><h3>St. Petersburg</h3><p>Local testimonials and neighborhood insights.</p></a>
          <a class="card" href="/locations/clearwater/"><h3>Clearwater</h3><p>Localized stats, FAQ, and lead capture block.</p></a>
          <a class="card" href="/locations/brandon/"><h3>Brandon</h3><p>Internal link mesh to nearby markets.</p></a>
        </div>
        <div class="image-placeholder lg">Interactive service area map for Tampa Bay</div>
      </section>

      <section class="section alt-blue">
        <h2>What Homeowners Say</h2>
        <div class="grid grid-3">
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Sarah - Tampa</h3><p>"Fast process, clear communication, and no surprises at closing."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Carlos - St. Petersburg</h3><p>"We sold as-is and moved on our timeline without extra stress."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Dana - Clearwater</h3><p>"Exactly the simple local buyer experience we hoped for."</p></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Choose Your Closing Date and Move Forward</h2>
        <p>Final CTA section variant used near the end of conversion pages.</p>
        <a class="btn btn-primary" href="/contact/">Get My Cash Offer</a>
      </section>
HTML

# How it works
render_page "how-it-works" "How It Works" "See exactly how the process works from first contact to closing day." '<nav class="breadcrumb">Home &gt; How It Works</nav>' <<'HTML'
      <section class="section alt-blue">
        <h2>Step-by-Step Process</h2>
        <p class="section-intro">Our process stays clear and simple on every device.</p>
        <div class="timeline">
          <article class="timeline-item"><div class="timeline-count">1</div><div><h3>Submit Your Property Info</h3><p>Form or phone intake with essential property details.</p></div></article>
          <article class="timeline-item"><div class="timeline-count">2</div><div><h3>We Evaluate Your Home</h3><p>Internal review of location, condition, and local sales context.</p></div></article>
          <article class="timeline-item"><div class="timeline-count">3</div><div><h3>Receive Your Cash Offer</h3><p>Clear written offer with no listing obligations.</p></div></article>
          <article class="timeline-item"><div class="timeline-count">4</div><div><h3>You Choose the Closing Date</h3><p>Close quickly or choose a date that fits your next move.</p></div></article>
          <article class="timeline-item"><div class="timeline-count">5</div><div><h3>Get Paid at Closing</h3><p>Title company closing flow with straightforward documents.</p></div></article>
        </div>
      </section>

      <section class="section" id="recently-purchased">
        <h2>Recently Purchased Homes</h2>
        <div class="grid grid-3">
          <article class="card"><div class="image-placeholder sm">Property Photo</div><h3>Seminole Heights, Tampa</h3><p>Single-family • Closed in 12 days • Inherited property</p></article>
          <article class="card"><div class="image-placeholder sm">Property Photo</div><h3>Kenwood, St. Petersburg</h3><p>Bungalow • Closed in 10 days • Needed repairs</p></article>
          <article class="card"><div class="image-placeholder sm">Property Photo</div><h3>Countryside, Clearwater</h3><p>Townhome • Closed in 15 days • Relocation timeline</p></article>
        </div>
      </section>

      <section class="section alt-sand" id="faq">
        <h2>FAQ</h2>
        <div class="faq-item"><h3>How fast can you close?</h3><p>Most transactions close in 7 to 21 days depending on title readiness and seller preference.</p></div>
        <div class="faq-item"><h3>Do I need to clean or repair the home?</h3><p>No. You can sell as-is without cleaning, staging, or repairs.</p></div>
        <div class="faq-item"><h3>Are there fees or commissions?</h3><p>No agent commissions and no added seller-facing closing fees in this flow.</p></div>
        <div class="faq-item"><h3>Am I committed if I request an offer?</h3><p>No. Offer requests are no-obligation by design.</p></div>
      </section>

      <section class="section cta-band">
        <h2>Start With a Fast, No-Obligation Offer</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

# Sell your house
render_page "sell-your-house" "Sell Your House Fast for Cash in Tampa Bay" "Need to sell house fast Tampa homeowners can count on? Our cash home buyer Tampa Bay team helps you close quickly. We buy houses Florida owners want to sell as-is." '<nav class="breadcrumb">Home &gt; Sell Your House</nav>' <<'HTML'
      <section class="section">
        <div class="split-2">
          <article class="card">
            <h2>What We Buy</h2>
            <p>We buy single-family homes, condos, townhomes, and multi-family properties in any condition across Tampa Bay and greater Florida.</p>
            <div class="meta-chip-row">
              <span class="meta-chip">Single Family</span>
              <span class="meta-chip">Condo</span>
              <span class="meta-chip">Townhome</span>
              <span class="meta-chip">Multi-Family</span>
              <span class="meta-chip">Fire Damage</span>
              <span class="meta-chip">Flood Damage</span>
              <span class="meta-chip">Foreclosure</span>
              <span class="meta-chip">Inherited</span>
            </div>
            <div class="image-placeholder" style="margin-top:0.9rem;">Property types visual panel</div>
          </article>
          <article class="form-shell">
            <h3>Get Your Free Cash Offer</h3>
            <p>Tell us about your property and we will contact you with next steps.</p>
            <div class="field">Full Name *</div>
            <div class="field">Property Address *</div>
            <div class="field">Phone Number *</div>
            <div class="field">Email Address</div>
            <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="/contact/">Get My Free Offer Now</a></p>
          </article>
        </div>
      </section>

      <section class="section alt-blue">
        <h2>How Fast Can You Close?</h2>
        <div class="grid grid-3">
          <article class="card"><div class="icon-placeholder">Icon</div><h3>As Fast as 7 Days</h3><p>Urgent timeline option for sellers who need speed.</p></article>
          <article class="card"><div class="icon-placeholder">Icon</div><h3>On Your Schedule</h3><p>Flexible closing date for transitions and move planning.</p></article>
          <article class="card"><div class="icon-placeholder">Icon</div><h3>Reliable Closing</h3><p>Clear process designed around certainty and fewer surprises.</p></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Get a Clear Offer and Timeline</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>

      <section class="section alt-sand">
        <h2>Cash Offer vs. Traditional Sale</h2>
        <div class="compare-table-wrap">
          <table class="compare-table">
            <thead>
              <tr><th>Line Item</th><th>Cash Offer</th><th>Traditional Sale</th></tr>
            </thead>
            <tbody>
              <tr><td>Closing Speed</td><td>7-21 days</td><td>Often 60+ days</td></tr>
              <tr><td>Repair Budget</td><td>Not required</td><td>Usually required</td></tr>
              <tr><td>Commission</td><td>0%</td><td>Typically 5%-6%</td></tr>
              <tr><td>Holding Costs</td><td>Reduced timeline</td><td>Extended listing period</td></tr>
              <tr><td>Open Houses</td><td>No</td><td>Yes</td></tr>
              <tr><td>Deal Certainty</td><td>High</td><td>Can fall through</td></tr>
            </tbody>
          </table>
        </div>
      </section>

      <section class="section">
        <h2>Local Market Overview</h2>
        <div class="grid grid-3">
          <article class="card"><h3>Median Home Price</h3><p style="font-size:1.6rem; font-weight:700; color:#1c4c76;">$412,000</p></article>
          <article class="card"><h3>Average Days on Market</h3><p style="font-size:1.6rem; font-weight:700; color:#1c4c76;">43 Days</p></article>
          <article class="card"><h3>Year-over-Year Growth</h3><p style="font-size:1.6rem; font-weight:700; color:#1c4c76;">+4.2%</p></article>
        </div>
        <h3 style="margin-top:1rem;">Explore Nearby Resources</h3>
        <div class="grid grid-3" style="margin-top:0.75rem;">
          <article class="card">
            <h3>Location Pages</h3>
            <p><a href="/locations/tampa/">Tampa</a> • <a href="/locations/st-petersburg/">St. Petersburg</a> • <a href="/locations/clearwater/">Clearwater</a></p>
          </article>
          <article class="card">
            <h3>Situation Pages</h3>
            <p><a href="/situations/foreclosure/">Foreclosure</a> • <a href="/situations/inherited-property/">Inherited Property</a> • <a href="/situations/fire-damage/">Fire Damage</a></p>
          </article>
          <article class="card">
            <h3>Process + FAQ</h3>
            <p><a href="/how-it-works/">How It Works</a> • <a href="#faq">FAQ</a></p>
          </article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Ready to Move Forward With a Cash Offer?</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>

      <section class="section alt-sand" id="faq">
        <h2>Frequently Asked Questions</h2>
        <div class="faq-item"><h3>Can I sell my house fast in Tampa Bay without repairs?</h3><p>Yes. We buy homes as-is, even if they need major work.</p></div>
        <div class="faq-item"><h3>How soon can I receive an offer?</h3><p>Most homeowners receive an offer within 24 hours.</p></div>
        <div class="faq-item"><h3>Do I pay commissions or hidden fees?</h3><p>No. Fee transparency is built into CTA and comparison sections.</p></div>
        <div class="faq-item"><h3>Can I choose my own closing date?</h3><p>Yes. You can choose the closing date that works best for you.</p></div>
        <div class="faq-item"><h3>Do you buy inherited or damaged properties?</h3><p>Yes. Situation pathways connect from this pillar to detail pages.</p></div>
      </section>

      <section class="section cta-band">
        <h2>Still Have Questions? Get Your Offer Today</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

# Locations hub
render_page "locations" "Areas We Serve in Tampa Bay" "Browse every county and city we serve across Tampa Bay." '<nav class="breadcrumb">Home &gt; Locations</nav>' <<'HTML'
      <section class="section">
        <h2>Service Area Map</h2>
        <div class="image-placeholder lg">Interactive map of counties and service cities</div>
      </section>

      <section class="section alt-blue">
        <h2>Browse by County</h2>
        <div class="grid grid-2">
          <a class="card" href="/locations/pinellas-county/"><h3>Pinellas County</h3><p>St. Petersburg, Clearwater, Largo, Dunedin</p></a>
          <a class="card" href="/locations/hillsborough-county/"><h3>Hillsborough County</h3><p>Tampa, Brandon, Riverview</p></a>
          <a class="card" href="/locations/pasco-county/"><h3>Pasco County</h3><p>Wesley Chapel, New Port Richey, Zephyrhills</p></a>
          <a class="card" href="/locations/hernando-county/"><h3>Hernando County</h3><p>Brooksville, Spring Hill</p></a>
        </div>
      </section>

      <section class="section">
        <h2>Top Cities</h2>
        <div class="grid grid-4">
          <a class="card" href="/locations/tampa/"><div class="image-placeholder sm">City Image</div><h3>Tampa</h3></a>
          <a class="card" href="/locations/st-petersburg/"><div class="image-placeholder sm">City Image</div><h3>St. Petersburg</h3></a>
          <a class="card" href="/locations/clearwater/"><div class="image-placeholder sm">City Image</div><h3>Clearwater</h3></a>
          <a class="card" href="/locations/brandon/"><div class="image-placeholder sm">City Image</div><h3>Brandon</h3></a>
          <a class="card" href="/locations/wesley-chapel/"><div class="image-placeholder sm">City Image</div><h3>Wesley Chapel</h3></a>
          <article class="card"><div class="image-placeholder sm">City Image</div><h3>Largo</h3></article>
          <article class="card"><div class="image-placeholder sm">City Image</div><h3>Dunedin</h3></article>
          <article class="card"><div class="image-placeholder sm">City Image</div><h3>Riverview</h3></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Need Help in a Specific Area?</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

render_county() {
  local slug="$1"
  local county="$2"
  local breadcrumb="<nav class=\"breadcrumb\">Home &gt; Locations &gt; ${county}</nav>"
  local subtitle="We buy houses throughout ${county} and provide fair cash offers with flexible timelines."
  local neighborhood_cards=""

  case "$slug" in
    pinellas-county)
      neighborhood_cards='
          <a class="card" href="/locations/st-petersburg/"><h3>Old Northeast</h3><p>St. Petersburg</p></a>
          <a class="card" href="/locations/clearwater/"><h3>Countryside</h3><p>Clearwater</p></a>
          <a class="card" href="/locations/clearwater/"><h3>Largo Central</h3><p>Largo</p></a>
          <a class="card" href="/locations/clearwater/"><h3>Downtown Dunedin</h3><p>Dunedin</p></a>'
      ;;
    hillsborough-county)
      neighborhood_cards='
          <a class="card" href="/locations/tampa/"><h3>Seminole Heights</h3><p>Tampa</p></a>
          <a class="card" href="/locations/tampa/"><h3>Hyde Park</h3><p>Tampa</p></a>
          <a class="card" href="/locations/brandon/"><h3>Brandon Town Center</h3><p>Brandon</p></a>
          <a class="card" href="/locations/brandon/"><h3>South Riverview</h3><p>Riverview</p></a>'
      ;;
    pasco-county)
      neighborhood_cards='
          <a class="card" href="/locations/wesley-chapel/"><h3>Seven Oaks</h3><p>Wesley Chapel</p></a>
          <a class="card" href="/locations/wesley-chapel/"><h3>Meadow Pointe</h3><p>Wesley Chapel</p></a>
          <a class="card" href="/locations/pasco-county/"><h3>Downtown New Port Richey</h3><p>New Port Richey</p></a>
          <a class="card" href="/locations/pasco-county/"><h3>Zephyr Commons</h3><p>Zephyrhills</p></a>'
      ;;
    hernando-county)
      neighborhood_cards='
          <a class="card" href="/locations/hernando-county/"><h3>Spring Hill Central</h3><p>Spring Hill</p></a>
          <a class="card" href="/locations/hernando-county/"><h3>Historic Brooksville</h3><p>Brooksville</p></a>
          <a class="card" href="/locations/hernando-county/"><h3>Weeki Wachee</h3><p>Coastal Area</p></a>
          <a class="card" href="/locations/hernando-county/"><h3>Timber Pines</h3><p>Spring Hill</p></a>'
      ;;
  esac

  render_page "locations/$slug" "We Buy Houses in ${county}, FL" "$subtitle" "$breadcrumb" <<HTML
      <section class="section alt-blue">
        <h2>${county} Market Snapshot</h2>
        <div class="grid grid-3">
          <article class="card"><h3>Median Price</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">__VALUE_MEDIAN__</p></article>
          <article class="card"><h3>Inventory</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">__VALUE_INVENTORY__</p></article>
          <article class="card"><h3>Avg Days on Market</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">__VALUE_DAYS__</p></article>
        </div>
      </section>

      <section class="section">
        <h2>Common Seller Situations in ${county}</h2>
        <div class="grid grid-2">
          <article class="card"><div class="icon-placeholder">Icon</div><h3>Repair Burden</h3><p>Homes needing major updates before listing.</p></article>
          <article class="card"><div class="icon-placeholder">Icon</div><h3>Timeline Pressure</h3><p>Relocation or financial deadlines requiring a fast close.</p></article>
          <article class="card"><div class="icon-placeholder">Icon</div><h3>Inherited Homes</h3><p>Out-of-area ownership and maintenance costs.</p></article>
          <article class="card"><div class="icon-placeholder">Icon</div><h3>Tenant Occupancy</h3><p>Landlord transitions with occupied units.</p></article>
        </div>
      </section>

      <section class="section alt-sand">
        <h2>Neighborhoods We Buy In</h2>
        <div class="grid grid-4">
${neighborhood_cards}
        </div>
      </section>

      <section class="section cta-band">
        <h2>Get a Fast Local Cash Offer in ${county}</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>

      <section class="section" id="faq">
        <h2>${county} FAQ</h2>
        <div class="faq-item"><h3>Do you buy homes across all of ${county}?</h3><p>Yes. We buy homes throughout the county, including surrounding neighborhoods and nearby cities.</p></div>
        <div class="faq-item"><h3>How quickly can closing happen?</h3><p>Most closings happen within 7 to 21 days.</p></div>
        <div class="faq-item"><h3>Can I sell without repairs?</h3><p>Yes. As-is condition is supported across county pages.</p></div>
      </section>

      <section class="section cta-band">
        <h2>Need to Sell in ${county}? We Can Help</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML
}

# Replace county metric placeholders with values
render_county "pinellas-county" "Pinellas County"
render_county "hillsborough-county" "Hillsborough County"
render_county "pasco-county" "Pasco County"
render_county "hernando-county" "Hernando County"

# County value substitutions
perl -0pi -e 's/__VALUE_MEDIAN__/455,000/g; s/__VALUE_INVENTORY__/2.4 Months/g; s/__VALUE_DAYS__/46 Days/g' locations/pinellas-county/index.html
perl -0pi -e 's/__VALUE_MEDIAN__/435,000/g; s/__VALUE_INVENTORY__/2.8 Months/g; s/__VALUE_DAYS__/43 Days/g' locations/hillsborough-county/index.html
perl -0pi -e 's/__VALUE_MEDIAN__/390,000/g; s/__VALUE_INVENTORY__/3.1 Months/g; s/__VALUE_DAYS__/48 Days/g' locations/pasco-county/index.html
perl -0pi -e 's/__VALUE_MEDIAN__/335,000/g; s/__VALUE_INVENTORY__/3.6 Months/g; s/__VALUE_DAYS__/52 Days/g' locations/hernando-county/index.html

render_city() {
  local slug="$1"
  local city="$2"
  local county="$3"
  local neighborhoods="$4"
  local median="$5"
  local dom="$6"
  local growth="$7"
  local subtitle="Sell your ${city} home as-is with a local buyer who understands neighborhood value, market timing, and fast closings."
  local breadcrumb="<nav class=\"breadcrumb\">Home &gt; Locations &gt; ${city}</nav>"

  render_page "locations/$slug" "We Buy Houses in ${city}, FL" "$subtitle" "$breadcrumb" <<HTML
      <section class="section">
        <div class="split-2">
          <article class="card">
            <h2>${city} Seller Snapshot</h2>
            <p>If you need to sell quickly in ${city}, you can skip repairs, avoid listing uncertainty, and close on your preferred timeline.</p>
            <p style="margin-top:0.85rem;"><strong>Neighborhoods:</strong> ${neighborhoods}</p>
            <div class="image-placeholder" style="margin-top:0.8rem;">${city} neighborhood photo area</div>
          </article>
          <article class="form-shell">
            <h3>Get Your Free Cash Offer</h3>
            <p>Share your property details and receive a no-obligation offer.</p>
            <div class="field">Full Name *</div>
            <div class="field">Property Address *</div>
            <div class="field">Phone Number *</div>
            <div class="field">Email Address</div>
            <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="/contact/">Get My Free Offer Now</a></p>
          </article>
        </div>
      </section>

      <section class="section alt-blue">
        <h2>${city} Real Estate Stats</h2>
        <div class="grid grid-3">
          <article class="card"><h3>Median Home Price</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">${median}</p></article>
          <article class="card"><h3>Average Days on Market</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">${dom}</p></article>
          <article class="card"><h3>Year-over-Year Change</h3><p style="font-size:1.5rem; font-weight:700; color:#1f4e79;">${growth}</p></article>
        </div>
      </section>

      <section class="section">
        <h2>Homeowner Reviews in ${city}</h2>
        <div class="grid grid-3">
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>${city} Seller Story</h3><p>"Simple process from first call to closing day."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>${city} Seller Story</h3><p>"Offer was fair and communication stayed clear."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>${city} Seller Story</h3><p>"We closed on the exact date we needed."</p></article>
        </div>
      </section>

      <section class="section alt-sand">
        <h2>Nearby Areas We Also Serve</h2>
        <div class="grid grid-4">
          <a class="card" href="/locations/tampa/"><h3>Tampa</h3></a>
          <a class="card" href="/locations/st-petersburg/"><h3>St. Petersburg</h3></a>
          <a class="card" href="/locations/clearwater/"><h3>Clearwater</h3></a>
          <a class="card" href="/locations/brandon/"><h3>Brandon</h3></a>
        </div>
      </section>

      <section class="section" id="faq">
        <h2>${city} FAQ</h2>
        <div class="faq-item"><h3>How fast can I sell in ${city}?</h3><p>Most deals close in 7 to 21 days depending on title and timing.</p></div>
        <div class="faq-item"><h3>Do I need to repair my home first?</h3><p>No. City pages support as-is purchase positioning.</p></div>
        <div class="faq-item"><h3>Are there commissions or fees?</h3><p>No agent commissions or added seller fees.</p></div>
      </section>

      <section class="section cta-band">
        <h2>Ready to Sell in ${city}?</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML
}

render_city "st-petersburg" "St. Petersburg" "Pinellas County" "Old Northeast, Kenwood, Snell Isle, Shore Acres" "\$448,000" "39 Days" "+3.8%"
render_city "tampa" "Tampa" "Hillsborough County" "Seminole Heights, Hyde Park, Carrollwood, Westchase" "\$432,000" "41 Days" "+4.5%"
render_city "clearwater" "Clearwater" "Pinellas County" "Countryside, Island Estates, Belleair, Clearwater Beach" "\$420,000" "44 Days" "+3.1%"
render_city "brandon" "Brandon" "Hillsborough County" "Bloomingdale, Limona, Providence Lakes, Heather Lakes" "\$384,000" "36 Days" "+4.0%"
render_city "wesley-chapel" "Wesley Chapel" "Pasco County" "Seven Oaks, Meadow Pointe, Epperson, Wiregrass Ranch" "\$395,000" "34 Days" "+5.2%"

# Situations hub
render_page "situations" "We Buy Houses in Any Situation" "Hub page for all situation detail routes with uniform card hierarchy and conversion path back to the pillar page." '<nav class="breadcrumb">Home &gt; Situations</nav>' <<'HTML'
      <section class="section">
        <h2>Situations We Help With</h2>
        <div class="grid grid-4">
          <a class="card" href="/situations/inherited-property/"><div class="icon-placeholder">Icon</div><h3>Inherited Property</h3><p>Sell inherited homes quickly and privately.</p></a>
          <a class="card" href="/situations/fire-damage/"><div class="icon-placeholder">Icon</div><h3>Fire Damage</h3><p>Skip restoration and sell as-is.</p></a>
          <a class="card" href="/situations/flood-damage/"><div class="icon-placeholder">Icon</div><h3>Flood Damage</h3><p>Move forward without major repair costs.</p></a>
          <a class="card" href="/situations/foundation-problems/"><div class="icon-placeholder">Icon</div><h3>Foundation Problems</h3><p>No structural fixes required before sale.</p></a>
          <a class="card" href="/situations/foreclosure/"><div class="icon-placeholder">Icon</div><h3>Foreclosure</h3><p>Fast options for urgent timelines.</p></a>
          <a class="card" href="/situations/landlord-with-tenants/"><div class="icon-placeholder">Icon</div><h3>Landlord with Tenants</h3><p>Sell occupied rentals with less friction.</p></a>
          <a class="card" href="/situations/divorce/"><div class="icon-placeholder">Icon</div><h3>Divorce</h3><p>Simpler path during major transitions.</p></a>
          <a class="card" href="/situations/code-violations/"><div class="icon-placeholder">Icon</div><h3>Code Violations</h3><p>Sell without fixing every citation first.</p></a>
        </div>
      </section>
      <section class="section cta-band">
        <h2>Talk Through Your Situation Today</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

render_situation() {
  local slug="$1"
  local title="$2"
  local subtitle="If you are facing this situation, we can help you sell quickly with a clear plan."
  local breadcrumb="<nav class=\"breadcrumb\">Home &gt; Situations &gt; ${title}</nav>"

  render_page "situations/$slug" "Sell Your ${title} Home in Tampa Bay" "$subtitle" "$breadcrumb" <<HTML
      <section class="section">
        <div class="split-2">
          <article class="card">
            <h2>Why This Situation Is Hard to List Traditionally</h2>
            <p>Selling in this situation can feel overwhelming. Our team gives you a clear, judgment-free path forward.</p>
            <h3 style="margin-top:0.9rem;">How a Cash Sale Helps</h3>
            <p>You avoid repairs, skip agent commissions, and choose a closing date that fits your timeline.</p>
            <div class="meta-chip-row">
              <span class="meta-chip">No Repairs</span>
              <span class="meta-chip">No Cleanup</span>
              <span class="meta-chip">Zero Fees</span>
              <span class="meta-chip">Close Fast</span>
            </div>
            <div class="image-placeholder" style="margin-top:0.9rem;">Situation support image area</div>
          </article>
          <article class="form-shell">
            <h3>Get Your Free Cash Offer</h3>
            <div class="field">Full Name *</div>
            <div class="field">Property Address *</div>
            <div class="field">Phone Number *</div>
            <div class="field">Email Address</div>
            <div class="field large">Tell us about your situation (optional)</div>
            <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="/contact/">Get My Free Offer Now</a></p>
          </article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Get a Clear Next Step for Your Situation</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>

      <section class="section alt-blue">
        <h2>Helpful Internal Links</h2>
        <div class="grid grid-3">
          <a class="card" href="/sell-your-house/"><h3>Sell Your House Pillar</h3><p>Main guide for cash sale process and comparisons.</p></a>
          <a class="card" href="/locations/tampa/"><h3>City Pages</h3><p>Localized area pages with nearby city links.</p></a>
          <a class="card" href="/sell-your-house/#faq"><h3>FAQ Hub</h3><p>Shared question framework for long-tail intent.</p></a>
        </div>
      </section>

      <section class="section alt-sand" id="faq">
        <h2>${title} FAQ</h2>
        <div class="faq-item"><h3>Can I sell in this condition without repairs?</h3><p>Yes. We buy homes as-is in this situation.</p></div>
        <div class="faq-item"><h3>How fast can I close?</h3><p>Many sellers close within 7 to 21 days.</p></div>
        <div class="faq-item"><h3>Do I pay commissions?</h3><p>No. No agent commissions or extra seller-facing fees.</p></div>
      </section>

      <section class="section cta-band">
        <h2>Let’s Find the Best Next Step for You</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML
}

render_situation "inherited-property" "Inherited Property"
render_situation "fire-damage" "Fire-Damaged"
render_situation "flood-damage" "Flood-Damaged"
render_situation "foundation-problems" "Foundation Problem"
render_situation "foreclosure" "Foreclosure"
render_situation "landlord-with-tenants" "Tenant-Occupied Rental"
render_situation "divorce" "Divorce"
render_situation "code-violations" "Code Violation"

# About
render_page "about" "About Paramount Bay Homebuyers" "Learn about our local team and why homeowners trust us for fast, simple sales." '<nav class="breadcrumb">Home &gt; About</nav>' <<'HTML'
      <section class="section">
        <div class="split-2">
          <article class="card">
            <h2>Our Story</h2>
            <p>We started Paramount Bay Homebuyers to give Tampa Bay homeowners a simpler way to sell without stress.</p>
            <p>Our focus is honest communication, fair offers, and reliable closings on your schedule.</p>
            <div class="meta-chip-row">
              <span class="meta-chip">Local Team</span>
              <span class="meta-chip">Transparent Offers</span>
              <span class="meta-chip">Flexible Closing</span>
            </div>
          </article>
          <article class="card">
            <h3>Team Photo</h3>
            <div class="image-placeholder lg">Team and office photo area</div>
          </article>
        </div>
      </section>

      <section class="section alt-blue">
        <h2>Meet the Team</h2>
        <div class="grid grid-3">
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Team Member</h3><p>Role and short local credibility summary.</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Team Member</h3><p>Role and short local credibility summary.</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>Team Member</h3><p>Role and short local credibility summary.</p></article>
        </div>
        <p style="margin-top:0.8rem;"><a class="btn btn-secondary" href="/about/meet-our-team/">View Full Team Page</a></p>
      </section>

      <section class="section">
        <h2>Recent Reviews</h2>
        <div class="grid grid-3">
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"Friendly local team and very clear process."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"No pressure and we closed exactly on schedule."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"Straightforward offer and responsive communication."</p></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Want to Work With a Local Team You Can Trust?</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

render_page "about/meet-our-team" "Meet Our Team" "Meet the local professionals who guide each seller from first call to closing." '<nav class="breadcrumb">Home &gt; About &gt; Meet Our Team</nav>' <<'HTML'
      <section class="section">
        <h2>Team Profiles</h2>
        <div class="grid grid-3">
          <article class="card"><div class="image-placeholder sm">Headshot</div><h3>Team Member Name</h3><p><strong>Role:</strong> Operations / Acquisitions / Client Support</p><p>Local market specialist focused on transparent offers and smooth closings.</p></article>
          <article class="card"><div class="image-placeholder sm">Headshot</div><h3>Team Member Name</h3><p><strong>Role:</strong> Operations / Acquisitions / Client Support</p><p>Local market specialist focused on transparent offers and smooth closings.</p></article>
          <article class="card"><div class="image-placeholder sm">Headshot</div><h3>Team Member Name</h3><p><strong>Role:</strong> Operations / Acquisitions / Client Support</p><p>Local market specialist focused on transparent offers and smooth closings.</p></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Talk With Our Team About Your Property</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

render_page "about/reviews" "Homeowner Reviews" "Read feedback from local homeowners who sold quickly with our team." '<nav class="breadcrumb">Home &gt; About &gt; Reviews</nav>' <<'HTML'
      <section class="section alt-blue">
        <h2>Aggregate Rating + Review Source</h2>
        <div class="split-2">
          <article class="card">
            <h3>4.9 / 5 Average Rating</h3>
            <p>Our average rating reflects responsive service and reliable closings.</p>
            <div class="meta-chip-row">
              <span class="meta-chip">Google</span>
              <span class="meta-chip">Local Testimonials</span>
              <span class="meta-chip">Verified Homeowners</span>
            </div>
          </article>
          <article class="card">
            <div class="image-placeholder">Google Reviews feed embed</div>
          </article>
        </div>
      </section>

      <section class="section">
        <h2>Written Testimonials</h2>
        <div class="grid grid-3">
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"Great communication and a very easy closing process."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"Fair offer and no stress about repairs."</p></article>
          <article class="card"><div class="avatar-placeholder">Photo</div><h3>5-Star Review</h3><p>"Everything happened exactly on the timeline we wanted."</p></article>
        </div>
      </section>

      <section class="section cta-band">
        <h2>Get the Same Simple Experience</h2>
        <a class="btn btn-primary" href="/contact/">Get Offer</a>
      </section>
HTML

# Blog index and post
render_page "blog" "Blog" "Helpful guides for Tampa Bay homeowners exploring a cash sale." '<nav class="breadcrumb">Home &gt; Blog</nav>' <<'HTML'
      <section class="section alt-blue">
        <h2>Featured Post</h2>
        <article class="card">
          <div class="image-placeholder lg">Featured Post Image</div>
          <div class="meta-chip-row">
            <span class="meta-chip">Selling Tips</span>
            <span class="meta-chip">8 min read</span>
          </div>
          <h3 style="margin-top:0.7rem;">How to Sell a House Fast in Tampa Bay Without Repairs</h3>
          <p>Learn practical steps for selling quickly, avoiding repairs, and comparing your options.</p>
          <p style="margin-top:0.8rem;"><a class="btn btn-secondary" href="/blog/[slug]/">Read More</a></p>
        </article>
      </section>

      <section class="section">
        <h2>Latest Articles</h2>
        <div class="grid grid-3">
          <a class="card" href="/blog/[slug]/"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></a>
          <article class="card"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></article>
          <article class="card"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></article>
          <article class="card"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></article>
          <article class="card"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></article>
          <article class="card"><div class="image-placeholder sm">Thumbnail</div><h3>Article Card Title</h3><p>Excerpt and metadata row.</p></article>
        </div>
      </section>
HTML

render_page "blog/[slug]" "Blog Post Template" "Detailed article layout with helpful guidance and quick conversion options." '<nav class="breadcrumb">Home &gt; Blog &gt; [Post Title]</nav>' <<'HTML'
      <section class="section">
        <div class="sidebar-layout">
          <article class="card">
            <p class="eyebrow">Category Tag</p>
            <h2>What Tampa Bay Sellers Need to Know About Cash Offers</h2>
            <p class="section-intro">Date • Author • Read Time</p>
            <div class="image-placeholder lg">Featured article image area</div>
            <h3 style="margin-top:1rem;">Section Heading (H2)</h3>
            <p>Clear, practical guidance for homeowners weighing a fast cash sale.</p>
            <h3 style="margin-top:1rem;">Section Heading (H3)</h3>
            <p>Each section can include local examples, timelines, and decision tips.</p>

            <section class="section cta-band" style="margin-top:1rem;">
              <h2>Mid-Article CTA</h2>
              <a class="btn btn-primary" href="/contact/">Get Offer</a>
            </section>

            <h3 id="faq" style="margin-top:1rem;">FAQ</h3>
            <div class="faq-item"><h3>How quickly can a cash sale close?</h3><p>Many closings happen in 7 to 21 days.</p></div>
            <div class="faq-item"><h3>Do I need to fix my property first?</h3><p>No. As-is sale pathways are supported in this model.</p></div>
            <p style="margin-top:0.9rem;"><a class="btn btn-primary" href="/contact/">Get Offer</a></p>
          </article>

          <aside class="sticky-side">
            <div class="form-shell">
              <h3>Get Your Free Offer</h3>
              <div class="field">Name *</div>
              <div class="field">Property Address *</div>
              <div class="field">Phone *</div>
              <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="/contact/">Get Offer</a></p>
            </div>
            <div class="card">
              <h3>Related Posts</h3>
              <a href="#">How to Compare Cash vs Traditional Sale</a>
              <a href="#">What Happens at a Fast Closing</a>
              <a href="#">Selling an Inherited Property in Florida</a>
            </div>
            <div class="card">
              <h3>Need Help Now?</h3>
              <p><a href="tel:+18135551234">Call (813) 555-1234</a></p>
            </div>
          </aside>
        </div>
      </section>
HTML

# Contact
render_page "contact" "Contact" "Reach our team directly for a no-obligation cash offer and timeline." '<nav class="breadcrumb">Home &gt; Contact</nav>' <<'HTML'
      <section class="section">
        <div class="split-2">
          <article class="card">
            <h2>Contact Details</h2>
            <div class="grid">
              <article class="card"><h3>Phone</h3><p>(813) 555-1234</p></article>
              <article class="card"><h3>Email</h3><p>hello@paramountbayhomebuyers.com</p></article>
              <article class="card"><h3>Service Area</h3><p>Hillsborough, Pinellas, Pasco, and Hernando counties.</p></article>
            </div>
          </article>
          <article class="form-shell">
            <h3>Request Your Offer</h3>
            <div class="field">Full Name *</div>
            <div class="field">Property Address *</div>
            <div class="field">Phone Number *</div>
            <div class="field">Email Address</div>
            <div class="field large">Tell us about your situation (optional)</div>
            <p style="margin-top:0.75rem;"><a class="btn btn-primary btn-block" href="#">Get My Free Offer Now</a></p>
          </article>
        </div>
      </section>

      <section class="section alt-blue">
        <h2>Map</h2>
        <div class="image-placeholder lg">Office and service radius map</div>
      </section>
HTML

# Route index
cat > routes.html <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Wireframe Routes</title>
  <link rel="stylesheet" href="/assets/styles.css" />
</head>
<body>
  <main class="page-wrap">
    <div class="container">
      <section class="page-hero">
        <p class="eyebrow">Route Directory</p>
        <h1>All High-Fidelity Wireframe Routes</h1>
      </section>
      <section class="section">
        <div class="grid grid-2">
          <a class="card" href="/">/</a>
          <a class="card" href="/how-it-works/">/how-it-works/</a>
          <a class="card" href="/sell-your-house/">/sell-your-house/</a>
          <a class="card" href="/locations/">/locations/</a>
          <a class="card" href="/locations/pinellas-county/">/locations/pinellas-county/</a>
          <a class="card" href="/locations/hillsborough-county/">/locations/hillsborough-county/</a>
          <a class="card" href="/locations/pasco-county/">/locations/pasco-county/</a>
          <a class="card" href="/locations/hernando-county/">/locations/hernando-county/</a>
          <a class="card" href="/locations/st-petersburg/">/locations/st-petersburg/</a>
          <a class="card" href="/locations/tampa/">/locations/tampa/</a>
          <a class="card" href="/locations/clearwater/">/locations/clearwater/</a>
          <a class="card" href="/locations/brandon/">/locations/brandon/</a>
          <a class="card" href="/locations/wesley-chapel/">/locations/wesley-chapel/</a>
          <a class="card" href="/situations/">/situations/</a>
          <a class="card" href="/situations/inherited-property/">/situations/inherited-property/</a>
          <a class="card" href="/situations/fire-damage/">/situations/fire-damage/</a>
          <a class="card" href="/situations/flood-damage/">/situations/flood-damage/</a>
          <a class="card" href="/situations/foundation-problems/">/situations/foundation-problems/</a>
          <a class="card" href="/situations/foreclosure/">/situations/foreclosure/</a>
          <a class="card" href="/situations/landlord-with-tenants/">/situations/landlord-with-tenants/</a>
          <a class="card" href="/situations/divorce/">/situations/divorce/</a>
          <a class="card" href="/situations/code-violations/">/situations/code-violations/</a>
          <a class="card" href="/about/">/about/</a>
          <a class="card" href="/about/meet-our-team/">/about/meet-our-team/</a>
          <a class="card" href="/about/reviews/">/about/reviews/</a>
          <a class="card" href="/blog/">/blog/</a>
          <a class="card" href="/blog/[slug]/">/blog/[slug]/</a>
          <a class="card" href="/contact/">/contact/</a>
        </div>
      </section>
    </div>
  </main>
</body>
</html>
HTML

echo "High-fidelity wireframes generated."
