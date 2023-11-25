-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

INSERT INTO invited_customers
(customer_id,
invited_guests)
VALUES (
(SELECT customerID
FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com'),
3);

UPDATE invited_customers
SET
  invited_guests = 4
WHERE customer_id = (SELECT customerID
FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com');