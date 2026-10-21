
-- Check missing key fields in the raw event data

SELECT
  COUNT(*) AS total_rows,

  COUNTIF(user_pseudo_id IS NULL)
    AS rows_missing_user_id,

  COUNTIF(event_date IS NULL OR event_date = '')
    AS rows_missing_event_date,

  COUNTIF(event_name IS NULL OR event_name = '')
    AS rows_missing_event_name

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;
