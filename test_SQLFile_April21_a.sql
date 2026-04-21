-- View first 25 rows of data
SELECT *
FROM alabamaData_NO2
LIMIT 25;

-- Count rows + distinct sites/counties/CBSAs
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT "Local Site Name") AS unique_sites,
  COUNT(DISTINCT "County") AS unique_counties,
  COUNT(DISTINCT "CBSA Name") AS unique_cbsas
FROM alabamaData_NO2;

-- Which monitoring sites have the most daily records?
SELECT
  "Local Site Name",
  "County",
  COUNT(*) AS n_days
FROM alabamaData_NO2
GROUP BY "Local Site Name", "County"
ORDER BY n_days DESC;

-- Average daily Max NO2
SELECT
  AVG("Daily Max 1-hour NO2 Concentration") AS Avg_NO2_DailyMax
FROM alabamaData_NO2
WHERE "Daily Max 1-hour NO2 Concentration" >= 12;

-- Create a list of high NO₂ days
SELECT
  "Date",
  "County",
  "Local Site Name",
  "Daily Max 1-hour NO2 Concentration" AS NO2_DailyMax
FROM alabamaData_NO2
WHERE "Daily Max 1-hour NO2 Concentration" >= 12
ORDER BY NO2_DailyMax DESC;

-- Summary stats for NO₂ and AQI (whole dataset)
SELECT
  AVG("Daily Max 1-hour NO2 Concentration") AS avg_NO2,
  MIN("Daily Max 1-hour NO2 Concentration") AS min_NO2,
  MAX("Daily Max 1-hour NO2 Concentration") AS max_NO2,
  AVG("Daily AQI Value") AS avg_aqi,
  MIN("Daily AQI Value") AS min_aqi,
  MAX("Daily AQI Value") AS max_aqi
FROM alabamaData_NO2;


-- County-level NO₂ burden (ranked)
SELECT
  "County",
  AVG("Daily Max 1-hour NO2 Concentration") AS avg_NO2,
  MAX("Daily Max 1-hour NO2 Concentration") AS max_NO2,
  COUNT(*) AS n_records
FROM alabamaData_NO2
GROUP BY "County"
ORDER BY avg_NO2 DESC;


--View all CBSAs in the dataset
SELECT DISTINCT "CBSA Name"
FROM alabamaData_NO2
ORDER BY "CBSA Name";


--Count how many records each CBSA has
SELECT
  "CBSA Name",
  COUNT(*) AS record_count
FROM alabamaData_NO2
GROUP BY "CBSA Name"
ORDER BY record_count DESC;


--Count how many monitoring sites are in each CBSA
SELECT
  "CBSA Name",
  COUNT(DISTINCT "Local Site Name") AS site_count
FROM alabamaData_NO2
GROUP BY "CBSA Name"
ORDER BY site_count DESC;

















