USE RealEstateAgency;

CREATE TABLE Property ( 
	property_id INTEGER PRIMARY KEY,
	property_type VARCHAR(15) NOT NULL CHECK(property_type IN('apartment', 'detached house', 'villa', 'bungalow', 'cottage')),
	size DECIMAL(5, 2) NOT NULL CHECK(size > 0),
	property_address NVARCHAR(100) NOT NULL,
	district NVARCHAR(20),
	n_of_bedrooms TINYINT NOT NULL CHECK(n_of_bedrooms BETWEEN 1 AND 10),
	n_of_bathrooms TINYINT NOT NULL CHECK(n_of_bathrooms BETWEEN 1 AND 10),
	[floor] TINYINT CHECK([floor] BETWEEN 0 AND 50),
	property_description NTEXT NOT NULL
);

CREATE TABLE Client ( 
	client_id INTEGER PRIMARY KEY,
	first_name NVARCHAR(30) NOT NULL CHECK(first_name NOT LIKE '%[^a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ ]%'),
	last_name NVARCHAR(30) NOT NULL CHECK(last_name NOT LIKE '%[^a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ-]%'),
	phone_number NVARCHAR(15) NOT NULL CHECK (phone_number NOT LIKE '%[^0-9()+]%'),
	email_address VARCHAR(50) NOT NULL UNIQUE CHECK (email_address LIKE '%_@__%.__%'),
	date_of_birth DATE NOT NULL 
);

CREATE TABLE Agent ( 
	agent_id INTEGER PRIMARY KEY,
	first_name NVARCHAR(30) NOT NULL CHECK(first_name NOT LIKE '%[^a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ ]%'),
	last_name NVARCHAR(30) NOT NULL CHECK(last_name NOT LIKE '%[^a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ-]%'),
	phone_number VARCHAR(15) NOT NULL CHECK (phone_number NOT LIKE '%[^0-9()+]%'),
	email_address VARCHAR(50) NOT NULL UNIQUE CHECK (email_address LIKE '%_@__%.__%'),
	date_of_start DATE NOT NULL CHECK (date_of_start > '2024-01-01'), --assuming the company exists from 2024-01-01
	date_of_end DATE
);

CREATE TABLE Inspection (
	inspection_id INTEGER PRIMARY KEY,
	date_and_hour SMALLDATETIME NOT NULL,
	property_id INT NOT NULL FOREIGN KEY REFERENCES Property(property_id),
	agent_id INT NOT NULL FOREIGN KEY REFERENCES Agent(agent_id),
	client_id INT FOREIGN KEY REFERENCES Client(client_id)

);

CREATE TABLE ListingType (
    listing_type_id INTEGER PRIMARY KEY,
    listing_type_name VARCHAR(8) NOT NULL CHECK(listing_type_name IN('for sale', 'for rent')),
    agency_fee DECIMAL(5,2) NOT NULL CHECK (agency_fee >= 0 AND agency_fee <= 100)
);

CREATE TABLE Listing (
	listing_id INTEGER PRIMARY KEY,
	listing_status VARCHAR(20) NOT NULL CHECK(listing_status IN('active', 'pending', 'sold', 'withdrawn', 'leased', 'expired')),
	listing_price MONEY NOT NULL CHECK (listing_price > 0),
	date_of_start DATE NOT NULL CHECK (date_of_start >= '2024-01-01'), 
	date_of_end DATE,
	property_id INT NOT NULL FOREIGN KEY REFERENCES Property(property_id),
	agent_id INT NOT NULL FOREIGN KEY REFERENCES Agent(agent_id),
	listing_type_id INT NOT NULL FOREIGN KEY REFERENCES ListingType(listing_type_id)
);


CREATE TABLE Discount (
    discount_id INT PRIMARY KEY,
    discount_type VARCHAR(50) NOT NULL CHECK(discount_type IN ('percentage', 'fixed amount')),
    discount_value DECIMAL(10, 2) NOT NULL CHECK (discount_value > 0)
);

CREATE TABLE [Contract] (
	contract_id INTEGER PRIMARY KEY,
	contract_type VARCHAR(49) NOT NULL CHECK(contract_type IN ('Property Acquisition or Lease Brokerage Agreement', 'Real Estate Brokerage Agreement')),
	date_of_start DATE NOT NULL CHECK(date_of_start > '2024-01-01'), 
	date_of_end DATE,
	signing_date DATE NOT NULL CHECK(signing_date > '2024-01-01'),
	property_id INT NOT NULL FOREIGN KEY REFERENCES Property(property_id),
	agent_id INT NOT NULL FOREIGN KEY REFERENCES Agent(agent_id),
	discount_id INT FOREIGN KEY REFERENCES Discount(discount_id)
);

CREATE TABLE ContractRole (
    contract_id INT NOT NULL, 
    client_id INT NOT NULL, 
    contract_role VARCHAR(8) NOT NULL CHECK (contract_role IN ('buyer', 'seller', 'landlord', 'tenant')), 
    PRIMARY KEY (contract_id, client_id), 
    FOREIGN KEY (contract_id) REFERENCES [Contract] (contract_id), 
    FOREIGN KEY (client_id) REFERENCES Client (client_id)
);
	

CREATE TABLE Offer (
	offer_id INTEGER PRIMARY KEY,
	offer_status VARCHAR(10) NOT NULL CHECK(offer_status IN('accepted', 'denied', 'pending')),
	offer_price MONEY NOT NULL CHECK (offer_price > 0),
	property_id INT NOT NULL FOREIGN KEY REFERENCES Property(property_id),
	client_id INT NOT NULL FOREIGN KEY REFERENCES Client(client_id)
);




					
					
					
