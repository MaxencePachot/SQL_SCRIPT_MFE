-- Delete E_COMMERCE database
DROP DATABASE IF EXISTS E_COMMERCE;

-- Create E_COMMERCE database
CREATE DATABASE IF NOT EXISTS E_COMMERCE;

-- Use E_COMMERCE database
USE E_COMMERCE;

-- Delete shipper table
DROP TABLE IF EXISTS shipper;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS shipper (
shipper_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
shipper_name VARCHAR(255)
);

-- Delete Categories table
DROP TABLE IF EXISTS category;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS category (
category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255),
category_description TEXT
);

-- Delete country table
DROP TABLE IF EXISTS country;

-- Create country table
CREATE TABLE IF NOT EXISTS country (
country_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(255),
country_code VARCHAR(2)
);

-- Delete city table
DROP TABLE IF EXISTS city;

-- Create city table
CREATE TABLE IF NOT EXISTS city (
city_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
city_name VARCHAR(255),
city_country_id INT
);

-- Add foreign key reference to city table
ALTER TABLE city ADD FOREIGN KEY (city_country_id) REFERENCES country(country_id);

-- Delete address table
DROP TABLE IF EXISTS address;

-- Create address table
CREATE TABLE IF NOT EXISTS address (
address_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
address_street VARCHAR(255),
address_postal_code VARCHAR(10),
address_city_id INT
);

-- Add foreign key reference to address table
ALTER TABLE address ADD FOREIGN KEY (address_city_id) REFERENCES city(city_id);

-- Delete customer table
DROP TABLE IF EXISTS customer;

-- Create customer table
CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_first_name VARCHAR(50),
customer_last_name VARCHAR(50),
customer_email VARCHAR(100),
customer_address_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add foreign key reference to customer table
ALTER TABLE customer ADD FOREIGN KEY (customer_address_id) REFERENCES address(address_id);

-- Delete suppliers table
DROP TABLE IF EXISTS supplier;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS supplier (
supplier_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(50),
supplier_address_id INT
);

-- Add foreign key reference to supplier table
ALTER TABLE supplier ADD FOREIGN KEY (supplier_address_id) REFERENCES address(address_id);

-- Delete product table
DROP TABLE IF EXISTS product;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS product (
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255),
product_price INT,
product_description TEXT,
product_supplier_id INT,
product_category_id INT
);

-- Add foreign key references to product table
ALTER TABLE product ADD FOREIGN KEY (product_supplier_id) REFERENCES supplier(supplier_id);
ALTER TABLE product ADD FOREIGN KEY (product_category_id) REFERENCES category(category_id);

-- Delete statut table
DROP TABLE IF EXISTS statut;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS statut (
statut_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
statut_name VARCHAR(50)
);

-- Delete orders table
DROP TABLE IF EXISTS orders;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS orders (
orders_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
orders_date DATE,
orders_customer_id INT,
orders_statut_id INT,
orders_shipper_id INT
);

-- Add foreign key references to orders table
ALTER TABLE orders ADD FOREIGN KEY (orders_customer_id) REFERENCES customer(customer_id);
ALTER TABLE orders ADD FOREIGN KEY (orders_statut_id) REFERENCES statut(statut_id);
ALTER TABLE orders ADD FOREIGN KEY (orders_shipper_id) REFERENCES shipper(shipper_id);


-- Delete orders_quantity table
DROP TABLE IF EXISTS orders_quantity;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS orders_quantity (
orders_quantity_quantity INT,
orders_quantity_orders_id INT,
orders_quantity_product_id INT
);

-- Add foreign key references to orders_quantity table
ALTER TABLE orders_quantity ADD FOREIGN KEY (orders_quantity_orders_id) REFERENCES orders(orders_id);
ALTER TABLE orders_quantity ADD FOREIGN KEY (orders_quantity_product_id) REFERENCES product(product_id);

-- Delete phone table
DROP TABLE IF EXISTS phone;

-- Create a new table if it does not already exist and link it to the database
CREATE TABLE IF NOT EXISTS phone (
phone_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
phone_number VARCHAR(20),
phone_customer_id INT,
phone_supplier_id INT,
phone_shipper_id INT
);

-- Add foreign key references to phone table
ALTER TABLE phone ADD FOREIGN KEY (phone_customer_id) REFERENCES customer(customer_id);
ALTER TABLE phone ADD FOREIGN KEY (phone_supplier_id) REFERENCES supplier(supplier_id);
ALTER TABLE phone ADD FOREIGN KEY (phone_shipper_id) REFERENCES shipper(shipper_id);



