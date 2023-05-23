CREATE TABLE IF NOT EXISTS users (
  id int,
  user_name varchar(255),
  CONSTRAINT user_id_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users_settings (
  user_id int,
  theme_id int
);

CREATE TABLE IF NOT EXISTS users_preset_timers (
  user_id int,
  preset_name varchar(255),
  product_id int,
  time_amount_minutes int,
  time_amount_hours int,
  custom_name varchar(255),
  created_at date
);

CREATE TABLE IF NOT EXISTS users_items_relation (
  user_id int,
  item_id int
);

CREATE TABLE IF NOT EXISTS history (
  user_id int,
  time_amount_minutes int,
  time_amount_hours int,
  product_id int,
  completed boolean,
  created_at date
);

CREATE TABLE IF NOT EXISTS products (
  id int,
  minimum_time_in_minutes int,
  product_name varchar(255),
  CONSTRAINT product_id_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS items (
  id int,
  item_name varchar(255),
  price int,
  section_id int,
  asset_file_name varchar(255),
  CONSTRAINT item_id_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS themes (
  id int,
  theme_name varchar(255),
  CONSTRAINT theme_id_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS sections (
  id int,
  section_name varchar(255),
  CONSTRAINT section_id_pk PRIMARY KEY (id)
);