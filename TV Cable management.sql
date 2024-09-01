drop table customer cascade constraints; 
drop table payment cascade constraints; 
drop table subscription cascade constraints; 
drop table channels cascade constraints; 
drop table packages cascade constraints; 
drop table package_channels cascade constraints; 

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(200)
  );
Create table payment
(
payment_id int primary key,
mode_of_payment varchar(20),
payment_date date,
customer_id int references customer(customer_id)
);

CREATE TABLE subscription(
subscription_id INT PRIMARY KEY,
 start_date DATE,
end_date DATE,
payment_id int references payment(payment_id),
customer_id int references customer(customer_id)
);

CREATE TABLE packages (
  package_id INT PRIMARY KEY,
  pname VARCHAR(100),
  description VARCHAR(200),
  monthly_fee DECIMAL(10,2),
  no_of_channels int,
  subscription_id REFERENCES subscription(subscription_id)
);
CREATE TABLE channels (
  channel_id INT PRIMARY KEY,
  channelname VARCHAR(50),
  description VARCHAR(200),
  customer_id REFERENCES customer(customer_id)
);

CREATE TABLE package_channels (
  package_channel_id INT PRIMARY KEY,
  package_id REFERENCES packages(package_id),
  channel_id REFERENCES channels(channel_id)
);
INSERT INTO customer VALUES (1, 'Rohan', 'pai', 'rohanpai@example.com', '9620124621', '123 Main St');
INSERT INTO customer VALUES (2, 'Jane', 'Smith', 'janesmith@example.com', '8523063521', '456 Elm St');
INSERT INTO customer VALUES (3, 'Shreya', 'Rao', 'shreyarao@example.com', '9834552184', '789 Oak St');
INSERT INTO customer VALUES (4, 'Manvi', 'sigh', 'manvisigh@example.com', '8399842646', '987 Maple Ave');
INSERT INTO customer VALUES (5, 'ram', 'Patil', 'rampatil@example.com', '9347562912', '123 Pine St');
INSERT INTO customer VALUES (6, 'Ritika', 'Shetty', 'ritikashetty@example.com', '8323572754', '456 Cedar Ave');
INSERT INTO customer VALUES (7, 'riya', 'karne', 'riyakarne@example.com', '9742376543', '789 Maple St');
INSERT INTO customer VALUES (8, 'Parth', 'kulkarni', 'parthkulkarni@example.com', '9432265932', '321 Oak Ave');
INSERT INTO customer VALUES (9, 'Ankit', 'shettar', 'ankit@example.com', '9347651234', '789 Oak St');
INSERT INTO customer VALUES (10, 'Anand', 'Agarwal', 'anand@example.com' , '9084576312', '987 Maple Ave');

select * from customer;

INSERT INTO payment VALUES (1, 'Credit Card', '28-FEB-2023',1);
INSERT INTO payment VALUES (2, 'Paytm', '01-MAR-2023',2);
INSERT INTO payment VALUES (3, 'GPay', '02-MAR-2023',1);
INSERT INTO payment VALUES (4, 'Credit Card', '03-MAR-2023',6);
INSERT INTO payment VALUES (5, 'Gpay', '04-MAR-2023', 7);
INSERT INTO payment VALUES (6, 'Debit Card', '05-APR-2023',6);
INSERT INTO payment VALUES (7, 'Credit Card', '30-APR-2023',7);
INSERT INTO payment VALUES (8, 'Paytm', '07-MAY-2023',3);
INSERT INTO payment VALUES (9, 'Credit Card', '09-MAY-2023',2);
INSERT INTO payment VALUES (10, 'Phonepayl', '12-MAY-2023',6);
select * from payment;

INSERT INTO subscription VALUES (1, '01-MAR-2023', '01-APR-2023', 1,2);
INSERT INTO subscription VALUES (2, '01-APR-2023', '01-JUN-2023', 2,4);
INSERT INTO subscription VALUES (3, '02-APR-2023', '02-MAY-2023', 3,2);
INSERT INTO subscription VALUES (4, '03-MAR-2023', '21-JUN-2023', 6,1);
INSERT INTO subscription VALUES (5, '04-JUN-2023', '15-AUG-2023', 2,6);
INSERT INTO subscription VALUES (6, '05-MAR-2023', '21-JUL-2023', 7,4);
INSERT INTO subscription VALUES (7, '06-MAY-2023', '20-JUL-2023', 7,1);
INSERT INTO subscription VALUES (8, '07-APR-2023', '29-JUN-2023', 1,4);
INSERT INTO subscription VALUES (9, '08-MAR-2023', '30-APR-2023', 7,7);
INSERT INTO subscription VALUES (10, '09-JUN-2023', '09-JUL-2023', 6,2);

