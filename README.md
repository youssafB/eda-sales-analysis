# eda-sales-analysis
## 1.  High-Level Metrics Overview

Gain an initial understanding of overall business performance by calculating key high-level metrics for:

- **Sales**
- **Volume**
- **Pricing**
- **Customer Activity**

### 🧮 Summary Table

| **Total Sales** | **Total Quantity** | **Average Price** | **Total Nr. Orders** | **Total Nr. Products** | **Total Nr. Customers** |
|-----------------|--------------------|--------------------|-----------------------|-------------------------|--------------------------|
| 29,356,250      | 60,423             | 486                | 27,659                | 295                     | 18,484                   |

> 📌 This overview is generated using a single SQL query that combines multiple aggregation functions with `UNION ALL`.  
> You can view the full SQL query [here](scripts/1_Business_metrics).


## 2. Customers segmentation:


# 🛍️ Customer Segmentation with RFM Analysis

This project applies **RFM analysis** (Recency, Frequency, Monetary) to segment customers based on their purchasing behavior. It's designed to help businesses understand **customer value** and **target segments more effectively**.

---

## 🔍 RFM Scoring

Each customer is scored from **1 to 5** based on:

- **Recency**: How recently they made a purchase  
- **Frequency**: How often they make purchases  
- **Monetary**: How much money they spend  

---

## 🧠 Segmentation Logic

Using RFM scores, customers are grouped into 8 key segments:

| Segment Name             | Rule Logic           | Description                                   |
|--------------------------|----------------------|-----------------------------------------------|
| 🏆 **Champions**          | R ≥ 4, F ≥ 4, M ≥ 4   | Best customers: buy often, spend a lot        |
| ✨ **Loyal Customers**    | R ≥ 4, F ≥ 3          | Frequent buyers                               |
| 🆕 **New Customers**      | R = 5, F = 1          | Just joined                                   |
| 💰 **Big Spenders**       | R ≥ 3, M ≥ 4          | Spend a lot, may not buy frequently           |
| ⏳ **At Risk**            | R ≤ 2, F ≥ 4          | Used to buy a lot, now quiet                  |
| ❌ **Lost Customers**     | R ≤ 2, F ≤ 2, M ≤ 2   | Likely lost                                   |
| 📈 **Potential Loyalists**| F ≥ 4, M ≤ 3          | Buy often, could spend more                   |
| 🧊 **Others**             | -                    | Don’t fit into other segments                 |

---

✅ Use this segmentation to tailor marketing strategies and improve customer retention.
Key SQL Features:
    - `CREATE VIEW`, `CTE`, `NTILE()`, `CASE`, `JOIN`, `GROUP BY`

