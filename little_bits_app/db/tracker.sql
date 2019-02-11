DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;


CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  tag_type VARCHAR(255)
);

CREATE TABLE merchants(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  date_added TIMESTAMP DEFAULT NOW()
);