INSERT INTO packages VALUES (1, 'Basic', 'Includes 50 channels', 50.00,30, 1);
INSERT INTO packages VALUES (2, 'Premium', 'Includes 100 channels', 75.00,56, 6);
INSERT INTO packages VALUES (3, 'Sports Package', 'Includes ESPN and Fox Sports', 10.00,12, 3);
INSERT INTO packages VALUES (4, 'Movie Package', 'Includes HBO and Showtime', 15.00, 9,4);
INSERT INTO packages VALUES (5, 'Premium Sports', 'Includes ESPN and Fox Sports', 20.00,15,5);
INSERT INTO packages VALUES (6, 'Premium Movie', 'Includes HBO, Showtime, and Cinemax', 25.00,18, 6);
INSERT INTO packages VALUES (7, 'Premium Entertainment', 'Includes HBO, Showtime, Cinemax, and NBC', 30.00,20, 7);
INSERT INTO packages VALUES (8, 'Premium Sports and Movie', 'Includes ESPN, Fox Sports, HBO, Showtime, and Cinemax', 35.00, 26,7);
INSERT INTO packages VALUES (9, 'pogo', 'all kids show', 10.00, 5,9);
INSERT INTO packages VALUES (10, 'cartoon', 'Includes HBO' , 25.00,15, 9);


INSERT INTO channels VALUES (1, 'ABC', 'General entertainment', 1);
INSERT INTO channels VALUES (2, 'ESPN', 'Sports', 2);
INSERT INTO channels VALUES (3, 'Fox Sports', 'Sports', 4);
INSERT INTO channels VALUES (4, 'HBO', 'Movies', 2);
INSERT INTO channels VALUES (5, 'NBC', 'General entertainment', 6);
INSERT INTO channels VALUES (6, 'Cinemax', 'Movies', 6);
INSERT INTO channels VALUES (7, 'ABC', 'General entertainment', 7);
INSERT INTO channels VALUES (8, 'Showtime', 'Movies and TV shows', 9);
INSERT INTO channels VALUES (9, 'PQR', 'kids entertainment', 10);
INSERT INTO channels VALUES (10, 'MNO', 'kids Movies and TV shows', 10);

INSERT INTO package_channels VALUES (1, 1, 1);
INSERT INTO package_channels VALUES (2, 1, 2);
INSERT INTO package_channels VALUES (3, 4, 6);
INSERT INTO package_channels VALUES (4, 2, 4);
INSERT INTO package_channels VALUES (5, 1, 6);
INSERT INTO package_channels VALUES (6, 6, 6);
INSERT INTO package_channels VALUES (7, 8, 7);
INSERT INTO package_channels VALUES (8, 3, 8);
INSERT INTO package_channels VALUES (9, 3, 5);
INSERT INTO package_channels VALUES(10, 10, 10);

--1)Retrieve the details of customers who have made a payment using a specific mode of payment. such as Credit card or paytm.
SELECT first_name,last_name,address
FROM customer
where customer.customer_id IN (select payment.customer_id
                            from payment
                            where mode_of_payment='Credit Card' OR mode_of_payment='Paytm');

--2.)Retrieve the package name and monthly fee for all packages that have been subscribed to by customers.
SELECT pname, monthly_fee
FROM packages
WHERE subscription_id IN (
                            SELECT subscription_id
                            FROM subscription
                          );    

--3)Retrieve the package ID and name of all packages that have at least one channel associated with them.
SELECT package_id, pname,description
FROM packages
WHERE package_id IN (
                        SELECT package_id
                        FROM package_channels
                        );
--4)Retrieve the total number of channels that have been subscribed to by each customer.
SELECT customer_id, COUNT(channel_id) AS num_channels
FROM channels
GROUP BY customer_id;

--5)Retrieve the total count of customers who havent subscribed to the channel.
select count(*)
from customer
where not exists ( select *
                    from subscription
                    where customer.customer_id=subscription.customer_id);
                    
--6)*Retrieve the channel ID and channel name for all channels that have been subscribed to by at least one customer.
SELECT channel_id, channelname
FROM channels
WHERE channel_id IN (
                    SELECT channel_id
                     FROM package_channels
                    );
--7)Retrieve the count of customers who pay monthly fee b/w 25-60 for the package subscribed               
select count(*)
from customer
where customer_id IN (select subscription.customer_id
                      from subscription,packages
                      where subscription.subscription_id=packages.subscription_id
                      and packages.monthly_fee between 25 and 60);

--8)Retrieve the channel name and package name that each customer chooses.
select customer.customer_id,customer.first_name,channels.channelname,packages.pname
from channels,package_channels,packages,customer
where channels.channel_id=package_channels.channel_id and package_channels.package_id=packages.package_id and customer.customer_id=channels.customer_id
order by customer_id;


