SELECT
   cohorts.name
   ,count(assignment_submissions.*) as total_submissions
FROM
  students
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
  INNER JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY
  cohorts.id
ORDER BY
  total_submissions DESC;