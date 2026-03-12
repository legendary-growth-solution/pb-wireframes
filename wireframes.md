# Paramount Bay Homebuyers - Full Website Wireframes

This wireframe set is based on `paramount-bay-ide-prompt.md` and covers all routes in the site inventory.

## 1) Global Wireframe Shell

### 1.1 Sticky Header (All Pages)

```text
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ LOGO | How It Works | Sell Your House | Locations v | Situations v | About v | [Get Cash Offer] │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

Mobile:

```text
┌──────────────────────────────────────────┐
│ LOGO                           [☰ Menu] │
└──────────────────────────────────────────┘
Menu panel (slide-down):
[How It Works]
[Sell Your House]
[Locations]
[Situations]
[About]
[Call (XXX) XXX-XXXX]
[Get Cash Offer]
```

### 1.2 Breadcrumb Bar (All Interior Pages)

```text
Home > Section > Subsection > Current Page
```

### 1.3 Global Footer (All Pages)

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│ Col 1: Brand + social   Col 2: Company   Col 3: Sell Your House   Col 4:   │
│                                                                   Locations │
├──────────────────────────────────────────────────────────────────────────────┤
│ Copyright | Privacy Policy | Terms of Use                                  │
└──────────────────────────────────────────────────────────────────────────────┘
```

### 1.4 Mobile Sticky Bottom Bar (All Pages, Mobile Only)

```text
┌──────────────────────────────┬──────────────────────────────┐
│      Tap to Call             │       Get Cash Offer         │
└──────────────────────────────┴──────────────────────────────┘
```

## 2) Route Coverage Map

| Route | Wireframe Type |
|---|---|
| `/` | Home |
| `/how-it-works/` | How It Works |
| `/sell-your-house/` | Sell Your House (SEO Pillar) |
| `/locations/` | Locations Hub |
| `/locations/pinellas-county/` | County Template |
| `/locations/hillsborough-county/` | County Template |
| `/locations/pasco-county/` | County Template |
| `/locations/hernando-county/` | County Template |
| `/locations/st-petersburg/` | City Template |
| `/locations/tampa/` | City Template |
| `/locations/clearwater/` | City Template |
| `/locations/brandon/` | City Template |
| `/locations/wesley-chapel/` | City Template |
| `/situations/` | Situations Hub |
| `/situations/inherited-property/` | Situation Detail Template |
| `/situations/fire-damage/` | Situation Detail Template |
| `/situations/flood-damage/` | Situation Detail Template |
| `/situations/foundation-problems/` | Situation Detail Template |
| `/situations/foreclosure/` | Situation Detail Template |
| `/situations/landlord-with-tenants/` | Situation Detail Template |
| `/situations/divorce/` | Situation Detail Template |
| `/situations/code-violations/` | Situation Detail Template |
| `/about/` | About |
| `/about/meet-our-team/` | Meet Our Team |
| `/about/reviews/` | Reviews |
| `/blog/` | Blog Index |
| `/blog/[slug]/` | Blog Post Template |
| `/contact/` | Contact |

## 3) Page Wireframes

## 3.1 Home (`/`)

```text
[Sticky Header]

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ HERO (2 columns)                                                                                │
│ Left:                                                                                           │
│  - Eyebrow: Serving Tampa Bay, FL                                                               │
│  - H1: Sell Your House Fast in Tampa Bay                                                        │
│  - Copy: No repairs, no agents, no fees...                                                      │
│  - [Get My Cash Offer] [See How It Works]                                                       │
│  - Social proof line                                                                             │
│ Right: Lead Form Card                                                                            │
│  - Get Your Free Cash Offer                                                                      │
│  - Name / Property Address / Phone / Email                                                       │
│  - [Get My Free Offer Now]                                                                       │
│  - Privacy note                                                                                  │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

┌ TRUST BAR (dark strip, 5 items) ┐
| Offers in 24 Hours | Close in 7-21 Days | No Repairs | Zero Fees | 5-Star Local |
└──────────────────────────────────┘

┌ How It Works (3 Step Cards) ┐
| 1 Tell Us | 2 Get Offer | 3 Pick Closing Date |
└───────────────────────────┘

┌ Situations We Help With (8 cards grid) ┐
| Inherited | Fire | Flood | Foundation |
| Foreclosure | Landlord | Divorce | Code Violations |
└────────────────────────────────────────┘

┌ CTA Banner: Ready to Get Your Cash Offer? [Button] ┐

┌ Comparison Table: Paramount Bay vs Traditional Agent ┐

┌ Areas We Serve ┐
| City cards: Tampa / St. Petersburg / Clearwater / Brandon |
| Map placeholder |
└────────────────┘

┌ Testimonials (3 cards) ┐

┌ Final CTA Banner ┐

[Footer]
```

Mobile stack order:
1. Hero copy
2. Hero form
3. Trust bar (scrollable chips or wrapped rows)
4. Remaining sections one per row
5. Sticky bottom call/offer bar always visible

## 3.2 How It Works (`/how-it-works/`)

