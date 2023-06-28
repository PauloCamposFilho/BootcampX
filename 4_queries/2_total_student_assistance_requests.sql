SELECT
   count(*) as total_assistances
  ,students.name
FROM
  assistance_requests
  INNER JOIN students ON students.id = assistance_requests.student_id
WHERE
  students.id = 4
GROUP BY
  students.name