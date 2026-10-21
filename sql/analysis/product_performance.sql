-- most viewed product
SELECT
  items.item_name AS product_name,
  COUNT(*) AS product_views,
  COUNT(DISTINCT user_pseudo_id) AS unique_viewers

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
   UNNEST(items) AS items

WHERE
  event_name = 'view_item'
  AND items.item_name IS NOT NULL

GROUP BY
  product_name 


ORDER BY
  product_views DESC

