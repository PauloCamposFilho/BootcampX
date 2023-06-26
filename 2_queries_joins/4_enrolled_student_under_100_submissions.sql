SELECT
   students.name as student
  ,count(assignment_submissions.*) as total_submissions
FROM
  assignment_submissions
  INNER JOIN students ON students.id = assignment_submissions.student_id
WHERE
  students.end_date IS NULL
GROUP BY 
  students.name
HAVING
  count(assignment_submissions.*) < 100;