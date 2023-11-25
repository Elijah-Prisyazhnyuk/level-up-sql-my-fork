-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

--add customer
INSERT INTO Customers
(FirstName, LastName, Address)
VALUES
('Loretta', 'Hundey', '6939 Elka Place');

--order
INSERT INTO Orders
(CustomerID, OrderDate)
VALUES
((SELECT CustomerID
  FROM Customers
  WHERE FirstName = 'Loretta' 
  AND LastName = 'Hundey'
  AND Address = '6939 Elka Place'),
  '2022-09-20 14:00:00');


--add Dishes Hindu Code
INSERT INTO OrdersDishes
(OrderID, DishID)
VALUES
((SELECT OrderID
  FROM Orders
  WHERE CustomerID = (SELECT CustomerID
  FROM Customers
  WHERE FirstName = 'Loretta' 
  AND LastName = 'Hundey'
  AND Address = '6939 Elka Place')
  AND OrderDate = '2022-09-20 14:00:00'),
  (SELECT DishID
  FROM Dishes
  WHERE Name = 'Tropical Blue Smoothie'));

--Report sum
SELECT c.FirstName || ' ' || c.LastName as customer, SUM(d.Price) as SUM
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrdersDishes od ON o.OrderID = od.OrderID
JOIN Dishes d ON od.DishID = d.DishID
WHERE c.FirstName = 'Loretta' 
  AND c.LastName = 'Hundey'
  AND c.Address = '6939 Elka Place'
  AND o.OrderDate = '2022-09-20 14:00:00'
GROUP BY c.CustomerID;


HAVING d.DishID = 
(SELECT DishID
FROM OrdersDishes
WHERE OrderID = 
  (SELECT OrderID
  FROM Orders
  WHERE CustomerID = 
    (SELECT CustomerID
    FROM Customers
    WHERE FirstName = 'Loretta' 
    AND LastName = 'Hundey'
    AND Address = '6939 Elka Place')
    AND OrderDate = '2022-09-20 14:00:00'))

  --OOORR some hindu code by ChatGPT
  -- Создаем временную таблицу для хранения значений из списка
CREATE TEMPORARY TABLE IF NOT EXISTS DishList (DishName TEXT);
INSERT INTO temp.DishList VALUES ('House Salad'), ('Mini Cheesburger'), ('Tropical Blue Smoothie');

-- Основной цикл
WITH RECURSIVE Loop AS (
  SELECT DishName, 1 AS Iteration
  FROM DishList
  UNION ALL
  SELECT DishName, Iteration + 1
  FROM Loop
  WHERE Iteration < 3  -- Задайте нужное количество проходов
)

-- но похоже это не будет работать
INSERT INTO OrdersDishes (OrderID, DishID)
SELECT (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = (
        SELECT CustomerID
        FROM Customers
        WHERE FirstName = 'Loretta'
        AND LastName = 'Hundey'
        AND Address = '6939 Elka Place'
    )
    AND OrderDate = '2022-09-20 14:00:00'
), (
    SELECT DishID
    FROM Dishes
    WHERE Name = Loop.DishName
)
FROM Loop;


  