-- Insert the data into the country table
INSERT INTO country (country_name, country_code) VALUES
('Afghanistan', 'AF'),
('Åland Islands', 'AX'),
('Albania', 'AL'),
('Algeria', 'DZ'),
('American Samoa', 'AS'),
('Andorra', 'AD'),
('Angola', 'AO'),
('Anguilla', 'AI'),
('Antarctica', 'AQ'),
('Antigua and Barbuda', 'AG'),
('Argentina', 'AR'),
('Armenia', 'AM'),
('Aruba', 'AW'),
('Australia', 'AU'),
('Austria', 'AT'),
('Azerbaijan', 'AZ'),
('Bahamas', 'BS'),
('Bahrain', 'BH'),
('Bangladesh', 'BD'),
('Barbados', 'BB'),
('Belarus', 'BY'),
('Belgium', 'BE'),
('Belize', 'BZ'),
('Benin', 'BJ'),
('Bermuda', 'BM'),
('Bhutan', 'BT'),
('Bolivia, Plurinational State of', 'BO'),
('Bonaire, Sint Eustatius and Saba', 'BQ'),
('Bosnia and Herzegovina', 'BA'),
('Botswana', 'BW'),
('Bouvet Island', 'BV'),
('Brazil', 'BR'),
('British Indian Ocean Territory', 'IO'),
('Brunei Darussalam', 'BN'),
('Bulgaria', 'BG'),
('Burkina Faso', 'BF'),
('Burundi', 'BI'),
('Cambodia', 'KH'),
('Cameroon', 'CM'),
('Canada', 'CA'),
('Cape Verde', 'CV'),
('Cayman Islands', 'KY'),
('Central African Republic', 'CF'),
('Chad', 'TD'),
('Chile', 'CL'),
('China', 'CN'),
('Christmas Island', 'CX'),
('Cocos (Keeling) Islands', 'CC'),
('Colombia', 'CO'),
('Comoros', 'KM'),
('Congo', 'CG'),
('Congo, the Democratic Republic of the', 'CD'),
('Cook Islands', 'CK'),
('Costa Rica', 'CR'),
('Côte d''Ivoire', 'CI'),
('Croatia', 'HR'),
('Cuba', 'CU'),
('Curaçao', 'CW'),
('Cyprus', 'CY'),
('Czech Republic', 'CZ'),
('Denmark', 'DK'),
('Djibouti', 'DJ'),
('Dominica', 'DM'),
('Dominican Republic', 'DO'),
('Ecuador', 'EC'),
('Egypt', 'EG'),
('El Salvador', 'SV'),
('Equatorial Guinea', 'GQ'),
('Eritrea', 'ER'),
('Estonia', 'EE'),
('Ethiopia', 'ET'),
('Falkland Islands (Malvinas)', 'FK'),
('Faroe Islands', 'FO'),
('Fiji', 'FJ'),
('Finland', 'FI'),
('France', 'FR'),
('French Guiana', 'GF'),
('French Polynesia', 'PF'),
('French Southern Territories', 'TF'),
('Gabon', 'GA'),
('Gambia', 'GM'),
('Georgia', 'GE'),
('Germany', 'DE'),
('Ghana', 'GH'),
('Gibraltar', 'GI'),
('Greece', 'GR'),
('Greenland', 'GL'),
('Grenada', 'GD'),
('Guadeloupe', 'GP'),
('Guam', 'GU'),
('Guatemala', 'GT'),
('Guernsey', 'GG'),
('Guinea', 'GN'),
('Guinea-Bissau', 'GW'),
('Guyana', 'GY'),
('Haiti', 'HT'),
('Heard Island and McDonald Islands', 'HM'),
('Holy See (Vatican City State)', 'VA'),
('Honduras', 'HN'),
('Hong Kong', 'HK'),
('Hungary', 'HU'),
('Iceland', 'IS'),
('India', 'IN'),
('Indonesia', 'ID'),
('Iran, Islamic Republic of', 'IR'),
('Iraq', 'IQ'),
('Ireland', 'IE'),
('Isle of Man', 'IM'),
('Israel', 'IL'),
('Italy', 'IT'),
('Jamaica', 'JM'),
('Japan', 'JP'),
('Jersey', 'JE'),
('Jordan', 'JO'),
('Kazakhstan', 'KZ'),
('Kenya', 'KE'),
('Kiribati', 'KI'),
('Korea, Democratic People''s Republic of', 'KP'),
('Korea, Republic of', 'KR'),
('Kuwait', 'KW'),
('Kyrgyzstan', 'KG'),
('Lao People''s Democratic Republic', 'LA'),
('Latvia', 'LV'),
('Lebanon', 'LB'),
('Lesotho', 'LS'),
('Liberia', 'LR'),
('Libya', 'LY'),
('Liechtenstein', 'LI'),
('Lithuania', 'LT'),
('Luxembourg', 'LU'),
('Macao', 'MO'),
('Macedonia, the Former Yugoslav Republic of', 'MK'),
('Madagascar', 'MG'),
('Malawi', 'MW'),
('Malaysia', 'MY'),
('Maldives', 'MV'),
('Mali', 'ML'),
('Malta', 'MT'),
('Marshall Islands', 'MH'),
('Martinique', 'MQ'),
('Mauritania', 'MR'),
('Mauritius', 'MU'),
('Mayotte', 'YT'),
('Mexico', 'MX'),
('Micronesia, Federated States of', 'FM'),
('Moldova, Republic of', 'MD'),
('Monaco', 'MC'),
('Mongolia', 'MN'),
('Montenegro', 'ME'),
('Montserrat', 'MS'),
('Morocco', 'MA'),
('Mozambique', 'MZ'),
('Myanmar', 'MM'),
('Namibia', 'NA'),
('Nauru', 'NR'),
('Nepal', 'NP'),
('Netherlands', 'NL'),
('New Caledonia', 'NC'),
('New Zealand', 'NZ'),
('Nicaragua', 'NI'),
('Niger', 'NE'),
('Nigeria', 'NG'),
('Niue', 'NU'),
('Norfolk Island', 'NF'),
('Northern Mariana Islands', 'MP'),
('Norway', 'NO'),
('Oman', 'OM'),
('Pakistan', 'PK'),
('Palau', 'PW'),
('Palestine, State of', 'PS'),
('Panama', 'PA'),
('Papua New Guinea', 'PG'),
('Paraguay', 'PY'),
('Peru', 'PE'),
('Philippines', 'PH'),
('Pitcairn', 'PN'),
('Poland', 'PL'),
('Portugal', 'PT'),
('Puerto Rico', 'PR'),
('Qatar', 'QA'),
('Réunion', 'RE'),
('Romania', 'RO'),
('Russian Federation', 'RU'),
('Rwanda', 'RW'),
('Saint Barthélemy', 'BL'),
('Saint Helena, Ascension and Tristan da Cunha', 'SH'),
('Saint Kitts and Nevis', 'KN'),
('Saint Lucia', 'LC'),
('Saint Martin (French part)', 'MF'),
('Saint Pierre and Miquelon', 'PM'),
('Saint Vincent and the Grenadines', 'VC'),
('Samoa', 'WS'),
('San Marino', 'SM'),
('Sao Tome and Principe', 'ST'),
('Saudi Arabia', 'SA'),
('Senegal', 'SN'),
('Serbia', 'RS'),
('Seychelles', 'SC'),
('Sierra Leone', 'SL'),
('Singapore', 'SG'),
('Sint Maarten (Dutch part)', 'SX'),
('Slovakia', 'SK'),
('Slovenia', 'SI'),
('Solomon Islands', 'SB'),
('Somalia', 'SO'),
('South Africa', 'ZA'),
('South Georgia and the South Sandwich Islands', 'GS'),
('South Sudan', 'SS'),
('Spain', 'ES'),
('Sri Lanka', 'LK'),
('Sudan', 'SD'),
('Suriname', 'SR'),
('Svalbard and Jan Mayen', 'SJ'),
('Swaziland', 'SZ'),
('Sweden', 'SE'),
('Switzerland', 'CH'),
('Syrian Arab Republic', 'SY'),
('Taiwan, Province of China', 'TW'),
('Tajikistan', 'TJ'),
('Tanzania, United Republic of', 'TZ'),
('Thailand', 'TH'),
('Timor-Leste', 'TL'),
('Togo', 'TG'),
('Tokelau', 'TK'),
('Tonga', 'TO'),
('Trinidad and Tobago', 'TT'),
('Tunisia', 'TN'),
('Turkey', 'TR'),
('Turkmenistan', 'TM'),
('Turks and Caicos Islands', 'TC'),
('Tuvalu', 'TV'),
('Uganda', 'UG'),
('Ukraine', 'UA'),
('United Arab Emirates', 'AE'),
('United Kingdom', 'GB'),
('United States', 'US'),
('United States Minor Outlying Islands', 'UM'),
('Uruguay', 'UY'),
('Uzbekistan', 'UZ'),
('Vanuatu', 'VU'),
('Venezuela, Bolivarian Republic of', 'VE'),
('Viet Nam', 'VN'),
('Virgin Islands, British', 'VG'),
('Virgin Islands, U.S.', 'VI'),
('Wallis and Futuna', 'WF'),
('Western Sahara', 'EH'),
('Yemen', 'YE'),
('Zambia', 'ZM'),
('Zimbabwe', 'ZW');

