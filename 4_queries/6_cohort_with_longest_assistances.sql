SELECT
   cohorts.name
  ,AVG(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
FROM
  assistance_requests
  INNER JOIN students on students.id = assistance_requests.student_id
  INNER JOIN cohorts on cohorts.id = students.cohort_id
GROUP BY
  cohorts.id
ORDER BY
  average_assistance_time desc
LIMIT 1;