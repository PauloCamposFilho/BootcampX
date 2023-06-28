SELECT
   count(*)
  ,teachers.name
FROM
  assistance_requests
  INNER JOIN teachers on teachers.id = assistance_requests.teacher_id
WHERE
  assistance_requests.teacher_id = 4
GROUP BY
  teachers.name;