INSERT INTO city (city_name, city_country_id) VALUES 
('Paris', 75),
('Madrid', 176),
('Berlin', 14),
('Rome', 93),
('Vienna', 24),
('Athens', 32),
('Amsterdam', 17),
('Brussels', 29),
('Budapest', 60),
('Copenhagen', 54),
('Dublin', 108),
('Helsinki', 71),
('Lisbon', 155),
('Oslo', 161),
('Prague', 52),
('Stockholm', 170),
('Warsaw', 164),
('Zurich', 196),
('Barcelona', 176),
('Munich', 14),
('Venice', 93),
('Salzburg', 24),
('Santorini', 32),
('Rotterdam', 17),
('Ghent', 29),
('Krakow', 164),
('Cologne', 14),
('Lyon', 75),
('Florence', 93),
('Bruges', 29),
('Reykjavik', 100),
('Tallinn', 78),
('Valletta', 139),
('St. Petersburg', 172),
('Lucerne', 196),
('Bergen', 161),
('Belfast', 108);
 
INSERT INTO address (address_street, address_postal_code, address_city_id) VALUES
('Avenue des Champs-Élysées', '75008', 1),
('Gran Vía', '28013', 2),
('Unter den Linden', '10117', 3),
('Via dei Fori Imperiali', '00186', 4),
('Kärntner Straße', '1010', 5),
('Adrianou', '105 58', 6),
('Dam Square', '1012 JS', 7),
('Grand Place', '1000', 8),
('Budapesti út', '1024', 9),
('Rådhuspladsen', '1599', 10),
('Connell Street Upper', 'D01 F5P2', 11),
('Helsinki Railway Square', '00100', 12),
('Praça do Comércio', '1100-148', 13),
('Karl Johans gate', '0154', 14),
('Staromestske namesti', '110 00', 15),
('Slottsbacken', '111 30', 16),
('Plac Zamkowy', '00-277', 17),
('Bahnhofstrasse', '8001', 18),
('Passeig de Gràcia', '08008', 19),
('Marienplatz', '80331', 20),
('Piazza San Marco', '30124', 21),
('Getreidegasse', '5020', 22),
('Fira', '847 00', 23),
('Mauritsweg', '3012 JT', 7),
('Sint-Baafsplein', '9000', 8), 
('Wawel 5', '31-001', 24),
('Domplatz', '50667', 14),
('Place Bellecour', '69002', 1),
('Piazza del Duomo', '50122', 4),
('Grote Markt', '8000', 8),
('Aðalstræti', '101', 25),
('Vene tänav', '10123', 26),
('Republic Street', 'VLT 1117', 27),
('Nevsky Prospekt', '190000', 28),
('Bahnhofstrasse', '6003', 29),
('Bryggen', '5003', 30),
('Donegall Square North', 'BT1 5GA', 11);

