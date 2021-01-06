-- Q1:1 Nisan 2007 tarihten sonra ödeme yapan müşterileri listeleyen bir sorgu yazınız.


select DISTINCT(c.email),c.first_name, c.last_name, p.payment_date
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id 
where p.payment_date > '2007-04-01' ;


-- Q2:Aksiyon ve Animasyon kategorisindeki filmlerin çıkış tarihlerini, başlığını ve kategorisini listeleyen bir sorgu yazınız.

select film.title, film.release_year, category.name
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id= category.category_id
where category.name = 'Action' OR category.name='Animation';

-- Q3 :Film kiralama ödemesini en yakın tarihte yapan müşterilerin adı, soyadını ve ödeme tarihini listeleyen bir sorgu yazınız.


SELECT c.first_name, c.last_name, p.payment_date
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id
where p.payment_date = (select max(payment_date) from payment); 

-- Q4:P ve P'den sonraki harflerle başlayan ve stokta bulunmayan filmleri listeleyen bir sorgu yazınız.

SELECT f.title
FROM film AS f
INNER JOIN inventory AS i
ON f.film_id = i.film_id 
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
WHERE f.title SIMILAR TO '[P-Z]%' AND r.return_date IS NULL ;

-- Q5:B harfi ile başlayan müşterileri, film kiralamak için ödedikleri toplam miktarları ile birlikte listeleyen bir sorgu yazınız.



SELECT customer.first_name, customer.last_name, SUM(payment.amount) 
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id 
where customer.first_name LIKE 'B%' group by customer.first_name, customer.last_name;
