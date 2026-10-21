--most purchased product
SELECT
  item.item_name AS product_name,
  COUNT(*) AS purchase_item_count,
  COUNT(DISTINCT user_pseudo_id) AS unique_users

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item

WHERE
  event_name = 'purchase'
  AND item.item_name IS NOT NULL
  AND TRIM(item.item_name) != ''
  AND LOWER(TRIM(item.item_name)) != '(not set)'

GROUP BY
  product_name

ORDER BY
  purchase_item_count DESC

LIMIT 10;