INSERT INTO category (category_name, category_description) VALUES 
('Books', 'Fiction and non-fiction books'),
('Electronics', 'TVs, computers, and other electronics'),
('Clothing', 'Men, women, and children clothing'),
('Home & Garden', 'Furniture, home decor, and gardening supplies'),
('Beauty', 'Makeup, skincare, and beauty products'),
('Sports & Outdoors', 'Sporting goods and outdoor equipment'),
('Toys & Games', 'Toys, board games, and puzzles'),
('Music', 'CDs, vinyl records, and musical instruments'),
('Movies & TV Shows', 'DVDs, Blu-rays, and digital movies'),
('Food & Drink', 'Groceries, snacks, and drinks');

INSERT INTO supplier (supplier_name, supplier_address_id) VALUES 
('Acme Inc.', 1),
('XYZ Corporation', 2),
('Global Industries', 3),
('Smith & Co.', 4),
('Jones Enterprises', 5),
('Johnson & Sons', 6),
('Brown Manufacturing', 7),
('Robinson & Co.', 8),
('Davis Enterprises', 9),
('Wilson & Sons', 10);


INSERT INTO statut (statut_name) VALUES 
('DELIVERED'),
('SHIPPED'),
('PROCESSING'),
('PENDING');

INSERT INTO shipper (shipper_name) VALUES 
('UPS'),
('FedEx'),
('DHL'),
('USPS'),
('TNT');

