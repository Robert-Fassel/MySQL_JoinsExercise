/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select products.Name, categories.Name from products
 inner join categories on categories.CategoryID = products.CategoryID
 where categories.Name="computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating from products
left join reviews on reviews.ProductID = products.ProductID where Rating = 5;


 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, sum(sales.Quantity) as total from sales
inner join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by total desc limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name, categories.Name from departments
inner join categories on categories.DepartmentID = departments.DepartmentID
where categories.Name = "appliances" or categories.Name = "games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, sum(sales.Quantity) as 'total sold', sum(sales.Quantity * sales.PricePerUnit) as 'total price'
from products
inner join sales on sales.ProductID = products.ProductID
where products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
from products
inner join reviews on reviews.ProductID = products.ProductID
where products.ProductID = 857 and reviews.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity)
from employees
inner join sales on sales.EmployeeID = employees.EmployeeID
inner join products on products.ProductID = sales.ProductID
group by employees.EmployeeID, products.ProductID;