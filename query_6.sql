SELECT
    g.name AS group_name,
    s.name AS student_name
FROM groups g
JOIN students s ON g.id = s.group_id
ORDER BY g.name, s.name;
