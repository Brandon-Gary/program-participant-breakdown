# First-Time vs Returning Program Participants

### Organizational Need
My organization offers a free-to-enroll program for community members in our area. The program provides resources and education during evening classes. During each class participants are asked to fill out an electronic sign-in form to track attendance. The same community member could attend (and therefore sign-in) to multiple classes, and often more than one class was held in a month. The team offering the classes was interested in finding out how many new participants vs returning participants were attending throughout the year, and how this compared to the overall participation totals month by month.

### Input Data
A sample of the sign in data is included in this repository in the `sample_sign_in_data.csv` file. The sample data provided is fake to protect the confidentiality of program participants, but the overall format is the same.

### Process
The sign-in data was queried to aggregate and obtain the necessary statistics. The result of the query was imported in Power BI for dashboard development which would ultimately be shared with the team.
#### SQL Methodology
1. Generated a monthly reporting calendar for the 2025 calendar year.
2. Calculated unique participant attendance totals for each month.
3. Identified the first recorded attendance date for every participant.
4. Classified participants as first-time or returning based on attendance history.
5. Calculated monthly retention and acquisition metrics.
6. Produced a reporting table for visualization in Power BI.

#### Power BI Methodology
1. Created specific measures for KPI cards at the top of the report.
2. Created line & clustered column chart as well as 100% stacked column chart to visualize participant classification over time.
3. Documented "Key Findings" with interprations that stood out.
4. Added full monthly data table on a second page for completeness.

### Outcome
