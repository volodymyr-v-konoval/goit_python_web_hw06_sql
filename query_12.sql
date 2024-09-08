SELECT
    g.name AS group_name,
    s.name AS student_name,
    sub.name AS subject_name,
    gr.grade AS grade,
    gr.grade_date AS last_grade_date
FROM students s
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
JOIN groups g ON s.group_id = g.id
WHERE gr.grade_date = (
    SELECT MAX(gr2.grade_date)
    FROM grades gr2
    WHERE gr2.student_id = s.id AND gr2.subject_id = sub.id
)
ORDER BY g.name, sub.name, s.name;
