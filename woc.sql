CREATE DATABASE IF NOT EXISTS WOC;
​
USE WOC;
​
CREATE TABLE IF NOT EXISTS USER(id INT(6) AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(30) NOT NULL,phone VARCHAR(15) NOT NULL, email VARCHAR(50),type VARCHAR(10) NOT NULL,registration_date DATETIME NOT NULL,device_id VARCHAR(30),status VARCHAR(15),ratings INT(2),blood_group VARCHAR(5));
​
CREATE TABLE IF NOT EXISTS RIDER(id INT(6) AUTO_INCREMENT PRIMARY KEY, pin INT(6),is_challenged BOOL NOT NULL,is_verified BOOL,verification_date DATETIME,verified_date DATETIME,proof_of_challenge VARCHAR(200), user_id INT(6));
​
CREATE TABLE IF NOT EXISTS DRIVER(id INT(6) AUTO_INCREMENT PRIMARY KEY, user_id INT(6), lcense_number VARCHAR(20) NOT NULL,license_expiry_date DATETIME NOT NULL,license_doc VARCHAR(200),is_verified BOOL,verification_date DATETIME,verified_by VARCHAR(50),address VARCHAR(200) NOT NULL);
​
CREATE TABLE IF NOT EXISTS VEHICLE(id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, user_id INT(6) NOT NULL,vehicle_number VARCHAR(20) NOT NULL,insurance_doc VARCHAR(200) NOT NULL,vehicle_model VARCHAR(20),vehicle_type VARCHAR(20),vehicle_doc VARCHAR(200),is_verified BOOL,verifiedby VARCHAR(50),verification_date DATETIME);
​
CREATE TABLE IF NOT EXISTS TRIP(id INT(6) AUTO_INCREMENT PRIMARY KEY, driver_id INT(6),rider_id INT(6),start_location VARCHAR(20),end_location VARCHAR(20), trip_start_time DATETIME, trip_end_time DATETIME, duration TIME, distance INT(6),cost DOUBLE, status VARCHAR(20), cancelled_by INT(6),created_time DATETIME,updated_time DATETIME);
​
CREATE TABLE IF NOT EXISTS FEEDBACK(id INT(6) AUTO_INCREMENT PRIMARY KEY, trip_id INT(6), user_id INT(6),feedback_owner_id INT(6),rating INT(2) NOT NULL,comment VARCHAR(500) NOT NULL);
​
CREATE TABLE IF NOT EXISTS PRICING(id INT(6) AUTO_INCREMENT PRIMARY KEY, city VARCHAR(20) NOT NULL,cost_per_km INT(4) NOT NULL,extra_charges INT(6) NOT NULL);
​
CREATE TABLE IF NOT EXISTS USER_LOCATION(id INT(6) AUTO_INCREMENT PRIMARY KEY,user_id INT(6),location  VARCHAR(50),created_time DATETIME,updated_time DATETIME);
​
CREATE TABLE IF NOT EXISTS DRIVER_AVAILABILITY(id INT(6) AUTO_INCREMENT PRIMARY KEY, user_id INT(6),status VARCHAR(20),created_time DATETIME,updated_time DATETIME);

CREATE TABLE IF NOT EXISTS USER_CREDENTIALS(id INT(6) AUTO_INCREMENT PRIMARY KEY,user_id INT(6), user_name VARCHAR(20),user_pin INT(20),created_time DATETIME,updated_time DATETIME);

CREATE TABLE IF NOT EXISTS SERVICEABLE_AREA(id INT(6) AUTO_INCREMENT PRIMARY KEY, area_name VARCHAR(20), pincode_pattern VARCHAR(20), city_name VARCHAR(20), state_name VARCHAR(20), is_servicable BOOLEAN, servicable_since DATETIME, service_paused_since DATETIME) ;
​
​
ALTER TABLE USER ADD CONSTRAINT PK_User PRIMARY KEY (phone);
​
ALTER TABLE RIDER ADD CONSTRAINT FK_UserRider FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE DRIVER ADD CONSTRAINT FK_UserDriver FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE VEHICLE ADD CONSTRAINT FK_VehicleUser FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE TRIP ADD CONSTRAINT FK_TripRider FOREIGN KEY (rider_id) REFERENCES USER(id);
​
ALTER TABLE TRIP ADD CONSTRAINT FK_TripDriver FOREIGN KEY (driver_id) REFERENCES USER(id);
​
ALTER TABLE FEEDBACK ADD CONSTRAINT FK_FeedBackTrip FOREIGN KEY (trip_id) REFERENCES TRIP(id);
​
ALTER TABLE FEEDBACK ADD CONSTRAINT FK_FeedBackUser FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE FEEDBACK ADD CONSTRAINT FK_feedBackOwner FOREIGN KEY (feedback_owner_id) REFERENCES USER(id);
​
ALTER TABLE USER_LOCATION ADD CONSTRAINT FK_locationUser FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE DRIVER_AVAILABILITY ADD CONSTRAINT FK_DRIVER_AVAILABILITY FOREIGN KEY (user_id) REFERENCES USER(id);
​
ALTER TABLE USER_CREDENTIALS ADD CONSTRAINT FK_USER_CREDENTIALS PRIMARY KEY (user_name);

ALTER TABLE SERVICEABLE_AREA ADD CONSTRAINT FK_SERVICEABLE_AREA PRIMARY KEY (id);
