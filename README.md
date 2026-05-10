# 🛒 Olist E-Commerce Sales Analysis | SQL + Power BI Project


---

## 📝 Short Description
A complete data analyst portfolio project analyzing **100,000+ real Brazilian e-commerce orders** using MySQL and Power BI — transforming raw CSV data into actionable business insights through structured querying, multi-table joins, aggregation analysis, and an interactive visual dashboard.

Built entirely from scratch: database design → data cleaning → SQL analysis → Power BI dashboard. No Python. No shortcuts.

---

## 🛠️ Skills Used

**SQL & Database**
`MySQL 8.0` `LOAD DATA INFILE` `Multi-table JOINs` `Aggregations` `GROUP BY` `Window Functions` `Date Functions` `UNION` `Subqueries` `Data Cleaning` `NULLIF` `Views`

**Data Visualization**
`Power BI Desktop` `DAX Measures` `Data Modeling` `Table Relationships` `Slicers` `Interactive Filters` `KPI Cards` `Map Visual` `Line Chart` `Bar Chart` `Donut Chart`

**Other**
`Data Analysis` `Business Insights` `GitHub` `Portfolio Documentation`

---

## 📦 Data Source

**[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)** — Kaggle

| Detail | Info |
|--------|------|
| Tables | 7 CSV files |
| Records | 100,000+ orders |
| Period | 2016 – 2018 |
| Type | Real production data |
| Domain | E-Commerce / Retail |

---

## ✨ Features & Highlights

### ❗ Problem
Olist had massive raw transactional data across 7 tables with **no unified view** of revenue performance, customer geography, product demand, or payment behavior. The data was spread across CSVs with missing values, encoding issues, and no relationships defined.

### 🎯 Key Goal
- Build a structured **MySQL database from scratch**
- Clean and import **100K+ records** handling nulls, duplicates, and encoding errors
- Answer **6 critical business questions** using pure SQL
- Build a **fully interactive Power BI dashboard** with 5 visuals + 3 KPIs + 2 slicers

---

## 📊 Power BI Dashboard

> *Interactive dashboard built in Power BI Desktop connected live to MySQL*

### Dashboard Visuals

| Visual | Type | Insight |
|--------|------|---------|
| Monthly Revenue Trend | Line Chart | Growth pattern 2016–2018 |
| Top 10 Product Categories | Bar Chart | Revenue by category |
| Revenue by State | Map | Geographic concentration |
| Payment Methods | Donut Chart | Payment preference split |
| Order Status Breakdown | Pie Chart | Delivery success rate |
| Total Revenue | KPI Card | R$ 13.59M |
| Total Orders | KPI Card | 99,441 |
| Avg Order Value | KPI Card | R$ 120.65 |

### Interactive Features
- 🔘 **Year slicer** — filter all visuals by 2016, 2017, or 2018
- 🔘 **Order Status slicer** — filter by delivered, shipped, cancelled
- 🖱️ **Cross-filtering** — click any visual to filter all others


---

## 💡 Business Impact & Insights

| Insight | Finding |
|---------|---------|
| 💰 Total Revenue | R$ 13,221,498 across 96,478 delivered orders |
| 📈 Growth | Revenue grew **700x** in 2 years (2016→2018) |
| 🛍️ Top Category | Health & Beauty — R$ 1,258,681 in revenue |
| 🌍 Top Market | São Paulo = **39% of ALL** national revenue |
| 💳 Payment | **74%** of customers pay by credit card (avg R$163) |
| ✅ Logistics | **97%** successful delivery rate |
| 📅 Seasonality | Black Friday Nov 2017 drove a **79% revenue spike** |

### 📋 Recommendations Generated
1. **Expand marketing** into underserved northern states (BA, GO, ES)
2. **Prioritize Health & Beauty** with loyalty programs and bundle deals
3. **Incentivize credit card use** to increase average order value
4. **Pre-plan inventory** for Q4 seasonal demand spikes every year

---

## 🗂️ SQL Queries

### 1. Total Revenue & Orders
```sql
SELECT 
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(SUM(i.price), 2) AS total_revenue,
  ROUND(AVG(i.price), 2) AS avg_order_value
FROM olist_orders o
JOIN olist_order_items i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered';
```

### 2. Monthly Revenue Trend
```sql
SELECT 
  DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(SUM(i.price), 2) AS revenue
FROM olist_orders o
JOIN olist_order_items i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;
```

### 3. Top 10 Product Categories
```sql
SELECT 
  t.product_category_name_english AS category,
  COUNT(DISTINCT i.order_id) AS total_orders,
  ROUND(SUM(i.price), 2) AS revenue
FROM olist_order_items i
JOIN olist_products p ON i.product_id = p.product_id
JOIN product_category_name_translation t 
  ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;
```

### 4. Sales by State
```sql
SELECT 
  c.customer_state AS state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(SUM(i.price), 2) AS revenue
FROM olist_orders o
JOIN olist_customers c ON o.customer_id = c.customer_id
JOIN olist_order_items i ON o.order_id = i.order_id
GROUP BY state
ORDER BY revenue DESC
LIMIT 10;
```

### 5. Payment Methods
```sql
SELECT 
  payment_type,
  COUNT(*) AS total_transactions,
  ROUND(SUM(payment_value), 2) AS total_value,
  ROUND(AVG(payment_value), 2) AS avg_value
FROM olist_order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;
```

### 6. Order Status Breakdown
```sql
SELECT 
  order_status,
  COUNT(*) AS total_orders,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage
FROM olist_orders
GROUP BY order_status
ORDER BY total_orders DESC;
```

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| MySQL 8.0 | Database engine & SQL analysis |
| MySQL Workbench | Query writing and execution |
| Power BI Desktop | Interactive dashboard |
| Kaggle | Dataset source |
| GitHub | Version control & portfolio |

---

Example : https://github.com/arindam-09/analysis_report.md/blob/main/Olist_Dashboard.png


