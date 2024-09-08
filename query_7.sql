SELECT
    g.name AS group_name,
    sub.name AS subject_name,
    s.name AS student_name,
    gr.grade AS grade
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
ORDER BY g.name, sub.name, s.name;
