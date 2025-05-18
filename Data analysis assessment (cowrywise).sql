-- Create required referenced tables first (minimal structure)

CREATE TABLE plans_currency (
    id int PRIMARY KEY
);

CREATE TABLE funds_usdindex (
    id nvarchar(32) PRIMARY KEY
);

CREATE TABLE managed_portfolio_portfolioholdings (
    id nvarchar(32) PRIMARY KEY
);

CREATE TABLE plans_planpreset (
    id int PRIMARY KEY
);

-- Now create the main table

DROP TABLE IF EXISTS plans_plan;

CREATE TABLE plans_plan (
  id nvarchar(32) NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL,
  description varchar(255) NOT NULL,
  amount int NOT NULL,
  start_date date NULL,
  last_charge_date date NULL,
  next_charge_date date NULL,
  created_on datetime NOT NULL,
  frequency_id int NOT NULL,
  owner_id nvarchar(32) NOT NULL,
  status_id int NOT NULL,
  interest_rate float NOT NULL,
  withdrawal_date date NULL,
  default_plan bit NOT NULL,
  plan_type_id int NOT NULL,
  goal float NOT NULL,
  locked bit NOT NULL,
  next_returns_date date NOT NULL,
  last_returns_date date NOT NULL,
  cowry_amount int NOT NULL,
  debit_card nvarchar(32) NULL,
  is_archived bit NOT NULL,
  is_deleted bit NOT NULL,
  is_goal_achieved bit NOT NULL,
  is_a_goal bit NOT NULL,
  is_interest_free bit NOT NULL,
  plan_group_id nvarchar(32) NULL,
  is_deleted_from_group bit NOT NULL,
  is_a_fund bit NOT NULL,
  purchased_fund_id nvarchar(32) NULL,
  is_a_wallet bit NOT NULL,
  currency_is_dollars bit NOT NULL,
  is_auto_rollover bit NOT NULL,
  is_vendor_plan bit NOT NULL,
  plan_source varchar(100) NOT NULL,
  is_donation_plan bit NOT NULL,
  donation_description nvarchar(max) NOT NULL,
  donation_expiry_date date NULL,
  donation_link varchar(255) NULL,
  link_code varchar(255) NULL,
  charge_payment_fee bit NOT NULL,
  donation_is_approved bit NOT NULL,
  is_emergency_plan bit NOT NULL,
  is_personal_challenge bit NOT NULL,
  currency_id int NOT NULL,
  is_a_usd_index bit NOT NULL,
  usd_index_id nvarchar(32) NULL,
  open_savings_plan bit NOT NULL,
  new_cycle bit NOT NULL,
  recurrence nvarchar(max) NULL,
  is_bloom_note bit NOT NULL,
  is_managed_portfolio bit NOT NULL,
  portfolio_holdings_id nvarchar(32) NULL,
  is_fixed_investment bit NOT NULL,
  is_regular_savings bit NOT NULL,
  preset_id int NULL,

  -- Foreign Keys
  CONSTRAINT fk_plan_currency FOREIGN KEY (currency_id) REFERENCES plans_currency(id),
  CONSTRAINT fk_usd_index FOREIGN KEY (usd_index_id) REFERENCES funds_usdindex(id),
  CONSTRAINT fk_portfolio_holdings FOREIGN KEY (portfolio_holdings_id) REFERENCES managed_portfolio_portfolioholdings(id),
  CONSTRAINT fk_plan_preset FOREIGN KEY (preset_id) REFERENCES plans_planpreset(id)
);

-- Indexes
CREATE INDEX idx_frequency_id ON plans_plan(frequency_id);
CREATE INDEX idx_owner_id ON plans_plan(owner_id);
CREATE INDEX idx_status_id ON plans_plan(status_id);
CREATE INDEX idx_plan_type_id ON plans_plan(plan_type_id);
CREATE INDEX idx_plan_group_id ON plans_plan(plan_group_id);
CREATE INDEX idx_purchased_fund_id ON plans_plan(purchased_fund_id);
CREATE INDEX idx_usd_index_id ON plans_plan(usd_index_id);
CREATE INDEX idx_currency_id ON plans_plan(currency_id);
CREATE INDEX idx_portfolio_holdings_id ON plans_plan(portfolio_holdings_id);
CREATE INDEX idx_preset_id ON plans_plan(preset_id);

