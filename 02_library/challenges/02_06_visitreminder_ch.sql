-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT p.FirstName || ' ' || p.LastName AS patron,
p.Email as email, COUNT(l.PatronID) as count
FROM Patrons p JOIN Loans l ON p.PatronID = l.PatronID
GROUP BY patron 
ORDER BY count ASC
LIMIT 5