```text
[Sticky Header]
[Breadcrumb: Home > How It Works]

┌ Page Banner: H1 + supporting line ┐

┌ 5-Step Vertical Timeline ┐
| 1 Submit Property Info   |
| 2 We Evaluate Your Home  |
| 3 Receive Cash Offer     |
| 4 Choose Closing Date    |
| 5 Get Paid at Closing    |
└──────────────────────────┘

┌ Recently Purchased Homes (3 cards) ┐
| Address/Area | Property Type | Days to Close | Situation |

┌ FAQ Accordion (4+ Qs) ┐

┌ CTA Banner ┐

[Footer]
```

## 3.3 Sell Your House (`/sell-your-house/`) SEO Pillar

```text
[Sticky Header]
[Breadcrumb: Home > Sell Your House]

┌ Banner: Sell Your House Fast for Cash in Tampa Bay ┐

┌ What We Buy (2 columns) ┐
| Left: property types + conditions copy |
| Right: Lead Form |
| Tag cloud: Single Family, Condo, Townhome, Multi-Family, Fire, Flood, etc. |
└──────────────────────────┘

┌ CTA Banner ┐

┌ How Fast Can You Close? (3 feature cards) ┐
| As Fast as 7 Days | On Your Schedule | Guaranteed Close |

┌ CTA Banner ┐

┌ Expanded Comparison Table ┐

┌ Local Market Overview (3 counter cards) ┐
| Median Price | Avg Days on Market | YoY Growth |

┌ Internal Link Hub (3 cards) ┐
| Locations Hub | Situations Hub | FAQ Hub |

┌ FAQ Accordion (5+ SEO-targeted Qs) ┐

[Footer]
```

## 3.4 Locations Hub (`/locations/`)

```text
[Sticky Header]
[Breadcrumb: Home > Locations]

┌ Banner: Areas We Serve in Tampa Bay ┐

┌ Full-width Map ┐

┌ Browse by County (4 cards) ┐
| Pinellas | Hillsborough | Pasco | Hernando |
| each includes city list |

┌ Top Cities Grid (8 cards) ┐

┌ CTA Banner ┐

[Footer]
```

## 3.5 County Template (`/locations/[county]/`)

Used for:
- `/locations/pinellas-county/`
- `/locations/hillsborough-county/`
- `/locations/pasco-county/`
- `/locations/hernando-county/`

```text
[Sticky Header]
[Breadcrumb: Home > Locations > County]

┌ Banner: We Buy Houses in [County], FL ┐

┌ County Stats (3 cards) ┐
| Median Price | Inventory | Avg Days on Market |

┌ Common Seller Problems in [County] ┐
| short local pain-point blocks |

┌ City Grid (links to city pages) ┐

┌ CTA Banner ┐

┌ FAQ Accordion (county-specific) ┐

[Footer]
```

## 3.6 City Template (`/locations/[city]/`)

Used for:
- `/locations/st-petersburg/`
- `/locations/tampa/`
- `/locations/clearwater/`
- `/locations/brandon/`
- `/locations/wesley-chapel/`

```text
[Sticky Header]
[Breadcrumb: Home > Locations > County > City]

┌ Banner: We Buy Houses in [City], FL ┐

┌ Two-Column Local Section ┐
| Left: local market copy + stats + neighborhoods (3-5 names) |
| Right: Lead Form |

┌ Testimonials from [City] homeowners (3 cards) ┐

┌ Nearby Areas We Also Serve (4 linked city cards) ┐

┌ Local FAQ Accordion (3+ Qs) ┐

[Footer]
```

## 3.7 Situations Hub (`/situations/`)

```text
[Sticky Header]
[Breadcrumb: Home > Situations]

┌ Banner: We Buy Houses in Any Situation ┐

┌ Situation Cards Grid (8 cards) ┐
| Inherited | Fire | Flood | Foundation | Foreclosure | Landlord | Divorce | Code Violations |
| each card: icon + 2-line description + Learn More |

┌ CTA Banner ┐

[Footer]
```

## 3.8 Situation Detail Template (`/situations/[situation]/`)

Used for all eight situation routes.

```text
[Sticky Header]
[Breadcrumb: Home > Situations > [Situation]]

┌ Banner: Sell Your [Situation]-Related Home in Tampa Bay ┐

┌ Two-Column Problem/Solution Section ┐
| Left: why traditional sale is hard + how cash offer helps |
| Checklist: no repairs, no cleanup, zero fees, close fast |
| Right: Lead Form (+ optional Tell us about your situation field) |

┌ CTA Banner ┐

┌ Internal Link Block ┐
| Sell Your House pillar | Related city pages | FAQ hub |

┌ Situation FAQ Accordion (3+ Qs) ┐

[Footer]
```

## 3.9 About (`/about/`)

```text
[Sticky Header]
[Breadcrumb: Home > About]

┌ Page Banner ┐

┌ Our Story (2 columns) ┐
| Left: origin + mission copy |
| Right: team photo placeholder |

┌ Team Preview Cards or teaser to Meet Our Team page ┐

┌ Reviews/Testimonial Section ┐

┌ CTA Banner ┐

[Footer]
```

