--i decided to make customers and employees functions since making a function is the hardest thing to do i figugered id do the hardest part first lol, then im going to do the rest as normal inserts 

CREATE OR REPLACE FUNCTION insert_customer_data(p_first_name VARCHAR(50), p_last_name VARCHAR(50), p_phone NUMERIC(10), p_email VARCHAR(50))
RETURNS VOID
AS $$
BEGIN
  INSERT INTO customers (first_name, last_name, phone, email, date_added)
  VALUES (p_first_name, p_last_name, p_phone, p_email, NOW());
END;
$$ LANGUAGE plpgsql;
SELECT insert_customer_data('Pika', 'Chu', 1234567890, 'PikaChu@pokemon.com');
SELECT insert_customer_data('Dark', 'Rai', 1123456789, 'DarkRai@pokemon.com');
SELECT insert_customer_data('Magi', 'Karp', 1555123457, 'MagiKarp@pokemon.com')

CREATE OR REPLACE FUNCTION insert_employee_data(p_first_name VARCHAR(50), p_last_name VARCHAR(50), p_job_title VARCHAR(50), p_email VARCHAR(50), p_birthday DATE, p_pin_code NUMERIC(4), p_phone NUMERIC(10))
RETURNS VOID
AS $$
DECLARE
  v_employee_id INT;
BEGIN
  INSERT INTO employees (first_name, last_name, job_title, email, birthday, pin_code, phone)
  VALUES (p_first_name, p_last_name, p_job_title, p_email, p_birthday, p_pin_code, p_phone)
  RETURNING employee_id INTO v_employee_id;
  RAISE NOTICE 'Inserted employee with id %', v_employee_id;
END;
$$ LANGUAGE plpgsql;

DO $$
BEGIN
  PERFORM insert_employee_data('Professor', 'Oak', 'Manager', 'ProfessorOak@pokemon.com', '1998-04-01', 1111, 2345678901);
  PERFORM insert_employee_data('Ash', 'Ketchum', 'Mechanic', 'AshKetchum@pokemon.com', '1990-01-01', 2222, 3456789012);
  PERFORM insert_employee_data('Mis', 'Ty', 'Sales', 'MisTy@pokemon.com', '1990-01-02', 3333, 3456789013);
END $$;





INSERT INTO cars (vin_number, car_year, make, model, used, base_cost, for_sale, customer_id)
VALUES 
    (123456789, 2006, 'BMW', '525xi', TRUE, 25000.00, TRUE, NULL),
    (987654321, 2022, 'Honda', 'Civic', FALSE, 1000.00, TRUE, NULL),
    (555555555, 1966, 'Ford', 'Mustang', TRUE, 80000.00, FALSE, 1);



INSERT INTO invoices (invoice_id, invoice_date, customer_id, employee_id, vin_number, amount, car_sale)
VALUES 
    (1, '2023-04-07 10:00:00', 1, 16, 123456789, 8000.00, TRUE),
    (2, '2023-04-08 11:00:00', 2, 17, 987654321, 23000.00, TRUE),
    (3, '2023-04-09 12:00:00', 3, 18, 555555555, 30000.00, FALSE);

INSERT INTO service_tickets (service_id, service_done, invoice_id, vin_number, date_start, date_end)
VALUES 
    (1, 'Oil change', 1, 123456789, '2023-04-10', '2023-04-11'),
    (2, 'Replace clutch', 2, 123456789, '2023-04-10', '2023-04-11'),
    (3, 'Rebuild Engine and add A.C', 3, 555555555, '2023-04-10', '2023-04-11');

INSERT INTO service_done_by (employee_id, service_id)
VALUES 
    (16, 1),
    (17, 2),
    (18, 3);








