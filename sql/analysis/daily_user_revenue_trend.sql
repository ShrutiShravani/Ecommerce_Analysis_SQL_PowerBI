-- How do daily purchases and revenue change over time?

SELECT
  PARSE_DATE('%Y%m%d', event_date) AS purchase_date,
  COUNT(*) AS purchase_events,
  COUNT(DISTINCT user_pseudo_id) AS purchasing_users,
  ROUND(SUM(ecommerce.purchase_revenue_in_usd), 2)
    AS purchase_revenue_usd

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

WHERE
  event_name = 'purchase'

GROUP BY
  purchase_date

ORDER BY
  purchase_date;