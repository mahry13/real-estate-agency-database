CREATE VIEW InspectionsForLostowice AS
SELECT I.inspection_id, I.date_and_hour, P.property_address, P.district, A.first_name AS agent_name, C.first_name AS client_name
FROM RealEstateAgency.dbo.Inspection I
JOIN RealEstateAgency.dbo.Property P ON I.property_id = P.property_id
JOIN RealEstateAgency.dbo.Agent A ON I.agent_id = A.agent_id
JOIN RealEstateAgency.dbo.Client C ON I.client_id = C.client_id
WHERE P.district = 'Ujeścisko-Łostowice';
