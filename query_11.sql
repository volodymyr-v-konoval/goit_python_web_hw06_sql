SELECT
    s.name AS student_name,
    t.fullname AS teacher_name,
    AVG(gr.grade) AS average_grade
FROM students s
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
GROUP BY s.name, t.fullname
ORDER BY s.name, t.fullname;
