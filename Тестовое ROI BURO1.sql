create DATABASE shop;
use shop;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

INSERT INTO orders VALUES
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 2, DEFAULT, DEFAULT);

INSERT INTO users VALUES
  (DEFAULT, 'alex73', '1982-10-11', NOW(), NOW()),
  (DEFAULT, 'admin', '1990-01-01', NOW(), NOW()),
  (DEFAULT, 'third client', '1990-01-01', NOW(), NOW());

/* Задание 1: Решение */
SELECT DISTINCT(name)
  FROM users
 INNER JOIN orders ON users.id=orders.user_id;
