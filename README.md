# 📊 Sales Performance Analysis — SQL EDA Project

## 1. Business Problem
A retail company selling Bikes, Accessories, and Clothing wants to **understand its sales performance, product profitability, and customer value segmentation** to make better strategic decisions.

Management has raised concerns about:
- Overreliance on a single product category.
- Declining engagement from certain customer groups.
- Low profitability from high-volume items.

**Goal of the analysis:**
1. Identify revenue drivers and profitability risks.  
2. Segment customers for targeted marketing campaigns.  
3. Provide actionable recommendations backed by **data-driven insights**.

---

## 2. Executive Summary — Key Insights

### 💡 Key Takeaways
- **96%+ of total revenue comes from Bikes**, driven by high prices — creating a heavy dependency on one category.  
- **Accessories** represent **60% of units sold but contribute little to profit** — margins are weak.  
- **33% of customers** are in **high-value segments** (Champions, Loyal, Big Spenders) — retention priority.  
- **13% of customers** are **At Risk** and could churn without re-engagement campaigns.  

### 📌 Recommended Actions
- Diversify revenue streams to reduce dependency on Bikes.  
- Improve accessory margins via bundling, supplier renegotiation, or upselling.  
- Launch loyalty and personalized retention campaigns for high-value customers.  
- Implement churn prevention strategies for At Risk segments.

---

## 3. High-Level Business Metrics
| **Total Sales** | **Total Quantity** | **Avg. Price** | **# Orders** | **# Products** | **# Customers** |
|-----------------|--------------------|----------------|--------------|----------------|-----------------|
| 29,356,250      | 60,423             | 486            | 27,659       | 295            | 18,484          |

📂 [View SQL Query](scripts/1_Business_metrics.sql)  
**SQL Skills Used:** Aggregations, multiple `SUM()`, `COUNT(DISTINCT)`, `AVG()` combined via `UNION ALL`.

---

## 4. Sales Performance by Category
**Question:** Which categories drive revenue and profit?

### Insights
- **Bikes**: 96%+ of revenue, high margin, low volume risk if supply is disrupted.  
- **Accessories**: High volume, low profit — margin improvement needed.  
- **Clothing**: Low contribution to both revenue and volume.

📂 [View SQL Query](scripts/2_categories_performance.sql)  
**SQL Skills Used:** Grouped aggregations, category breakdown, calculated profit margin.

---

## 5. Customer Segmentation — RFM Analysis
**Objective:** Classify customers into behavioral segments to guide marketing.

### Methodology
- Scored each customer on **Recency, Frequency, and Monetary** metrics using `NTILE(5)`.
- Assigned segments with `CASE WHEN` logic inside CTEs.
- Created views for reusability.

| Segment | Description | % of Customers |
|---------|-------------|----------------|
| 🏆 Champions | Buy often, spend a lot | 12% |
| ✨ Loyal Customers | Frequent buyers | 10% |
| 💰 Big Spenders | High spend, less frequent | 11% |
| ⏳ At Risk | Previously active, now declining | 13% |
| ❌ Lost | Likely churned | 11% |
| 📈 Potential Loyalists | Frequent but low spend | 7% |
| Others | Miscellaneous | 36% |

📂 [View SQL Query](scripts/3_customers_segementation.sql)  
**SQL Skills Used:** `CREATE VIEW`, `CTE`, `NTILE()`, `CASE`, `JOIN`, advanced filtering.

---

## 6. Technical & Analytical Skills Demonstrated
- **Advanced SQL Concepts:**
  - Window Functions (`NTILE()`, `ROW_NUMBER()`, `RANK()`)
  - Common Table Expressions (CTEs)
  - Complex Joins
  - Conditional Logic with `CASE WHEN`
  - Aggregations & Grouped Metrics
  - Query optimization for large datasets
- **Analytical Skills:**
  - Business metric creation (Sales, Profitability, RFM scoring)
  - Customer segmentation & retention strategy
  - Data storytelling & visualization-ready output

---
