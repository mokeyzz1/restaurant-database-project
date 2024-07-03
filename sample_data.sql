-- Sample data for Customers table
INSERT INTO Customers (FirstName, LastName, Address, PhoneNumber, Email)
VALUES 
('John', 'Doe', '123 Main St', '555-1234', 'john.doe@example.com'),
('Jane', 'Smith', '456 Oak Ave', '555-5678', 'jane.smith@example.com'),
('Emily', 'Jones', '789 Pine Rd', '555-8765', 'emily.jones@example.com');

-- Sample data for Categories table
INSERT INTO Categories (CategoryName)
VALUES 
('Pizza'),
('Hoagies'),
('Salads'),
('Beverages'),
('Desserts');

-- Sample data for Sizes table
INSERT INTO Sizes (SizeName)
VALUES 
('Small'),
('Medium'),
('Large'),
('Extra Large');

-- Sample data for MenuItems table
INSERT INTO MenuItems (ItemName, Description, BasePrice, CategoryID)
VALUES 
('Pepperoni Pizza', 'Pizza with pepperoni and mozzarella cheese', 10.99, 1),
('Cheese Pizza', 'Pizza with mozzarella cheese', 7.99, 1),
('Turkey Hoagie', 'Hoagie with turkey, cheese, and vegetables', 6.99, 2),
('Greek Salad', 'Salad with feta cheese, olives, and dressing', 6.99, 3),
('Coke', 'Can of Coca-Cola', 1.99, 4),
('Chocolate Cake', 'Slice of chocolate cake', 3.99, 5);

-- Sample data for Ingredients table
INSERT INTO Ingredients (IngredientName, Cost)
VALUES 
('Pepperoni', 1.00),
('Mozzarella Cheese', 0.75),
('Turkey', 1.50),
('Feta Cheese', 0.75),
('Olives', 0.50),
('Greek Dressing', 0.50),
('Coca-Cola Syrup', 0.20),
('Cake Batter', 1.00);

-- Sample data for MenuItemIngredients table
INSERT INTO MenuItemIngredients (MenuItemID, IngredientID, Quantity)
VALUES 
(1, 1, 1.00), -- Pepperoni Pizza with Pepperoni
(1, 2, 0.75), -- Pepperoni Pizza with Mozzarella Cheese
(2, 2, 1.00), -- Cheese Pizza with Mozzarella Cheese
(3, 3, 1.00), -- Turkey Hoagie with Turkey
(4, 4, 0.75), -- Greek Salad with Feta Cheese
(4, 5, 0.50), -- Greek Salad with Olives
(4, 6, 0.50); -- Greek Salad with Greek Dressing

-- Sample data for Orders table
INSERT INTO Orders (CustomerID, OrderDateTime, OrderType, PaymentMethod, TotalAmount, OrderStatus)
VALUES 
(1, '2024-06-30 18:30:00', 'Delivery', 'Credit Card', 25.97, 'Completed'),
(2, '2024-06-30 19:00:00', 'Pickup', 'Cash', 8.99, 'In Progress'),
(3, '2024-06-30 19:30:00', 'Eat-In', 'Credit Card', 15.98, 'Received');

-- Sample data for OrderItems table
INSERT INTO OrderItems (OrderID, MenuItemID, SizeID, Quantity, Price)
VALUES 
(1, 1, 3, 1, 10.99), -- Order 1: Pepperoni Pizza (Large)
(1, 5, 2, 1, 1.99), -- Order 1: Coke (Medium)
(2, 2, 2, 1, 7.99), -- Order 2: Cheese Pizza (Medium)
(3, 4, 1, 2, 6.99); -- Order 3: Greek Salad (Small)
