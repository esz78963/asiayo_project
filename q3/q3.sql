SELECT class
FROM class 
WHERE name = (
    SELECT name 
    FROM score 
    ORDER BY score DESC 
    FETCH FIRST 1 ROWS SKIP 1
);