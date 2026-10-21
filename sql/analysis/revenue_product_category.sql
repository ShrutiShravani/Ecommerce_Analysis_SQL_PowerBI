

-- Which product categories generate the highest purchase revenue?

SELECT
  item.item_category AS product_category,
  ROUND(
    SUM(item.price * item.quantity),
    2
  ) AS item_revenue,
  SUM(item.quantity) AS units_purchased,
  COUNT(DISTINCT user_pseudo_id) AS purchasing_users

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item

WHERE
  event_name = 'purchase'
  AND item.item_category IS NOT NULL
  AND TRIM(item.item_category) != ''
  AND LOWER(TRIM(item.item_category)) != '(not set)'
  AND item.price IS NOT NULL
  AND item.quantity IS NOT NULL

GROUP BY
  product_category

ORDER BY
  item_revenue DESC

LIMIT 10;
