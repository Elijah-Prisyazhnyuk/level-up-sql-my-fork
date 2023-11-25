-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT ReservationID
FROM Reservations
WHERE CustomerID = 
(SELECT CustomerID
FROM Customers
WHERE LastName LIKE 'Ste%ens_n') 
AND PartySize = 4 
AND DATE(Date) LIKE '%-06-14'

--OR

SELECT c.FirstName ||' ' || c.LastName as customer,
r.ReservationID
FROM Customers c JOIN Reservations r ON c.CustomerID = r.CustomerID
WHERE c.LastName LIKE 'Ste%ens_n'
AND r.PartySize = 4
AND DATE(r.Date) LIKE '%-06-14'