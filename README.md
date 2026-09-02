# Astrafy take home challenge

**Staging**: cleans and standardizes the raw Orders and Sales tables.

**Intermediate**: combines order and sales information and prepares customer order history required for segmentation.

**Marts**: contains business-ready tables used for analysis and BI.

This separation keeps transformations modular and makes the models easier to test, maintain and reuse.

 ---
***Data availability note**: The provided dataset documentation states that Orders and Sales contain data from 2022 to 2023, while the exercises request results for 2025 and 2026. Therefore, the queries are parameterized for the requested years, but no 2025/2026 records are available in the provided dataset. I have not fabricated data to produce non-zero results.*
