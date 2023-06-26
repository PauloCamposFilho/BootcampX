SELECT
  sum(assignment_submissions.duration)
FROM
  students
  INNER JOIN assignment_submissions ON assignment_submissions.student_id = students.id
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE
  cohorts.id = 1;