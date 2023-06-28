SELECT DISTINCT
   teachers.name as teacher
  ,cohorts.name as cohort
FROM
  assistance_requests
  INNER JOIN teachers on teachers.id = assistance_requests.teacher_id
  INNER JOIN students on students.id = assistance_requests.student_id
  INNER JOIN cohorts on cohorts.id = students.cohort_id
WHERE
  cohorts.name = 'JUL02'
ORDER BY
  teachers.name;