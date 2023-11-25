-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

--delete for tests
DELETE FROM Reservations
WHERE CustomerID = (
SELECT CustomerID
FROM Customers
WHERE FirstName = 'Sam' 
  AND LastName = 'McAdams'
  AND Email = 'smac@kinetecoinc.com');

DELETE FROM Customers
WHERE CustomerID = (
SELECT CustomerID
FROM Customers
WHERE FirstName = 'Sam' 
  AND LastName = 'McAdams'
  AND Email = 'smac@kinetecoinc.com');


INSERT INTO Customers
(FirstName, LastName, Email)
SELECT 'Sam', 'McAdams', 'smac@kinetecoinc.com'
WHERE NOT EXISTS (
SELECT CustomerID
FROM Customers
WHERE FirstName = 'Sam' 
  AND LastName = 'McAdams'
  AND Email = 'smac@kinetecoinc.com')

INSERT INTO Reservations
(CustomerID, Date, PartySize)
VALUES
((
SELECT CustomerID
FROM Customers
WHERE FirstName = 'Sam' 
  AND LastName = 'McAdams'
  AND Email = 'smac@kinetecoinc.com'),
'2022-08-12 18:00:00',
5);



INSERT INTO Reservations
(CustomerID, Date, PartySize)
VALUES
((CASE
  WHEN (SELECT CustomerID
      FROM Customers
      WHERE Email = 'smac@kinetecoinc.com' 
        AND FirstName = 'Sam'
        AND LastName = 'McAdams') IS NULL
    THEN
      102
  ELSE
    (SELECT CustomerID
      FROM Customers
      WHERE Email = 'smac@kinetecoinc.com' 
        AND FirstName = 'Sam'
        AND LastName = 'McAdams')
END),
'2022-08-12 18:00:00',
5);

--run 2 times;
INSERT INTO 
(CASE
  WHEN 
    (SELECT CustomerID
    FROM Customers
    WHERE Email = 'smac@kinetecoinc.com' 
     AND FirstName = 'Sam'
      AND LastName = 'McAdams') NOT EXISTS
  THEN
    Customers
  ELSE
    Reservations
END)
(CASE
  WHEN 
    (SELECT CustomerID
    FROM Customers
    WHERE Email = 'smac@kinetecoinc.com' 
     AND FirstName = 'Sam'
      AND LastName = 'McAdams') NOT EXISTS
  THEN
    (FirstName, LastName, Email)
  ELSE
    (CustomerID, Date, PartySize)
END)
VALUES
(CASE
  WHEN 
    (SELECT CustomerID
    FROM Customers
    WHERE Email = 'smac@kinetecoinc.com' 
      AND FirstName = 'Sam'
      AND LastName = 'McAdams') IS NULL
  THEN
    ('Sam',
    'McAdams',
    'smac@kinetecoinc.com')
  ELSE
    ((SELECT CustomerID
      FROM Customers
      WHERE Email = 'smac@kinetecoinc.com' 
        AND FirstName = 'Sam'
        AND LastName = 'McAdams'),
    '2022-08-12 18:00:00',
    5)
END)
