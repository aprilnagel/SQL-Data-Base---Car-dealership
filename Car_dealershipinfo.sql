CREATE TABLE salesperson (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR, 
    last_name VARCHAR,
    phone VARCHAR,
    email VARCHAR
);

CREATE TABLE customer(
    id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    phone VARCHAR,
    email VARCHAR,
    street VARCHAR,
    city VARCHAR,
    state VARCHAR,
    zip_code INTEGER
);
CREATE TABLE car (
    VIN VARCHAR PRIMARY KEY,
    salesperson_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    make VARCHAR,
    model VARCHAR,
    year INTEGER,
    cost DECIMAL,
    is_new BOOLEAN,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)

)

CREATE TABLE service_ticket (
    id INTEGER PRIMARY KEY,
    car_VIN VARCHAR NOT NULL,
    customer_id INTEGER NOT NULL,
    service_date DATE,
    service_type VARCHAR,
    description TEXT,
    labor_cost DECIMAL,
    parts_cost DECIMAL,
    total_cost DECIMAL,
    status VARCHAR
    FOREIGN KEY (car_VIN) REFERENCES CAR (VIN),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);


CREATE TABLE mechanic(
    id INTEGER PRIMARY KEY,
    fist_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    specialization VARCHAR,
    certification VARCAR
);

CREATE TABLE mechanical_service_ticket (
    mechanic_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    hours_worked DECIMAL(5, 2),
    work_notes TEXT,
    PRIMARY KEY (mechanic_id, ticket_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(id),
    FOREIGN KEY (ticket_id) REFERENCES service_ticket(id)
);

CREATE TABLE invoice (
    id INTEGER PRIMARY KEY,
    car_VIN VARCHAR NOT NULL,
    salesperson_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    sale_date DATE,
    total_amount DECIMAL,
    FOREIGN KEY (car_VIN) REFERENCES car(VIN),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO salesperson (first_name, last_name, phone, email) VALUES
('lucas', 'smith', '555-1234', 'lucas.smith@example.com'),
('emma', 'johnson', '555-5678', 'emma.johnson@example.com'),
('oliver', 'williams', '555-8765', 'oliver.williams@example.com'),
('ava', 'brown', '555-4321', 'ava.brown@example.com'),
('sophia', 'jones', '555-2468', 'sophia.jones@example.com')

INSERT INTO car (VIN, salesperson_id, customer_id, make, model, year, cost, is_new) VALUES
('1HGCM82633A123456', 1, 1, 'Honda', 'Accord', 2020, 24000.00, TRUE),
('1FAFP404X1F123456', 2, 2, 'Ford', 'Mustang', 2019, 26000.00, FALSE),
('2T1BURHE5JC123456', 3, 3, 'Toyota', 'Corolla', 2021, 20000.00, TRUE),
('3C6UR5FL7JG123456', 4, 4, 'Dodge', 'Ram', 2018, 35000.00, FALSE),
('5YJSA1E26JF123456', 5, 5, 'Tesla', 'Model S', 2022, 80000.00, TRUE);

INSERT INTO customer (first_name, last_name, phone, email, street, city, state, zip_code) VALUES
('Liam', 'Miller', '555-1111', 'liam.miller@example.com', '123 Elm St', 'Springfield', 'IL', 62704),
('Olivia', 'Davis', '555-2222', 'olivia.davis@example.com', '456 Oak St', 'Springfield', 'IL', 62704),
('Noah', 'Garcia', '555-3333', 'noah.garcia@example.com', '789 Pine St', 'Springfield', 'IL', 62704),
('Isabella', 'Martinez', '555-4444', 'isabella.martinez@example.com', '101 Maple St', 'Springfield', 'IL', 62704),
('Mason', 'Rodriguez', '555-5555', 'mason.rodriguez@example.com', '202 Birch St', 'Springfield', 'IL', 62704);

INSERT INTO mechanic (fist_name, last_name, specialization, certification) VALUES
('James', 'Wilson', 'Engine Repair', 'ASE Certified'),
('Benjamin', 'Moore', 'Transmission', 'ASE Certified'),
('Elijah', 'Taylor', 'Brakes', 'ASE Certified'),
('Lucas', 'Anderson', 'Electrical Systems', 'ASE Certified'),
('Henry', 'Thomas', 'General Maintenance', 'ASE Certified');

INSERT INTO mechanical_service_ticket (mechanic_id, ticket_id, hours_worked, work_notes) VALUES
(1, 1, 2.5, 'Replaced timing belt and adjusted valves.'),
(2, 2, 3.0, 'Rebuilt transmission and replaced fluid.'),
(3, 3, 1.5, 'Replaced brake pads and rotors.'),
(4, 4, 2.0, 'Fixed electrical wiring issues and replaced battery.'),
(5, 5, 1.0, 'Performed oil change and general inspection.');

INSERT INTO service_ticket (car_VIN, customer_id, service_date, service_type, description, labor_cost, parts_cost, total_cost, status) VALUES
('1HGCM82633A123456', 1, '2023-01-15', 'Maintenance', 'Oil change and tire rotation', 50.00, 30.00, 80.00, 'Completed'),
('1FAFP404X1F123456', 2, '2023-02-20', 'Repair', 'Brake pad replacement', 100.00, 150.00, 250.00, 'In Progress'),
('2T1BURHE5JC123456', 3, '2023-03-10', 'Inspection', 'Annual safety inspection', 75.00, 0.00, 75.00, 'Completed'),
('3C6UR5FL7JG123456', 4, '2023-04-05', 'Repair', 'Engine diagnostics and repair', 200.00, 300.00, 500.00, 'Pending'),
('5YJSA1E26JF123456', 5, '2023-05-12', 'Maintenance', 'Battery check and replacement', 80.00, 120.00, 200.00, 'Completed');

INSERT INTO invoice (car_VIN, salesperson_id, customer_id, sale_date, total_amount) VALUES
('1HGCM82633A123456', 1, 1, '2023-06-01', 24000.00),
('1FAFP404X1F123456', 2, 2, '2023-06-15', 26000.00),
('2T1BURHE5JC123456', 3, 3, '2023-07-01', 20000.00),
('3C6UR5FL7JG123456', 4, 4, '2023-07-15', 35000.00),
('5YJSA1E26JF123456', 5, 5, '2023-08-01', 80000.00);