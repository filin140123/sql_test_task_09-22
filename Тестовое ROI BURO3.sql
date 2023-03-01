CREATE DATABASE sample;
   USE sample;

  DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users VALUES
  (DEFAULT, 'sample user', '1990-01-01', DEFAULT, DEFAULT);

/* Задание 3: Решение */

 START TRANSACTION;
 
INSERT INTO sample.users(name, birthday_at, created_at, updated_at) 
SELECT name, birthday_at, created_at, updated_at
  FROM shop.users
 WHERE id=1;
 
COMMIT;
 
