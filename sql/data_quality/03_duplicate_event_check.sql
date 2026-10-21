
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) - COUNT(DISTINCT TO_JSON_STRING(t))
    AS exact_duplicate_rows
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` AS t;
