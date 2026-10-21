
-- Question: Which acquisition sources are associated with the most purchases?

SELECT
  traffic_source.source AS source,

  COUNT(*) AS purchase_events,

  COUNT(DISTINCT user_pseudo_id) AS purchasing_users

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

WHERE
  event_name = 'purchase'

GROUP BY
  source

ORDER BY
  purchase_events DESC;
