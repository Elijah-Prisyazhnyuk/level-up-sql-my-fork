-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.


SELECT c.FirstName || ' ' || c.LastName AS customer, COUNT(o.OrderID) as count
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY customer
ORDER BY count DESC
LIMIT 15