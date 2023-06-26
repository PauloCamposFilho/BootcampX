SELECT
  sum(assignment_submissions.duration)
FROM
  students
  INNER JOIN assignment_submissions ON assignment_submissions.student_id = students.id
WHERE
  students.id = 186;