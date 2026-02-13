## Final_SQL_Query.sql (How to Use)

This file contains the full SQL script used for the skin cancer lesion analysis, including:
- Dataset inspection (optional)
- Diagnosis distribution summary
- Demographic factors summary
- Lifestyle factors summary
- Environmental and infrastructure factors summary

### How to run
1. Open `Final_SQL_Query.sql` in pgAdmin (or any PostgreSQL client).
2. Ensure the database is connected and the required tables are available.
3. Run the script **top to bottom** (statements are separated with semicolons).
4. Export or screenshot key outputs for reporting (see the `images/` folder for examples).

### Notes
- Outputs are descriptive summaries generated using `JOIN`, `GROUP BY`, and `COUNT(*)`.
- Results should be interpreted as dataset distributions, not clinical conclusions.
