SELECT
    g.name AS group_name,
    sub.name AS subject_name,
    AVG(gr.grade) AS average_grade
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
GROUP BY g.name, sub.name
ORDER BY g.name, sub.name;
