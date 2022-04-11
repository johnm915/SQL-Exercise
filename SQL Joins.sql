-- joins: select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name 

SELECT P.Name as ProductName, C.Name as CategoryName
 From products as P
 Inner join categories as C on C.CategoryID = p.CategoryID
 Where C.Name = 'computers';
 
 -- joins: find all product names, product prices, 
 -- and products ratings that have a rating of 5
 select p.Name, p.Price, r.Rating 
 from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating = 5;
 
 select products.Name, products.Price, reviews.Rating
 from products 
 inner join reviews on reviews.ProductID = products.ProductID
 where reviews.Rating = 5;

-- joins: find the employee with the most total quantity sold.  
-- use the sum() function and group by
select e.FirstName , e.LastName, sum(s.quantity) as total from sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
Limit 2;

-- joins: find the name of the department, 
-- and the name of the category for Appliances and Games
select d.Name as 'Department Names', c.Name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';
--  joins: find the product name, total # sold, and total price sold,
 -- for Eagles: Hotel California --You may need to use SUM()
 select p.name, sum(s.quantity) as 'Total Sold', sum(s.quantity * s.PricePerUnit) as 'Total Price'
 From products as p
 inner join sales as s on s.ProductID = p.ProductID
 where p.ProductID = 97;
 
 
 
 -- joins: find Product name, reviewer name, rating,
 -- and comment on the Visio TV. (only return for the lowest rating!) */
 select p.name, r.reviewer, r.Rating, r.Comment from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where p.ProductID = 857 and r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
--  Your goal is to write a query that serves as an employee sales report.
-- This query should return the employeeID, the employee's first and last name, 
-- the name of each product, how many of that product they sold 
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as totalSold
from sales as s
Inner join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;


