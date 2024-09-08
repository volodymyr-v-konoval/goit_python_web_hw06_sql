SELECT DISTINCT
    s.name AS student_name,
    t.fullname AS teacher_name,
    sub.name AS subject_name
FROM students s
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
ORDER BY s.name, t.fullname, sub.name;
