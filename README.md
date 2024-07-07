#### README.md


# Restaurant Database Project

This project involves creating a database for Cardinal Pizza and Hoagies (CPH), a small mom-and-pop pizza and hoagie restaurant. The database supports business operations and customer orders, giving CPH better information about its business and performance.

## Features

- **Customer Information Management:** Store and manage customer details such as name, address, phone number, and email.
- **Order Processing:** Track order details, including date and time, type of order, payment method, total amount, and status.
- **Menu Management:** Maintain a list of menu items, their descriptions, prices, ingredients, sizes, and categories.
- **Sales Tracking:** Monitor sales by category, menu item, payment method, and customer.
- **Cost Management:** Calculate the total cost of each menu item based on its ingredients.

  ### Advanced SQL features: 
- **Foreign Key Constraints**: Ensuring referential integrity between related tables
- **Triggers for Automation**: Automating repetitive tasks and maintaining data consistency
- **Indexes for Performance**: Enhancing query performance
  

## Database Schema

The database schema includes the following tables:
- Customers
- Categories
- Sizes
- MenuItems
- Ingredients
- MenuItemIngredients
- Orders
- OrderItems

## Getting Started

### Prerequisites

- MySQL installed on your system
  
### Installation

To set up the database, follow these steps:

1. Run the `create_tables.sql` script to create the database schema.
2. Run the `sample_data.sql` script to populate the database with sample data.

## How to Run the Project

1. **Clone the repository:**

    ```bash
    git clone https://github.com/mokeyzz1/restaurant-database-project.git
    cd restaurant-database-project
    ```

2. **Connect to your MySQL database:**

    You can just open your MySQL command-line client or use a tool like MySQL Workbench.

3. **Create the database and use it:**

    ```sql
    CREATE DATABASE restaurant;
    USE restaurant;
    ```

4. **Create the tables:**

    ```sql
    SOURCE create_tables.sql;
    ```

5. **Insert sample data:**

    ```sql
    SOURCE sample_data.sql;
    ```

6. **Run example queries to verify the data:**

    ```sql
    SOURCE sample_queries.sql;
    ```
### Usage

Run the following query to see all menu items:
```sql
SELECT MenuItemID, ItemName, Description, BasePrice FROM MenuItems;
   ```

# Documentation
Detailed documentation can be found in the [DOCUMENTATION.md](https://github.com/mokeyzz1/restaurant-database-project/blob/master/DOCUMENTATION.md) file. 

# License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/mokeyzz1/restaurant-database-project/blob/master/LICENSE) file for details.

# Contact
For any inquiries, please contact me at moseskorom82@gmail.com 



    