-- Drop table if exists
IF OBJECT_ID('dbo.plans_plan', 'U') IS NOT NULL
    DROP TABLE dbo.plans_plan;
GO

-- Create table with exactly 53 columns
CREATE TABLE dbo.plans_plan (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    amount DECIMAL(18,2),
    start_date DATE,
    last_charge_date DATE,
    next_charge_date DATE,
    created_on DATE,
    frequency_id INT,
    owner_id INT,
    status_id INT,
    interest_rate FLOAT,
    withdrawal_date DATE NULL,
    default_plan BIT,
    plan_type_id INT,
    goal DECIMAL(18,2),
    locked BIT,
    next_returns_date DATE NULL,
    last_returns_date DATE NULL,
    cowry_amount DECIMAL(18,2),
    debit_card VARCHAR(50) NULL,
    is_archived BIT,
    is_deleted BIT,
    is_goal_achieved BIT,
    is_a_goal BIT,
    is_interest_free BIT,
    plan_group_id INT NULL,
    is_deleted_from_group BIT,
    is_a_fund BIT,
    purchased_fund_id INT NULL,
    is_a_wallet BIT,
    currency_is_dollars BIT,
    is_auto_rollover BIT,
    is_vendor_plan BIT,
    plan_source VARCHAR(50) NULL,
    is_donation_plan BIT,
    donation_description VARCHAR(255) NULL,
    donation_expiry_date DATE NULL,
    donation_link VARCHAR(255) NULL,
    link_code VARCHAR(50) NULL,
    charge_payment_fee BIT,
    donation_is_approved BIT,
    is_emergency_plan BIT,
    is_personal_challenge BIT,
    currency_id INT,
    is_a_usd_index BIT,
    usd_index_id INT NULL,
    open_savings_plan BIT,
    new_cycle BIT,
    recurrence INT,
    is_bloom_note BIT,
    is_managed_portfolio BIT,
    portfolio_holdings_id INT NULL,
    is_fixed_investment BIT,
    is_regular_savings BIT,
    preset_id INT NULL
);

