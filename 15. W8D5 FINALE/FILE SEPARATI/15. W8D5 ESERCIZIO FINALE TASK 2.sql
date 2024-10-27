-- Creazione del database
CREATE DATABASE ToysgroupDB;

-- Selezione del database
USE ToysgroupDB;


-- Creazione della tabella CATEGORY
CREATE TABLE CATEGORY (
    CategoryID INT,               
    CategoryName VARCHAR(100),   
    CategoryDescription TEXT,     
    CONSTRAINT PK_CATEGORY PRIMARY KEY (CategoryID)
);

-- Creazione della tabella PRODUCT
CREATE TABLE PRODUCT (
    ProductID INT,                                          
    ProductName VARCHAR(100),                                
    Description TEXT,                                       
    CategoryID INT ,                                          
    Price DECIMAL(10, 2),        							
    StockQuantity INT,            							  
    CONSTRAINT PK_PRODUCT PRIMARY KEY (ProductID),
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Creazione della tabella REGION
CREATE TABLE REGION (
    RegionID INT,              								 
    RegionName VARCHAR(100),                                  
    RegionDescription TEXT,                                   
    CONSTRAINT PK_REGION PRIMARY KEY (RegionID)
);

-- Creazione della tabella STATE
CREATE TABLE STATE (
    StateID INT,                                              
    StateName VARCHAR(100),                                   
    RegionID INT,                                             
    CONSTRAINT PK_STATE PRIMARY KEY (StateID),
    CONSTRAINT FK_STATE_REGION FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);


-- Creazione della tabella SALES
CREATE TABLE SALES (
    SalesID INT,                                             
    ProductID INT,                                            
    StateID INT,                                             
    QuantitySold INT,                                         
    SaleDate DATE,                                            
    TotalAmount DECIMAL(10, 2),                              
	CONSTRAINT PK_SALES PRIMARY KEY (SalesID),
    CONSTRAINT FK_SALES_PRODUCT FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_SALES_STATE FOREIGN KEY (StateID) REFERENCES State(StateID)
);




-- TASK 3 INSERIMENTO DATI NEL DB

-- POPOLAZIONE TABLE CATEGORY

INSERT INTO CATEGORY (CategoryID, CategoryName, CategoryDescription)
VALUES 
    (1, 'Educational', 'Educational toys for all ages'),
    (2, 'Electronic', 'Electronic and tech-based toys'),
    (3, 'Outdoor', 'Toys for outdoor play'),
    (4, 'Board Games', 'Board games for family and friends'),
    (5, 'Plush Toys', 'Soft plush toys for children');
    
-- POPOLAZIONE TABLE PRODUCT
INSERT INTO PRODUCT (ProductID, ProductName, Description, CategoryID, Price, StockQuantity)
VALUES 
    (1, 'Building Blocks', 'Colorful building blocks', 1, 15.99, 200),
    (2, 'Robot Kit', 'DIY robot kit', 2, 49.99, 150),
    (3, 'Bicycle', 'Children bicycle', 3, 89.99, 30),
    (4, 'Puzzle', '3D puzzle set', 1, 12.99, 300),
    (5, 'Drone', 'Remote-controlled drone', 2, 99.99, 25),
    (6, 'Water Gun', 'High-power water gun', 3, 8.99, 75),
    (7, 'Chess Set', 'Wooden chess set', 4, 29.99, 120),
    (8, 'Stuffed Bear', 'Large stuffed bear', 5, 19.99, 500),
    (9, 'Alphabet Blocks', 'Educational alphabet blocks', 1, 10.99, 250),
    (10, 'Tablet Toy', 'Tablet with educational games', 2, 39.99, 45),
    (11, 'Scooter', 'Kids scooter', 3, 49.99, 80),
    (12, 'Trivia Game', 'Trivia board game', 4, 24.99, 100),
    (13, 'Stuffed Dog', 'Stuffed toy dog', 5, 14.99, 60),
    (14, 'Science Lab Kit', 'Science experiments kit', 1, 34.99, 110),
    (15, 'Mini Drone', 'Compact mini drone', 2, 59.99, 30),
    (16, 'Swing Set', 'Outdoor swing set', 3, 149.99, 20),
    (17, 'Playing Cards', 'Standard deck of cards', 4, 3.99, 300),
    (18, 'Stuffed Cat', 'Stuffed toy cat', 5, 16.99, 90),
    (19, 'Coloring Book', 'Animal-themed coloring book', 1, 5.99, 400),
    (20, 'Electronic Keyboard', 'Mini keyboard with songs', 2, 29.99, 35),
    (21, 'Roller Skates', 'Children roller skates', 3, 39.99, 60),
    (22, 'Monopoly', 'Classic Monopoly game', 4, 19.99, 80),
    (23, 'Stuffed Elephant', 'Stuffed toy elephant', 5, 17.99, 110),
    (24, 'Chemistry Kit', 'Basic chemistry set', 1, 39.99, 75),
    (25, 'Remote Car', 'Remote-controlled car', 2, 25.99, 50),
    (26, 'Frisbee', 'Outdoor frisbee', 3, 7.99, 150),
    (27, 'Jenga', 'Jenga block game', 4, 12.99, 90),
    (28, 'Stuffed Bunny', 'Soft stuffed bunny', 5, 13.99, 40),
    (29, 'Magnet Set', 'Magnet building set', 1, 20.99, 85),
    (30, 'Toy Phone', 'Kids toy phone', 2, 9.99, 75),
    (31, 'Kite', 'Colorful kite', 3, 6.99, 60),
    (32, 'Risk', 'Strategy board game', 4, 22.99, 55),
    (33, 'Stuffed Lion', 'Stuffed toy lion', 5, 21.99, 70),
    (34, 'Math Puzzles', 'Puzzles to enhance math skills', 1, 11.99, 180),
    (35, 'Toy Camera', 'Children camera', 2, 29.99, 25),
    (36, 'Sand Bucket', 'Outdoor sand bucket and shovel', 3, 4.99, 120),
    (37, 'Clue', 'Murder mystery game', 4, 15.99, 60),
    (38, 'Stuffed Tiger', 'Stuffed toy tiger', 5, 18.99, 30),
    (39, 'Solar Robot', 'Solar-powered robot', 1, 29.99, 40),
    (40, 'Smartwatch', 'Kids smartwatch', 2, 59.99, 20),
    (41, 'Camping Tent', 'Children camping tent', 3, 89.99, 15),
    (42, 'Uno', 'Card game Uno', 4, 9.99, 180),
    (43, 'Stuffed Penguin', 'Stuffed toy penguin', 5, 15.99, 65),
    (44, 'Physics Kit', 'Basic physics set', 1, 28.99, 70),
    (45, 'Electronic Drum', 'Toy drum set', 2, 34.99, 30),
    (46, 'Skateboard', 'Small skateboard for kids', 3, 59.99, 50),
    (47, 'Scrabble', 'Word game Scrabble', 4, 19.99, 55),
    (48, 'Stuffed Giraffe', 'Stuffed toy giraffe', 5, 14.99, 75),
    (49, 'Alphabet Learning Mat', 'Educational mat', 1, 19.99, 95),
    (50, 'Robotic Arm', 'Programmable robotic arm', 2, 79.99, 25);
    
-- POPOLAZIONE TABEL REGION

INSERT INTO REGION (RegionID, RegionName, RegionDescription)
VALUES 
    (1, 'North America', 'United States and Canada'),
    (2, 'Europe', 'Countries in Europe'),
    (3, 'Asia', 'Asian countries'),
    (4, 'South America', 'Countries in South America'),
    (5, 'Australia', 'Australia and surrounding areas');
    
    
-- POPOLAZIONE TABLE STATE
INSERT INTO STATE (StateID, StateName, RegionID)
VALUES 
    (1, 'California', 1),
    (2, 'New York', 1),
    (3, 'Texas', 1),
    (4, 'Ontario', 1),
    (5, 'Berlin', 2),
    (6, 'Paris', 2),
    (7, 'Tokyo', 3),
    (8, 'Seoul', 3),
    (9, 'São Paulo', 4),
    (10, 'Buenos Aires', 4),
    (11, 'Sydney', 5),
    (12, 'Melbourne', 5),
    (13, 'Washington', 1),
    (14, 'Florida', 1),
    (15, 'Moscow', 2),
    (16, 'Rome', 2),
    (17, 'Beijing', 3),
    (18, 'Shanghai', 3),
    (19, 'Lima', 4),
    (20, 'Santiago', 4),
    (21, 'Perth', 5),
    (22, 'Brisbane', 5);
    
    
    -- POPOLAZIONE TABELLA SALES 
    
INSERT INTO SALES (SalesID, ProductID, StateID, QuantitySold, SaleDate, TotalAmount)
VALUES 
(1, 1,8, 5, '2023-01-01', 79.95),
    (2, 2,6, 2, '2023-01-03', 99.98),
    (3, 3,6, 3, '2023-01-04', 269.97),
    (4, 4,2, 7, '2023-01-05', 90.93),
    (5, 5,3, 1, '2023-01-06', 99.99),
    (6, 6,20, 12, '2023-01-10', 107.88),
    (7, 7,19, 6, '2023-01-12', 179.94),
    (8, 8,10, 10, '2023-01-15', 199.90),
    (9, 9,10, 8, '2023-01-18', 87.92),
    (10, 10,18, 3, '2023-01-20', 119.97),
    (11, 11,13, 5, '2023-01-21', 249.95),
    (12, 12,21, 2, '2023-01-25', 49.98),
    (13, 13,15, 4, '2023-01-27', 59.96),
    (14, 14,9, 6, '2023-01-30', 209.94),
    (15, 1,19, 3, '2023-02-01', 79.95),
    (16, 2,17, 2, '2023-02-02', 49.98),
    (17, 3,21, 5, '2023-02-05', 99.95),
    (18, 4,18, 7, '2023-02-07', 190.93),
    (19, 5,5, 1, '2023-02-10', 99.99),
    (20, 6,17, 12, '2023-02-12', 107.88),
    (21, 7,1, 6, '2023-02-14', 179.94),
    (22, 8,21, 10, '2023-02-16', 199.90),
    (23, 9,14, 8, '2023-02-19', 87.92),
    (24, 10,11, 3, '2023-02-22', 119.97),
    (25, 11,19, 5, '2023-02-24', 249.95),
    (26, 12,7, 2, '2023-02-26', 49.98),
    (27, 13,1, 4, '2023-02-28', 59.96),
    (28, 1,16, 8, '2023-03-02', 159.95),
    (29, 2,12, 3, '2023-03-03', 149.98),
    (30, 3,5, 6, '2023-03-05', 99.95),
    (31, 4,20, 4, '2023-03-07', 190.93),
    (32, 5,13, 2, '2023-03-10', 199.99),
    (33, 6,17, 7, '2023-03-11', 129.88),
    (34, 7,17, 11, '2023-03-14', 289.94),
    (35, 8,14, 9, '2023-03-17', 129.90),
    (36, 9,17, 12, '2023-03-19', 199.92),
    (37, 10,16, 5, '2023-03-21', 249.95),
    (38, 11,13, 3, '2023-03-24', 69.98),
    (39, 12,14, 6, '2023-03-26', 59.96),
    (40, 1,11, 10, '2023-04-01', 199.95),
    (41, 2,9, 7, '2023-04-02', 179.98),
    (42, 3,18, 2, '2023-04-05', 59.95),
    (43, 4,15, 8, '2023-04-07', 190.93),
    (44, 5,2, 4, '2023-04-10', 89.99),
    (45, 6,13, 9, '2023-04-12', 129.88),
    (46, 7,19, 3, '2023-04-15', 89.94),
    (47, 8,22, 10, '2023-04-17', 199.90),
    (48, 9,6, 4, '2023-04-19', 119.97),
    (49, 10,14, 5, '2023-04-21', 249.95),
    (50, 11,13, 1, '2023-04-25', 49.98),
    (51, 12,7, 6, '2023-04-28', 59.96),
    (52, 1,2, 5, '2023-05-01', 79.95),
    (53, 2,7, 2, '2023-05-03', 99.98),
    (54, 3,3, 3, '2023-05-04', 269.97),
    (55, 4,7, 7, '2023-05-05', 90.93),
    (56, 5,16, 1, '2023-05-06', 99.99),
    (57, 6,9, 12, '2023-05-10', 107.88),
    (58, 7,11, 6, '2023-05-12', 179.94),
    (59, 8,4, 10, '2023-05-15', 199.90),
    (60, 9,18, 8, '2023-05-18', 87.92),
    (61, 10,13, 3, '2023-05-20', 119.97),
    (62, 11,18, 5, '2023-05-21', 249.95),
    (63, 12,6, 2, '2023-05-25', 49.98),
    (64, 13,12, 4, '2023-05-27', 59.96),
    (65, 14,22, 6, '2023-05-30', 209.94),
    (66, 1,10, 5, '2023-06-01', 79.95),
    (67, 2,15, 2, '2023-06-03', 99.98),
    (68, 3,15, 3, '2023-06-04', 269.97),
    (69, 4,9, 7, '2023-06-05', 90.93),
    (70, 5,5, 1, '2023-06-06', 99.99),
    (71, 6,3, 12, '2023-06-10', 107.88),
    (72, 7,7, 6, '2023-06-12', 179.94),
    (73, 8,12, 10, '2023-06-15', 199.90),
    (74, 9,13, 8, '2023-06-18', 87.92),
    (75, 10,1, 3, '2023-06-20', 119.97),
    (76, 11,20, 5, '2023-06-21', 249.95),
    (77, 12,1, 2, '2023-06-25', 49.98),
    (78, 13,6, 4, '2023-06-27', 59.96),
    (79, 14,12, 6, '2023-06-30', 209.94),
    (80, 1,9, 5, '2023-07-01', 79.95),
    (81, 2,16, 2, '2023-07-03', 99.98),
    (82, 3,3, 3, '2023-07-04', 269.97),
    (83, 4,16, 7, '2023-07-05', 90.93),
    (84, 5,5, 1, '2023-07-06', 99.99),
    (85, 6,11, 12, '2023-07-10', 107.88),
    (86, 7,15, 6, '2023-07-12', 179.94),
    (87, 8,11, 10, '2023-07-15', 199.90),
    (88, 9,8, 8, '2023-07-18', 87.92),
    (89, 10,21, 3, '2023-07-20', 119.97),
    (90, 11,8, 5, '2023-07-21', 249.95),
    (91, 12,1, 2, '2023-07-25', 49.98),
    (92, 13,22, 4, '2023-07-27', 59.96),
    (93, 14,20, 6, '2023-07-30', 209.94),
    (94, 1,6, 5, '2023-08-01', 79.95),
    (95, 2,12, 2, '2023-08-03', 99.98),
    (96, 3,2, 3, '2023-08-04', 269.97),
    (97, 4,2, 7, '2023-08-05', 90.93),
    (98, 5,1, 1, '2023-08-06', 99.99),
    (99, 6,19, 12, '2023-08-10', 107.88),
    (100, 7,9, 6, '2023-08-12', 179.94),
    (101, 8,2, 10, '2023-08-15', 199.90),
    (102, 9,4, 8, '2023-08-18', 87.92),
    (103, 10,17, 3, '2023-08-20', 119.97),
    (104, 11,6, 5, '2023-08-21', 249.95),
    (105, 12,4, 2, '2023-08-25', 49.98),
    (106, 13,15, 4, '2023-08-27', 59.96),
    (107, 14,9, 6, '2023-08-30', 209.94),
    (108, 1,15, 5, '2023-09-01', 79.95),
    (109, 2,16, 2, '2023-09-03', 99.98),
    (110, 3,1, 3, '2023-09-04', 269.97),
    (111, 4,17, 7, '2023-09-05', 90.93),
    (112, 5,16, 1, '2023-09-06', 99.99),
    (113, 6,6, 12, '2023-09-10', 107.88),
    (114, 7,8, 6, '2023-09-12', 179.94),
    (115, 8,21, 10, '2023-09-15', 199.90),
    (116, 9,16, 8, '2023-09-18', 87.92),
    (117, 10,9, 3, '2023-09-20', 119.97),
    (118, 11,18, 5, '2023-09-21', 249.95),
    (119, 12,1, 2, '2023-09-25', 49.98),
    (120, 13,20, 4, '2023-09-27', 59.96),
    (121, 1,6, 5, '2023-10-01', 79.95),
    (122, 2,5, 2, '2023-10-03', 99.98),
    (123, 3,11, 3, '2023-10-04', 269.97),
    (124, 4,11, 7, '2023-10-05', 90.93),
    (125, 5,5, 1, '2023-10-06', 99.99),
    (126, 6,1, 12, '2023-10-10', 107.88),
    (127, 7,20, 6, '2023-10-12', 179.94),
    (128, 8,16, 10, '2023-10-15', 199.90),
    (129, 9,15, 8, '2023-10-18', 87.92),
    (130, 10,3, 3, '2023-10-20', 119.97),
    (131, 11,9, 5, '2023-10-21', 249.95),
    (132, 12,9, 2, '2023-10-25', 49.98),
    (133, 13,21, 4, '2023-10-27', 59.96),
    (134, 1,15, 5, '2023-11-01', 79.95),
    (135, 2,20, 2, '2023-11-03', 99.98),
    (136, 3,11, 3, '2023-11-04', 269.97),
    (137, 4,4, 7, '2023-11-05', 90.93),
    (138, 5,14, 1, '2023-11-06', 99.99),
    (139, 6,10, 12, '2023-11-10', 107.88),
    (140, 7,16, 6, '2023-11-12', 179.94),
    (141, 8,8, 10, '2023-11-15', 199.90),
    (142, 9,18, 8, '2023-11-18', 87.92),
    (143, 10,10, 3, '2023-11-20', 119.97),
    (144, 11,7, 5, '2023-11-21', 249.95),
    (145, 12,5, 2, '2023-11-25', 49.98),
    (146, 13,8, 4, '2023-11-27', 59.96),
    (147, 1,1, 5, '2023-12-01', 79.95),
    (148, 2,3, 2, '2023-12-03', 99.98),
    (149, 3,16, 3, '2023-12-04', 269.97),
    (150, 4,20, 7, '2023-12-05', 90.93),
    (151, 5,16, 1, '2023-12-06', 99.99),
    (152, 6,12, 12, '2023-12-10', 107.88),
    (153, 7,4, 6, '2023-12-12', 179.94),
    (154, 8,10, 10, '2023-12-15', 199.90),
    (155, 9,7, 8, '2023-12-18', 87.92),
    (156, 10,11, 3, '2023-12-20', 119.97),
    (157, 11,22, 5, '2023-12-21', 249.95),
    (158, 12,19, 2, '2023-12-25', 49.98),
    (159, 13,13, 4, '2023-12-27', 59.96),
    (160, 14,18, 6, '2023-12-30', 209.94),
    (161, 1,13, 10, '2023-12-31', 159.95),
    (162, 2,20, 8, '2023-11-30', 119.98),
    (163, 3,3, 6, '2023-10-29', 169.97),
    (164, 4,22, 7, '2023-09-28', 90.93),
    (165, 5,10, 5, '2023-08-27', 99.99),
    (166, 6,18, 4, '2023-07-26', 107.88),
    (167, 7,4, 3, '2023-06-25', 179.94),
    (168, 8,9, 12, '2023-05-24', 199.90),
    (169, 9,13, 8, '2023-04-23', 87.92),
    (170, 10,9, 3, '2023-03-22', 119.97),
    (171, 11,21, 5, '2023-02-21', 249.95),
    (172, 12,16, 2, '2023-01-20', 49.98),
    (173, 13,11, 4, '2023-01-18', 59.96),
    (174, 14,9, 6, '2023-01-15', 209.94),
    (175, 1,2, 7, '2023-02-01', 99.95),
    (176, 2,16, 9, '2023-03-03', 149.98),
    (177, 3,5, 5, '2023-04-04', 69.95),
    (178, 4,5, 4, '2023-05-05', 180.93),
    (179, 5,11, 3, '2023-06-06', 139.99),
    (180, 6,14, 2, '2023-07-07', 87.88),
    (181, 7,3, 1, '2023-08-08', 179.94),
    (182, 8,19, 8, '2023-09-09', 199.90),
    (183, 9,2, 7, '2023-10-10', 87.92),
    (184, 10,6, 6, '2023-11-11', 119.97),
    (185, 11,5, 5, '2023-12-12', 249.95),
    (186, 12,22, 3, '2023-01-13', 49.98),
    (187, 13,15, 4, '2023-02-14', 59.96),
    (188, 14,18, 6, '2023-03-15', 209.94),
    (189, 1,17, 5, '2023-04-16', 79.95),
    (190, 2,15, 2, '2023-05-17', 99.98),
    (191, 3,15, 3, '2023-06-18', 269.97),
    (192, 4,4, 7, '2023-07-19', 90.93),
    (193, 5,9, 1, '2023-08-20', 99.99),
    (194, 6,8, 12, '2023-09-21', 107.88),
    (195, 7,20, 6, '2023-10-22', 179.94),
    (196, 8,12, 10, '2023-11-23', 199.90),
    (197, 9,12, 8, '2023-12-24', 87.92),
    (198, 10,8, 3, '2023-12-25', 119.97),
    (199, 11,14, 5, '2023-12-26', 249.95),
    (200, 12,10, 2, '2023-12-27', 49.98),
	(201, 1,11, 10, '2022-01-01', 99.90),
    (202, 2,1, 5, '2022-01-03', 49.95),
    (203, 3,5, 20, '2022-01-05', 539.80),
    (204, 4,4, 7, '2022-01-07', 159.91),
    (205, 5,15, 3, '2022-01-10', 299.97),
    (206, 6,9, 1, '2022-01-12', 99.99),
    (207, 7,15, 4, '2022-01-15', 719.76),
    (208, 8,15, 15, '2022-01-18', 299.85),
    (209, 9,6, 8, '2022-01-20', 159.92),
    (210, 10,1, 2, '2022-01-23', 239.94),
    (211, 11,13, 6, '2022-01-25', 299.94),
    (212, 12,22, 12, '2022-01-30', 129.84),
    (213, 1,4, 5, '2022-02-02', 69.95),
    (214, 2,6, 10, '2022-02-05', 199.80),
    (215, 3,22, 3, '2022-02-08', 81.87),
    (216, 4,16, 2, '2022-02-10', 79.86),
    (217, 5,10, 6, '2022-02-12', 359.94),
    (218, 6,11, 4, '2022-02-15', 499.92),
    (219, 7,5, 1, '2022-02-18', 159.99),
    (220, 8,11, 8, '2022-02-20', 199.90),
    (221, 9,6, 7, '2022-02-22', 159.92),
    (222, 10,10, 5, '2022-02-25', 119.97),
    (223, 11,19, 6, '2022-03-01', 249.95),
    (224, 12,10, 4, '2022-03-05', 99.96),
    (225, 1,9, 15, '2022-03-10', 149.85),
    (226, 2,5, 2, '2022-03-12', 79.95),
    (227, 3,14, 10, '2022-03-15', 269.70),
    (228, 4,12, 5, '2022-03-18', 149.95),
    (229, 5,18, 7, '2022-03-20', 239.93),
    (230, 6,19, 8, '2022-03-22', 399.92),
    (231, 7,22, 1, '2022-03-25', 159.99),
    (232, 8,11, 4, '2022-03-28', 119.96),
    (233, 9,8, 6, '2022-04-01', 159.92),
    (234, 10,16, 5, '2022-04-03', 299.95),
    (235, 11,17, 8, '2022-04-06', 199.90),
    (236, 12,5, 3, '2022-04-10', 199.87),
    (237, 1,8, 9, '2022-04-12', 179.90),
    (238, 2,22, 10, '2022-04-15', 199.80),
    (239, 3,18, 12, '2022-04-18', 269.70),
    (240, 4,15, 7, '2022-04-21', 159.91),
    (241, 5,1, 5, '2022-04-25', 299.95),
    (242, 6,13, 4, '2022-04-28', 499.92),
    (243, 7,5, 6, '2022-05-01', 719.76),
    (244, 8,2, 8, '2022-05-04', 199.90),
    (245, 9,18, 4, '2022-05-08', 159.92),
    (246, 10,8, 2, '2022-05-10', 239.94),
    (247, 11,2, 1, '2022-05-15', 299.94),
    (248, 12,13, 10, '2022-05-20', 399.90),
    (249, 1,2, 5, '2022-05-25', 69.95),
    (250, 2,17, 15, '2022-05-30', 199.80),
    (251, 3,19, 3, '2022-06-01', 81.87),
    (252, 4,20, 5, '2022-06-05', 79.86),
    (253, 5,5, 7, '2022-06-10', 359.94),
    (254, 6,12, 4, '2022-06-15', 499.92),
    (255, 7,11, 1, '2022-06-20', 159.99),
    (256, 8,19, 8, '2022-06-25', 199.90),
    (257, 9,6, 6, '2022-06-30', 159.92),
    (258, 10,18, 8, '2022-07-01', 239.94),
    (259, 11,10, 5, '2022-07-05', 299.95),
    (260, 12,17, 3, '2022-07-10', 99.96),
    (261, 1,12, 10, '2022-07-15', 99.90),
    (262, 2,16, 12, '2022-07-20', 239.88),
    (263, 3,9, 14, '2022-07-25', 369.70),
    (264, 4,19, 8, '2022-07-30', 159.91),
    (265, 5,14, 6, '2022-08-01', 359.94),
    (266, 6,1, 4, '2022-08-05', 499.92),
    (267, 7,13, 1, '2022-08-10', 159.99),
    (268, 8,4, 10, '2022-08-15', 199.90),
    (269, 9,14, 6, '2022-08-20', 159.92),
    (270, 10,10, 8, '2022-08-25', 239.94),
    (271, 11,10, 3, '2022-09-01', 249.95),
    (272, 12,1, 4, '2022-09-05', 99.96),
    (273, 1,16, 7, '2022-09-10', 109.90),
    (274, 2,1, 6, '2022-09-15', 129.80),
    (275, 3,5, 10, '2022-09-20', 269.70),
    (276, 4,9, 5, '2022-09-25', 149.95),
    (277, 5,22, 8, '2022-10-01', 239.93),
    (278, 6,1, 12, '2022-10-05', 599.88),
    (279, 7,15, 4, '2022-10-10', 719.76),
    (280, 8,11, 10, '2022-10-15', 199.90),
    (281, 9,6, 7, '2022-10-20', 159.92),
    (282, 10,16, 5, '2022-10-25', 119.97),
    (283, 11,7, 6, '2022-11-01', 249.95),
    (284, 12,12, 4, '2022-11-05', 99.96),
    (285, 1,2, 2, '2022-11-10', 59.95),
    (286, 2,12, 12, '2022-11-15', 239.88),
    (287, 3,13, 15, '2022-11-20', 539.80),
    (288, 4,1, 8, '2022-11-25', 159.91),
    (289, 5,14, 3, '2022-12-01', 299.97),
    (290, 6,17, 1, '2022-12-05', 99.99),
    (291, 7,20, 10, '2022-12-10', 999.90),
    (292, 8,9, 5, '2022-12-15', 99.95),
    (293, 9,18, 7, '2022-12-20', 139.92),
    (294, 10,19, 2, '2022-12-25', 239.94),
    (295, 11,7, 6, '2022-12-30', 299.94);



-- TASK 4 QUERY 

/*
1)	Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query per determinare
*/
SELECT 
    CategoryID, COUNT(*)
FROM
    CATEGORY
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT 
    ProductID, COUNT(*)
FROM
    PRODUCT
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT 
    RegionID, COUNT(*)
FROM
    REGION
GROUP BY RegionID
HAVING COUNT(*) > 1;

SELECT 
    StateID, COUNT(*)
FROM
    STATE
GROUP BY StateID
HAVING COUNT(*) > 1;

SELECT 
    SalesID, COUNT(*)
FROM
    SALES
GROUP BY SalesID
HAVING COUNT(*) > 1;

/*
2)	Esporre l’elenco delle transazioni indicando nel result set il codice documento,
 la data, il nome del prodotto, la categoria del prodotto, il nome dello stato, 
 il nome della regione di vendita e un campo booleano valorizzato in base alla condizione
 che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)
*/
SELECT 
    s.SalesID AS NUMERO_FATTURA,
    s.SaleDate AS DATA_FATTURA,
    p.ProductName AS NOME_PRODOTTO,
    c.CategoryName AS CATEGORIA,
    st.StateName AS Nazione,
    r.RegionName AS Regione,
    CASE
        WHEN DATEDIFF(CURDATE(), SaleDate) > 180 THEN TRUE
        ELSE FALSE
    END AS PIUDI180GIORNI
FROM
    sales s
        JOIN
    state st ON s.stateid = st.stateid
        JOIN
    region r ON st.regionid = r.regionid
        JOIN
    product p ON s.productid = p.productid
        JOIN
    category c ON p.categoryid = c.categoryid;


/*
3)	Esporre l’elenco dei prodotti che hanno venduto,
 in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito.
 (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano).
 Nel result set devono comparire solo il codice prodotto e il totale venduto.
*/

-- considerando la media dei prodotti venduti per ogni categoria > della media dell-anno precendete
-- rendo autonomo il controllo di quale sia l-ultimo anno censito confronotandolo con l'anno precedente ad esso
SELECT 
    p.ProductID,
    p.ProductName,
    AVG(s.QuantitySold) AS Media,
    YEAR(s.SaleDate) AS SaleYear
FROM
    PRODUCT p
        JOIN
    SALES s ON p.ProductID = s.ProductID
WHERE
    YEAR(s.SaleDate) = (SELECT 
            YEAR(MAX(SaleDate))
        FROM
            SALES)
GROUP BY p.ProductID , p.ProductName , YEAR(s.SaleDate)
HAVING AVG(s.QuantitySold) > (SELECT 
        AVG(QuantitySold)
    FROM
        sales
    WHERE
        YEAR(SaleDate) = (SELECT 
                YEAR(MAX(SaleDate))
            FROM
                SALES) - 1);


/*
4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.
*/
SELECT 
    p.ProductID,
    p.ProductName AS NOME_PRODOTTO,
    YEAR(s.saledate) AS ANNO,
    SUM(s.TotalAmount) AS FATTURATO
FROM
    product p
        JOIN
    sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID , p.ProductName , YEAR(s.saledate)
ORDER BY ANNO , p.ProductID;

/*
5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.
*/
SELECT 
    s.StateID,
    st.StateName AS STATO,
    YEAR(s.saledate) AS ANNO,
    SUM(S.TotalAmount) AS FATTURATO
FROM
    sales s
        JOIN
    state st ON s.StateID = st.StateID
GROUP BY s.StateID , st.StateName , YEAR(s.saledate)
ORDER BY ANNO ASC , FATTURATO DESC;

/*
6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
*/

-- considerando che come criterio di valutaizone la quantita massima venduta 
-- nel caso in cui si voglia considerare il fatturato basterebbe ordinare la query per Fatturato
SELECT 
    c.CategoryID,
    c.CategoryName,
    SUM(s.QuantitySold) AS QTAVENDUTA,
    SUM(s.TotalAmount) AS Fatturato
FROM
    CATEGORY c
        JOIN
    PRODUCT p ON c.CategoryID = p.CategoryID
        JOIN
    SALES s ON p.ProductID = s.ProductID
GROUP BY c.CategoryID , c.CategoryName
ORDER BY QTAVENDUTA DESC
LIMIT 1;


-- seconda cosiderazione valutiamo in base al fatturato 
SELECT 
    c.CategoryID,
    c.CategoryName,
    SUM(s.QuantitySold) AS QTAVENDUTA,
    SUM(s.TotalAmount) AS Fatturato
FROM
    CATEGORY c
        JOIN
    PRODUCT p ON c.CategoryID = p.CategoryID
        JOIN
    SALES s ON p.ProductID = s.ProductID
GROUP BY c.CategoryID , c.CategoryName
ORDER BY Fatturato DESC
LIMIT 1;

/*
7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
*/

-- primo metodo left join e se la productid e null nella tabella sales non abbiamo vendite
SELECT 
    p.ProductID, p.ProductName
FROM
    PRODUCT p
        LEFT JOIN
    SALES s ON p.ProductID = s.ProductID
WHERE
    s.ProductID IS NULL;
-- Secondo metodo considero i product id non presenti nella tabela sales 

SELECT 
    p.ProductID, p.ProductName
FROM
    PRODUCT p
WHERE
    p.ProductID NOT IN (SELECT 
            s.ProductID
        FROM
            SALES s);
/*
8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni
utili (codice prodotto, nome prodotto, nome categoria)

*/
CREATE VIEW SA_VW_PRODOTTI AS 
SELECT 
    p.ProductID AS CODICE_PRODOTTO,       
    p.ProductName AS NOME_PRODOTTO,      
    c.CategoryName AS CATEGORIA      
FROM 
    PRODUCT p
JOIN 
    CATEGORY c ON p.CategoryID = c.CategoryID;

SELECT * FROM SA_VW_PRODOTTI;

/*
9)	Creare una vista per le informazioni geografiche
*/
CREATE VIEW SA_VW_INFORMAIZONIGEOGRAFICHE AS
SELECT 
    r.RegionID AS IDREGIONE,            
    r.RegionName AS NOME_REGIONE,       
    r.RegionDescription AS DESCRIZIONE,
    s.StateID AS IDSTATO,             
    s.StateName AS NOME_STATO           
FROM 
    REGION r
JOIN 
    STATE s ON r.RegionID = s.RegionID;

SELECT * FROM SA_VW_INFORMAIZONIGEOGRAFICHE;
