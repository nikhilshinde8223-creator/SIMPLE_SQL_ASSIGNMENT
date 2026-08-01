########################################------------------SQL SIMPLE ASSIGNMENT-----------------##########################################
###CREATING EMPTY DATABASE
create database online_book_store_db;
### THEN USE CREATED DATABASE
use online_book_store_db;
#NOW SEEING THOSE TABLES
select * from books;
select * from orders;
select * from customers;

##Q1.Retrieve all books in the “Fiction” genre. 
##QUERY:-
select * from books where genre ='Fiction';

##Q2.Find books published after the year 1950. 
#QUERY:-
select * from books where published_year > 1950; 

##Q3.List all customers from Canada. 
#QUERY:-
select * from customers where country ='canada';

##QUESTION FOR EXTRA PRACTICE
#QUERY:-
select count(customer_id)'count' from customers where country ='India';

##Q4Show orders placed in November 2023.
#QUERY:-
select count(order_id) from orders where order_date between'2023-11-01' and '2023-11-30';

##Q5.Retrieve the total stock of books available.
#QUERY:-
select sum(stock) as 'Total stock' from books;

##Q6.Find the details of the most expensive book. 
#QUERY:-
select * from books order by price desc limit 5;

##Q7.Show all customers who ordered more than 1 quantity of a book.
#QUERY:-
select Customer_id from Orders where Quantity > 1;

##Q8.Retrieve all orders where the total amount exceeds $20.
#QUERY:-
select*from orders where Total_Amount>20;

##Q9.List all distinct genres in the bookstore. 
##QUERY:-
select distinct(genre) from books;

##Q10.Find the book with the lowest stock available.
##QUERY:-
select * from books order by stock asc limit 10;

##Q11.Calculate the total revenue from all orders.
#QUERY:-
select round(sum(Total_Amount),2) from orders;

##Q12. Retrieve the total number of books sold for each genre.
##QUERY:-
select books.genre,sum(orders.quantity)as'total_book sold' from orders
 join books
 on orders.book_id=books.book_id
 group by books.genre;

##Q13.Find the average price of books in the “Fantasy” genre.
##QUERY:-
select round(avg(price),2) as'average price'from books
where genre='fantasy';

##Q14.List customers who have placed at least 2 orders.
##QUERY:-
select customers.name,count(orders.order_id) 
from customers join orders 
on customers.customer_id=orders.customer_id
 group by customers.customer_id,customers.name 
 having count(orders.order_id)>=2;

##Q15.Find the most frequently ordered book.
##QUERY:-
SELECT b.title,
       COUNT(o.book_id) AS total_orders
FROM orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY total_orders DESC
LIMIT 1;

#Q16.Show the top 3 most expensive books of the “Fantasy” genre.
#QUERY:-
select * from books
 where genre ='Fantasy'
 order by price desc 
limit 3;

##Q17.Retrieve the total quantity of books sold by each author
##QUERY:-
select books.Author,sum(orders.quantity) as total_books_sold
from books
join orders
on books.book_id=orders.book_id
group by books.Author;

##Q18.List the cities of customers who spent over $30.
##QUERY:-
select customers.city from customers
join orders
on customers.customer_id=orders.customer_id
group by customers.customer_id, customers.city
having sum(orders.Total_Amount)>30;

##Q19.Find the customer who spent the most on orders.
##QUERY:-
select customers.customer_id,customers.name, 
 round(sum(orders.Total_Amount),2)as 'Total_spent'
 from customers 
join orders
on customers.customer_id=orders.customer_id
group by customers.customer_id,customers.name
order by Total_spent desc
limit 1;

##Q20.Calculate the stock remaining after fulfilling all orders.
##QUERY:-
SELECT b.book_id,
       b.title,
       b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;