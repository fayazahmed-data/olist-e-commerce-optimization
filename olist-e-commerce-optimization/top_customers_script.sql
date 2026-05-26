create database olist_database;

psql -d olist_database

-- Customers Table
CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

-- Payments Table
CREATE TABLE payments (
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value NUMERIC
);

-- Orders Table
CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);



WITH CustomerSpend AS (
    -- Step 1: Calculate total spend per unique customer
    SELECT 
        c.customer_state,
        c.customer_unique_id,
        SUM(p.payment_value) AS total_spent
    FROM 
        customers c
    JOIN 
        orders o ON c.customer_id = o.customer_id
    JOIN 
        payments p ON o.order_id = p.order_id
    GROUP BY 
        c.customer_state, 
        c.customer_unique_id
),
RankedCustomers AS (
    -- Step 2: Rank customers within each state based on total spend
    SELECT 
        customer_state,
        customer_unique_id,
        total_spent,
        DENSE_RANK() OVER (PARTITION BY customer_state ORDER BY total_spent DESC) as spend_rank
    FROM 
        CustomerSpend
)
-- Step 3: Filter for the top 10
SELECT 
    customer_state,
    customer_unique_id,
    total_spent,
    spend_rank
FROM 
    RankedCustomers
WHERE 
    spend_rank <= 10
ORDER BY 
    customer_state ASC, 
    spend_rank ASC;