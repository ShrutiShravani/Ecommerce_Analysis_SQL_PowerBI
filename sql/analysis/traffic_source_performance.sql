
-- Which first-acquisition sources are associated with the most purchases and revenue?

SELECT
  COALESCE(traffic_source.source, '(not set)') AS acquisition_source,

  COUNT(*) AS purchase_events,

  COUNT(DISTINCT user_pseudo_id) AS purchasing_users,

  ROUND(
    SUM(ecommerce.purchase_revenue_in_usd),
    2
  ) AS recorded_purchase_revenue_usd

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

WHERE
  event_name = 'purchase'

GROUP BY
  acquisition_source

ORDER BY
  recorded_purchase_revenue_usd DESC;
