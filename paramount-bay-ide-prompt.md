# Paramount Bay Homebuyers — Full Website Build Prompt

---

## Project Overview

Build a complete, production-ready marketing website for **Paramount Bay Homebuyers**, a local cash home buying company serving the Tampa Bay, Florida area. The company purchases residential properties directly from homeowners — without real estate agents, repairs, or lengthy closing timelines.

The target customer is a Tampa Bay homeowner who needs to sell quickly, is facing a difficult situation (foreclosure, divorce, inherited property, damage, etc.), or simply wants to avoid the hassle of a traditional sale.

The brand voice is: **friendly, local, honest, and simple.** This is not a corporate entity. It is a trusted neighbor who happens to buy houses. Every design and copy decision should reinforce that.

---

## Business Model Context

- The company makes all-cash offers on residential properties in any condition
- No repairs, no agent commissions, no closing costs charged to the seller
- Typical close timeline: 7 to 21 days
- Service area: Hillsborough County, Pinellas County, Pasco County, and Hernando County, Florida
- Primary cities: Tampa, St. Petersburg, Clearwater, Brandon, Wesley Chapel, Largo, Dunedin, Riverview, New Port Richey, Zephyrhills, Brooksville, Spring Hill
- The main conversion goal is capturing a lead via a property address form

---

## Design System

### Brand Feeling

The visual design must reflect the Florida Gulf Coast lifestyle. Think warm sunlight, coastal neighborhoods, palm trees, open skies. The feeling should be light, sunny, friendly, approachable, trustworthy, and simple to navigate. Avoid anything corporate, dark, aggressive, or cluttered.

Target emotional impression: "Friendly local cash buyer who makes selling simple."

### Color Palette

Use CSS custom properties for all colors.

```css
--color-primary:       #1E78C8;   /* Main brand blue — headers, links, icons */
--color-primary-dark:  #0B5FA5;   /* Navigation, footer backgrounds */
--color-sky:           #77BCE6;   /* Hero gradients, decorative backgrounds */
--color-orange:        #FF9F1C;   /* Primary CTA buttons */
--color-gold:          #F2B705;   /* Button hover state, secondary accents */
--color-green:         #3BB44A;   /* Icons, checkmarks, highlights */
--color-white:         #FFFFFF;   /* Primary page background */
--color-sand:          #F7E6B0;   /* Alternating section backgrounds */
--color-dark:          #1B2A41;   /* Body text, outlines */
--color-soft-blue:     #F4FAFF;   /* Alternating section backgrounds */
```

### Typography

Import from Google Fonts:
- **Poppins** (weights: 400, 600, 700, 800) — all headings and navigation
- **Open Sans** (weights: 400, 500, 600) — all body text and form fields

Font size scale:
```
H1: 44px–48px
H2: 32px
H3: 24px
Body: 18px
Small: 15px
Line height: 1.5–1.7
```

### Layout Principles

