WITH months AS (
SELECT
*
FROM
UNNEST(GENERATE_DATE_ARRAY('2025-01-01', '2025-12-01', INTERVAL 1 MONTH)) as month
),
monthly_total AS (
  SELECT
    m.month,
    COUNT(DISTINCT participant_id) as total_participants
  FROM `bigquery-project-494619.EMBER.sign_ins` s
  JOIN months m 
    ON s.timestamp >= m.month
    AND s.timestamp < m.month + INTERVAL 1 MONTH
  GROUP BY m.month
),
min_month AS (
SELECT
  participant_id,
  MIN(timestamp) as first_class
FROM `bigquery-project-494619.EMBER.sign_ins`
GROUP BY participant_id
),
ftp AS (
SELECT
  m.month,
  COUNT(*) as first_time_participants
FROM min_month a
JOIN months m
  ON a.first_class >= m.month
  AND a.first_class < m.month + INTERVAL 1 MONTH
  GROUP BY m.month
  ORDER BY m.month
)
SELECT
  mt.month,
  mt.total_participants,
  f.first_time_participants AS first_time_participants,
  mt.total_participants - f.first_time_participants as returning_participants,
  ROUND((f.first_time_participants / mt.total_participants)*100,2) as percent_first_timers,
  ROUND(((mt.total_participants - f.first_time_participants) / mt.total_participants)*100,2) as percent_returners
FROM monthly_total mt
LEFT JOIN ftp f
  ON mt.month = f.month
ORDER BY mt.month
