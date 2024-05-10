SELECT 
	country ,
    sum(amount) AS Total_Compres
FROM company
JOIN transaction ON company.id = transaction.company_id
WHERE declined = 0
GROUP BY country
ORDER BY total_compres DESC;

SELECT count(DISTINCT(country)) AS Countries
FROM company
RIGHT JOIN transaction ON company.id = transaction.company_id
WHERE declined = 0;


SELECT 
	company_name, 
    round(avg(amount),2) AS AVG
FROM transaction
JOIN company ON transaction.company_id = company.id 
WHERE declined = 0
GROUP BY company_name
ORDER BY avg(amount) DESC
LIMIT 1;

SELECT *
FROM transaction
WHERE company_id IN (
						SELECT id
						FROM company
						WHERE country = "Germany"
);


SELECT company_name
FROM company
WHERE id IN (
				SELECT company_id
				FROM transaction
				WHERE amount > (
								SELECT AVG(amount)
								FROM transaction
													)
);



SELECT *
FROM company
WHERE id NOT IN (
					SELECT DISTINCT company_id
					FROM transaction
										);
;	

SELECT
    DATE(timestamp) AS Data,
    SUM(amount) AS Total
FROM transaction
WHERE declined = 0
GROUP BY data
ORDER BY total DESC
LIMIT 5;


SELECT 
	country , 
    ROUND(avg(amount) , 2) AS avg
FROM company
JOIN transaction ON company.id = transaction.company_id
WHERE declined = 0
GROUP BY country
ORDER BY avg DESC;


SELECT 
	company_name as Company,
    amount
FROM company
JOIN transaction ON company.id = transaction.company_id
WHERE country IN (
					SELECT country
					FROM company
					WHERE company_name = "Non Institute"
														)
ORDER BY company_name ASC;




SELECT amount
FROM transaction
WHERE company_id IN (
						SELECT id
						FROM company
						WHERE country IN (
											SELECT country
											FROM company
											WHERE company_name = "Non Institute"
																				)
)
ORDER BY amount ASC;


SELECT 
	amount ,
	DATE(timestamp) , 
    phone,
    country 
FROM company
JOIN transaction ON company.id = transaction.company_id
WHERE (amount BETWEEN 100 AND 200) 
AND DATE(timestamp) IN (
						'2021-04-29', '2021-07-20', '2022-03-13'
																)
ORDER BY amount DESC;


SELECT
	company_name AS Company,
	COUNT(transaction.id) AS Transaccions,
	IF(COUNT(transaction.id) > 4, 'Més de 4', 'Menor o igual a 4') AS Tipus
FROM transaction
LEFT JOIN company
ON transaction.company_id = company.id
GROUP BY company_name
ORDER BY Transaccions DESC;
		




