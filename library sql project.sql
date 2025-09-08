--- Creating table
---Book---
DROP TABLE IF EXISTS Book; 
CREATE table Book(
       Book_ID SERIAL PRIMARY KEY,
	   Title varchar(100),
	   Author varchar(100),
	   Genre varchar(50),
	   Published_Year int,
	   Price numeric(10,2),
	   Stock int

);
--- Customer--
Drop table if exists customer;
 Create table customer(
       Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

--- Order ID---

    
Drop table if exists orders;
 create table orders(
        Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT references customer(customer_id),
    Book_ID INT references Book(Book_id),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

 select*from Book;
  select*from customer;
   select*from orders;
 
--Importing data into books
--Importing data into customer
--Importing data into orders

--Questions--
-------------->
-- 1) Retrieve all books in the "Fiction" genre:
      select * from book
	   where genre='Fiction';

-- 2) Find books published after the year 1950:
      select * from book
	    where published_year >1950;

-- 3) List all customers from the Canada:
        select * from customer
		 where country='Canada';

-- 4) Show orders placed in November 2023:
        select * from orders 
		 where order_date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
        select sum(stock) as book_available
		  from book;

-- 6) Find the details of the most expensive book:
         select * from book
		 order by price desc limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
       select * from customer 
	    where customer_id>1;


-- 8) Retrieve all orders where the total amount exceeds $20:
      select * from orders 
	   where total_amount>20;


-- 9) List all genres available in the Books table:
         select distinct genre from book
		 group by genre;


-- 10) Find the book with the lowest stock:
         select * from book
		 order by stock asc limit 1;

-- 11) Calculate the total revenue generated from all orders:
          select sum(total_amount) as revune
		   from orders;


--- Advance Questions :
------------------------->
select* from orders
-- 1) Retrieve the total number of books sold for each genre:
        select b.genre,sum(o.quantity) as book_sold
		 from orders o
		 join book b
		 on o.book_id = b.book_id
         group by b.genre;

-- 2) Find the average price of books in the "Fantasy" genre.
       select avg(price) as avg_price
	    from book
		 where genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:
     select c.customer_id,c.name, count(o.order_id) as count_book
	 from customer c
	 join orders o 
	 on c.customer_id=o.customer_id
	 group by c.customer_id,c.name
	 having count(order_id)>2;
select * from book
-- 4) Find the most frequently ordered book:
     select b.book_id,b.title, count(o.order_id)as frequently_ordered 
	  from book b
	  join orders o
	  on b.book_id = o.order_id
	  group by b.book_id,b.title
	  order by frequently_ordered  desc limit 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
     select book_id,title,genre,price
	  from book
	  where genre='Fantasy'
	  order by price desc limit 3;



-- 6) Retrieve the total quantity of books sold by each author:
     select b.author,sum(o.quantity) 
	 from book b
	 join orders o
	 on b.book_id=o.book_id
	 group by b.author;


-- 7) List the cities where customers who spent over $30 are located:
         select c.city,o.total_amount from customer c
		 join orders o
		 on c.customer_id = o.customer_id
		 where o.total_amount>30;

select * from customer
select * from orders

-- 8) Find the customer who spent the most on orders:
        select c.customer_id,c.name,sum(o.total_amount) as most_order from  orders o
		join customer c
		on c.customer_id = o.customer_id
		group by c.customer_id,c.name
		order by most_order desc limit 1 ;


--9) Calculate the stock remaining after fulfilling all orders:	
       SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM book b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;