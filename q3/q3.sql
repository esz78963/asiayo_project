SELECT class
FROM class 
WHERE name = (
    SELECT name 
    FROM score 
    ORDER BY score DESC 
    FETCH FIRST 1 ROWS SKIP 1
);
-- ORDER BY score DESC 按照score排序 用DESC由大到小排序
-- FETCH FIRST 1 ROWS SKIP 1 跳過第一排後選第一個