- Wide spacing and generous padding between sections (minimum 64px top/bottom per section)
- Rounded UI elements throughout: buttons 10px radius, cards 12px radius, forms 8px radius
- Minimal borders — use shadows instead
- Card shadow: `0 4px 12px rgba(0,0,0,0.08)`
- Bright, positive imagery placeholders (use descriptive alt text and data-src attributes for lazy loading)
- Section backgrounds must alternate in this order: White > Soft Blue (#F4FAFF) > Soft Sand (#F7E6B0) — repeat as needed

### Button Specifications

Primary CTA button:
```
background: #FF9F1C
hover background: #F2B705
color: white
border-radius: 10px
padding: 14px 26px
font-weight: 700
font-family: Poppins
transition: background 0.2s ease, transform 0.15s ease, box-shadow 0.2s ease
hover: slight lift (translateY(-2px)) and soft glow shadow
```

Secondary button:
```
background: #1E78C8
hover background: #0B5FA5
color: white
same radius and padding
```

### Micro-animations

Apply subtle, purposeful animations throughout. Use CSS `@keyframes` and `transition` properties. Do not use heavy JavaScript animation libraries unless necessary.

Required animations:
- **Fade-in on scroll**: All sections, cards, and content blocks fade in and slide up slightly (translateY 20px to 0, opacity 0 to 1) when they enter the viewport. Use Intersection Observer API.
- **Button hover**: Lift (translateY -2px) + box-shadow increase + background color transition. Duration: 150ms.
- **CTA button pulse**: A soft repeating pulse/glow animation on the primary CTA button in the hero section only, to draw the eye. Use `@keyframes` with `box-shadow` cycling.
- **Navigation link underline**: Animated underline that slides in from left on hover using `::after` pseudo-element with `width: 0 to 100%` transition.
- **Form field focus**: Border color transitions from neutral to `#1E78C8` with a soft glow. Duration: 200ms.
- **Card hover**: Cards lift slightly (translateY -4px) and shadow deepens on hover. Duration: 200ms.
- **Step number**: Subtle scale animation (1 to 1.05) on parent hover.
- **FAQ accordion**: Smooth max-height transition when opening/closing answers. Rotate the toggle icon 45 degrees when open.
- **Counter numbers**: On the stats section, numbers count up from 0 when scrolled into view (vanilla JS, no libraries).
- **Trust bar items**: Staggered fade-in on page load using animation-delay increments.
- **Icon bounce**: Icons in feature cards do a gentle translateY bounce (3px) on parent hover.

---

## Site Architecture

### Navigation (Sticky Header)

The header is sticky. On scroll, add a subtle `box-shadow` to indicate the sticky state (transition this in with CSS).

Logo: Left-aligned.

Navigation links (desktop):
```
How It Works
Sell Your House
Locations  (dropdown)
Situations (dropdown)
About       (dropdown: Meet Our Team, Reviews, Blog)
```

Primary CTA button in header: "Get Cash Offer" — color: `#FF9F1C`

Mobile: Hamburger menu. Full-screen slide-down nav with the same links in large text. Include a prominent phone number and "Get Cash Offer" button at the bottom of the mobile menu.

Include a sticky bottom bar on mobile only: a tap-to-call button on the left and "Get Cash Offer" on the right, both full-width halves, always visible.

---

## Page Inventory

Build the following pages. Each is described in detail below.

```
/                              Home
/how-it-works/                 How It Works
/sell-your-house/              Sell Your House (SEO Pillar)
/locations/                    Locations Hub
/locations/pinellas-county/    County Page
/locations/hillsborough-county/
/locations/pasco-county/
/locations/hernando-county/
/locations/st-petersburg/      City Page (template)
/locations/tampa/
/locations/clearwater/
/locations/brandon/
/locations/wesley-chapel/
/situations/                   Situations Hub
/situations/inherited-property/
/situations/fire-damage/
/situations/flood-damage/
/situations/foundation-problems/
/situations/foreclosure/
/situations/landlord-with-tenants/
/situations/divorce/
/situations/code-violations/
/about/                        About
/about/meet-our-team/
/about/reviews/
/blog/                         Blog Index
/blog/[slug]/                  Blog Post Template
/contact/                      Contact
```

---

## Page Specifications

---

### Home Page — `/`

**Section 1: Hero**
Background: Gradient from `#77BCE6` (top-left) to white (bottom-right). Optionally overlay a subtle radial light effect.
Layout: Two columns. Left: headline and supporting copy. Right: inline lead capture form.

Left column:
- Eyebrow text (small caps, `#FF9F1C`): "Serving Tampa Bay, FL"
- H1: "Sell Your House Fast in Tampa Bay"
- Supporting paragraph: No repairs, no agents, no fees. Fair cash offer in 24 hours. Close on your schedule.
- Two buttons: Primary "Get My Cash Offer" and Secondary "See How It Works"
- Social proof line beneath buttons: Star rating, number of satisfied homeowners

Right column — Lead capture form card:
- White card, border-radius 16px, elevated shadow
- Form title: "Get Your Free Cash Offer"
- Subline: "No obligation. Takes 60 seconds."
- Fields: Full Name, Property Address, Phone Number, Email Address
- Submit button: "Get My Free Offer Now" (full width, primary orange)
- Privacy note beneath: lock icon + "Your information is private. No spam."

**Section 2: Trust Bar**
Dark background (`#1B2A41`). Full-width strip. Five trust signals inline:
- Offers in 24 Hours
- Close in 7 to 21 Days
- No Repairs Needed
- Zero Fees or Commissions
- 5-Star Rated Local Buyer

Animate each trust item in with a staggered fade on page load.

**Section 3: How It Works**
Background: Soft blue (`#F4FAFF`).
Heading: "How It Works"
Three steps as cards (horizontal on desktop, vertical on mobile):
1. Tell Us About Your Home — quick form or call, no inspection needed
2. Get Your Cash Offer — written offer within 24 hours, no obligation
3. Pick Your Closing Date — as fast as 7 days or whenever suits you

Each step card has a large numbered circle (orange), a heading, and a paragraph. Cards fade in on scroll with slight stagger delay.

**Section 4: Situations We Help With**
Background: White.
Heading: "Any Situation, Any Condition"
Eight cards in a 4x2 grid (2x4 on mobile). Each card has an icon, a situation name, and one-line description. Situations: Inherited Property, Fire Damage, Flood Damage, Foundation Problems, Foreclosure, Landlord with Tenants, Divorce, Code Violations.
Cards link to their respective `/situations/` sub-pages.

**Section 5: CTA Block**
Full-width gradient banner (`#1E78C8` to `#0B5FA5`). Centered heading, supporting sentence, primary button.
Heading: "Ready to Get Your Cash Offer?"

**Section 6: Comparison Table**
Background: Soft sand (`#F7E6B0`).
Heading: "Cash Offer vs. Traditional Sale"
Two-column comparison table: Paramount Bay vs. Traditional Agent.
Rows: Closing Time, Repairs Required, Agent Commission, Closing Costs, Open Houses, Deal Certainty.
Use checkmarks (color: `#3BB44A`) and X marks (color: red) as values.

**Section 7: Areas We Serve**
Background: White.
Heading: "Areas We Serve"
Four city cards (Tampa, St. Petersburg, Clearwater, Brandon) with a link to the full locations page.
Below the cards: a map placeholder div (insert Google Maps embed or placeholder div with a data attribute for the map to be initialised).

**Section 8: Testimonials**
Background: Soft blue.
Heading: "What Homeowners Say"
Three testimonial cards. Each has a star rating, a quote, and a reviewer name with city.

**Section 9: Final CTA**
Repeat the CTA block from Section 5 with different supporting copy.

---

### How It Works — `/how-it-works/`

Breadcrumb: Home > How It Works

**Section 1: Page Banner**
Gradient background. H1: "How It Works". Supporting sentence.

**Section 2: Detailed Step-by-Step**
Five steps in a vertical timeline layout (desktop: step number left, content right; mobile: stacked). Steps:
1. Submit Your Property Info
2. We Evaluate Your Home
3. Receive Your Cash Offer
4. You Choose the Closing Date
5. Get Paid at Closing

Each step has a number, heading, and two-to-three sentence explanation. Animate each step in sequentially on scroll.

**Section 3: Recently Purchased Homes**
Background: Soft blue.
Heading: "Recently Purchased Homes"
Three cards showing recent acquisitions: address/neighborhood, property type, days to close, seller situation.

**Section 4: FAQ**
Background: Soft sand.
Accordion FAQ with at minimum four questions relevant to the process.
FAQ items animate open/close with a smooth max-height transition.

**Section 5: CTA Block**

---

### Sell Your House — `/sell-your-house/` (SEO Pillar Page)

This is the most important SEO page on the site. It must target the following primary keywords:
- sell house fast Tampa
- cash home buyer Tampa Bay
- we buy houses Florida

Breadcrumb: Home > Sell Your House

Include a BreadcrumbList JSON-LD schema block and a FAQPage JSON-LD schema block (described in the SEO section below).

**Page Banner**: H1: "Sell Your House Fast for Cash in Tampa Bay"

**Section: What We Buy**
Two-column layout: copy left, lead form right (same form as homepage hero). Describe all property types and conditions accepted. Include a tag cloud of property types (Single Family, Condo, Townhome, Multi-Family, Fire Damage, Flood Damage, Foreclosure, Inherited).

**CTA Block** — insert after every second content section

**Section: How Fast Can You Close**
Three feature cards: As Fast as 7 Days, On Your Schedule, Guaranteed Close.

**CTA Block**

**Section: Cash Offer vs. Traditional Sale**
Full comparison table (same structure as homepage but with added financial detail rows).

**Section: Local Market Overview**
Three stat cards: Median Home Price Tampa, Average Days on Market, Year-over-Year Price Growth.
Use the counter-up animation on the numbers when scrolled into view.

**Section: Internal Link Hub**
Three cards linking to: Locations hub, Situations hub, FAQ hub.

**Section: FAQ**
Minimum five questions targeting long-tail search queries. Must have FAQPage schema.

---

### Locations Hub — `/locations/`

Breadcrumb: Home > Locations

**Page Banner**: H1: "Areas We Serve in Tampa Bay"

**Section: Map**
Full-width map placeholder (Google Maps embed or static map image with pin markers). Show all service cities.

**Section: Browse by County**
Four cards linking to each county sub-page: Pinellas County, Hillsborough County, Pasco County, Hernando County.
Each card lists the primary cities within that county.

**Section: Top Cities Grid**
Eight city cards in a 4x2 grid. Each links to the city-level page.

**CTA Block**

---

### County Page Template — `/locations/[county]/`

Breadcrumb: Home > Locations > [County Name]

BreadcrumbList schema required.

Sections:
1. Page Banner with H1: "We Buy Houses in [County Name], FL"
2. County market stats (median price, inventory, avg days on market)
3. Common seller problems / situations in that area
4. City grid — all cities within the county linking to city-level pages
5. CTA block
6. FAQ section with FAQPage schema

---

### City Page Template — `/locations/[city]/`

Each city gets its own page. The template is identical but content is localised per city.

Breadcrumb: Home > Locations > [County Name] > [City Name]

BreadcrumbList schema required.
FAQPage schema required.

Sections:
1. Page Banner: H1: "We Buy Houses in [City], FL"
2. Two-column: local copy (left) + lead form (right)
   - Local market stats for that city (median price, days on market)
   - Reference 3 to 5 local neighborhoods by name
3. Testimonials from homeowners in that city
4. Nearby cities internal linking grid (4 nearest cities, each linking to their page) — this creates the internal mesh
5. Localized FAQ section (minimum 3 questions specific to the city)

---

### Situations Hub — `/situations/`

Breadcrumb: Home > Situations

**Page Banner**: H1: "We Buy Houses in Any Situation"

**Section: Situation Cards Grid**
Three columns (two on tablet, one on mobile).
Cards for all eight situations: Inherited Property, Fire Damage, Flood Damage, Foundation Problems, Foreclosure, Landlord with Tenants, Divorce, Code Violations.
Each card: icon, situation name, two-line description, "Learn More" link to the sub-page.

**CTA Block**

---

### Situation Detail Page Template — `/situations/[situation]/`

Used for all eight situations. All content is situation-specific.

Breadcrumb: Home > Situations > [Situation Name]

BreadcrumbList schema required.
FAQPage schema required.

Sections:
1. Page Banner: H1 targeting the specific situation (e.g., "Sell Your Fire-Damaged Home in Tampa Bay")
2. Two-column: situation-specific copy (left) + lead form (right)
   - Explain why this situation makes traditional selling difficult
   - Explain exactly how a cash sale solves the problem
   - Four checklist items (no repairs, no cleanup, zero fees, close fast)
3. CTA block
4. Internal links back to: Sell Your House pillar page, most relevant city pages, FAQ hub
5. FAQ section with minimum three situation-specific questions

---

### About — `/about/`

Breadcrumb: Home > About

Sections:
1. Page Banner
2. Our Story — two-column, copy left, team photo placeholder right
3. Team sub-page teaser or inline team cards (if Meet Our Team is not a separate page)
4. Reviews/testimonials section
5. CTA block

#### Meet Our Team — `/about/meet-our-team/`

Team member cards. Each card: photo placeholder, name, role, short bio.

#### Reviews — `/about/reviews/`

Full reviews page. Google review embed placeholder at top. Grid of written testimonials below. Include aggregate star rating display.

---

### Blog Index — `/blog/`

Breadcrumb: Home > Blog

Layout: Featured post (large, full-width card at top). Grid of remaining posts below (3 columns desktop, 2 tablet, 1 mobile).

Each post card: category tag, title, excerpt, date, estimated read time, author, "Read More" link.

---

### Blog Post Template — `/blog/[slug]/`

Breadcrumb: Home > Blog > [Post Title]

BreadcrumbList schema required.
FAQPage schema required on any post containing a FAQ section.

Layout:
- Left column (70%): article content
- Right column (30%): sticky sidebar containing lead capture form, related posts, phone number CTA

Article structure: Eyebrow tag, H1 title, meta line (date, author, read time), featured image placeholder, article body with H2/H3 subheadings, internal CTA block mid-article, FAQ accordion at bottom.

Sidebar is sticky on desktop: it scrolls with the user until it reaches the footer.

---

### Contact — `/contact/`

Breadcrumb: Home > Contact

Sections:
1. Page Banner
2. Two-column: contact details (left, three cards: phone, email, service area) + contact form (right)
3. Google Maps embed or placeholder

---

## SEO Architecture

### Breadcrumb Navigation

Every interior page must have a visible breadcrumb bar directly beneath the header, above the H1. Left-aligned. All items except the current page are clickable links.

Format examples:
```
Home > Locations > Pinellas County > St. Petersburg
Home > Situations > Fire Damage
Home > Blog > How to Sell My House Without Realtors
Home > Sell Your House
```

The current page is not hyperlinked. Use a separator character (>) between items.

### JSON-LD Structured Data

Every indexable page must include a `BreadcrumbList` schema block in a `<script type="application/ld+json">` tag in the `<head>`.

Every page with a visible FAQ section must include a `FAQPage` schema block.

Rules:
- Positions in BreadcrumbList must reflect the actual URL hierarchy
- URLs in schema must match canonical URLs exactly
- FAQ answers in schema must match visible page content word-for-word
- Do not include promotional language inside structured data
- Do not add schema blocks for content that is not visibly present on the page
- Do not duplicate schema blocks

BreadcrumbList example:
```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://www.paramountbayhomebuyers.com/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Locations",
      "item": "https://www.paramountbayhomebuyers.com/locations/"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "St. Petersburg",
      "item": "https://www.paramountbayhomebuyers.com/locations/st-petersburg/"
    }
  ]
}
```

FAQPage example:
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How fast can I sell my house in St. Petersburg?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Most cash transactions close within 7 to 21 days depending on title clearance and seller preference."
      }
    }
  ]
}
```

### LocalBusiness Schema

On the homepage and contact page, include a `LocalBusiness` schema block:
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Paramount Bay Homebuyers",
  "description": "Local cash home buyers serving the Tampa Bay area. We buy houses in any condition, fast.",
  "url": "https://www.paramountbayhomebuyers.com",
  "telephone": "[PHONE]",
  "email": "[EMAIL]",
  "address": {
    "@type": "PostalAddress",
    "addressRegion": "FL",
    "addressCountry": "US"
  },
  "areaServed": ["Tampa", "St. Petersburg", "Clearwater", "Brandon", "Wesley Chapel"],
  "priceRange": "$$"
}
```

