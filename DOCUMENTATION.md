```markdown
# Restaurant Database Project Documentation

## Overview


Description: The Cardinal Pizza and Hoagies database project aims to create an efficient online ordering system for a small restaurant. This system enables customers to place orders online, facilitates order management for the restaurant staff, and tracks inventory to ensure timely order fulfillment. 

Purpose: The goal is to enhance customer service by providing a seamless ordering experience, optimizing operational efficiency through automated order processing, and improving decision-making with data-driven insights from the database. 

Audience: This documentation is intended for developers, stakeholders interested in restaurant operations, and potential employers seeking insight into your database design and implementation skills. 

## Database Design
### Entity Relationship Diagram

[ERD.png] 

The database is designed to support the following use cases:
* Customer can place an order online
* Restaurant staff can manage orders and track inventory    
* Restaurant owner can analyze sales data and make data-driven decisions

## Database Schema

## Schema Description

```sql
## Customers: 
CustomerID (INT, PK, Auto Increment) 
FirstName (VARCHAR(50), NOT NULL) 
LastName (VARCHAR(50), NOT NULL) 
Address (VARCHAR(255), NOT NULL) 
PhoneNumber (VARCHAR(15), NOT NULL) 
Email (VARCHAR(100), NOT NULL, UNIQUE) 

## Categories

CategoryID (INT, PK, Auto Increment) 
CategoryName (VARCHAR(50), NOT NULL) 

##Sizes
SizeID (INT, PK, Auto Increment) 
SizeName (VARCHAR(50), NOT NULL) 

MenuItems: 
MenuItemID (INT, PK, Auto Increment) 
ItemName (VARCHAR(100), NOT NULL) 
Description (TEXT) 
BasePrice (DECIMAL(10, 2), NOT NULL) 
CategoryID (INT, FK references Categories(CategoryID)) 

## Ingredients 
IngredientID (INT, PK, Auto Increment) 
IngredientName (VARCHAR(100), NOT NULL) 
Cost (DECIMAL(10, 2), NOT NULL) 
MenuItemIngredients: 
MenuItemID (INT, FK references MenuItems(MenuItemID)) 
IngredientID (INT, FK references Ingredients(IngredientID)) 
Quantity (DECIMAL(5, 2), NOT NULL) 

## Orders
OrderID (INT, PK, Auto Increment) 
CustomerID (INT, FK references Customers(CustomerID)) 
OrderDateTime (DATETIME, NOT NULL) 
OrderType (VARCHAR(50), NOT NULL) 
PaymentMethod (VARCHAR(50), NOT NULL) 
TotalAmount (DECIMAL(10, 2), NOT NULL) 
OrderStatus (VARCHAR(50), NOT NULL) 

## OrderItems: 
OrderItemID (INT, PK, Auto Increment) 
OrderID (INT, FK references Orders(OrderID)) 
MenuItemID (INT, FK references MenuItems(MenuItemID))
SizeID (INT, FK references Sizes(SizeID)) 
Quantity (INT, NOT NULL) 
Price (DECIMAL(10, 2), NOT NULL)
```

## Sample Data and Transactions 

### Sample Data Insertion

```sql
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
```


## Advanced SQL Features

### Foreign Key Constraints

Foreign key constraints are used to maintain referential integrity between tables. For example, in the `Orders` table, the `CustomerID` field is a foreign key referencing the `CustomerID` field in the `Customers` table.

### Triggers for Automation

Triggers are used to automate certain actions in the database. For example, the `update_total_amount` trigger updates the total amount of an order whenever a new item is added to the order.

### Indexes for Performance

Indexes are created on frequently queried fields to improve performance. For example, an index is created on the `OrderDateTime` field in the `Orders` table.

### Stored Procedures

Stored procedures are used to encapsulate complex queries and can be called with parameters. For example, the `GetCustomerOrders` stored procedure retrieves all orders for a specific customer.

### Views

Views are virtual tables that represent the result of a query. For example, the `OrderSummary` view provides a summary of orders, including customer names and total amounts.

## Triggers

### Example Trigger

```sql
CREATE TRIGGER update_order_status
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET OrderStatus = 'in progress'
    WHERE OrderID = NEW.OrderID;
END;
```


## Example Queries

### Get all menu items with their categories
```sql
SELECT 
    MenuItems.ItemName, 
    Categories.CategoryName, 
    MenuItems.Description, 
    MenuItems.BasePrice
FROM MenuItems
JOIN Categories ON MenuItems.CategoryID = Categories.CategoryID;

### Get ingredients for a specific menu item
SELECT 
    MenuItems.ItemName AS MenuItem, 
    Ingredients.IngredientName, 
    Ingredients.Cost
FROM Ingredients
JOIN MenuItemIngredients ON Ingredients.IngredientID = MenuItemIngredients.IngredientID
JOIN MenuItems ON MenuItemIngredients.MenuItemID = MenuItems.MenuItemID
WHERE MenuItems.MenuItemID = 1;
```



