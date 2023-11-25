-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

UPDATE Customers
SET
  FavoriteDish = 
    (SELECT DishID
    FROM Dishes
    WHERE Name = 'Quinoa Salmon Salad')
WHERE FirstName = 'Cleo' AND LastName = 'Goldwater';

SELECT c.FirstName || ' ' || c.LastName AS customer, d.Name
FROM Customers c JOIN Dishes d ON c.FavoriteDish = d.DishID
WHERE c.FirstName = 'Cleo' AND c.LastName = 'Goldwater'
GROUP BY customer