INSERT INTO product (product_name, product_price, product_description, product_supplier_id, product_category_id) VALUES
('French Baguette', 3, 'A classic French bread with a crispy crust and soft interior', 1, 10),
('Paella', 20, 'A traditional Spanish dish made with saffron rice, seafood, and chicken', 2, 10),
('Bratwurst', 5, 'A German sausage made with pork and flavored with herbs and spices', 3, 3),
('Pizza Margherita', 10, 'A classic Italian pizza with tomato sauce, mozzarella cheese, and basil', 4, 10),
('Wiener Schnitzel', 18, 'A thin, breaded and fried veal cutlet, a specialty of Austria', 5, 10),
('Moussaka', 15, 'A Greek casserole dish made with layers of eggplant, meat, and tomato sauce', 6, 10),
('Stroopwafel', 2, 'A Dutch cookie made from two thin layers of baked dough and caramel syrup', 7, 10),
('Belgian Chocolate', 8, 'Luxurious chocolate made in Belgium with high quality cocoa beans', 8, 10),
('Goulash', 12, 'A Hungarian stew made with beef, paprika, and vegetables', 9, 10),
('Danish Pastry', 4, 'A sweet pastry made with layers of buttery dough and fruit or custard filling', 10, 10),
('Croissant', 2, 'A buttery, flaky pastry that originated in France.', 1, 10),
('Baguette', 1, 'A long, thin loaf of French bread that is commonly made from basic lean dough.', 1, 10),
('Churro', 2, 'A fried dough pastry that is popular in Spain, Portugal, and Latin American countries.', 2, 10),
('Paella', 20, 'A traditional Spanish dish that typically consists of rice, saffron, vegetables, and meat or seafood.', 2, 10),
('Bratwurst', 5, 'A type of German sausage made from pork or beef that is usually grilled or fried.', 3, 10),
('Sauerkraut', 4, 'A finely chopped and pickled cabbage that is often served as a side dish in German cuisine.', 3, 10),
('Pizza Margherita', 12, 'A classic Italian pizza that is topped with tomato sauce, mozzarella cheese, and fresh basil.', 4, 10),
('Spaghetti Carbonara', 15, 'An Italian pasta dish that is made with egg, hard cheese, and bacon or pancetta.', 4, 10),
('Wiener Schnitzel', 18, 'A traditional Austrian dish that features a thin, breaded and fried veal cutlet.', 5, 10),
('Apfelstrudel', 6, 'A sweet Austrian pastry that is made with thinly sliced apples, sugar, cinnamon, and raisins.', 5, 10),
('Moussaka', 14, 'A Greek casserole that typically consists of layers of eggplant, ground meat, and tomato sauce.', 6, 10),
('Greek Salad', 8, 'A fresh and colorful salad that typically includes tomatoes, cucumbers, feta cheese, and olives.', 6, 10),
('Stroopwafel', 3, 'A Dutch waffle made from two thin layers of baked dough with a caramel-like syrup filling.', 7, 10),
('Bitterballen', 7, 'A Dutch snack food that consists of small, deep-fried balls filled with a ragout-like mixture.', 7, 10),
('Belgian Waffle', 5, 'A type of waffle that is usually lighter, crispier, and has larger squares than regular waffles.', 8, 10),
('Mussels and Fries', 18, 'A popular Belgian dish that consists of steamed mussels in a white wine and herb broth, served with fries.', 8, 10),
('Goulash', 10, 'A Hungarian stew that typically includes meat, vegetables, and spices, and is often served with bread or dumplings.', 9, 10),
('Chicken Paprikash', 13, 'A Hungarian dish that features chicken in a creamy paprika sauce, often served over egg noodles.', 9, 10),
('Smørrebrød', 6, 'A Danish open-faced sandwich that typically includes a variety of toppings on rye bread.', 10, 4),
('Frikadeller', 8, 'A Danish meatball that is typically made with ground pork, veal, or beef, and served with potatoes and gravy.', 10, 10);

