USE uzo
SELECT * FROM Heart_Disease_Prediction

--Q1. What is the avg. age of patients that have more chance of heart attack and those that do not?
SELECT target,
AVG(age) AS Average_age
FROM Heart_Disease_Prediction
GROUP BY target;

--Q2. What is the avg, trestbps for patients with more chance of heart attack?
SELECT AVG(trestbps) AS Average_trestbps
FROM Heart_Disease_Prediction
WHERE target = 1;

--Q3. Write a query that retrieves the number of patients with more chance of HA for each age.
SELECT age, COUNT(*) AS Numofpatients
FROM Heart_Disease_Prediction
WHERE target = 1
GROUP BY age
ORDER BY age;

--Q4. What is the most common type of chest pain (cp) among patients with more chance of heart attack?

SELECT TOP 1 cp, COUNT(*) AS most_common_cp
FROM Heart_Disease_Prediction
WHERE target = 1 
GROUP BY cp 
ORDER BY most_common_cp DESC;

--Q5. What is the correlation between cholesterol levels (chol) and the likelihood of heart attack?

SELECT chol, COUNT(*) AS count, 
       SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS heart_attack_count,
       (SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) * 1 / COUNT(*)) AS heart_attack_ratio
FROM Heart_Disease_Prediction
GROUP BY chol
ORDER BY chol;

--Q6. What is the distribution of resting electrocardiographic results (restecg) among patients with more chance of heart attack?

SELECT restecg, COUNT(*) AS heart_attack
FROM Heart_Disease_Prediction
WHERE target = 1
GROUP BY restecg;


