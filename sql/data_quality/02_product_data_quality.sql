
SELECT
  COUNT(*) AS total_item_rows,
  COUNTIF(item.item_name IS NULL) AS null_product_names,
  COUNTIF(TRIM(item.item_name) = '') AS blank_product_names,
  COUNTIF(LOWER(TRIM(item.item_name)) = '(not set)')
    AS not_set_product_names,
  COUNTIF(item.price IS NULL) AS missing_prices,
  COUNTIF(item.quantity IS NULL) AS missing_quantities,
  COUNTIF(item.price < 0) AS negative_prices,
  COUNTIF(item.quantity <= 0) AS non_positive_quantities
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item;