## 3.10 Meet Our Team (`/about/meet-our-team/`)

```text
[Sticky Header]
[Breadcrumb: Home > About > Meet Our Team]

┌ Banner ┐

┌ Team Grid ┐
| Photo | Name | Role | Short bio |
| Photo | Name | Role | Short bio |
| ... |

┌ CTA Banner ┐

[Footer]
```

## 3.11 Reviews (`/about/reviews/`)

```text
[Sticky Header]
[Breadcrumb: Home > About > Reviews]

┌ Banner + Aggregate Rating ┐

┌ Google Review Embed Placeholder ┐

┌ Written Reviews Grid ┐
| stars + quote + name + city |

┌ CTA Banner ┐

[Footer]
```

## 3.12 Blog Index (`/blog/`)

```text
[Sticky Header]
[Breadcrumb: Home > Blog]

┌ Banner ┐

┌ Featured Post (full-width card) ┐
| Category | Title | Excerpt | Date | Read Time | Author | Read More |

┌ Post Grid (3-col desktop / 2-col tablet / 1-col mobile) ┐
| BlogCard | BlogCard | BlogCard |
| BlogCard | BlogCard | BlogCard |

[Footer]
```

## 3.13 Blog Post Template (`/blog/[slug]/`)

```text
[Sticky Header]
[Breadcrumb: Home > Blog > Post Title]

┌ Main Content + Sidebar Layout (70/30 desktop) ┐
| LEFT (Article):                               | RIGHT (Sticky Sidebar): |
| - Eyebrow tag                                | - Lead Form             |
| - H1                                          | - Related posts         |
| - Meta line                                   | - Phone CTA             |
| - Featured image placeholder                  |                         |
| - H2/H3 body sections                         |                         |
| - Mid-article CTA block                       |                         |
| - Optional FAQ accordion                      |                         |
└──────────────────────────────────────────────────────────────────────────────┘

[Footer]
```

Mobile:
1. Article content first
2. Sidebar blocks become stacked sections below article

## 3.14 Contact (`/contact/`)

```text
[Sticky Header]
[Breadcrumb: Home > Contact]

┌ Banner ┐

┌ Two Columns ┐
| Left: contact cards                          |
| - Phone                                      |
| - Email                                      |
| - Service area                               |
| Right: Contact Form                          |
| - Name, Property Address, Phone, Email       |
| - Tell us about your situation (optional)    |
| - Submit CTA                                 |

┌ Map Embed Placeholder ┐

[Footer]
```

## 4) Reusable Section Wireframes

### 4.1 Lead Form Component

```text
┌────────────────────────────┐
│ Get Your Free Cash Offer   │
│ No obligation. 60 seconds. │
│ [Full Name]                │
│ [Property Address]         │
│ [Phone Number]             │
│ [Email Address]            │
│ [Tell us about situation]  │ (optional where required)
│ [Get My Free Offer Now]    │
│ lock icon + privacy note   │
└────────────────────────────┘
```

### 4.2 CTA Banner Component

```text
┌──────────────────────────────────────────────────────────┐
│ Headline (benefit-first)                                │
│ Supporting one-liner                                    │
│ [Get My Cash Offer]                                     │
└──────────────────────────────────────────────────────────┘
```

### 4.3 FAQ Accordion Component

```text
[+] Question 1
    Answer text...
[+] Question 2
    Answer text...
[+] Question 3
    Answer text...
```

### 4.4 Comparison Table Component

```text
┌───────────────────────────────┬──────────────────────┬──────────────────────┐
│ Feature                       │ Paramount Bay        │ Traditional Agent    │
├───────────────────────────────┼──────────────────────┼──────────────────────┤
│ Closing Time                  │ 7-21 days            │ 60+ days             │
│ Repairs Required              │ No                   │ Usually yes          │
│ Agent Commission              │ No                   │ Yes                  │
│ Closing Costs                 │ No                   │ Often yes            │
│ Open Houses                   │ No                   │ Yes                  │
│ Deal Certainty                │ High                 │ Can fall through     │
└───────────────────────────────┴──────────────────────┴──────────────────────┘
```

## 5) Content and Copy Anchors

Use these exact anchor lines across wireframes:
- Hero H1: "Sell Your House Fast in Tampa Bay"
- Primary CTA: "Get My Cash Offer" / "Get My Free Offer Now"
- Core proof points: "No repairs, no agents, no fees" and "Close in 7 to 21 days"
- Tone: local, empathetic, simple, no pressure

## 6) Responsive Behavior Summary

- Desktop: multi-column layouts, sticky sidebar on blog post, full nav
- Tablet: cards condense to 2 columns, timeline stacks partially
- Mobile: all sections single column, hamburger with top-down panel, sticky bottom dual CTA bar

## 7) Build Notes for Design Handoff

- Alternate section backgrounds in this sequence: White -> Soft Blue -> Soft Sand
- Keep one H1 per page
- Every interior page starts with breadcrumb + page banner
- Every major page includes at least one conversion block (form or CTA banner)
- Template pages must keep localized copy blocks while preserving this structure
