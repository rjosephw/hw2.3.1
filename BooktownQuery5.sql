SELECT A.Author_ID, A.First_Name, A.Last_Name FROM Authors A
WHERE A.Author_ID IN (
    SELECT DISTINCT B.Author_ID
    FROM Books B  WHERE B.Subject_id IN (
        SELECT DISTINCT Subject_id
        FROM Books   WHERE Author_ID = (
            SELECT Author_ID
            FROM Authors
            WHERE First_Name = 'J. K.' AND Last_Name = 'Rowling'
        )
    )
)
ORDER BY A.Last_Name ASC, A.Author_ID DESC;