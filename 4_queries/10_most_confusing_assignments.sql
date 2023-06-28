SELECT
   assignments.id
  ,assignments.day
  ,assignments.chapter
  ,assignments.name
  ,count(assistance_requests.assignment_id) as total_requests
FROM
  assignments
  INNER JOIN assistance_requests on assistance_requests.assignment_id = assignments.id
GROUP BY
  assignments.id
ORDER BY
  total_requests DESC;