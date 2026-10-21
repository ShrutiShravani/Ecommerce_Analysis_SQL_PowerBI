-- How does e-commerce performance differ by device?

SELECT
  device.category AS device_category,
  COUNT(DISTINCT user_pseudo_id) AS unique_users,
  COUNTIF(event_name = 'purchase') AS purchase_events,
  COUNT(DISTINCT IF(event_name = 'purchase', user_pseudo_id, NULL))
    AS purchasing_users,
  ROUND(SUM(
    IF(
      event_name = 'purchase',
      ecommerce.purchase_revenue_in_usd,
      0
    )
  ), 2) AS purchase_revenue_usd

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

GROUP BY
  device_category

ORDER BY
  purchase_revenue_usd DESC;
