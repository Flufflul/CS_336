USE auction;

/*DELETE FROM users
WHERE username NOT NULL;*/

/*ALTER TABLE users AUTO_INCREMENT = 1;*/

/*Users*/
INSERT INTO users (username, password, email) VALUES ('forename', 'surname', 'fs@gmail.com');
INSERT INTO users (username, password, email) VALUES ('username', 'password', 'up@gmail.com');
INSERT INTO users (username, password, email) VALUES ('jakobs', 'b0rderl2nds3', 'jb@gmail.com');
INSERT INTO users (username, password, email) VALUES ('pink', 'floyd', 'dgilmour@gmail.com');
INSERT INTO users (username, password, email) VALUES ('m2m2', 'asdflkjh', 'm2m2@gmail.com');
INSERT INTO users (username, password, email) VALUES ('justa', 'normalperson', 'nisemono@gmail.com');
INSERT INTO users (username, password, email) VALUES ('fake', 'user', 'fake@gmail.com');
INSERT INTO users (username, password, email) VALUES ('notafake', 'user', 'notfake@gmail.com');
INSERT INTO users (username, password, email) VALUES ('not a real person', 'password', 'notreal2@gmail.com');
INSERT INTO users (username, password, email) VALUES ('also not real', 'password', 'notreal@gmail.com');
INSERT INTO users (username, password, email) VALUES ('heyihavethesame', 'password', 'hp@gmail.com');
INSERT INTO users (username, password, email) VALUES ('mynameismypassword', 'mynameismypassword', 'bp@gmail.com');
INSERT INTO users (username, password, email) VALUES ('iNeedHelp', 'helphelphelp', 'helpme@gmail.com');

/*  Buyers  */
INSERT INTO users (username, password, email) VALUES ('thief', 'thiefPW', 'thief@gmail.com');
INSERT INTO buyers (buyer_id) VALUES ('thief');

INSERT INTO users (username, password, email) VALUES ('Slash', 'notGNR', 'sh@gmail.com');
INSERT INTO buyers (buyer_id) VALUES ('Slash');

INSERT INTO users (username, password, email) VALUES ('NotCameron','AlsoNotCameron', 'cch@gmail.com');
INSERT INTO buyers (buyer_ID) VALUES ('NotCameron');

INSERT INTO users(username, password, email) VALUES ('yui', 'httc', 'yuihttc@gmail.com');
INSERT INTO buyers (buyer_ID) VALUES ('yui');

INSERT INTO users(username, password, email) VALUES ('asuza', '1969mustang', 'asuzakon@gmail.com');
INSERT INTO buyers (buyer_ID) VALUES ('asuza');


/*	sellers	*/
INSERT INTO users(username, password, email) VALUES ('jerryCantrell', 'nutshellInABox', 'jc@gmail.com');
INSERT INTO sellers (seller_id) VALUES('jerryCantrell');

INSERT INTO users(username, password, email) VALUES ('joeperry', 'livinOnTheEdge', 'jp@gmail.com');
INSERT INTO sellers (seller_id) VALUES('joeperry');

INSERT INTO sellers(seller_id) VALUES('NotCameron');
INSERT INTO sellers (seller_id) VALUES ('thief');

/*Administrators and representatives*/
INSERT INTO users (username, password, email) VALUES ('rep1', 'reppw', 'rep1@gmail.com');
INSERT INTO Customer_Rep (rep_name) VALUES ((SELECT u.username FROM users u WHERE username = 'rep1'));

INSERT INTO users (username, password, email) VALUES ('secretHackerman', 'secretHackerman', 'noteliot@gmail.com');
INSERT INTO Customer_Rep (rep_name) VALUES ((SELECT u.username FROM users u WHERE username = 'secretHackerman'));

INSERT INTO users (username, password, email) VALUES ('admin1', 'adminpw', 'allpowerfuladmin@gmail.com');
INSERT INTO Admin_Staff (admin_name) VALUES ((SELECT u.username FROM users u WHERE username = 'admin1'));

INSERT INTO users (username, password, email) VALUES ('CameronsAdminPower', 'ImMorePowerfulThanAdmin1', 'cch1234@gmail.com');
INSERT INTO Admin_Staff (admin_name) VALUES ((SELECT u.username FROM users u WHERE username = 'CameronsAdminPower'));


