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

---


## 🔹Total sales by category
Question: What is the total revenue generated  by each category ?

### 🧠 Key Insights:
- **Bikes = 96%+** of total revenue  
- Driven by high unit price, not volume  
> ⚠️ **Risk**: Heavy reliance on a single category increases business vulnerability.

## 🔹Sales Volume & Profit by Category
Question: How do sales volume and profitability compare across categories?

### 🧠 Key Insights:
- Accessories make up 60% of units sold but contribute very little to profit
- Bikes account for only 25% of units sold yet generate over 96% of profit
- Clothing has low volume and low profit contribution

### ✅ Actions:
- Diversify revenue across categories  
- Improve accessory margins or bundle strategically  
- Reassess clothing strategy
  

---

# 🛍️ Customer Segmentation with RFM Analysis

- This project applies **RFM analysis** (Recency, Frequency, Monetary) to segment customers based on their purchasing behavior. 
- It's designed to help businesses understand **customer value** and **target segments more effectively**.


### 🧠 Key Insights

  - 33% of customers belong to high-value segments (Loyal Customers, Champions, Big Spenders) — ideal for loyalty, upselling, and personalized retention strategies.

  - 13% are At Risk — showing declining engagement. Timely reactivation campaigns can recover this group before churn. 

  - 11% are Lost Customers — historically engaged but now inactive. A smaller portion may respond to reactivation, but most indicate churned revenue.

  - 7% are New or Potential Loyalists — early in their journey, strong candidates for lifecycle marketing to increase retention.

### 🧠 Segmentation Logic

- Customers are scored from 1 to 5 on Recency, Frequency, and Monetary metrics based on their relative rankings. 
- Using these RFM scores, customers are grouped into 8 key segments :


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
 
 - **Key SQL concepts used:** `CREATE VIEW`, `CTE`, `NTILE()`, `CASE`, `JOIN`, and `GROUP BY`
 - For more details, see the [customers_segementation.](scripts/3_customers_segementation.sql).


---


