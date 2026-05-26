# 🛒 Brazilian E-Commerce: Customer Retention & Logistics Analysis

## 📌 Project Overview
This project analyzes a Brazilian E-Commerce dataset to identify critical bottlenecks in delivery logistics, evaluate customer churn across product categories, and isolate high-value "whale" customers by state. The goal is to translate raw SQL and Python data into actionable, revenue-saving business strategies.

## 🛠️ Technical Stack
* **Database / SQL:** Complex queries, `JOIN`s, and Window Functions (`DENSE_RANK()`) to segment customers by lifetime value and geography.
* **Python:** Data manipulation and analysis (`pandas`).
* **Data Visualization:** `matplotlib`, `seaborn`, and `plotly` for interactive and static reporting.

---

## 📊 Key Insights & Visualizations

### 1. The "Whale" Factor: Regional Wealth & Inequality
Using SQL Window Functions, we isolated the Top 10 lifetime spenders across all 27 Brazilian states. 
* **Total Wealth Concentration:** The Southeast/South dominates the spending ceiling. The top 10 customers in **Rio de Janeiro (RJ)** alone injected **$46,906.84** into the business, followed closely by **São Paulo (SP)** at **$41,527.47**.
* **Inequality Ratio:** By calculating the spread between the #1 spender and the #10 spender in each state, we found massive disparities. In **Mato Grosso do Sul (MS)**, the #1 spender spent **5.6x** more than the 10th. This indicates markets driven by single, high-volume corporate or wholesale buyers rather than a broad base of wealthy retail consumers.

  ```text
  --- Total Top-10 Wealth per State ---
  customer_state
  RJ    46906.84
  SP    41527.47
  SC    36208.56
  MG    36021.83
  BA    28261.38
  
  --- Inequality Ratio (#1 spend divided by #10 spend) ---
  customer_state
  MS    5.642852
  ES    5.452289
  RJ    5.307717
  AP    4.469428
  SC    4.361313

### 2. Logistics Bottleneck: The Long Tail of Late Deliveries
An analysis of "Delivery Lag Days" (Actual Delivery Date vs. Promised Deadline) reveals a severe logistics issue.
* While the median package arrives early (negative lag days), the boxplot distribution shows a massive **"long tail" of delivery failures**.
* Extreme outliers show customers waiting **50 to 150+ days** past their promised deadline, severely damaging brand trust.

### 3. Customer Churn by Product Category
A deep dive into category-specific retention (minimum 100 customers) highlights massive one-and-done purchase behaviors.
* Categories like **artes (Arts)** (98.5%), **livros_tecnicos (Technical Books)** (97.3%), and **eletrodomesticos_2 (Appliances)** (96.9%) suffer from near-total customer churn.
* Even lifestyle categories like **bebes (Baby)** see a **94.5% churn rate**, representing a massive missed opportunity for lifecycle marketing.

---

## 🚀 Strategic Business Recommendations
Based on the data insights, we propose the following three proactive interventions:

### 1. Tackle Delivery Outliers with "Proactive Logistics Interventions"
* **The Problem:** The delivery lag distribution shows a severe tail of failures, leaving some customers waiting months past their promised date.
* **The Solution:** Implement an automated logistics alert system. The moment a package crosses the `0` threshold (the promised deadline), automatically trigger an email to the customer apologizing for the delay and offering a partial shipping refund or a discount code for their next purchase. Proactive communication before day 30 turns a 1-star complaint into a 4-star "great customer service" review.

### 2. Combat Churn with "Lifecycle & Cross-Sell Email Campaigns"
* **The Problem:** Massive churn (94%+) exists in categories like *bebes* (baby products), *eletrodomesticos_2* (appliances), and *livros_tecnicos* (technical books).
* **The Solution:** Tailor marketing flows based on the category purchase:
  * **For *bebes* (Baby):** Babies grow fast! Set up automated email flows that trigger every 3 months. If they buy newborn items today, send targeted ads for 6-month toddler toys later.
  * **For *eletrodomesticos_2* & *audio*:** Shift from trying to sell a second washing machine to cross-selling accessories or extended warranties 14 days after delivery.

### 3. Launch a Regional "VIP Concierge Program"
* **The Problem:** There are massive disparities in customer spending. Absolute "whales" exist, such as a customer in RJ who spent $13,664, and another in SC who spent $9,553.
* **The Solution:** Create a "VIP Tier" for the top 100 highest-spending customers across the country. Offer these elite buyers a dedicated support phone number, guaranteed priority shipping (shielding them from the delivery lag tail), and early access to sales. It costs far less to retain these $10k+ spenders than to acquire thousands of new $50 buyers.

---

## ⚙️ How to Run This Project

1. ### Clone the repository:
   ```bash
   git clone https://github.com/fayazahmed-data/olist-e-commerce-optimization.git
   cd olist-e-commerce-optimization

2. ### Install Dependencies

   Run the following command in your terminal to install all required libraries:
   ```bash
   pip install pandas plotly matplotlib seaborn sqlalchemy

3. ### Run the Analysis
* **Explore Visualizations:** Open `olist-e-commerce-optimization/olist-e-commerce-optimization.ipynb` in Jupyter Notebook or VS Code to interact with the plots and view the deep-dive churn calculations.
