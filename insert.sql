USE RealEstateAgency;

INSERT INTO Property (property_id, property_type, size, property_address, district, n_of_bedrooms, n_of_bathrooms, [floor], property_description)
VALUES 
(1, 'apartment', 75.32, 'Kazimierza Porębskiego st., Gdańsk', 'Ujeścisko-Łostowice', 2, 1, 1, 'I am delighted to present a 75.32 m² apartment located on the 1st floor of a building equipped with a modern, silent elevator. The property features airtight, modern wooden windows, making the apartment warm and resistant to external noise.'),
(2, 'detached house', 167.42, 'Stragniarska st., Gdańsk', 'Śródmieście', 4, 3, NULL, 'I am pleased to present a property in a compact frontage development, located on a plot of land with an area of 135 m2, consisting of a tenement house with 4 above-ground floors at the front and an outbuilding at the back, of which the perimeter walls with a height of approx. 6 m remain. 4.5 by 30.0 m. It is worth noting that the tenement house is one of the few in the Main Town that was not destroyed during the war, which makes it a unique investment opportunity not only for enthusiasts of the history of Gdańsk.'),
(3, 'cottage', 250.87, 'Gdańska St., Suchy Dąb', NULL, 5, 4, NULL, 'I am presenting a house in a beautiful, quiet area located in Suchy Dąb, from which you can easily get to Pruszcz Gdański, about 10 minutes and the Tri-City ( approx. 30 minutes to the center of Gdańsk)'),
(4, 'bungalow', 200.08, 'Świętokrzyska St., Gdańsk', 'Ujeścisko-Łostowice', 4, 3, NULL, 'Spacious 4-bedroom bungalow with garden.'),
(5, 'detached house', 158.34, 'Ogarna St., Gdańsk', 'Śródmieście', 4, 3, NULL, 'Spacious 4-bedroom detached house with garden.'),
(6, 'apartment', 58, 'Wieżycka St., Gdańsk', 'Ujeścisko-Łostowice', 5, 4, 1, 'Luxury 5-bedroom villa with ocean views.'),
(7, 'apartment', 72.76, 'Ogarna St., Gdańsk', 'Śródmieście', 3, 1, 6, 'This 72.76 m² apartment is located on the 8th floor of a 16-story building. Thanks to its prime location, the windows face three directions: west, south, and north, providing excellent sunlight and breathtaking views of the city. '),
(8, 'apartment', 145, 'Grunwaldzka Ave., Gdańsk', 'Wrzeszcz Górny', 4, 3, 3, 'The apartment is located on the third floor of a historic tenement building situated directly on Grunwaldzka Street. The building is in good condition and features an intercom, an electric gate, shared parking, an attic, and individual storage cellars.'),
(9, 'villa', 350.00, 'Jaśkowa Dolina St., Gdańsk', 'Wrzeszcz Górny', 5, 4, NULL, 'Luxury 5-bedroom villa with forest views.'),
(10, 'apartment', 58.12, 'Damroki St., Gdańsk', 'Jasień', 2, 1, 8, 'This 58.12 m² apartment is located on the 8th floor of a 16-story building. Thanks to its prime location, the windows face three directions: west, south, and north, providing excellent sunlight and breathtaking views of the city. ');

INSERT INTO Client (client_id, first_name, last_name, phone_number, email_address, date_of_birth)
VALUES 
(1, 'Aleksandra', 'Wiśniewska', '+4546384349', 'olawisniaa@gmail.com', '2004-04-30'),
(2, 'Maria', 'Gałkowska', '+48546384349', 'emgie321@onet.pl', '2005-04-13'),
(3, 'Natalia', 'Sarbiewska', '+48546384349', 'natsarb@wp.com', '2005-07-04'),
(4, 'Alicja', 'Zabłocka', '+48546345349', 'alicjaaa123@gmail.com', '2004-11-15'),
(5, 'Eryk', 'Świrkula', '+48546384459', 'zmywar324@icloud.com', '2005-01-25'),
(6, 'Michał', 'Kulesz', '+48523384349', 'mihau00@gmail.com', '2004-04-10'),
(7, 'Monika', 'Hajbos', '+48546904349', 'mhajbos@gmail.com', '1976-03-12'),
(8, 'Adam', 'Mickiewicz', '+48580384349', 'pantaduesz3@onet.pl', '1985-07-13'),
(9, 'Aleksandra', 'Fabrykiewicz', '+48646384349', 'fabrol@icloud.com', '2006-02-07'),
(10, 'Natalia', 'Pałubicka', '+48546384359', 'natpal@gmail.com', '2005-05-21');


INSERT INTO Agent (agent_id, first_name, last_name, phone_number, email_address, date_of_start, date_of_end) 
VALUES 
(1, 'Kamil', 'Ślimak', '+48500111222', 'kamil.slim@realestate.com', '2024-05-01', NULL),
(2, 'Iwona', 'Pavlović', '+4850022233', 'iwona.pavlovic@realestate.com', '2024-06-15', NULL),
(3, 'Paweł', 'Szymonowski', '+48500444555', 'pawel.szym@realestate.com', '2024-07-10', NULL),
(4, 'Anna', 'Lewandowska', '+48500666777', 'anna.lewandowska@realestate.com', '2024-07-11', NULL),
(5, 'Norbert', 'Gierczak', '+48509006798', 'norbert.gierczak@realestate.com', '2024-02-01', NULL),
(6, 'Marcin', 'Majkut', '+48600666897', 'm.majkut@realestate.com', '2024-09-21', NULL);



