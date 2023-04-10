--i decided to make the customers and employees tables first since they have no FK
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone NUMERIC(10),
    email VARCHAR(50),
    date_added TIMESTAMP
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    email VARCHAR(50),
    birthday DATE,
    pin_code NUMERIC(4),
    phone NUMERIC(10)
);

CREATE TABLE cars(
    vin_number INT PRIMARY KEY,
    car_year INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    used BOOLEAN,
    base_cost MONEY,
    for_sale BOOLEAN,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoices(
    invoice_id SERIAL PRIMARY KEY,
    invoice_date TIMESTAMP,
    customer_id INT,
    employee_id INT,
    vin_number INT,
    amount MONEY,
    car_sale BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (vin_number) REFERENCES cars(vin_number)
);

CREATE TABLE service_tickets(
    service_id SERIAL PRIMARY KEY,
    service_done VARCHAR(100),
    invoice_id INT,
    vin_number INT,
    date_start DATE,
    date_end DATE,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (vin_number) REFERENCES cars(vin_number)
);

CREATE TABLE service_done_by(
    employee_id INT,
    service_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (service_id) REFERENCES service_tickets(service_id)
);