-- INSERT with exactly 53 columns and 53 values per row
INSERT INTO dbo.plans_plan (
    id, name, description, amount, start_date, last_charge_date, next_charge_date, created_on, 
    frequency_id, owner_id, status_id, interest_rate, withdrawal_date, default_plan, plan_type_id, 
    goal, locked, next_returns_date, last_returns_date, cowry_amount, debit_card, is_archived, 
    is_deleted, is_goal_achieved, is_a_goal, is_interest_free, plan_group_id, is_deleted_from_group,
    is_a_fund, purchased_fund_id, is_a_wallet, currency_is_dollars, is_auto_rollover, is_vendor_plan, 
    plan_source, is_donation_plan, donation_description, donation_expiry_date, donation_link, link_code, 
    charge_payment_fee, donation_is_approved, is_emergency_plan, is_personal_challenge, currency_id, 
    is_a_usd_index, usd_index_id, open_savings_plan, new_cycle, recurrence, is_bloom_note, 
    is_managed_portfolio, portfolio_holdings_id, is_fixed_investment, is_regular_savings, preset_id
)
VALUES
-- First row - 53 values
(
    1001,                            -- id
    'John Doe',                      -- name
    'Savings plan for car',          -- description
    50000.00,                        -- amount
    '2024-01-01',                    -- start_date
    '2024-02-01',                    -- last_charge_date
    '2024-03-01',                    -- next_charge_date
    '2024-01-05',                    -- created_on
    1,                               -- frequency_id
    1001,                            -- owner_id
    1,                               -- status_id
    3.5,                             -- interest_rate
    '2024-06-01',                    -- withdrawal_date
    0,                               -- default_plan
    1,                               -- plan_type_id
    55000.00,                        -- goal
    0,                               -- locked
    '2024-05-01',                    -- next_returns_date
    '2024-04-01',                    -- last_returns_date
    300.00,                          -- cowry_amount
    NULL,                            -- debit_card
    0,                               -- is_archived
    0,                               -- is_deleted
    1,                               -- is_goal_achieved
    1,                               -- is_a_goal
    0,                               -- is_interest_free
    NULL,                            -- plan_group_id
    0,                               -- is_deleted_from_group
    0,                               -- is_a_fund
    NULL,                            -- purchased_fund_id
    0,                               -- is_a_wallet
    1,                               -- currency_is_dollars
    0,                               -- is_auto_rollover
    0,                               -- is_vendor_plan
    'Web',                           -- plan_source
    0,                               -- is_donation_plan
    NULL,                            -- donation_description
    '2024-12-31',                    -- donation_expiry_date
    NULL,                            -- donation_link
    NULL,                            -- link_code
    1,                               -- charge_payment_fee
    0,                               -- donation_is_approved
    0,                               -- is_emergency_plan
    0,                               -- is_personal_challenge
    1,                               -- currency_id
    0,                               -- is_a_usd_index
    NULL,                            -- usd_index_id
    0,                               -- open_savings_plan
    0,                               -- new_cycle
    NULL,                            -- recurrence
    0,                               -- is_bloom_note
    0,                               -- is_managed_portfolio
    NULL,                            -- portfolio_holdings_id
    0,                               -- is_fixed_investment
    0,                               -- is_regular_savings
    NULL                             -- preset_id
),
-- Second row - 53 values
(
    1003,                            -- id
    'Michael Brown',                 -- name
    'Emergency fund',                -- description
    15000.00,                        -- amount
    '2024-03-01',                    -- start_date
    '2024-04-01',                    -- last_charge_date
    '2024-05-01',                    -- next_charge_date
    '2024-03-05',                    -- created_on
    1,                               -- frequency_id
    1003,                            -- owner_id
    1,                               -- status_id
    3.8,                             -- interest_rate
    NULL,                            -- withdrawal_date
    0,                               -- default_plan
    1,                               -- plan_type_id
    20000.00,                        -- goal
    0,                               -- locked
    '2024-07-01',                    -- next_returns_date
    '2024-06-01',                    -- last_returns_date
    100.00,                          -- cowry_amount
    NULL,                            -- debit_card
    0,                               -- is_archived
    0,                               -- is_deleted
    1,                               -- is_goal_achieved
    0,                               -- is_a_goal
    0,                               -- is_interest_free
    NULL,                            -- plan_group_id
    0,                               -- is_deleted_from_group
    0,                               -- is_a_fund
    NULL,                            -- purchased_fund_id
    0,                               -- is_a_wallet
    1,                               -- currency_is_dollars
    0,                               -- is_auto_rollover
    0,                               -- is_vendor_plan
    'Web',                           -- plan_source
    0,                               -- is_donation_plan
    NULL,                            -- donation_description
    '2024-12-31',                    -- donation_expiry_date
    NULL,                            -- donation_link
    NULL,                            -- link_code
    1,                               -- charge_payment_fee
    0,                               -- donation_is_approved
    0,                               -- is_emergency_plan
    0,                               -- is_personal_challenge
    0,                               -- currency_id
    0,                               -- is_a_usd_index
    NULL,                            -- usd_index_id
    0,                               -- open_savings_plan
    0,                               -- new_cycle
    NULL,                            -- recurrence
    0,                               -- is_bloom_note
    0,                               -- is_managed_portfolio
    NULL,                            -- portfolio_holdings_id
    0,                               -- is_fixed_investment
    0,                               -- is_regular_savings
    NULL                             -- preset_id
),
-- Third row - 53 values
(
    1004,                            -- id
    'Sarah Johnson',                 -- name
    'Retirement savings',            -- description
    75000.00,                        -- amount
    '2024-02-15',                    -- start_date
    '2024-03-15',                    -- last_charge_date
    '2024-04-15',                    -- next_charge_date
    '2024-02-20',                    -- created_on
    2,                               -- frequency_id
    1004,                            -- owner_id
    1,                               -- status_id
    4.2,                             -- interest_rate
    NULL,                            -- withdrawal_date
    0,                               -- default_plan
    2,                               -- plan_type_id
    100000.00,                       -- goal
    1,                               -- locked
    '2024-06-15',                    -- next_returns_date
    '2024-05-15',                    -- last_returns_date
    450.00,                          -- cowry_amount
    '1234-5678-9012-3456',           -- debit_card
    0,                               -- is_archived
    0,                               -- is_deleted
    0,                               -- is_goal_achieved
    1,                               -- is_a_goal
    0,                               -- is_interest_free
    NULL,                            -- plan_group_id
    0,                               -- is_deleted_from_group
    0,                               -- is_a_fund
    NULL,                            -- purchased_fund_id
    0,                               -- is_a_wallet
    0,                               -- currency_is_dollars
    1,                               -- is_auto_rollover
    0,                               -- is_vendor_plan
    'Mobile',                        -- plan_source
    0,                               -- is_donation_plan
    NULL,                            -- donation_description
    NULL,                            -- donation_expiry_date
    NULL,                            -- donation_link
    NULL,                            -- link_code
    0,                               -- charge_payment_fee
    0,                               -- donation_is_approved
    0,                               -- is_emergency_plan
    1,                               -- is_personal_challenge
    1,                               -- currency_id
    0,                               -- is_a_usd_index
    NULL,                            -- usd_index_id
    1,                               -- open_savings_plan
    1,                               -- new_cycle
    30,                              -- recurrence
    0,                               -- is_bloom_note
    0,                               -- is_managed_portfolio
    NULL,                            -- portfolio_holdings_id
    1,                               -- is_fixed_investment
    1,                               -- is_regular_savings
    5                                -- preset_id
),
-- Fourth row - 53 values
(
    1005,                            -- id
    'David Wilson',                  -- name
    'Education fund',                -- description
    25000.00,                        -- amount
    '2024-04-10',                    -- start_date
    '2024-05-10',                    -- last_charge_date
    '2024-06-10',                    -- next_charge_date
    '2024-04-15',                    -- created_on
    1,                               -- frequency_id
    1005,                            -- owner_id
    2,                               -- status_id
    3.9,                             -- interest_rate
    '2024-12-31',                    -- withdrawal_date
    0,                               -- default_plan
    3,                               -- plan_type_id
    30000.00,                        -- goal
    0,                               -- locked
    '2024-08-10',                    -- next_returns_date
    '2024-07-10',                    -- last_returns_date
    150.00,                          -- cowry_amount
    NULL,                            -- debit_card
    0,                               -- is_archived
    0,                               -- is_deleted
    0,                               -- is_goal_achieved
    1,                               -- is_a_goal
    1,                               -- is_interest_free
    10,                              -- plan_group_id
    0,                               -- is_deleted_from_group
    0,                               -- is_a_fund
    NULL,                            -- purchased_fund_id
    0,                               -- is_a_wallet
    0,                               -- currency_is_dollars
    0,                               -- is_auto_rollover
    1,                               -- is_vendor_plan
    'API',                           -- plan_source
    0,                               -- is_donation_plan
    NULL,                            -- donation_description
    NULL,                            -- donation_expiry_date
    NULL,                            -- donation_link
    NULL,                            -- link_code
    1,                               -- charge_payment_fee
    0,                               -- donation_is_approved
    0,                               -- is_emergency_plan
    0,                               -- is_personal_challenge
    1,                               -- currency_id
    1,                               -- is_a_usd_index
    101,                             -- usd_index_id
    0,                               -- open_savings_plan
    0,                               -- new_cycle
    NULL,                            -- recurrence
    1,                               -- is_bloom_note
    1,                               -- is_managed_portfolio
    2001,                            -- portfolio_holdings_id
    0,                               -- is_fixed_investment
    0,                               -- is_regular_savings
    NULL                             -- preset_id
),
-- Fifth row - 53 values
(
    1006,                            -- id
    'Emily Davis',                   -- name
    'Vacation savings',              -- description
    10000.00,                        -- amount
    '2024-05-01',                    -- start_date
    '2024-06-01',                    -- last_charge_date
    '2024-07-01',                    -- next_charge_date
    '2024-05-05',                    -- created_on
    3,                               -- frequency_id
    1006,                            -- owner_id
    1,                               -- status_id
    2.5,                             -- interest_rate
    NULL,                            -- withdrawal_date
    1,                               -- default_plan
    1,                               -- plan_type_id
    15000.00,                        -- goal
    0,                               -- locked
    '2024-09-01',                    -- next_returns_date
    '2024-08-01',                    -- last_returns_date
    75.00,                           -- cowry_amount
    NULL,                            -- debit_card
    0,                               -- is_archived
    0,                               -- is_deleted
    0,                               -- is_goal_achieved
    1,                               -- is_a_goal
    0,                               -- is_interest_free
    NULL,                            -- plan_group_id
    0,                               -- is_deleted_from_group
    0,                               -- is_a_fund
    500,                             -- purchased_fund_id
    0,                               -- is_a_wallet
    1,                               -- currency_is_dollars
    0,                               -- is_auto_rollover
    0,                               -- is_vendor_plan
    'Web',                           -- plan_source
    1,                               -- is_donation_plan
    'School building fund',          -- donation_description
    '2025-06-30',                    -- donation_expiry_date
    'https://example.com/donate',     -- donation_link
    'SCHOOL123',                     -- link_code
    0,                               -- charge_payment_fee
    1,                               -- donation_is_approved
    0,                               -- is_emergency_plan
    0,                               -- is_personal_challenge
    1,                               -- currency_id
    0,                               -- is_a_usd_index
    NULL,                            -- usd_index_id
    0,                               -- open_savings_plan
    0,                               -- new_cycle
    NULL,                            -- recurrence
    0,                               -- is_bloom_note
    0,                               -- is_managed_portfolio
    NULL,                            -- portfolio_holdings_id
    0,                               -- is_fixed_investment
    1,                               -- is_regular_savings
    10                               -- preset_id
);

