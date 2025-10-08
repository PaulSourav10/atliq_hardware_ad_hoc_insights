## 📊 Ad Hoc Insights: Atliq Hardware Consumer Goods Analytics

This repository contains the results of a comprehensive SQL-based data analysis of Atliq Hardware's market performance, product portfolio, and sales channels.

[cite_start]The project was created by Sourav Paul [cite: 4] [cite_start]as a challenge set by Tony Sharma, the Data Analytics Director, to evaluate candidates for an expanding analytics team and provide much-needed data-driven insights to management[cite: 15, 17].

---

## 🎯 Project Overview & Context

[cite_start]**Atliq Hardware** is a major computer hardware manufacturer based in India with a strong international presence[cite: 10]. [cite_start]Management lacked sufficient data for informed decision-making, which is the primary challenge addressed by this analysis[cite: 15].

### Business Model & Channels
[cite_start]Atliq Hardware distributes products through three main channels[cite: 32]:
* [cite_start]**Retailer** [cite: 31]
* [cite_start]**Direct** [cite: 33]
* [cite_start]**Distributor** [cite: 34]

### Product Divisions
[cite_start]The product portfolio is segmented into three divisions, with further breakdown into product segments[cite: 41]:
| Division | Segments |
| :--- | :--- |
| **PC** | [cite_start]Notebook, Desktop [cite: 38, 39, 40] |
| **P&A** (Peripherals & Accessories) | [cite_start]Peripherals, Accessories [cite: 42, 43, 44] |
| **N & S** (Networking & Storage) | [cite_start]Networking, Storage [cite: 45, 46, 47] |

### Fiscal Year Structure
[cite_start]The fiscal year (FY) runs from September to August[cite: 22]:
* [cite_start]**FY 2021:** September 2020 - August 2021 [cite: 26]
* [cite_start]**FY 2020:** September 2019 - August 2020 [cite: 25]

---

## ✨ Key Strategic Insights

The analysis yielded several crucial business insights for Atliq Hardware:

* [cite_start]**Product Portfolio Expansion:** The number of unique products increased significantly by **36.33%** in 2021 vs. 2020 (from 245 to 334)[cite: 107].
* [cite_start]**Leading Segments:** **Notebooks**, **accessories**, and **peripherals** constitute **83%** of total manufactured products, indicating a strong focus on these core lines[cite: 116, 117].
* [cite_start]**Segment Growth Leader:** The **Accessories** segment had the largest increase in product count, adding **34** new products in 2021[cite: 121, 127].
* [cite_start]**Channel Performance:** The **Retailer** channel was the clear sales leader in FY 2021, with a **73.22%** contribution to gross sales[cite: 166].
* [cite_start]**Volume Drivers:** The **N & S Division** led total sold quantity, driven by high-volume accessories like pen drives, outselling the top PC division product by more than 40 times[cite: 161, 162].
* [cite_start]**Sales Resilience:** Following a pandemic-driven slump in Q3 2020 [cite: 152][cite_start], sales rebounded strongly, reaching volumes **10x higher** than pre-pandemic levels by late 2021[cite: 143].

---

## 💻 Data Analysis Challenges (Ad-Hoc Requests)

The core of this project involved answering 10 specific business requests using SQL. The full analysis queries are available in `analysis_queries.sql`.

| No. | Business Request | Key Finding / Result |
| :--- | :--- | :--- |
| **1** | Provide the list of markets where "Atliq Exclusive" operates in the APAC region. | [cite_start]India, Japan, Australia, Bangladesh, Indonesia, New Zealand, Philippines, and South Korea[cite: 103]. |
| **2** | What is the percentage of unique product increase in 2021 vs. 2020? | [cite_start]**36.33%** increase (245 unique products in 2020 to 334 in 2021)[cite: 107]. |
| **3** | Report with all unique product counts per segment, sorted descending. | [cite_start]Notebook (129), Accessories (116), Peripherals (84), Desktop (32), Storage (27), Networking (9)[cite: 112]. |
| **4** | Which segment had the most increase in unique products in 2021 vs. 2020? | [cite_start]**Accessories** (34 product difference: 69 to 103)[cite: 121, 127]. |
| **5** | Get the products with the highest and lowest manufacturing costs. | Highest: AQ HOME Allin1 Gen 2 (₹263.42); [cite_start]Lowest: AQ Master wired x1 Ms (₹0.86)[cite: 132]. |
| **6** | Top 5 customers who received the highest average pre-invoice discount for FY 2021 in the Indian market. | [cite_start]Flipkart (30.83%), Viveks (30.38%), Ezone (30.28%), Croma (30.25%), and Amazon (29.33%)[cite: 140]. |
| **7** | Complete report of Gross sales amount for "Atliq Exclusive" per month/year. | [cite_start]Highest gross sales month was November 2020[cite: 150]. |
| **8** | In which quarter of 2020 was the maximum total\_sold\_quantity? | [cite_start]**Q1** (Quarter 1)[cite: 155, 18]. |
| **9** | Which channel helped bring more gross sales in FY 2021 and its percentage contribution? | [cite_start]**Retailer** ($1,924.17M gross sales, 73.22% contribution)[cite: 166]. |
| **10** | Top 3 products in each division with a high total\_sold\_quantity in FY 2021. | [cite_start]Top product was **AQ Pen Drive 2 IN 1** (N & S division)[cite: 166]. |

---

## 📂 Repository Contents

| File/Folder | Description |
| :--- | :--- |
| `Ad-Hoc-Insights_by_Sourav_paul.pdf` | [cite_start]The complete presentation slide deck with all queries, results, and strategic insights[cite: 3, 4]. |
| `analysis_queries.sql` | The SQL script containing all the queries used to answer the 10 ad hoc business requests (recommended to create this file). |
| `README.md` | This overview file. |

---

## 🛠️ Data-Set Schema Reference

[cite_start]The analysis utilizes a star schema composed of Dimension and Fact tables [cite: 52, 53] [cite_start]within the `gbd0041` database[cite: 51]:

* [cite_start]**Dimension Tables:** `Dim_customer` [cite: 54][cite_start], `Dim_product` [cite: 55][cite_start], `Dim_date` [cite: 56]
* [cite_start]**Fact Tables:** `Fact_forecast_monthly` [cite: 57][cite_start], `Fact_sales_monthly` [cite: 58][cite_start], `Fact_post_invoice_deductions` [cite: 59][cite_start], `Fact_pre_invoice_deductions` [cite: 60][cite_start], `Fact_manufacturing_cost` [cite: 61]