INSERT INTO customer (customer_first_name, customer_last_name, customer_email, customer_address_id) VALUES
('John', 'Doe', 'johndoe@example.com', 1),
('Jane', 'Doe', 'janedoe@example.com', 2),
('Bob', 'Smith', 'bobsmith@example.com', 3),
('Alice', 'Johnson', 'alicejohnson@example.com', 4),
('Mike', 'Brown', 'mikebrown@example.com', 5),
('Emily', 'Davis', 'emilydavis@example.com', 6),
('Chris', 'Wilson', 'chriswilson@example.com', 7),
('Jessica', 'Garcia', 'jessicagarcia@example.com', 8),
('David', 'Lee', 'davidlee@example.com', 9),
('Karen', 'Taylor', 'karentaylor@example.com', 10),
('Steven', 'Martin', 'stevenmartin@example.com', 11),
('Maria', 'Gonzalez', 'mariagonzalez@example.com', 12),
('Daniel', 'Clark', 'danielclark@example.com', 13),
('Linda', 'Moore', 'lindamoore@example.com', 14),
('Andrew', 'Jackson', 'andrewjackson@example.com', 15),
('Susan', 'Thomas', 'susanthomas@example.com', 16),
('Kevin', 'Lee', 'kevinlee@example.com', 17),
('Amanda', 'Hall', 'amandahall@example.com', 18),
('Eric', 'Young', 'ericyoung@example.com', 19),
('Kimberly', 'Wright', 'kimberlywright@example.com', 20),
('Brian', 'White', 'brianwhite@example.com', 21),
('Melissa', 'Adams', 'melissaadams@example.com', 22),
('Matthew', 'Scott', 'matthewscott@example.com', 23),
('Stephanie', 'Green', 'stephaniegreen@example.com', 24),
('William', 'Baker', 'williambaker@example.com', 25),
('Patricia', 'Nelson', 'patricianelson@example.com', 26),
('Timothy', 'Carter', 'timothycarter@example.com', 27),
('Amy', 'Mitchell', 'amymitchell@example.com', 28),
('Richard', 'Perez', 'richardperez@example.com', 29),
('Laura', 'Roberts', 'lauraroberts@example.com', 30);

INSERT INTO phone (phone_number, phone_customer_id, phone_supplier_id, phone_shipper_id) VALUES
('555-123-4567', 1, NULL, NULL),
('555-234-5678', 2, NULL, NULL),
('555-345-6789', 3, NULL, NULL),
('555-456-7890', 4, NULL, NULL),
('555-567-8901', 5, NULL, NULL),
('555-678-9012', 6, NULL, NULL),
('555-789-0123', 7, NULL, NULL),
('555-890-1234', 8, NULL, NULL),
('555-901-2345', 9, NULL, NULL),
('555-012-3456', 10, NULL, NULL),
('555-123-4567', 11, NULL, NULL),
('555-234-5678', 12, NULL, NULL),
('555-345-6789', 13, NULL, NULL),
('555-456-7890', 14, NULL, NULL),
('555-567-8901', 15, NULL, NULL),
('555-678-9012', 16, NULL, NULL),
('555-789-0123', 17, NULL, NULL),
('555-890-1234', 18, NULL, NULL),
('555-901-2345', 19, NULL, NULL),
('555-012-3456', 20, NULL, NULL),
('555-123-4567', 21, NULL, NULL),
('555-234-5678', 22, NULL, NULL),
('555-345-6789', 23, NULL, NULL),
('555-456-7890', 24, NULL, NULL),
('555-567-8901', 25, NULL, NULL),
('555-678-9012', 26, NULL, NULL),
('555-789-0123', 27, NULL, NULL),
('555-890-1234', 28, NULL, NULL),
('555-901-2345', 29, NULL, NULL),
('555-012-3456', 30, NULL, NULL),
('555-111-2222', NULL, 1, NULL),
('555-222-3333', NULL, 2, NULL),
('555-333-4444', NULL, 3, NULL),
('555-444-5555', NULL, 4, NULL),
('555-555-6666', NULL, 5, NULL),
('555-666-7777', NULL, 6, NULL),
('555-777-8888', NULL, 7, NULL),
('555-888-9999', NULL, 8, NULL),
('555-999-0000', NULL, 9, NULL),
('555-000-1511', NULL, 10, NULL),
('555-111-2282', NULL, NULL, 1),
('555-222-3393', NULL, NULL, 2),
('555-333-5464', NULL, NULL, 3),
('555-444-1155', NULL, NULL, 4),
('555-555-6796', NULL, NULL, 5);