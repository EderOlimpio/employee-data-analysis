# People Analytics Dashboard (Mews)

## Project Overview
This project involves the creation of a comprehensive People Analytics Dashboard using Tableau, designed for People Business Partners at Mews. The dashboard provides insights into employee demographics, onboarding processes, tenure, and performance trends.

## Data Sources
- `Employee_data_corrected.csv`: Contains core employee demographic and performance data.
- `Onboarding_data_cleaned.csv`: Contains details related to employee onboarding.

## SQL Analyses
Ad-hoc SQL queries and data preparation scripts are stored in the `SQL/` folder. These queries represent the foundational data extraction and transformation logic behind the dashboard's insights.

- [Employee Demographics Analysis](SQL/employee_demographics_analysis.sql): Queries to understand employment type distribution across age, gender, and nationality segments.
- [Online Onboarding Analysis](SQL/online_onboarding_analysis.sql): SQL for demographics of online onboarders and trends by weekday.
- [Average Tenure and Performance Analysis](SQL/tenure_performance_analysis.sql): Calculations for employee tenure and average performance metrics per segment.

## Key Metrics & Sections
The dashboard is structured into the following key areas:
- **Global Filters:** Interactive filters for `Age Group`, `Onboarding Weekday`, `Department`, `EmploymentType`, `Gender`, and `Nationality`.
- **Key Metrics:**
    - Total Employees: `COUNTD([EmployeeID])`
    - Avg. Company Tenure: `AVG([Tenure (Years)])`
    - % Online Onboarding: `SUM(IF [IsOnlineOnboarding] THEN 1 ELSE 0 END) / COUNTD([EmployeeID])`
- **Main Content Area:**
    - **Demographics Section:** Worksheets covering distribution by age group, gender, and nationality.
    - **Onboarding Section:** Worksheets analyzing online onboarding demographics by age and gender, and onboarding by weekday.
    - **Tenure & Performance Section:** Worksheets on average tenure/performance by segment, and top/bottom performance segments.

## Interactivity
- **Filter Actions:** Most charts are configured with "Use as Filter" to allow cross-filtering across the dashboard.
- **Parameter Action:** The `Select Segment` parameter allows dynamic segmentation of tenure and performance data.

## Tableau Dashboard Link
https://public.tableau.com/views/working_17487118610600/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## How to Use the Dashboard
1.  **Global Filters:** Utilize the filters at the top (Age Group, Department, Gender, etc.) to refine your analysis across all relevant charts.
2.  **Interactive Charts:** Click on bars or segments within the Demographics and Onboarding charts to cross-filter the rest of the dashboard for deeper dives into specific groups.
3.  **Dynamic Segments:** Use the "Select Segment" dropdown near the Tenure & Performance charts to switch the view between Age Group, Gender, or Nationality for tenure and performance insights.
4.  **Tooltips:** Hover over any data point on a chart to view detailed information in the tooltips.

## Design & Formatting Notes
- **Layout:** Structured using nested containers (Horizontal and Vertical) for neat alignment and optimized chart sizing.
- **Tooltips & Labels:** Customized for detailed information and readability.

## Setup Instructions (for someone else to open the project)
1.  Clone this repository: `git clone [repository_url]`
2.  Open the `.twbx` file in Tableau Desktop.

