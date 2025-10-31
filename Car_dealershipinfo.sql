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