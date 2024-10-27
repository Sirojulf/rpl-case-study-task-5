
CREATE SCHEMA `travelokaplus` ;

/* create table */
USE travelokaplus;
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(255)
);

CREATE TABLE FlightBooking (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    user_id INT,
    booking_date DATE,
    payment_status BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE HotelBooking (
    booking_id INT PRIMARY KEY,
    hotel_id INT,
    user_id INT,
    check_in DATE,
    check_out DATE,
    payment_status BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE TouristAttraction (
    attraction_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    description TEXT,
    ticket_price DECIMAL(10, 2)
);

CREATE TABLE AttractionBooking (
    booking_id INT PRIMARY KEY,
    attraction_id INT,
    user_id INT,
    visit_date DATE,
    payment_status BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (attraction_id) REFERENCES TouristAttraction(attraction_id)
);

CREATE TABLE TravelAgent (
    agent_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_info TEXT
);

CREATE TABLE TravelAgentPackage (
    package_id INT PRIMARY KEY,
    agent_id INT,
    description TEXT,
    price DECIMAL(10, 2),
    FOREIGN KEY (agent_id) REFERENCES TravelAgent(agent_id)
);

/* Insert to table  */

INSERT INTO User (user_id, name, email, phone, password) VALUES
(1, 'wisnu', 'wisnu456@gamil.com', '08113042120', 'wsn23'),
(2, 'desi', 'desi95@gamil.com', '08513012234', 'ds95');

INSERT INTO FlightBooking (booking_id, flight_id, user_id, booking_date, payment_status) VALUES
(1, 101, 1, '2024-10-15', TRUE),
(2, 102, 2, '2024-10-20', FALSE);

INSERT INTO HotelBooking (booking_id, hotel_id, user_id, check_in, check_out, payment_status) VALUES
(1, 201, 1, '2024-11-01', '2024-11-07', TRUE),
(2, 202, 2, '2024-11-10', '2024-11-15', FALSE);

INSERT INTO TouristAttraction (attraction_id, name, location, description, ticket_price) VALUES
(1, 'Taman Budaya Garuda Wisnu Kencana', 'Bali', 'Iconic tower in Bali', 100.000),
(2, 'Kuta Beach', 'Bali', 'Beautiful beach in Bali', 300.000);

INSERT INTO AttractionBooking (booking_id, attraction_id, user_id, visit_date, payment_status) VALUES
(1, 1, 1, '2024-11-03', TRUE),
(2, 2, 2, '2024-11-12', FALSE);

INSERT INTO TravelAgent (agent_id, name, contact_info) VALUES
(1, 'Jaya Travels', 'jaya@outlook.com'),
(2, 'Adventure Seekers', 'adventureseekers@gmail.com');

INSERT INTO TravelAgentPackage (package_id, agent_id, description, price) VALUES
(1, 1, 'Bali Tour', 150.00),
(2, 2, 'Bali Tour', 200.00);
