SELECT
  AVG(total_duration) as average_total_duration
FROM
  (
    SELECT
      sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
    FROM
      assistance_requests
      INNER JOIN students on students.id = assistance_requests.student_id
      INNER JOIN cohorts on cohorts.id = students.cohort_id
    GROUP BY
      cohorts.id
    ORDER BY
      total_duration
  ) as total_durations;