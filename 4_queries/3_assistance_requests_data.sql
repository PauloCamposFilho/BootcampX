SELECT
   teachers.name
  ,students.name
  ,assignments.name
  ,assistance_requests.completed_at - assistance_requests.started_at as duration
FROM
  assistance_requests
  INNER JOIN students on students.id = assistance_requests.student_id
  INNER JOIN teachers on teachers.id = assistance_requests.teacher_id
  INNER JOIN assignments on assignments.id = assistance_requests.assignment_id
ORDER BY
  duration;