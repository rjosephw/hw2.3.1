SELECT
    B.Title BookTitle,
    E.Publication_Date PublicationDate,
    A.Author_ID AuthorID,
    A.First_Name AuthorFirstName,
    A.Last_Name AuthorLastName
FROM
    Editions E
JOIN
    Books B ON E.Book_ID = B.Book_ID
JOIN
    Authors A ON B.Author_ID = A.Author_ID
WHERE
    B.Author_ID IN (
        SELECT DISTINCT B.Author_ID
        FROM Editions E1
        JOIN Books B1 ON E1.Book_ID = B1.Book_ID
        WHERE E1.Publication_Date BETWEEN '2003-01-01' AND '2008-12-31'
    )
ORDER BY
    A.Author_ID ASC,
    B.Title ASC,
    E.Publication_Date DESC;