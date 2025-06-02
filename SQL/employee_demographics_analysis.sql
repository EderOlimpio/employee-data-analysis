SELECT
  CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS AgeGroup,
  Gender,
  Nationality,
  EmploymentType,
  COUNT(*) AS EmployeeCount
FROM employees
GROUP BY AgeGroup, Gender, Nationality, EmploymentType
ORDER BY AgeGroup, EmploymentType, EmployeeCount DESC;