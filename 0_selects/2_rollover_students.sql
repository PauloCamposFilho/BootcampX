SELECT
   students.name as "student name"
  ,cohorts.name as "cohort name"
  ,cohorts.start_date as "cohort start_date"
  ,students.start_date as "student start_date"
FROM
  students
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE
  students.start_date != cohorts.start_date
ORDER BY
  cohorts.start_date;