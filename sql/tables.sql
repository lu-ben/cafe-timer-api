CREATE TABLE IF NOT EXISTS themes (
  id int PRIMARY KEY,
  theme_name varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
  id int PRIMARY KEY,
  user_name varchar(255) NOT NULL,
  theme_id int DEFAULT 0,
  FOREIGN KEY (theme_id) REFERENCES themes (id)
);

CREATE TABLE IF NOT EXISTS products (
  id int PRIMARY KEY,
  minimum_time_in_minutes int,
  product_name varchar(255)
);

CREATE TABLE IF NOT EXISTS history (
  user_id int,
  time_amount_minutes int,
  time_amount_hours int,
  product_id int,
  completed boolean,
  created_at date,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS sections (
  id int PRIMARY KEY,
  section_name varchar(255) NOT NULL,
  amount_of_slots int DEFAULT 2
);

CREATE TABLE IF NOT EXISTS items (
  id int PRIMARY KEY,
  item_name varchar(255) NOT NULL,
  price int NOT NULL,
  asset_file_name varchar(255)
);

CREATE TABLE IF NOT EXISTS users_preset_timers (
  id int PRIMARY KEY,
  user_id int NOT NULL,
  preset_name varchar(255) NOT NULL,
  product_id int NOT NULL,
  time_amount_minutes int NOT NULL,
  time_amount_hours int DEFAULT 0,
  created_at date,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE IF NOT EXISTS users_items_relation (
  user_id int NOT NULL,
  item_id int NOT NULL,
  section_id int NOT NULL,
  slot_number int NOT NULL,
  PRIMARY key (user_id, item_id, section_id, slot_number),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE,
  FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS items_sections_relation (
  item_id int NOT NULL,
  section_id int NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE,
  FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE CASCADE
)

/*  
Each section has a fixed amount of slots for items
Each item has a set number of sections it can be placed in
If an item can be placed in section 1 it can be placed in all of its slots
*/
