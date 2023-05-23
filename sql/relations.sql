ALTER TABLE users_settings
ADD CONSTRAINT users_settings_user_id 
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE users_settings
ADD CONSTRAINT users_settings_theme_id
FOREIGN KEY (theme_id)
REFERENCES themes (id);

ALTER TABLE users_items_relation
ADD CONSTRAINT users_id
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE users_items_relation
ADD CONSTRAINT items_id
FOREIGN KEY (item_id)
REFERENCES items (id);

ALTER TABLE items
ADD CONSTRAINT items_sections_id
FOREIGN KEY (section_id)
REFERENCES sections (id);

ALTER TABLE users_preset_timers
ADD CONSTRAINT preset_timers_user_id
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE users_preset_timers
ADD CONSTRAINT preset_timers_product_id
FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE history
ADD CONSTRAINT history_user_id
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE history
ADD CONSTRAINT history_product_id
FOREIGN KEY (product_id)
REFERENCES products (id);