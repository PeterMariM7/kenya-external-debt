# Kenya External Debt Analysis (2010–2024)

This project analyzes Kenya's external debt from 2010 to 2024 using data from the World Bank API. It extracts, transforms, and loads (ETL) the data into a PostgreSQL database. A Grafana dashboard provides two visual panels: one for total debt trend and another for year-over-year change.

---

## Repository Contents

- `kenyadebt.ipynb`: Python script to extract, transform, and load data
- `requirements.txt`: Python libraries required to run the script
- `grafana-screenshots/`: Two PNGs showing Grafana dashboards
- `schema.sql`: SQL used to set up the target PostgreSQL table (optional)

---

## How to Run

1. Clone this repository:
```bash
git clone https://github.com/PeterMariM7/kenya-external-debt.git
cd kenya-external-debt

## install dependencies
pip install -r requirements.txt



##open grafana to show the analysis
SELECT 
  TO_DATE(year || '-01-01', 'YYYY-MM-DD') AS time,
  debt / 1000000 AS debt_million_usd
FROM "Kenya_Debt".kenya_external_debt
WHERE debt IS NOT NULL
ORDER BY time;

## for the line chart
SELECT 
  TO_DATE(year || '-01-01', 'YYYY-MM-DD') AS time,
  (debt - LAG(debt) OVER (ORDER BY year)) / 1000000 AS yoy_change_million_usd
FROM "Kenya_Debt".kenya_external_debt
WHERE debt IS NOT NULL
ORDER BY time;

#### reflection


This analysis revealed a consistent and notable rise in Kenya’s external debt from 2010 through 2023, with data for 2024 not yet available. Visualizing the year-to-year shifts highlighted major borrowing spikes, which may relate to infrastructure projects or economic recovery efforts.

A key technical hurdle was configuring Grafana to correctly connect with the Aiven-hosted PostgreSQL database, which required handling a custom port and schema. Dealing with missing values and formatting the time-series data also demanded careful attention.

Overall, this project strengthened my understanding of full-stack data workflows powered by APIs—from extraction and transformation, to storage and visualization. It also boosted my skills with tools like wbgapi, PostgreSQL, and Grafana.