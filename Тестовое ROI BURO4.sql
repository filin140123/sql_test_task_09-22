USE shop;

/* Задание 4: Решение */

-- Добавил еще заказов в таблицу orders, чтобы хотя бы у нескольких юзеров было минимум 3 заказа
INSERT INTO orders VALUES
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 3, DEFAULT, DEFAULT),
  (DEFAULT, 3, DEFAULT, DEFAULT),
  (DEFAULT, 3, DEFAULT, DEFAULT);

-- Само решение
SELECT users.name
  FROM users
 WHERE birthday_at <= CURRENT_DATE() - INTERVAL 30 YEAR
   AND name IN (SELECT name
		  FROM users
		 INNER JOIN orders ON users.id=orders.user_id 
                 GROUP BY name 
		HAVING COUNT(name) >= 3)
 ORDER BY RAND()
 LIMIT 1;
                
