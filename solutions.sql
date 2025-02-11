USE bank;
SHOW TABLES;
DESCRIBE client;

-- Query 1: Get the id values of the first 5 clients from district_id = 1
SELECT client_id  
FROM client  
WHERE district_id = 1  
ORDER BY client_id  
LIMIT 5;

-- Query 2: Get the last client_id where district_id = 72
SELECT client_id  
FROM client  
WHERE district_id = 72  
ORDER BY client_id DESC  
LIMIT 1;

-- Query 3: Get the 3 lowest amounts in the loan table
SELECT amount  
FROM loan  
ORDER BY amount ASC  
LIMIT 3;

-- Query 4: Possible values for status in the loan table (ordered alphabetically)
SELECT DISTINCT status  
FROM loan  
ORDER BY status ASC;

-- Query 5: Get the loan_id of the highest payment received
SELECT loan_id  
FROM loan  
ORDER BY payments DESC  
LIMIT 1;

-- Query 6: Get the loan amount of the lowest 5 account_ids
SELECT account_id, amount  
FROM loan  
ORDER BY account_id ASC  
LIMIT 5;

-- Query 7: Account IDs with the lowest loan amount and a loan duration of 60
SELECT account_id  
FROM loan  
WHERE duration = 60  
ORDER BY amount ASC  
LIMIT 5;

-- Query 8: Unique values of k_symbol in the `order` table
SELECT DISTINCT k_symbol  
FROM `order`;

-- Query 9: Order IDs of the client with account_id 34
SELECT order_id  
FROM `order`  
WHERE account_id = 34;

-- Query 10: Account IDs responsible for orders between order_id 29540 and 29560
SELECT DISTINCT account_id  
FROM `order`  
WHERE order_id BETWEEN 29540 AND 29560;

-- Query 11: Individual amounts sent to account_to = 30067122
SELECT amount  
FROM `order`  
WHERE account_to = 30067122;

-- Query 12: First 10 transactions from account_id 793 in chronological order (newest to oldest)
SELECT trans_id, date, type, amount  
FROM trans  
WHERE account_id = 793  
ORDER BY date DESC  
LIMIT 10;

-- Query 13: Count of clients for each district_id (lower than 10)
SELECT district_id, COUNT(client_id) AS client_count  
FROM client  
WHERE district_id < 10  
GROUP BY district_id  
ORDER BY district_id ASC;

-- Query 14: Number of cards per type, ranked by most frequent
SELECT type, COUNT(*) AS count  
FROM card  
GROUP BY type  
ORDER BY count DESC;

-- Query 15: Top 10 account_ids based on sum of loan amounts
SELECT account_id, SUM(amount) AS total_loan  
FROM loan  
GROUP BY account_id  
ORDER BY total_loan DESC  
LIMIT 10;

-- Query 16: Number of loans issued per day before 930907, ordered by date descending
SELECT date, COUNT(*) AS loan_count  
FROM loan  
WHERE date < 930907  
GROUP BY date  
ORDER BY date DESC;

-- Query 17: Loans issued per day in December 1997, grouped by loan duration
SELECT date, duration, COUNT(*) AS loan_count  
FROM loan  
WHERE date BETWEEN 971201 AND 971231  
GROUP BY date, duration  
ORDER BY date ASC, duration ASC;

-- Query 18: Sum of transaction amounts per type for account_id 396
SELECT account_id, type, SUM(amount) AS total_amount  
FROM trans  
WHERE account_id = 396  
GROUP BY type  
ORDER BY type ASC;



