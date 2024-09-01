#TV Cable Management: SQL Database Project

This project demonstrates the setup and management of a SQL database for a subscription-based service, including tables for customers, payments, subscriptions, packages, channels, and their relationships. The database includes various SQL queries to retrieve and manipulate data based on different conditions.

## Table of Contents

- [Database Structure](#database-structure)
- [Tables](#tables)
  - [Customer](#customer)
  - [Payment](#payment)
  - [Subscription](#subscription)
  - [Packages](#packages)
  - [Channels](#channels)
  - [Package_Channels](#package_channels)
- [Sample Data](#sample-data)
- [SQL Queries](#sql-queries)
- [Procedures](#procedures)
- [Usage](#usage)


## Database Structure

The database consists of six tables: `customer`, `payment`, `subscription`, `packages`, `channels`, and `package_channels`. These tables are interconnected through primary and foreign keys to maintain data integrity and relationships.

## Tables

### Customer

- **Fields**: `customer_id`, `first_name`, `last_name`, `email`, `phone`, `address`
- **Description**: Stores customer information.

### Payment

- **Fields**: `payment_id`, `mode_of_payment`, `payment_date`, `customer_id`
- **Description**: Stores payment details linked to customers.

### Subscription

- **Fields**: `subscription_id`, `start_date`, `end_date`, `payment_id`, `customer_id`
- **Description**: Stores subscription details linked to payments and customers.

### Packages

- **Fields**: `package_id`, `pname`, `description`, `monthly_fee`, `no_of_channels`, `subscription_id`
- **Description**: Stores package details, including associated subscription.

### Channels

- **Fields**: `channel_id`, `channelname`, `description`, `customer_id`
- **Description**: Stores channel information linked to customers.

### Package_Channels

- **Fields**: `package_channel_id`, `package_id`, `channel_id`
- **Description**: Links packages and channels.

## Sample Data

Sample data is provided for each table, including customers, payments, subscriptions, packages, channels, and their associations through package channels.

## SQL Queries

The project includes various SQL queries for data retrieval and manipulation:

1. Retrieve details of customers who have made payments using a specific mode of payment, such as Credit Card or Paytm.
2. Retrieve package names and monthly fees for all packages subscribed to by customers.
3. Retrieve package IDs and names for packages with associated channels.
4. Retrieve the total number of channels subscribed to by each customer.
5. Retrieve the total count of customers who haven't subscribed to any channels.
6. Retrieve channel IDs and names for channels subscribed to by customers.
7. Retrieve the count of customers paying a monthly fee between 25 and 60.
8. Retrieve channel and package names chosen by each customer.
9. Retrieve channel names active in the month of June.
10. Retrieve customer names, IDs, and subscription end dates for payments made in April.
11. Retrieve the number of customers who haven’t made payments in April or June.
12. Find the total number of payments made by customers with subscriptions to packages having more than 15 channels.
13. Retrieve the average monthly fee for packages subscribed to within a specific date range.
14. Retrieve the count of each mode of payment in descending order.
15. Find customers who subscribed to a package with a monthly fee greater than 50 but haven't made any payments yet.
16. Retrieve customer IDs and names of customers subscribed to packages with monthly fees above the average.
17. Retrieve customer IDs and names of customers subscribed to more than two packages.

## Procedures

### Example Procedures

1. **Insert a New Customer**
   - Inserts a new customer if the customer ID doesn't already exist.

2. **Calculate Total Monthly Fees for All Packages**
   - Calculates and prints the total monthly fees for all packages.

3. **Retrieve All Channels Subscribed by a Particular Customer**
   - Lists channels subscribed to by a specific customer ID.

4. **Retrieve All Subscriptions with Package Name and Monthly Fee**
   - Lists subscriptions along with package names and fees.

5. **Update Customer Payment Information**
   - Updates the payment information for a specified customer.

6. **Retrieve All Customers and Their Subscription Information**
   - Displays customer details along with their subscription information.

## Usage

1. **Setup**:
   - Run the provided SQL scripts to create the database schema and populate it with sample data.
  
2. **Execution**:
   - Use the provided SQL queries and procedures to interact with the database.

3. **Testing**:
   - Verify the database operations by executing queries against the sample data.


