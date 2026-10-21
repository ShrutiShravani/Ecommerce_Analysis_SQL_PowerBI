# E-commerce Analytics: Customer Journey, Product & Revenue Performance

![SQL](https://img.shields.io/badge/SQL-BigQuery-4285F4?logo=googlecloud&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Dataset](https://img.shields.io/badge/Dataset-GA4%20Public%20Demo-34A853)

## Table of Contents

- [Project Overview](#project-overview)
- [Business Questions](#business-questions)
- [Tools & Technologies](#tools--technologies)
- [Dataset](#dataset)
- [Analysis & Key Findings](#analysis--key-findings)
  - [1. Product Performance](#1-product-performance)
  - [2. Revenue by Product Category](#2-revenue-by-product-category)
  - [3. Customer Journey Analysis](#3-customer-journey-analysis)
  - [4. Acquisition Source Performance](#4-acquisition-source-performance)
  - [5. Revenue & Device Performance](#5-revenue--device-performance)
  - [6. Data Quality Assessment](#6-data-quality-assessment)
- [Power BI Dashboard](#power-bi-dashboard)
- [Project Deliverables](#project-deliverables)
- [Conclusion](#conclusion)
- [Dataset Reference](#dataset-reference)

---

## Project Overview

An end-to-end e-commerce analytics project using **Google BigQuery**, **SQL**, and **Power BI** to analyze product performance, customer journeys, acquisition sources, revenue trends, and device-level purchasing behavior.

Using the Google Analytics 4 (GA4) public e-commerce demo dataset, I developed SQL queries to investigate business performance, compare product and category revenue, analyze customer activity across shopping events, and perform data-quality checks. The results were used to build a three-page Power BI dashboard.

**Objective:** Turn raw event data into actionable insights that can support product, marketing, and business decisions.

---

## Business Questions

1. Which products attract the most views, purchases, and revenue?
2. How does customer activity change from product views to cart additions, checkout, and purchases?
3. Which acquisition sources generate the most purchasing users and recorded purchase revenue?
4. How does purchase revenue vary across devices and over time?
5. What data-quality issues should be considered before using the results for business decisions?

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| **SQL** | Data aggregation, filtering, joins, `UNNEST`, conditional aggregation, and distinct-user analysis |
| **Google BigQuery** | Querying the public GA4 e-commerce dataset |
| **Power BI** | Interactive dashboard development and visual analysis |
| **CSV** | Exporting aggregated query results for dashboard reporting |

---

## Dataset

| Detail | Value |
|--------|-------|
| **Source** | Google Analytics 4 public e-commerce demo dataset |
| **Dataset** | `bigquery-public-data.ga4_obfuscated_sample_ecommerce` |
| **Analysis period** | November 1, 2020 – January 31, 2021 |
| **Event records analysed** | 4,295,584 |

The dataset contains customer interaction events, traffic-source information, device categories, purchase revenue, and product-level details.

---

## Analysis & Key Findings

### 1. Product Performance

#### Top-viewed products

The **Google Navy Speckled Tee** recorded **56,466** product views, followed by **Super G Unisex Joggers** with **52,758** and **Google Zip Hoodie F/C** with **49,795**.

These products attracted substantial browsing activity, making them useful candidates for further purchase-performance analysis.

#### Top-purchased products

**Super G Unisex Joggers** led the top-purchased product results with **285** purchased-item records and **221** unique purchasing users. **Google Zip Hoodie F/C** followed with **256** purchased-item records and **218** unique users.

> **Note:** These figures represent item-level records and distinct users, not necessarily unique orders.

#### Revenue by product

**Google Zip Hoodie F/C** generated the highest calculated item revenue among the top 10 products at **13,788**, followed by **Google Crewneck Sweatshirt Navy** at **10,714** and **Google Men's Tech Fleece Grey** at **9,964**.

Super G Unisex Joggers also appeared among the leading products by purchase activity and revenue, indicating strong performance across multiple product measures.

#### Business recommendations

- Compare product views with purchasing activity to identify products that attract attention but may have opportunities to improve conversion.
- Review high-revenue products for potential merchandising and promotion opportunities.
- Evaluate product performance using views, purchasing users, units, and revenue together rather than relying on a single metric.

---

### 2. Revenue by Product Category

**Apparel** generated the highest calculated item revenue at **171,786**, with **5,447** units purchased and **2,430** purchasing users.

The next highest categories by calculated item revenue were:

| Category | Item Revenue | Units Purchased |
|----------|-------------:|----------------:|
| New | 25,800 | 2,132 |
| Bags | 23,854 | 1,053 |
| Campus Collection | 20,060 | 2,184 |
| Accessories | 17,839 | 2,006 |

#### Business recommendations

- Examine Apparel separately to understand which products contribute most to category revenue.
- Compare category revenue with units purchased and purchasing users to distinguish higher-volume categories from those generating more revenue per unit.
- Review categories such as New and Campus Collection to understand their contribution to overall product performance.

> **Note:** Category labels are taken from the source data and may represent store navigation or merchandising labels rather than mutually exclusive product classifications.

---

### 3. Customer Journey Analysis

The analysis compared distinct users and total events across four shopping stages.

| Shopping Event | Total Events | Unique Users |
|----------------|-------------:|-------------:|
| Product view (`view_item`) | 386,068 | 61,252 |
| Add to cart (`add_to_cart`) | 58,543 | 12,545 |
| Begin checkout (`begin_checkout`) | 38,757 | 9,715 |
| Purchase (`purchase`) | 5,692 | 4,419 |

Product views involved 61,252 unique users, while 12,545 users triggered an add-to-cart event. The number of users associated with each subsequent event was lower.

This pattern suggests that moving from product browsing to cart addition is an important area to investigate. The difference between checkout activity and purchase activity also warrants further examination.

#### Business recommendations

- Investigate product-page engagement, pricing, and add-to-cart behavior.
- Review potential checkout friction, including shipping costs, payment options, and form usability.
- Validate the event sequence and analyse session-level user journeys before calculating formal funnel conversion rates.

> **Note:** These are event-level comparisons. The counts alone do not prove that the same users progressed through every stage in sequence, so they should not be interpreted as a fully validated conversion funnel.

---

### 4. Acquisition Source Performance

**Google** was the leading source by recorded purchase revenue in the query results, generating **104,831** across **1,377** purchasing users.

| Acquisition Source | Purchasing Users | Recorded Purchase Revenue |
|--------------------|-----------------:|--------------------------:|
| Google | 1,377 | 104,831 |
| Other | 1,063 | 81,099 |
| Direct | 1,054 | 79,650 |
| Data deleted | 680 | 50,064 |
| shop.googlemerchandisestore.com | 568 | 46,521 |

Google also recorded the highest number of purchase events among the listed sources, at **1,620**.

#### Business recommendations

- Compare acquisition sources by both purchasing users and revenue.
- Investigate the source classifications *Other* and *Data deleted* before using them for detailed marketing decisions.
- Evaluate acquisition quality using additional measures, such as engagement and conversion, before making budget-allocation decisions.

> **Note:** The query uses `traffic_source.source`, which represents the recorded original acquisition source. It does not necessarily identify the marketing channel responsible for each individual purchase.

---

### 5. Revenue & Device Performance

**Desktop** recorded the highest purchase revenue at **208,815** across **2,541** purchasing users. **Mobile** followed with **146,768** across **1,851** purchasing users, while **tablet** recorded **6,582** across **97** purchasing users.

| Device | Unique Users | Purchasing Users | Purchase Revenue |
|--------|-------------:|-----------------:|-----------------:|
| Desktop | 158,917 | 2,541 | 208,815 |
| Mobile | 109,195 | 1,851 | 146,768 |
| Tablet | 6,250 | 97 | 6,582 |

Desktop generated the most recorded purchase revenue in the analysed period, followed by mobile. Mobile also represented a substantial share of overall user activity.

#### Business recommendations

- Review mobile shopping and checkout journeys to identify opportunities to improve the purchasing experience.
- Compare purchasing-user counts with overall users by device to assess device-level purchasing performance.
- Monitor daily revenue trends to identify unusual changes that may require further investigation.

> **Note:** The daily revenue analysis uses purchase-event records and distinct purchasing users alongside recorded purchase revenue. Daily purchase-event counts should not be treated as unique order counts.

---

### 6. Data Quality Assessment

SQL checks were performed to assess event records, product-level fields, and purchase data.

#### Event-level checks

| Check | Result |
|-------|--------|
| Total event rows examined | 4,295,584 |
| Missing values | None reported in the fields checked |
| Duplicate events | None detected by the duplicate check |

*These results apply to the fields and duplicate definition used in the SQL checks.*

#### Product-level checks

| Check | Result |
|-------|-------:|
| Total item rows | 3,982,732 |
| Null product names | 0 |
| Blank product names | 0 |
| Product names marked `(not set)` | 148,458 |
| Missing prices | 148,459 |
| Missing quantities | 3,832,428 |
| Negative prices | 0 |
| Non-positive quantities | 3 |

The checks found no null or blank product names in the examined item rows, but some records used `(not set)` as a product name. Missing prices and especially missing quantities were also observed.

These missing values should be assessed in the context of the relevant event and the source dataset's field definitions before excluding records or calculating product-level metrics.

#### Purchase-level checks

| Check | Result |
|-------|-------:|
| Purchase events | 5,692 |
| Missing purchase revenue | 0 |
| Negative purchase revenue | 0 |
| Purchases without items | 2 |

Two purchase events had no associated item records. This is worth documenting when comparing recorded purchase revenue with revenue calculated from item-level data.

> **Data-quality conclusion:** The checks did not identify duplicate events under the tested definition, but missing product attributes and purchases without item details remain important limitations. These should be considered when interpreting product-level and revenue results.

---

## Power BI Dashboard

The report contains three pages:

| Page | Contents |
|------|----------|
| **Product Performance** | Top-viewed products, top-purchased products, revenue by product, and revenue by category |
| **Customer Journey & Acquisition** | Event activity, shopping-stage comparisons, and acquisition-source purchase performance |
| **Revenue & Device Performance** | Device-level purchase revenue and daily revenue trends, with a date slicer |

The dashboard uses aggregated SQL query results exported from BigQuery, rather than importing all raw event records into Power BI.

<!-- Add your dashboard screenshots below, e.g.:
![Product Performance](images/product-performance.png)
![Customer Journey & Acquisition](images/customer-journey.png)
![Revenue & Device Performance](images/revenue-device.png)
-->

---

## Project Deliverables

- [x] SQL analysis queries
- [x] SQL data-quality checks
- [x] Three-page Power BI dashboard
- [x] Dashboard PDF and screenshots
- [x] Business findings and recommendations

---

## Conclusion

This project demonstrates how SQL and Power BI can be used together to investigate e-commerce performance, understand customer activity, compare acquisition sources, and assess data quality.

The analysis highlights strong product and category performance, differences in purchasing activity across devices, and potential opportunities to investigate the customer journey. It also demonstrates why validating source fields and distinguishing event-level metrics from order-level metrics are important for reliable business reporting.

---

## Dataset Reference

[Google Analytics 4 BigQuery public dataset documentation](https://support.google.com/analytics/answer/7586738)