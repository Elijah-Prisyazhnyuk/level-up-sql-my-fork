-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.


SELECT Title, COUNT(DISTINCT BookID) - (SELECT COUNT(DISTINCT b.BookID)
FROM Books b JOIN Loans l ON b.BookID = l.BookID
WHERE b.Title = 'Dracula' AND l.ReturnedDate IS NULL) AS avialable
FROM Books
WHERE Title = 'Dracula'