--Write a query to get the num of copies of a film in inventory
--Try to use  a subquery instead of a join

SELECT film.title,
       (SELECT COUNT(inventory.film_id)
		FROM inventory 
		WHERE inventory.film_id = film.film_id)as "Number of Copies"
  FROM film 
  order by film.title;

--Create a view named 'title_count' from the above query

Create View title_count as 
	Select film.title,
		(Select Count(inventory.film_id)
		From inventory
		where inventory.film_id = film.film_id) as "Number of Copies"
		From film
		Order by film.title;
Select * from title_count;

--Query new table to find all the titles that have 7 copies
Select * From title_count
	where "Number of Copies" = 7



