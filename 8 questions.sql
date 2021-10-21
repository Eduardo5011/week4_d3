--1. List all customers who live in Texas (use
--JOINs)

SELECT customer.customer_id, customer.first_name,customer.last_name, address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas'



--2. Get all payments above $6.99 with the Customer's Full
--Name

SELECT customer.customer_id,customer.first_name, customer.last_name,payment.amount,payment.customer_id
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount >= 6.99



--3. Show all customers names who have made payments over $175(use
--subqueries)

SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
)


--4. List all customers that live in Nepal (use the city
--table)

SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE city.city = 'Nepal'



--5. Which staff member had the most
--transactions?

Select staff.first_name, staff.last_name,COUNT(payment.staff_id)
FROM payment
JOIN staff
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment.staff_id) DESC



--6. How many movies of each rating are
--there?


SELECT film.rating,count(film.rating)
FROM film
GROUP BY film.rating
ORDER BY COUNT(film.rating) DESC




--7 .Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 6.99
    ORDER BY amount DESC
)

--8,
SELECT COUNT(amount)
FROM payment
WHERE amount = 0