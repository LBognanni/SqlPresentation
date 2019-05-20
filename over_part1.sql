DECLARE @EXPENSES TABLE (EXPENSEDAY INT, REASON VARCHAR(100), AMOUNT DECIMAL(12,2))
INSERT INTO @EXPENSES (EXPENSEDAY, REASON, AMOUNT)
VALUES
(1, 'Groceries', 10),
(1, 'Restaurants', 20),
(1, 'Gym', 10),
(2, 'Groceries', 20),
(2, 'Travel', 15),
(2, 'Drinks', 8),
(3, 'Restaurants', 40),
(3, 'Travel', 30)

-- cool new way :)
SELECT EXPENSEDAY, REASON, AMOUNT, SUM(AMOUNT) OVER (PARTITION BY EXPENSEDAY) AS DAY_TOTAL
FROM @EXPENSES

-- old way :(
SELECT E1.EXPENSEDAY, E1.REASON, E1.AMOUNT, DAY_TOTAL
FROM @EXPENSES E1
INNER JOIN (
	SELECT EXPENSEDAY, SUM(AMOUNT) AS DAY_TOTAL
	FROM @EXPENSES
	GROUP BY EXPENSEDAY
) E2 ON E1.EXPENSEDAY=E2.EXPENSEDAY