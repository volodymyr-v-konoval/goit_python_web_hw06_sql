SELECT
    t.fullname AS teacher_name,
    sub.name AS subject_name,
    AVG(gr.grade) AS average_grade
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
JOIN grades gr ON sub.id = gr.subject_id
GROUP BY t.fullname, sub.name
ORDER BY t.fullname, sub.name;
