
SELECT
  COUNT(*) AS purchase_events,
  COUNTIF(ecommerce.purchase_revenue_in_usd IS NULL)
    AS missing_purchase_revenue,
  COUNTIF(ecommerce.purchase_revenue_in_usd < 0)
    AS negative_purchase_revenue,
  COUNTIF(ARRAY_LENGTH(items) = 0 OR items IS NULL)
    AS purchases_without_items
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  event_name = 'purchase';
