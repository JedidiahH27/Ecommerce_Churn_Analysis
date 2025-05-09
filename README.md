# 🛒 Customer Churn Analysis – E-Commerce Case Study

## 📌 Project Objective

The goal of this project is to explore customer churn behavior in an e-commerce business using SQL for querying, Python for exploratory data analysis (EDA), and Tableau for visualizing key trends. The findings will help identify at-risk customers and uncover behavioral patterns that drive churn, helping stakeholders make informed, data-driven decisions.

---

## 🧠 Business Problem

Customer churn is a critical metric for any subscription or retail-based company. Retaining existing customers is often more cost-effective than acquiring new ones. This project answers the following questions:

- What characteristics do churned customers share?
- How do behavior and satisfaction impact churn?
- Which segments have the highest churn rates?

---

## 📁 Dataset Description

**Source**: Simulated internal data  
**Size**: ~5,000 customers  
**Target Variable**: `Churn` (1 = churned, 0 = retained)

### Selected Variables

| Feature | Description |
|---------|-------------|
| `Tenure` | Months as a customer |
| `PreferredLoginDevice` | Device used to log in |
| `CityTier` | Tier of city (1 = top-tier) |
| `WarehouseToHome` | Distance to customer’s home |
| `PreferredPaymentMode` | Payment method |
| `HourSpendOnApp` | Average hours spent on app |
| `SatisfactionScore` | Score from 1–5 |
| `Complain` | Raised a complaint last month |
| `OrderCount`, `CouponUsed`, `CashbackAmount`, etc. | Behavior metrics |

---

## 🔧 Tools Used

| Tool     | Purpose                           |
|----------|-----------------------------------|
| **SQL**  | Data cleaning and transformation  |
| **Python** | Exploratory data analysis (Pandas, Seaborn, Matplotlib) |
| **Tableau** | Interactive visualizations & dashboards |

---

## 📊 Key EDA Steps (in Python)

- Data quality checks (nulls, outliers, duplicates)
- Churn rate by:
  - Tenure
  - Device type
  - Payment method
  - City tier
- Impact of complaints, satisfaction, and app usage on churn
- Correlation matrix and pairplots
- Aggregated KPIs (avg. orders, cashback, complaints) by churn status

---

## 📈 Tableau Visualizations

- Churn heatmaps by city and device
- Tenure vs. churn bubble chart
- Distribution of satisfaction scores
- Filterable dashboards: churn rate by payment type, gender, complaints

---
