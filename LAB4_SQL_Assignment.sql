/*
 * 1) You are required 
 * to create tables for supplier,customer,category,product,supplier_pricing,order,rating 
 * to store the data for the Ecommerce 
 * 
 * 2) Insert the data in the table created above 
 */

-- Creating database, creating tables and inserting data as per the question
create database E_commerce;

USE E_commerce;
create table supplier (SUPP_ID  int primary key,
                       SUPP_NAME varchar(24) NOT NULL,
                       SUPP_CITY varchar(24) NOT NULL,
                       SUPP_PHONE varchar(15) NOT NULL
                       );
                       
insert into supplier values (1, "Rajesh Retails", "Delhi", 1234567890);
insert into supplier values (2, "Appario Ltd.", "Mumbai", 2589631470);
insert into supplier values (3, "Knome products", "Banglore", 9785462315);
insert into supplier values (4, "Bansal Retails", "Kochi", 8975463285);
insert into supplier values (5, "Mittal Ltd.", "Lucknow", 7898456532);

create table customer (CUS_ID int primary key,
					   CUS_NAME VARCHAR(20) NOT NULL,
                       CUS_PHONE varchar(15) NOT NULL,
                       CUS_CITY varchar(24) NOT NULL,
                       CUS_GENDER char
                       );
                       
SET FOREIGN_KEY_CHECKS=0;

insert into customer values (1, "AAKASH", 9999999999, "DELHI", 'M');
insert into customer values (2, "AMAN", 9785463215, "NOIDA", 'M');
insert into customer values (3, "NEHA", 9999999999, "MUMBAI", 'F');
insert into customer values (4, "MEGHA", 9994562399, "KOLKATA", 'F');
insert into customer values (5, "PULKIT", 7895999999, "LUCKNOW", 'M');

create table category (CAT_ID int primary key,
                       CAT_NAME VARCHAR(20) NOT NULL
                       );

insert into category values (1, "BOOKS");
insert into category values (2, "GAMES");
insert into category values (3, "GROCERIES");
insert into category values (4, "ELECTRONICS");
insert into category values (5, "CLOTHES");

create table product (PRO_ID int primary key,
					  PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
                      PRO_DESC VARCHAR(60),
                      CAT_ID int,
                      foreign key (CAT_ID) references category (CAT_ID)
                      );
	