### On-Page SEO Requirements

Each page must have:
- A unique, keyword-relevant `<title>` tag (format: "[Page Topic] | Paramount Bay Homebuyers")
- A unique `<meta name="description">` tag under 160 characters
- One `<h1>` per page only
- Proper `<h2>` and `<h3>` hierarchy beneath it
- `<img>` tags with descriptive `alt` attributes
- Canonical `<link rel="canonical">` tag
- `<meta name="robots" content="index, follow">` on all public pages
- Open Graph tags: `og:title`, `og:description`, `og:url`, `og:type`

---

## Internal Linking Rules

The site uses a three-tier pillar structure:

- **Tier 1 (Pillar)**: `/sell-your-house/` — links to all location pages, all situation pages, and the FAQ hub
- **Tier 2 (Hub)**: `/locations/` and `/situations/` — link to their respective sub-pages and back to the pillar
- **Tier 3 (Leaf)**: City pages and situation detail pages — each must link back to the pillar, to its parent hub, and to at least three other related leaf pages (nearby cities or related situations)

City pages must include a "Nearby Areas We Also Serve" section linking to 4 adjacent city pages. This creates the internal mesh.

---

## Form Specifications

The lead capture form appears in multiple locations: hero section, pillar page, city pages, situation detail pages, blog sidebar, and a standalone contact page.