SELECT * FROM dbo.plans_plan;

ASSESSMENT QUESTION 1
WITH customer_products AS (
    SELECT 
        p.owner_id,
        MAX(p.name) AS customer_name,
        SUM(CASE WHEN p.is_regular_savings = 1 THEN p.amount ELSE 0 END) AS savings_amount,
        SUM(CASE WHEN p.is_fixed_investment = 1 OR p.is_a_fund = 1 OR p.portfolio_holdings_id IS NOT NULL 
                THEN p.amount ELSE 0 END) AS investment_amount,
        COUNT(CASE WHEN p.is_regular_savings = 1 THEN 1 END) AS savings_count,
        COUNT(CASE WHEN p.is_fixed_investment = 1 OR p.is_a_fund = 1 OR p.portfolio_holdings_id IS NOT NULL 
                  THEN 1 END) AS investment_count,
        SUM(p.amount) AS total_deposits
    FROM dbo.plans_plan p
    WHERE p.is_deleted = 0 
      AND p.is_archived = 0
      AND p.status_id = 1
    GROUP BY p.owner_id
)
SELECT 
    cp.owner_id AS customer_id,
    cp.customer_name,
    cp.savings_count,
    cp.savings_amount,
    cp.investment_count,
    cp.investment_amount,
    cp.total_deposits
