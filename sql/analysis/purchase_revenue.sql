

-- Which products generate the highest recorded purchase revenue?

SELECT
  item.item_name AS product_name,
  ROUND(
    SUM(item.price * item.quantity),
    2
  ) AS item_revenue_usd,
  SUM(item.quantity) AS units_purchased

FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item

WHERE
  event_name = 'purchase'
  AND item.item_name IS NOT NULL
  AND TRIM(item.item_name) != ''
  AND LOWER(TRIM(item.item_name)) != '(not set)'
  AND item.price IS NOT NULL
  AND item.quantity IS NOT NULL

GROUP BY
  product_name

ORDER BY
  item_revenue_usd DESC

LIMIT 10;
