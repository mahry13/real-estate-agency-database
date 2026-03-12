USE RealEstateAgency;


/*1. What is the total number of clients served and contracts signed, grouped by contract type*/
SELECT C.contract_type, COUNT(DISTINCT CR.client_id) AS total_clients, COUNT(C.contract_id) AS total_contracts
FROM [Contract] C
JOIN ContractRole CR ON C.contract_id = CR.contract_id
GROUP BY C.contract_type;


/*2. Properties listed more than once with listing prices and final prices*/
SELECT P.property_id, 
       P.property_address, 
       COUNT(DISTINCT L.listing_id) AS total_listings, 
       STRING_AGG(L.listing_price, ', ') AS listing_prices_over_time,
       MAX(CASE 
               WHEN O.offer_status = 'accepted' THEN 
                   CASE 
                       WHEN D.discount_type = 'percentage' THEN O.offer_price * (1 - D.discount_value / 100.0)
                       WHEN D.discount_type = 'fixed amount' THEN O.offer_price - D.discount_value
                       ELSE O.offer_price 
                   END
               ELSE NULL
           END) AS final_price
FROM Property P
JOIN Listing L ON P.property_id = L.property_id
LEFT JOIN Offer O ON P.property_id = O.property_id AND O.offer_status = 'accepted'
LEFT JOIN [Contract] C ON P.property_id = C.property_id
LEFT JOIN Discount D ON C.discount_id = D.discount_id
GROUP BY P.property_id, P.property_address
HAVING COUNT(DISTINCT L.listing_id) > 1;

/*3. Total revenue from contracts signed in 2024, grouped by agent*/
SELECT A.agent_id, A.first_name, A.last_name, SUM(L.listing_price * (LT.agency_fee / 100)) AS total_revenue
FROM [Contract] C
JOIN Listing L ON C.property_id = L.property_id
JOIN ListingType LT ON L.listing_type_id = LT.listing_type_id
JOIN Agent A ON C.agent_id = A.agent_id
WHERE YEAR(C.signing_date) = 2024
GROUP BY A.agent_id, A.first_name, A.last_name;



/*4. Agents with the number of contracts for properties listed under 30 days in descending order*/
SELECT A.agent_id, A.first_name, A.last_name, COUNT(C.contract_id) AS total_contracts
FROM RealEstateAgency.dbo.Agent A
JOIN RealEstateAgency.dbo.[Contract] C ON A.agent_id = C.agent_id
JOIN RealEstateAgency.dbo.Listing L ON C.property_id = L.property_id
WHERE DATEDIFF(DAY, L.date_of_start, C.signing_date) < 30
GROUP BY A.agent_id, A.first_name, A.last_name
ORDER BY total_contracts DESC;


/*5. Find properties with the highest number of offers received*/
SELECT P.property_id, P.property_address, 
(SELECT COUNT(O.offer_id) 
FROM Offer O 
WHERE O.property_id = P.property_id) AS total_offers
FROM Property P
ORDER BY total_offers DESC;


/*6. List clients who were both sellers/landlords and buyers/tenants in the past year*/
SELECT C.client_id, C.first_name, C.last_name, COUNT(CASE WHEN CR.contract_role IN ('seller', 'landlord') THEN 1 ELSE NULL END) AS total_listings,
COUNT(CASE WHEN CR.contract_role IN ('buyer', 'tenant') THEN 1 ELSE NULL END) AS total_purchases_or_rentals
FROM Client C
JOIN ContractRole CR ON C.client_id = CR.client_id
JOIN [Contract] CT ON CR.contract_id = CT.contract_id
WHERE YEAR(CT.signing_date) = YEAR(GETDATE()) - 1
GROUP BY C.client_id, C.first_name, C.last_name
HAVING COUNT(CASE WHEN CR.contract_role IN ('seller', 'landlord') THEN 1 ELSE NULL END) > 0
    AND COUNT(CASE WHEN CR.contract_role IN ('buyer', 'tenant') THEN 1 ELSE NULL END) > 0;


/*7. Agents hired within the past 6 months with the numbers of contracts signed ascendingly, show also the types of properties for which these contracts were signed*/
SELECT A.agent_id, A.first_name, A.last_name, COUNT(C.contract_id) AS total_contracts, STRING_AGG(P.property_type, ', ') AS property_types
FROM Agent A
JOIN [Contract] C ON A.agent_id = C.agent_id
JOIN Property P ON C.property_id = P.property_id
WHERE DATEDIFF(MONTH, A.date_of_start, GETDATE()) <= 6
GROUP BY A.agent_id, A.first_name, A.last_name
ORDER BY total_contracts ASC;

/*8. Average price of active listings for each type*/
SELECT LT.listing_type_name, AVG(L.listing_price) AS average_price
FROM Listing L
JOIN ListingType LT ON L.listing_type_id = LT.listing_type_id
WHERE L.listing_status = 'active'
GROUP BY LT.listing_type_name;


/*9. list all inspections scheduled for properties located in Ujescisko-Lostowice*/
SELECT * FROM InspectionsForLostowice;