FROM customer_products cp
WHERE cp.savings_count >= 1 
  AND cp.investment_count >= 1
ORDER BY cp.total_deposits DESC;

ASSESSMENT QUESTION 2
WITH customer_transactions AS (
    SELECT 
        owner_id AS customer_id,
        MAX(name) AS customer_name,
        -- Calculate transactions per month
        CASE 
            WHEN DATEDIFF(MONTH, MIN(start_date), MAX(last_charge_date)) > 0
            THEN COUNT(*) * 1.0 / DATEDIFF(MONTH, MIN(start_date), MAX(last_charge_date))
            ELSE 0 
        END AS transactions_per_month
    FROM dbo.plans_plan
    WHERE is_deleted = 0
      AND is_archived = 0
      AND status_id = 1
      AND last_charge_date IS NOT NULL
    GROUP BY owner_id
),
frequency_categories AS (
    SELECT 
        customer_id,
        customer_name,
        transactions_per_month,
        CASE 
            WHEN transactions_per_month >= 10 THEN 'High Frequency'
            WHEN transactions_per_month >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM customer_transactions
)
SELECT 
    frequency_category,
    COUNT(customer_id) AS customer_count,
    ROUND(AVG(transactions_per_month), 1) AS avg_transactions_per_month
FROM frequency_categories
GROUP BY frequency_category
ORDER BY 
    CASE frequency_category
        WHEN 'High Frequency' THEN 1
        WHEN 'Medium Frequency' THEN 2
        ELSE 3
    END;

	WITH customer_transactions AS (
    SELECT 
        owner_id,
        MAX(name) AS customer_name,
        COUNT(*) AS total_plans,
        -- Calculate approximate transactions per month
        CASE 
            WHEN DATEDIFF(MONTH, MIN(start_date), MAX(last_charge_date)) > 0
            THEN COUNT(*) * 1.0 / DATEDIFF(MONTH, MIN(start_date), MAX(last_charge_date))
            ELSE 0 
        END AS transactions_per_month
    FROM dbo.plans_plan
    WHERE is_deleted = 0
      AND is_archived = 0
      AND status_id = 1  -- Active plans only
      AND last_charge_date IS NOT NULL
    GROUP BY owner_id
)
SELECT 
    owner_id AS customer_id,
    customer_name,
    total_plans,
    ROUND(transactions_per_month, 2) AS monthly_transaction_rate,
    CASE 
        WHEN transactions_per_month >= 10 THEN 'High Frequency'
        WHEN transactions_per_month >= 3 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category