/*    Items    */
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (310970, 'Fender Squier 70s Classic Vibe', 'Fender', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (32010, 'Kenny Hickey Signature', 'Schecter', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (191959, '1959 Les Paul', 'Gibson', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (132018, 'Marty Friedman Signature', 'Jackson', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (742019, 'RGA742FM', 'Ibanez', 7);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (11600, 'APX600', 'Yamaha', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (101996, 'JF30', 'Guild', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (100827, 'AWN100', 'Giannini', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (111996, 'D50', 'Guild', 6);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (209000, 'Omen-4 Bass', 'Schecter', 4);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (107600, 'Johnny Christ 5 Bass', 'Schecter', 5);
INSERT INTO Items (item_id, model_name, manufacturer, num_strings) VALUES (720042, 'Frank Bello J-4', 'ESP', 4);

/*    Electric guitars and basses   */
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (310970, 'SSS');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (32010, 'HH');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (191959, 'HH');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (132018, 'HH');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (742019, 'HH');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (209000, 'HH');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (107600, 'HS');
INSERT INTO Electric_Guitar(item_id, pickup_config) VALUES (720042, 'HS');



/*     Acoustics    */
INSERT INTO Acoustic_Guitar(item_id, is_classical) VALUES (101996, 0);
INSERT INTO Acoustic_Guitar(item_id, is_classical) VALUES (111996, 0);
INSERT INTO Acoustic_Guitar(item_id, is_classical) VALUES (100827, 1);

/*     Acoustic electrics    */
INSERT INTO Acoustic_Electric_Guitar(item_id, pickup_type, includes_tuner) VALUES (11600, 'SRT Piezo', 0);

/*
AUCTIONS
Datetime format:   YYYY-MM-DD HH:MM:SS
the time section is in military time, to write 2:30pm, you write 14:30:00
Example:  2021-09-21 15:30:00    =  3:30pm and 0 seconds, on september 21st, 2021 
*/
INSERT INTO makes_auction VALUES 
('jerryCantrell', 111996, '2021-01-28 03:03:10', '2021-4-28 14:00:00', 500.00, 450.00, 550.00, 10, 0, ''),
('joeperry', 191959, '2021-01-28 03:03:10', '2021-2-28 15:00:00', 50000.00, 45000.00, 55000.00, 100, 55000.00, 'Slash'), /*tuple where someone used 'buy now' feature*/
('thief', 101996, '2021-04-10 03:03:10', '2021-5-28 15:00:00', 1000.00, 950.00, 1200.00, 100, 1100.00, ''),
('jerryCantrell', 100827, '2021-3-20 03:01:00', '2021-5-10 15:01:00', 900, 850, 940, 50, 1000, '');
/* (seller_username (called seller_id), item_id, start time, end time/expires, starting price, hidden min price, buy now price, min bid increment, highest current bid, winner name(winner name is not foreign key) )*/

INSERT INTO makes_bid VALUES
('Slash', 'joeperry', 191959, 0, 55000, 0, 55000), 
('NotCameron', 'thief', 101996, 1, 1100, 1200, 1000),
('NotCameron', 'jerryCantrell', 100827, 1, 1100, 1150, 900);
/* (buyer, seller, item id, is auto bid, bid, bid max, price)
	I forgot what the 'price' attribute in this table is for so change it if it doesn't match whatever it refers to
*/


/*Customer support tickets*/
INSERT INTO customer_support(user_id, rep_id, ticket_no, question, answer) VALUES('iNeedHelp', 'secretHackerman', 12345, 'Thief is selling a stolen acoustic guitar', 'Thank you for the report');
INSERT INTO customer_support(user_id, rep_id, ticket_no, question, answer) VALUES('iNeedHelp', 'rep1', 128010, 'How do i default on a bid', '');
INSERT INTO customer_support(user_id, rep_id, ticket_no, question, answer) VALUES('iNeedHelp', 'rep1', 543632, 'How do I turn autobid off', '');
INSERT INTO customer_support(user_id, rep_id, ticket_no, question, answer) VALUES('jerryCantrell', 'rep1', 10432, 'My auction for my JF30 disappeared', 'I restored the auction. Someone accidentally removed it');