--9)Retrieve the channel names that are active in the month of June.
select channelname
from channels
where customer_id in (select customer.customer_id
                      from customer,subscription
                      where customer.customer_id=subscription.customer_id and start_date like '-06-');

--10)Retrieve the customer name, id and end date of subscription who have done the payment in the month of April.
select customer.customer_id,customer.first_name,end_date
from customer, subscription
where customer.customer_id=subscription.customer_id and customer.customer_id in( select payment.customer_id
                                                                                 from payment
                                                                                 where payment.customer_id=customer.customer_id and payment_date like '-04-');


--11)Retrieve the number of customers who haven’t made the payment in the month of April or June 
select count(*)
from customer
where not exists (select *
                 from payment 
                 where customer.customer_id=payment.customer_id and payment_date like '%04%' or payment_date like '-06-');

--12)Find the total number of payments made by customers who have subscribed to packages with more than 15 channels.
SELECT COUNT(*) AS payment_count
FROM payment
WHERE customer_id IN (
                    SELECT customer_id
                    FROM subscription,packages
                    where subscription.subscription_id = packages.subscription_id
                    and packages.no_of_channels > 15);

--13)Retrieve average monthly fee of packages subscribed to by customers who have subscribed for a subscription between a given date range(30-mar to 15-aug).
SELECT AVG(packages.monthly_fee) AS avg_monthly_fee
FROM packages,subscription 
where packages.subscription_id = subscription.subscription_id
and subscription.start_date BETWEEN '30-MAR-23' AND '15-AUG-23';


--14)Retrieve the count of each mode_of_payment in decreasing order.
SELECT mode_of_payment, COUNT(*) AS payment_count
FROM payment
GROUP BY mode_of_payment
ORDER BY payment_count DESC;


--15)Find the customers who have subscribed to a package with a monthly fee greater than 50 and have not made any payment yet.
SELECT *
FROM customer c
WHERE EXISTS (
                SELECT *
                FROM subscription s,packages p
                where s.subscription_id = p.subscription_id and
                s.customer_id = c.customer_id AND p.monthly_fee > 50) AND NOT EXISTS (
                                                                                            SELECT *
                                                                                             FROM payment pay
                                                                                              WHERE pay.customer_id = c.customer_id
);
--16)Retrieve customer IDs and names of customers who have subscribed to a package with a monthly fee greater than the average monthly fee of all packages.
SELECT customer_id, first_name, last_name
FROM customer
WHERE EXISTS (
              SELECT *
              FROM subscription,packages
               WHERE subscription.subscription_id = packages.subscription_id
              AND customer.customer_id = subscription.customer_id AND packages.monthly_fee > (
                                                                                                SELECT AVG(monthly_fee)
                                                                                                FROM packages
                                                                                               )
              );

--17)Retrieve the customer IDs and names of customers who have subscribed to more than two packages
SELECT customer_id, first_name, last_name
FROM customer
WHERE EXISTS (
              SELECT *
              FROM subscription
              WHERE customer.customer_id = subscription.customer_id
              HAVING COUNT(*) > 2
);



SET SERVEROUPUT ON;

--18) Query to insert a new customer into the database:

DECLARE  v_customer_id INT;  v_first_name VARCHAR2(50);  v_last_name VARCHAR2(50);  v_email VARCHAR2(100);  v_phone VARCHAR2(20);  v_address VARCHAR2(200);  v_count INT;
  BEGIN 
 v_customer_id := 11; -- replace with desired value  v_first_name := 'John’;  v_last_name := 'Doe’;                v_email := 'johndoe@example.com';  v_phone := '555-555-5555’; 
 v_address := '123 Main St, Anytown USA';    
SELECT COUNT(*) INTO v_count FROM customer WHERE customer_id = v_customer_id;                     

IF v_count = 0 THEN   
 INSERT INTO customer (customer_id, first_name, last_name, email, phone, address)    VALUES (v_customer_id, v_first_name, v_last_name, v_email, v_phone, v_address);    DBMS_OUTPUT.PUT_LINE('Customer inserted successfully');  
ELSE    DBMS_OUTPUT.PUT_LINE('Customer with ID ' || v_customer_id || ' already exists');
  END IF;
END;


--19) Query to calculate the total monthly fees for all packages:

DECLARE  v_total_fees DECIMAL(10,2) := 0;
BEGIN
  FOR package IN (SELECT monthly_fee FROM packages) LOOP    
    v_total_fees := v_total_fees + package.monthly_fee;  
END LOOP;   
 DBMS_OUTPUT.PUT_LINE('Total monthly fees: ' || v_total_fees);
END;