FROM customer_transactions
ORDER BY transactions_per_month DESC;

ASSESSMENT QUESTION 3
-- Account Inactivity Alert
SELECT 
    p.id AS plan_id,
    p.owner_id AS customer_id,
    p.name AS account_name,
    p.description AS account_type,
    p.amount AS current_balance,
    p.last_charge_date AS last_transaction_date,
    DATEDIFF(DAY, p.last_charge_date, GETDATE()) AS days_inactive,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings Account'
        WHEN p.is_a_fund = 1 OR p.portfolio_holdings_id IS NOT NULL THEN 'Investment Account'
        ELSE 'Other Account'
    END AS account_category
FROM 
    dbo.plans_plan p
WHERE 
    -- Active accounts only
    p.is_deleted = 0 
    AND p.is_archived = 0
    AND p.status_id = 1
    
    -- Either savings or investment accounts
    AND (p.is_regular_savings = 1 OR p.is_a_fund = 1 OR p.portfolio_holdings_id IS NOT NULL)
    
    -- No transactions in the last 365 days
    AND (p.last_charge_date IS NULL OR p.last_charge_date < DATEADD(YEAR, -1, GETDATE()))
    
    -- Ensure account was created more than 1 year ago (to exclude new accounts)
    AND p.created_on < DATEADD(YEAR, -1, GETDATE())
ORDER BY 
    days_inactive DESC;

	ASSESSMENT QUESTION 4
	WITH customer_activity AS (
    SELECT 
        owner_id AS customer_id,
        MAX(name) AS customer_name,
        MIN(created_on) AS signup_date,
        COUNT(*) AS total_plans,
        -- Estimate transactions based on charge frequency
        SUM(
            CASE 
                WHEN last_charge_date IS NOT NULL AND created_on IS NOT NULL
                THEN DATEDIFF(MONTH, created_on, last_charge_date) + 1
                ELSE 0
            END
        ) AS estimated_total_transactions,
        AVG(amount) AS avg_plan_amount
    FROM dbo.plans_plan
    WHERE is_deleted = 0
      AND is_archived = 0
      AND status_id = 1  -- Active accounts only
    GROUP BY owner_id
)
SELECT 
    customer_id,
    customer_name,
    DATEDIFF(MONTH, signup_date, GETDATE()) AS account_tenure_months,
    estimated_total_transactions,
    avg_plan_amount,
    -- CLV calculation: (transactions/tenure) * 12 * (0.1% of avg amount)
    (estimated_total_transactions * 1.0 / NULLIF(DATEDIFF(MONTH, signup_date, GETDATE()), 1)) * 12 * (avg_plan_amount * 0.001) AS estimated_clv
FROM customer_activity
WHERE DATEDIFF(MONTH, signup_date, GETDATE()) > 0  -- Exclude customers who signed up this month
ORDER BY estimated_clv DESC;


















