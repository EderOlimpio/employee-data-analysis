-- Calculate tenure (in years) and performance

SELECT
  e.Gender,
  e.Nationality,
  e.Age,
  ROUND(EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.HireDate)) +
        EXTRACT(MONTH FROM AGE(CURRENT_DATE, e.HireDate))/12, 2) AS TenureYears,
  e.PerformanceRating
FROM employees e;

-- Performance rating per year of tenure (grouped)

SELECT
  e.Gender,
  e.Nationality,
  -- Optional: Uncomment for AgeGroup segmentation. Add 'AgeGroup' to GROUP BY if used.
  -- CASE
  --   WHEN e.Age < 25 THEN 'Under 25'
  --   WHEN e.Age BETWEEN 25 AND 34 THEN '25-34'
  --   WHEN e.Age BETWEEN 35 AND 44 THEN '35-44'
  --   WHEN e.Age BETWEEN 45 AND 54 THEN '45-54'
  --   ELSE '55+'
  -- END AS AgeGroup,
  ROUND(AVG(
      CASE
          WHEN tenure_data.tenure = 0 THEN NULL -- Prevents division by zero
          ELSE e.PerformanceRating / tenure_data.tenure
      END
  ), 2) AS AvgPerformancePerYear
FROM employees e
JOIN (
  SELECT
    EmployeeID,
    ROUND(EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate)) + EXTRACT(MONTH FROM AGE(CURRENT_DATE, HireDate))/12, 2) AS tenure
  FROM employees
) AS tenure_data ON e.EmployeeID = tenure_data.EmployeeID
GROUP BY e.Gender, e.Nationality
ORDER BY AvgPerformancePerYear DESC;