--18) Query to retrieve all channels subscribed by a particular customer:
DECLARE
v_customer_id NUMBER := 2; -- replace with desired customer ID
CURSOR c3 IS SELECT ch.channelname, ch.descriptionFROM channels chWHERE ch.customer_id = v_customer_id;

BEGIN
FOR rec IN c3 LOOP
DBMS_OUTPUT.PUT_LINE('Channel Name: ' || rec.channelname || ', Description: ' || rec.description);
END LOOP;
END;



--20) Query to retrieve all subscriptions with their respective package name and monthly fee:
DECLARE
CURSOR c2 IS SELECT s.subscription_id, p.pname, p.monthly_fee
FROM subscription sJOIN packages p ON s.subscription_id = p.subscription_id;
BEGIN
FOR rec IN c2 LOOP
DBMS_OUTPUT.PUT_LINE('Subscription ID: ' || rec.subscription_id || ', Package Name: ' || rec.pname || ', Monthly Fee: ' || rec.monthly_fee);
END LOOP;
END;

--21) Procedure to update a customer's payment information:
CREATE OR REPLACE PROCEDURE update_customer_payment (    p_customer_id IN customer.customer_id%TYPE,    p_mode_of_payment IN payment.mode_of_payment%TYPE,    p_payment_date IN payment.payment_date%TYPE)
IS
BEGIN    -- Loop through the payments for the given customer ID and update each payment record    
FOR payment_rec IN (        SELECT payment_id        FROM payment        WHERE customer_id = p_customer_id    )    LOOP        

UPDATE payment        SET mode_of_payment = p_mode_of_payment,            payment_date = p_payment_date        WHERE payment_id = payment_rec.payment_id;           
     DBMS_OUTPUT.PUT_LINE('Payment information updated for customer with ID: ' || p_customer_id);    
END LOOP;
END;


EXECUTE update_customer_payment(1, 'Debit Card', SYSDATE);

--22)  Procedure to retrieve all customers and their corresponding subscription information:

CREATE OR REPLACE PROCEDURE get_customer_subscriptions
IS
CURSOR customer_subscription_cur IS SELECT c.first_name || ' ' || c.last_name AS customer_name,p.pname AS package_name,s.start_date,s.end_date
FROM customer c
JOIN subscription s ON c.customer_id = s.customer_id
JOIN packages p ON s.subscription_id = p.subscription_id
ORDER BY c.last_name, c.first_name;

BEGIN
FOR customer_subscription_rec IN customer_subscription_cur LOOP
DBMS_OUTPUT.PUT_LINE(customer_subscription_rec.customer_name || ': ' ||customer_subscription_rec.package_name || ' (' ||customer_subscription_rec.start_date || ' - ' ||customer_subscription_rec.end_date || ')');
END LOOP;
END;

EXECUTE get_customer_subscriptions;



--23) Display no. of customers who made payment in a particular year
CREATE OR REPLACE FUNCTION get_num_customers_with_payment (p_year IN NUMBER)
RETURN INT 
IS
v_num_customers INT := 0;
BEGIN 
 SELECT COUNT(DISTINCT customer_id)  INTO v_num_customers 
 FROM payment 
 WHERE EXTRACT(YEAR FROM payment_date) = p_year;    RETURN v_num_customers;
END;
SELECT get_num_customers_with_payment(2023) FROM dual;

--24) display the date on which a particular customer made his most recent payment

CREATE OR REPLACE FUNCTION get_most_recent_payment (p_customer_id IN customer.customer_id%TYPE)
RETURN payment.payment_date%TYPEISv_payment_date payment.payment_date%TYPE;
BEGIN  
SELECT MAX(payment_date)  INTO v_payment_date  
FROM payment
  WHERE customer_id = p_customer_id;  
  RETURN v_payment_date;
END;


DECLARE   
 I DATE;
BEGIN
I := get_most_recent_payment(1);
DBMS_OUTPUT.PUT_LINE(I);
END;

--25) Trigger to delete all packages associated with a subscription when the subscription is cancelled:
CREATE OR REPLACE TRIGGER DELETE_PACKAGES_ON_CANCELLATION
AFTER DELETE ON subscription
FOR EACH ROW
BEGIN 
 DELETE FROM packages  
WHERE subscription_id = :OLD.subscription_id;
END;

DELETE FROM subscription
WHERE subscription_id = 1;


select max(monthly_fee)
from packages
where monthly_fee !=
                    (select max(monthly_fee)
                    from packages)
                    where monthly_fee !=
                                        (select max(monthly_fee)
                                        from packages);

select m1.monthly_fee
from packages m1
where 2=(select count(distinct monthly_fee)
         from packages m2
         where m2.monthly_fee>m1.monthly_fee);