INSERT INTO ListingType (listing_type_id, listing_type_name, agency_fee)
VALUES 
(1, 'for sale', 6.0),
(2, 'for rent', 5.0),
(3, 'for sale', 3.0),
(4, 'for rent', 4.5);

INSERT INTO Listing (listing_id, listing_status, listing_price, date_of_start, date_of_end, property_id, agent_id, listing_type_id)
VALUES 
(1, 'active', 350000, '2024-06-01', NULL, 1, 1, 1),
(2, 'pending', 1200, '2024-07-01', '2024-12-01', 2, 1, 2),
(3, 'sold', 280000, '2024-01-15', '2024-05-30', 3, 2, 1),
(4, 'active', 4500, '2024-02-01', NULL, 4, 1, 2),
(5, 'sold', 550000, '2024-03-10', '2024-06-20', 5, 3, 3),
(6, 'withdrawn', 800000, '2024-04-01', '2024-10-01', 6, 6, 1),
(7, 'sold', 350000, '2024-02-01', '2025-01-19', 8, 5, 3),
(8, 'active', 1100000, '2024-02-15', NULL, 9, 2, 1),
(9, 'pending', 600000, '2024-06-10', '2024-12-01', 3, 4, 1),
(10, 'active', 5000, '2024-06-10', NULL, 3, 3, 2),
(11, 'leased', 7000, '2024-06-10', '2024-12-01', 5, 5, 4),
(12, 'sold', 880000, '2024-06-10', '2024-12-01', 8, 3, 2);



INSERT INTO Inspection (inspection_id, date_and_hour, property_id, agent_id, client_id)
VALUES 
(1, '2024-06-15 14:30', 1, 1, 2),
(2, '2024-07-20 10:00', 4, 2, 3),
(3, '2024-08-10 11:00', 6, 1, 4),
(4, '2024-09-15 16:00', 4, 2, 5),
(5, '2024-08-05 13:00', 5, 3, 10),
(6, '2024-09-12 15:00', 6, 4, 2),
(7, '2024-10-10 11:30', 7, 5, 9),
(8, '2024-11-20 09:45', 1, 2, 4),
(9, '2024-12-01 14:00', 9, 4, 5);

INSERT INTO Discount (discount_id, discount_type, discount_value)
VALUES 
(1, 'percentage', 5.00),
(2, 'fixed amount', 10000.00),
(3, 'percentage', 10.00),
(4, 'fixed amount', 20000.00);


INSERT INTO [Contract] (contract_id, contract_type, date_of_start, date_of_end, signing_date, property_id, agent_id, discount_id)
VALUES 
(1, 'Property Acquisition or Lease Brokerage Agreement', '2024-05-01', '2024-11-01', '2024-05-05', 1, 1, NULL),
(2, 'Real Estate Brokerage Agreement', '2024-06-15', '2024-12-31', '2024-06-18', 2, 2, 2),
(3, 'Property Acquisition or Lease Brokerage Agreement', '2024-09-01', '2024-12-31', '2024-09-03', 6, 3, NULL),
(4, 'Real Estate Brokerage Agreement', '2024-06-15', '2024-12-31', '2024-06-18', 2, 2, NULL),
(5, 'Property Acquisition or Lease Brokerage Agreement', '2024-10-01', '2024-12-31', '2024-10-03', 3, 6, 3),
(6, 'Real Estate Brokerage Agreement', '2024-06-15', '2024-11-30', '2024-06-18', 5, 2, 2), 
(7, 'Property Acquisition or Lease Brokerage Agreement', '2024-04-01', '2024-12-31', '2024-04-03', 8, 3, 3),
(8, 'Real Estate Brokerage Agreement', '2024-11-01', '2024-11-30', '2024-11-04', 7, 6, NULL),
(9, 'Property Acquisition or Lease Brokerage Agreement', '2024-02-01', '2024-12-31', '2024-04-03', 8, 4, 3),
(10, 'Real Estate Brokerage Agreement', '2024-07-01', '2025-07-30', '2024-06-04', 7, 6, NULL),
(11, 'Property Acquisition or Lease Brokerage Agreement', '2024-07-01', '2025-07-30', '2024-06-04', 9, 4, NULL);

INSERT INTO ContractRole (contract_id, client_id, contract_role)
VALUES 
(1, 2, 'buyer'),
(2, 3, 'seller'),
(3, 6, 'tenant'),
(4, 2, 'landlord'),
(5, 9, 'buyer'),
(6, 5, 'seller'),
(7, 5, 'buyer'),
(8, 4, 'seller'),
(9, 7, 'tenant'),
(10, 6, 'landlord'), 
(11, 3, 'tenant');

INSERT INTO Offer (offer_id, offer_status, offer_price, property_id, client_id)
VALUES 
(1, 'accepted', 340000, 1, 2),
(2, 'pending', 1150000, 2, 3),
(3, 'accepted', 250000, 3, 4),
(4, 'accepted', 200000, 4, 5),
(5, 'pending', 480000, 5, 6),
(6, 'accepted', 300000, 6, 2),
(7, 'pending', 650000, 7, 5),
(8, 'denied', 500000, 8, 3),
(9, 'accepted', 200000, 9, 4),
(10, 'pending', 550000, 10, 6),
(11, 'accepted', 1200, 2, 6),
(12, 'accepted', 550000, 5, 6),
(13, 'accepted', 800000, 8, 2),
(14, 'accepted', 550000, 5, 6),
(15, 'denied', 500000, 10, 6);