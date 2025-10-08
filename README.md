# 📊 Ad Hoc Insights: Atliq Hardware Consumer Goods Analytics

This repository contains the results of a comprehensive SQL-based data analysis of **Atliq Hardware's** market performance, product portfolio, and sales channels.  
The project was created by **Sourav Paul** as a challenge set by the Data Analytics Director, **Tony Sharma**, to evaluate candidates for an expanding analytics team and provide data-driven insights to management.

---

## 🎯 Project Overview & Context

**Atliq Hardware** is a major computer hardware manufacturer in India with a strong international presence.  
Management lacked sufficient insights for data-informed decisions, which led to this analysis.

### Business Model & Channels
Atliq Hardware distributes products through three main channels:
* **Retailer**
* **Direct**
* **Distributor**

### Product Divisions
The product portfolio is segmented into three major divisions, with further breakdown into product segments:

| Division | Segments |
| :--- | :--- |
| **PC** (Personal Computer) | Notebook, Desktop |
| **P&A** (Peripherals & Accessories) | Peripherals, Accessories |
| **N & S** (Networking & Storage) | Networking, Storage |

### Fiscal Year Structure
The company's Fiscal Year (FY) runs from September to August:
* **FY 2021:** September 2020 - August 2021
* **FY 2020:** September 2019 - August 2020

---

## ✨ Key Strategic Insights

The analysis yielded several crucial business insights for Atliq Hardware:

* **Product Portfolio Expansion:** The number of unique products increased significantly by **36.33%** in 2021 vs. 2020 (from 245 to 334).
* **Leading Segments:** **Notebooks**, **accessories**, and **peripherals** show significant manufacturing growth, constituting **83%** of total manufactured products.
* **Segment Growth Leader:** The **Accessories** segment had the largest increase in product count, adding **34** new products in 2021.
* **Channel Performance:** The **Retailer** channel was the clear sales leader in FY 2021, with **$1,924.17M** in gross sales and a **73.22%** contribution.
* **Volume Drivers:** The **N & S Division** led the total sold quantity, driven by high-volume products like pen drives, outselling the top PC division product by more than **40 times**.
* **Sales Resilience:** Post-2020, monthly sales sustained **10x higher** volumes than pre-pandemic levels, showing strong market adaptation and resilience after a slump.

---

## 💻 Data Analysis Challenges (Ad-Hoc Requests)

The core of this project involved answering 10 specific business requests. The full analysis queries are recommended to be added in an `analysis_queries.sql` file.

| No. | Business Request | Key Finding / Result |
| :--- | :--- | :--- |
| 1 | Provide the list of markets where customer "Atliq Exclusive" operates in the APAC region | Australia, Bangladesh, India, Indonesia, Japan, New Zealand, Philippines, South Korea |
| 2 | What is the percentage of unique product increase in 2021 vs. 2020? | **36.33%** increase (245 unique products in 2020 to 334 in 2021) |
| 3 | Report with all unique product counts per segment, sorted descending | Notebook (129), Accessories (116), Peripherals (84), Desktop (32), Storage (27), Networking (9) |
| 4 | Which segment had the most increase in unique products in 2021 vs. 2020? | **Accessories** (34 product difference: 69 to 103) |
| 5 | Get the products with the highest and lowest manufacturing costs | Highest: **AQ HOME Allin1 Gen 2** (₹263.42); Lowest: **AQ Master wired x1 Ms** (₹0.86) |
| 6 | Top 5 customers who received the highest average pre-invoice discount for FY 2021 in the Indian market | Flipkart (30.83%), Viveks (30.38%), Ezone (30.28%), Croma (30.25%), Amazon (29.33%) |
| 7 | Complete report of Gross sales amount for the customer "Atliq Exclusive" per month/year | Highest gross sales month for Atliq Exclusive was **November 2020** |
| 8 | In which quarter of 2020 was the maximum total_sold_quantity? | **Q1** (Quarter 1) |
| 9 | Which channel helped bring more gross sales in FY 2021 and its percentage contribution? | **Retailer** ($1,924.17M gross sales, 73.22% contribution) |
| 10 | Top 3 products in each division with a high total_sold_quantity in FY 2021 | Top product overall was **AQ Pen Drive 2 IN 1** (N & S division) |

---

## 📂 Repository Contents

| File/Folder | Description |
| :--- | :--- |
| [`Ad-Hoc-Insights_by_Sourav_paul.pdf`](https://github.com/PaulSourav10/atliq_hardware_ad_hoc_insights/blob/main/Ad-Hoc-Insights_by_Sourav_paul.pdf) | Complete presentation slide deck with all queries, results, and strategic insights |
| [`Solution_file_CB_Resume_challange_7_By_Sourav_Paul.sql`](https://github.com/PaulSourav10/atliq_hardware_ad_hoc_insights/blob/main/Solution_file_CB_Resume_challange_7_By_Sourav_Paul.sql) | SQL scripts used to answer all 10 ad hoc business requests |
| `README.md` | This document, providing an overview and key findings |

---

## 📧 Contact

**Author:** Sourav Paul  
**Email:** souravpaulofficial101@gmail.com
