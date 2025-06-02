-- Demographics of employees who completed onboarding online

SELECT
  e.Gender,
  e.Nationality,
  CASE
    WHEN e.Age < 25 THEN 'Under 25'
    WHEN e.Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN e.Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN e.Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS AgeGroup,
  COUNT(*) AS OnlineOnboardingCount
FROM onboarding o
JOIN employees e ON o.EmployeeID = e.EmployeeID
WHERE o.IsOnlineOnboarding = TRUE
GROUP BY e.Gender, e.Nationality, AgeGroup -- Group by the created AgeGroup alias
ORDER BY OnlineOnboardingCount DESC;


-- Trends in onboarding by day of the week.

SELECT
  TO_CHAR(OnboardingDate, 'Day') AS WeekdayName,
  -- EXTRACT(DOW FROM OnboardingDate) is for PostgreSQL/Redshift (Sunday=0, Monday=1, etc.)
  -- For SQL Server, use: DATEPART(weekday, OnboardingDate)
  -- For MySQL, use: DAYOFWEEK(OnboardingDate) (Sunday=1, Monday=2, etc.)
  -- Choose the appropriate function for your database system.
  EXTRACT(DOW FROM OnboardingDate) AS WeekdayNum,
  COUNT(*) AS OnboardingCount
FROM onboarding
GROUP BY WeekdayName, WeekdayNum
ORDER BY WeekdayNum, OnboardingCount DESC; -- Order by WeekdayNum to ensure chronological order (Mon-Sun), then by count