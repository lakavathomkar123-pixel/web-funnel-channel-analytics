# Web Funnel & Marketing Channel Analytics

End-to-end e-commerce funnel and marketing channel analysis using Google BigQuery (GA4 sample dataset) and Looker Studio, identifying where users drop off and which channels/devices drive the most conversions.

## Tech Stack
- **SQL (Google BigQuery)** — data extraction and aggregation
- **Looker Studio** — interactive dashboard
- **Dataset:** Google's public GA4 obfuscated sample e-commerce dataset (`bigquery-public-data.ga4_obfuscated_sample_ecommerce`)

## Dashboard
[View Live Dashboard](https://datastudio.google.com/s/v7UZzFdGJ14)

## Key Findings

### 1. Conversion Funnel
| Stage | Users |
|---|---|
| Session Start | 267,116 |
| View Item | 61,252 |
| Add to Cart | 12,545 |
| Begin Checkout | 9,715 |
| Purchase | 4,419 |

**Overall conversion rate: 1.65%** (purchase / session start)

Biggest drop-off: session_start → view_item (77% of users leave before viewing a product).

### 2. Channel Performance
| Channel | Sessions | Purchases |
|---|---|---|
| Organic | 111,346 | 1,323 |
| (none) | 75,025 | 1,054 |
| Referral | 54,380 | 1,026 |

Organic search drives the highest volume of both sessions and purchases.

### 3. Device Breakdown
| Device | Users | Purchasers |
|---|---|---|
| Desktop | 158,917 | 2,541 |
| Mobile | 109,195 | 1,851 |
| Tablet | 6,250 | 97 |

Desktop converts at a higher rate than mobile despite mobile driving significant traffic.

### 4. Top Geography
US (118,493 users), India (25,367), Canada (20,268) are the top 3 markets by user count.

### 5. Top Product
"Google Clear Pen 4-Pack" led purchase volume (444 units across 158 purchase events).

## Business Recommendation
With a 77% drop-off between session start and product view, the highest-impact fix is improving landing page relevance and load speed for organic/referral traffic. Desktop's higher conversion rate versus mobile also suggests optimizing the mobile checkout flow could meaningfully lift the overall 1.65% conversion rate.

## SQL Queries
See `queries.sql` for all 6 queries used in this analysis.
