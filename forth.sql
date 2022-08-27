-- 1 
select distinct Country from customer order by country;
-- 2
select distinct Country, count(*) from customer group by country order by country;
-- 3
select LastName, FirstName from listofartists
UNION 
select LastName, FirstName from customer
ORDER BY LastName;
-- 4 
select LastName, FirstName, 'A' from listofartists
UNION 
select LastName, FirstName, 'N' from customer
ORDER BY LastName;
-- 5 
select Title from work where lower(Description) LIKE '%impressionist%';
-- 6 
select c.LastName, c.FirstName, w.Title from customer as c
JOIN trans t ON t.CustomerID = c.CustomerID
JOIN work w ON w.WorkID = t.WorkID;
-- 7
select a.LastName, a.FirstName, w.Title from listofartists as a
JOIN work w ON w.ArtistID = a.ArtistID;
-- 8
SELECT a.LastName, a.FirstName
FROM (
	select max(mycount), ArtistID 
    FROM (
		SELECT count(*) as mycount, ArtistID FROM work GROUP BY ArtistID) aa
	) aaa
JOIN listofartists as a ON a.ArtistID = aaa.ArtistID;
-- 9
select avg(oa.Age) 
FROM (SELECT DateDeceased - DateOfBirth Age FROM listofartists WHERE DateOfBirth < 1900) as oa;
-- 10
select min(Age) minAge, max(Age) maxAge, avg(Age) AvgAge, Nationality
FROM (SELECT DateDeceased - DateOfBirth Age, Nationality FROM listofartists) as aa
GROUP BY Nationality