Fields:
- Full Name (required)
- Property Address (required) — use address autocomplete if possible (Google Places API)
- Phone Number (required)
- Email Address (optional)
- Optional free-text field on contact and situation forms: "Tell us about your situation"

Form behaviour:
- Inline validation on blur (not on submit)
- Required field errors appear beneath the field with a red border transition
- On submit: show a loading state on the button (spinner, disabled state)
- On success: replace form with a confirmation message ("Thank you! We will contact you within 24 hours.")
- All fields use `border-radius: 8px`, `border: 1.5px solid #d0e8f5`, focus: `border-color: #1E78C8` with a soft glow

---

## Mobile Design Requirements

Breakpoints:
```
Desktop:  1200px and above
Tablet:   768px to 1199px
Mobile:   below 768px
```

Mobile-specific requirements:
- Sticky bottom bar with two full-width buttons: tap-to-call (left) and "Get Cash Offer" (right)
- All sections stack vertically
- Navigation collapses to hamburger menu
- Font sizes scale down: H1 to 32px, H2 to 26px, body to 16px
- All cards become full-width
- Tap targets minimum 48px height
- Forms remain usable and full-width

---

## Footer

Background: `#0B5FA5`
Text: white

Four-column layout (two columns on tablet, single column on mobile):
1. Brand column: logo, one-line brand description, social media icon links (Facebook, LinkedIn, Google Business)
2. Company: About Us, Meet Our Team, Reviews, Blog, Press
3. Sell Your House: How It Works, Get Cash Offer, Situations We Help, Cash vs Traditional
4. Locations: Tampa, St. Petersburg, Clearwater, All Locations link — plus phone number and email address

