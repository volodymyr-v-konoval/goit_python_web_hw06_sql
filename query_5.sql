SELECT
    t.fullname AS teacher_name,
    sub.name AS subject_name
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
ORDER BY t.fullname, sub.name;
