# Influencer Marketing Campaigns Analysis — SQL Project

This project focuses on analyzing influencer marketing campaigns using SQL. The goal is to extract insights such as performance metrics, engagement rates, ROI, and platform-specific behavior from campaign data.

---

## Problem Statement

Marketing teams often collaborate with influencers to boost brand visibility and sales. This project helps analyze:

- Which influencers perform best?
- What campaigns have the highest engagement?
- Which platforms drive better conversions?
- How much return on investment does each campaign generate?

---

## Dataset Structure

### 1. `influencers.csv`
| Column         | Description              |
|----------------|--------------------------|
| influencer_id  | Unique ID                |
| name           | Influencer Name          |
| category       | Niche/Category           |
| platform       | Platform (Instagram, etc.) |
| followers      | Follower count           |
| country        | Country of the influencer |

---

### 2. `campaigns.csv`
| Column       | Description              |
|--------------|--------------------------|
| campaign_id  | Unique ID                |
| brand        | Brand running the campaign |
| start_date   | Campaign start date      |
| end_date     | Campaign end date        |
| budget       | Budget allocated (in ₹)  |

---

### 3. `campaign_performance.csv`
| Column        | Description                  |
|---------------|------------------------------|
| performance_id| Unique ID                    |
| campaign_id   | Related campaign             |
| influencer_id | Related influencer           |
| views         | Total views                  |
| likes         | Total likes                  |
| comments      | Total comments               |
| clicks        | Clicks to website/product    |
| conversions   | Completed purchases/signups  |
| platform      | Platform used                |

---

### 4. `revenue.csv`
| Column         | Description             |
|----------------|-------------------------|
| conversion_id  | Unique ID               |
| campaign_id    | Related campaign        |
| revenue_generated | Revenue from that campaign (in ₹) |

---

## SQL Queries Performed

### Key Insights Generated:
1. **Total budget spent per brand**
2. **Top 5 influencers by views**
3. **Engagement rate per campaign**
4. **CTR (Click Through Rate) per campaign**
5. **Conversion rate by platform**
6. **ROI analysis per campaign**
7. **Influencer performance report**
8. **Best-performing platforms**

All queries were run on MySQL/PostgreSQL after importing the dataset.
