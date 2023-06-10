-- Create the customer table
CREATE TABLE customer (
    id INT PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Create the reservation table
CREATE TABLE reservation (
    id INT PRIMARY KEY,
    hotel VARCHAR(50) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    rate DECIMAL(5,2) NOT NULL,
    length_of_stay INT NOT NULL,
    customer_id INT NOT NULL
);

-- Create the account table
CREATE TABLE account (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL UNIQUE
);

-- Add foreign key constraint to the reservation table
ALTER TABLE reservation
ADD CONSTRAINT fk_reservation_customer FOREIGN KEY (customer_id) REFERENCES customer(id);

-- Add foreign key constraint to the account table
ALTER TABLE account
ADD CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES customer(id);
