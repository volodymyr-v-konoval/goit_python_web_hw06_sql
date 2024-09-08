SELECT DISTINCT
    s.name AS student_name,
    sub.name AS subject_name
FROM students s
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
ORDER BY s.name, sub.name;
