-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT Published as Years, COUNT(DISTINCT Title) as count
FROM Books
GROUP BY Years
ORDER BY count DESC;

SELECT b.Title as title, COUNT(b.Title) as count
FROM Books b 
JOIN Loans l ON b.BookID = l.BookID
GROUP BY title 
ORDER BY count DESC
LIMIT 5