insert into product values (1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values (2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values (4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values (6, "MILK", "1L Toned MIlk", 3);
insert into product values (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values (9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product values (10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values (11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product values (12, "Train Your Brain", "By Shireen Stephen", 1);
                      
create table supplier_pricing (PRICING_ID int primary key,
                                PRO_ID INT,
                                foreign key (PRO_ID) references product (PRO_ID),
                                SUPP_ID  int,
                                foreign key (SUPP_ID ) references supplier (SUPP_ID ),
                                SUPP_PRICE int default 0
                                );

insert into supplier_pricing values (1, 1, 2, 1500);
insert into supplier_pricing values (2, 3, 5, 30000);
insert into supplier_pricing values (3, 5, 1, 3000);
insert into supplier_pricing values (4, 2, 3, 2500);
insert into supplier_pricing values (5, 4, 1, 1000);
                                
-- creating table named as "order" backtick (`) is used here because order is defined keyword and to name a table as "order" back tick is used --

create table `order` (ORD_ID int primary key,
                      ORD_AMOUNT INT NOT NULL,
                      ORD_DATE DATE NOT NULL,
                      CUS_ID int,
                      foreign key (CUS_ID) references customer (CUS_ID),
                      PRICING_ID int,
                      foreign key (PRICING_ID) references supplier_pricing (PRICING_ID)
                      );

insert into `order` values (101, 1500, '2021-10-06', 2, 1);
insert into `order` values (102, 1000, '2021-10-12', 3, 5);
insert into `order` values (103, 30000, '2021-09-16', 5, 2);
insert into `order` values (104, 1500, '2021-10-05', 1, 1);
insert into `order` values (105, 3000, '2021-08-16', 4, 3);
insert into `order` values (106, 1450, '2021-08-18', 1, 9);
insert into `order` values (107, 789, '2021-09-01', 3, 7);
insert into `order` values (108, 780, '2021-09-07', 5, 6);
insert into `order` values (109, 3000, '2021-00-10', 5, 3);
insert into `order` values (110, 2500, '2021-09-10', 2, 4);
insert into `order` values (111, 1000, '2021-09-15', 4, 5);
insert into `order` values (112, 789, '2021-09-16', 4, 7);
insert into `order` values (113, 31000, '2021-09-16', 1, 8);
insert into `order` values (114, 1000, '2021-09-16', 3, 5);
insert into `order` values (115, 3000, '2021-09-16', 5, 3);
insert into `order` values (116, 99, '2021-09-17', 2, 14);
                    
create table rating (RAT_ID int primary key,
                     ORD_ID int,
                     foreign key (ORD_ID) references `order` (ORD_ID),
                     RAT_RATSTARS INT NOT NULL
                     );

insert into rating values (1, 101, 4);
insert into rating values (2, 102, 3);
insert into rating values (3, 103, 1);
insert into rating values (4, 104, 2);
insert into rating values (5, 105, 4);
insert into rating values (6, 106, 3);
insert into rating values (7, 107, 4);
insert into rating values (8, 108, 4);
insert into rating values (9, 109, 3);
insert into rating values (10, 110, 5);
insert into rating values (11, 111, 3);
insert into rating values (12, 112, 4);
insert into rating values (13, 113, 2);
insert into rating values (14, 114, 1);
insert into rating values (15, 115, 1);
insert into rating values (16, 116, 0);

-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. 
select COUNT(*), CUS_GENDER from `order`
	   inner join 
       customer on `order`.CUS_ID = customer.CUS_ID 
       where ORD_AMOUNT >= 3000 group by customer.CUS_GENDER;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2 
select * from `order` 
	   inner join
       Supplier_pricing  on `order`.PRICING_ID = Supplier_pricing.PRICING_ID
       inner join
       product on Supplier_pricing.PRO_ID = product.PRO_ID
       where CUS_ID = 2;

-- 5) Display the Supplier details who can supply more than one product. 
select * from Supplier
	   where SUPP_ID  in
       (select SUPP_ID  from Supplier_pricing group by SUPP_ID  having count(SUPP_ID ) > 1);
 
 -- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product 
select category.CAT_ID, CAT_NAME, PRO_NAME, SUPP_PRICE from `order`
       inner join Supplier_pricing on Supplier_pricing.PRICING_ID = `order`.PRICING_ID
       inner join product on Supplier_pricing.PRO_ID = product.PRO_ID
       inner join category on product.CAT_ID = category.CAT_ID
       order by ORD_AMOUNT limit 1;

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”. 
select ORD_ID, PRO_NAME from `order`
       inner join Supplier_pricing on `order`.PRICING_ID = Supplier_pricing.PRICING_ID
       inner join product on Supplier_pricing.PRO_ID = product.PRO_ID
       where ORD_DATE > "2021-10-05";

-- 8) Display customer name and gender whose names start or end with character 'A'. 
select CUS_NAME, CUS_GENDER from `customer`
       where CUS_NAME like 'A%' or CUS_NAME like '%A';
  
-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. 

mysql> delimiter //
CREATE PROCEDURE storedProcedure ()
Begin
Select  supplier.SUPP_ID, supplier.SUPP_NAME, rating.RAT_RATSTARS, 
case
    when RAT_RATSTARS =5 then 'Excellent service'
    when RAT_RATSTARS >=4 then 'Good service'
    when RAT_RATSTARS >2 then 'Average service'
    else 'poor service'
	
    end as Type_of_service
    from rating join `order` on rating.ORD_ID = `order`.ORD_ID
    join supplier_pricing on `order`.PRICING_ID = supplier_pricing.PRICING_ID
    join supplier on supplier_pricing.SUPP_ID =supplier.SUPP_ID;
end  ;

call storedProcedure();
