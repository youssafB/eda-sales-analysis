<!-- ================================================================================
🧠 RFM Segmentation Approach (SQL-Based)
===============================================================================
Goal:
    Segment customers based on purchase behavior using Recency, Frequency, and Monetary value
    for better targeting, retention, and business insights.

Approach:
    1. 📊 **Calculate RFM Metrics**:
       - Use `DATEDIFF()` for Recency, `COUNT()` for Frequency, and `SUM()` for Monetary.
       - Group data by customer to create a base view.

    2. 🧮 **Score Customers (1–5)**:
       - Use `NTILE(5)` in a CTE to assign RFM scores using quintiles.
       - Sorting logic:
         - Recency: `ORDER BY recency DESC` (lower = better)
         - Frequency & Monetary: `ORDER BY ... ASC` (higher = better)

    3. 🏷️ **Assign Segments**:
       - Apply `CASE` logic to map score combinations to customer segments
         (e.g., Champions, Loyal, At Risk).

    4. 📥 **Output Results**:
       - Select customer metrics, RFM scores, and their assigned segment labels.

Key SQL Features:
    - `CREATE VIEW`, `CTE`, `NTILE()`, `CASE`, `JOIN`, `GROUP BY`

=============================================================================== -->




  


-- Step 1: Create a view to calculate basic RFM metrics for each customer
CREATE VIEW vw_rfm_base AS
SELECT
    fs.customer_key,
    DATEDIFF(DAY, MAX(fs.order_date), '2014-01-28') AS recency,
    COUNT(fs.order_date) AS frequency,
    SUM(fs.sales_amount) AS monetary
FROM fact_sales fs
LEFT JOIN dim_customers dc ON fs.customer_key = dc.customer_key
GROUP BY fs.customer_key;

-- Step 2: Use a CTE to calculate RFM scores using quintiles (NTILE)
WITH rfm_scored AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,   -- Lower recency = better, so DESC
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,  -- Higher frequency = better, so ASC
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score    -- Higher monetary = better, so ASC
    FROM vw_rfm_base
),

-- Step 3: Assign customer segments based on RFM scores
rfm_segmented AS (
    SELECT *,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN '🏆 Champions'
            WHEN r_score >= 4 AND f_score >= 3 THEN '✨ Loyal Customers'
            WHEN r_score = 5 AND f_score = 1 THEN '🆕 New Customers'
            WHEN r_score >= 3 AND m_score >= 4 THEN '💰 Big Spenders'
            WHEN r_score <= 2 AND f_score >= 4 THEN '⏳ At Risk'
            WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN '❌ Lost Customers'
            WHEN f_score >= 4 AND m_score <= 3 THEN '📈 Potential Loyalists'
            ELSE '🧊 Others'
        END AS segment
    FROM rfm_scored
)

-- Final Result: Select RFM metrics, scores, and segment labels
SELECT 
    customer_key,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    segment
FROM rfm_segmented;
