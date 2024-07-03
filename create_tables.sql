-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Create the Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);

-- Create the Sizes table
CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY AUTO_INCREMENT,
    SizeName VARCHAR(50) NOT NULL
);

-- Create the MenuItems table
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT,
    BasePrice DECIMAL(10, 2) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the Ingredients table
CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    IngredientName VARCHAR(100) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL
);

-- Create the MenuItemIngredients table
CREATE TABLE MenuItemIngredients (
    MenuItemID INT NOT NULL,
    IngredientID INT NOT NULL,
    Quantity DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (MenuItemID, IngredientID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDateTime DATETIME NOT NULL,
    OrderType VARCHAR(50) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    SizeID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
    FOREIGN KEY (SizeID) REFERENCES Sizes(SizeID)