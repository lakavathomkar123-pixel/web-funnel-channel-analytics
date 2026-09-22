-- Query 1: Event counts
SELECT event_name, COUNT(*) AS event_count
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY event_name
ORDER BY event_count DESC;

-- Query 2: Conversion funnel (distinct users per stage)
SELECT
  COUNT(DISTINCT CASE WHEN event_name='session_start' THEN user_pseudo_id END) AS session_start,
  COUNT(DISTINCT CASE WHEN event_name='view_item' THEN user_pseudo_id END) AS view_item,
  COUNT(DISTINCT CASE WHEN event_name='add_to_cart' THEN user_pseudo_id END) AS add_to_cart,
  COUNT(DISTINCT CASE WHEN event_name='begin_checkout' THEN user_pseudo_id END) AS begin_checkout,
  COUNT(DISTINCT CASE WHEN event_name='purchase' THEN user_pseudo_id END) AS purchase
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;

-- Query 3: Channel-wise sessions and purchases
SELECT traffic_source.medium AS channel,
  COUNT(DISTINCT CASE WHEN event_name='session_start' THEN user_pseudo_id END) AS sessions,
  COUNT(DISTINCT CASE WHEN event_name='purchase' THEN user_pseudo_id END) AS purchases
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY channel
ORDER BY sessions DESC;

-- Query 4: Device category breakdown
SELECT device.category AS device_category,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNT(DISTINCT CASE WHEN event_name='purchase' THEN user_pseudo_id END) AS purchasers
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY device_category
ORDER BY users DESC;

-- Query 5: Top 10 countries by users
SELECT geo.country AS country, COUNT(DISTINCT user_pseudo_id) AS users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY country
ORDER BY users DESC
LIMIT 10;

-- Query 6: Top products by purchase quantity
SELECT item.item_name AS product_name,
  COUNT(*) AS purchase_events,
  SUM(item.quantity) AS total_quantity
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item
WHERE event_name = 'purchase'
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10;
