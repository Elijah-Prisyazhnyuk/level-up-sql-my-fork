-- Add a customer to the restaurant's loyalty program.

-- Use the following information to create a record:
-- Anna Smith (asmith@samoca.org)
-- 479 Lapis Dr., Memphis, TN
-- Phone: (555) 555-1212; Birthday: July 21, 1973

SELECT * FROM Customers;
INSERT INTO Customers
(CustomerID,
FirstName,
LastName,
Email,
Address,
City,
State,
Phone,
Birthday)
VALUES (101,
'Anna', 
'Smith', 
'asmith@samoca.org', 
'479 Lapis Dr.', 
'Memphis',
'TN',
'555-555-1212',
'1973-08-21'); 