Footer bottom strip:
Background: slightly darker (`#073d6e`)
Left: copyright notice
Right: Privacy Policy and Terms of Use links

---

## Component Library

Build the following reusable components that are used across multiple pages:

- `SiteHeader` — sticky header with logo, nav, CTA button
- `SiteFooter`
- `Breadcrumb` — accepts an array of {label, href} items
- `LeadForm` — the primary property lead capture form
- `HeroBanner` — page banner with gradient background, H1, and subtitle
- `SectionLabel` — small uppercase orange eyebrow text
- `StepCard` — numbered step with heading and body
- `FeatureCard` — icon, heading, body, optional link
- `TestimonialCard` — stars, quote, reviewer name and city
- `FAQAccordion` — accordion with smooth animation
- `CTABlock` — full-width gradient banner with heading, body, button
- `ComparisonTable` — two-column feature comparison
- `SituationCard` — icon, title, description, link
- `LocationCard` — city name, county, link
- `BlogCard` — thumbnail placeholder, category, title, excerpt, meta
- `TeamCard` — photo placeholder, name, role, bio
- `StatsCounter` — animated counter number with label
- `TrustBar` — horizontal row of trust signals

---

## Technical Requirements

- The site can be built in any modern stack (Next.js, Astro, plain HTML/CSS/JS, or similar)
- If using a framework, use static generation for all pages (SSG) for maximum SEO performance
- CSS: use custom properties (variables) for all colors, font sizes, and spacing values
- JavaScript: vanilla JS is preferred for micro-animations and form validation; avoid heavy dependencies for UI effects
- Images: use lazy loading (`loading="lazy"`) on all images below the fold; use `loading="eager"` on hero images
- All images must have meaningful `alt` attributes
- No placeholder or lorem ipsum text in the final output — write real, relevant, conversion-focused copy for all pages
- Validate all JSON-LD schema blocks in the Google Rich Results Test before considering a page complete
- Core Web Vitals: optimize for LCP (Largest Contentful Paint), CLS (Cumulative Layout Shift), and FID (First Input Delay). Avoid layout shifts on load, especially in the hero and header.
- Fonts loaded via `<link rel="preconnect">` and `font-display: swap`

---

## Copy Tone and Voice Guidelines

- Write in second person ("you", "your home") — direct and personal
- Short sentences and short paragraphs — no walls of text
- Never use jargon or legalese
- Lead with the benefit, then explain how it works
- Every CTA button label should be action-oriented and specific (e.g., "Get My Free Cash Offer" not just "Submit")
- Emphasize these three core benefits in all copy: speed, simplicity, certainty
- Never make the homeowner feel judged for their situation — all copy around difficult situations (foreclosure, divorce, damage) must be empathetic and solution-focused

---

## What Not to Do

- Do not use dark or black backgrounds anywhere except the trust bar
- Do not use heavy gradient overlays that obscure readability
- Do not use aggressive or high-pressure sales language
- Do not clutter layouts — white space is a feature
- Do not build pages that exist only for SEO with no real user value
- Do not use stock photo cliches (handshakes, suits, people pointing at clipboards)
- Do not add FAQ schema to pages where the FAQ section is hidden or not rendered
- Do not let any form submit without client-side validation
- Do not use auto-playing video or audio
- Do not build the mobile navigation as a sidebar drawer — use a top-down dropdown panel instead
