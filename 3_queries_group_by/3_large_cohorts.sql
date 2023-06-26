SELECT
   cohorts.name
  ,count(students.*) as student_count
FROM
  students
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY
  cohorts.id
HAVING
  count(students.*) >= 18
ORDER BY
  cohorts.id;