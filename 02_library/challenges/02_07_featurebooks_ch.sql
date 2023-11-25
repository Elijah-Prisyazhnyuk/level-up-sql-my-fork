-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT DISTINCT b.BookID as ID,
b.Title as title,
b.Barcode as code
FROM Books b 
JOIN Loans l ON b.BookID = l.BookID
WHERE (b.Published BETWEEN 1890 AND 1899)
AND l.ReturnedDate IS NOT NULL
ORDER BY title

SELECT Title, Barcode
FROM Books
WHERE Published BETWEEN 1890 AND 1899
AND (BookID NOT IN 
  (SELECT BookID 
  FROM Loans 
  WHERE ReturnedDate IS NULL)) 
ORDER BY Title;