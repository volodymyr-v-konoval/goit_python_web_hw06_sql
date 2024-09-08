WITH StudentAverages AS (
    SELECT
        s.id AS student_id,
        s.name AS student_name,
        sub.id AS subject_id,
        sub.name AS subject_name,
        AVG(g.grade) AS average_grade
    FROM students s
    JOIN grades g ON s.id = g.student_id
    JOIN subjects sub ON g.subject_id = sub.id
    GROUP BY s.id, s.name, sub.id, sub.name
),
RankedStudents AS (
    SELECT
        sa.subject_name,
        sa.student_name,
        sa.average_grade,
        ROW_NUMBER() OVER (PARTITION BY sa.subject_name ORDER BY sa.average_grade DESC) AS rank
    FROM StudentAverages sa
)
SELECT
    rs.subject_name,
    rs.student_name,
    rs.average_grade
FROM RankedStudents rs
WHERE rs.rank = 1;
