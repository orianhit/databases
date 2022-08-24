USE `artists`;

-- 1
SELECT *
FROM artists.listofartists a
LEFT OUTER JOIN artists.work w ON a.ArtistID = w.ArtistID
WHERE w.ArtistID IS NULL;

-- 2
SELECT *
FROM artists.listofartists
WHERE ArtistID NOT IN (
SELECT DISTINCT a.ArtistID
FROM artists.listofartists a
JOIN artists.work w ON a.ArtistID = w.ArtistID);

-- 3
SELECT LastName, FirstName
FROM trans t
JOIN work w ON w.WorkID = t.WorkID
JOIN listofartists a ON w.ArtistID = a.ArtistID;

-- 4
SELECT LastName, FirstName
FROM trans t
JOIN work w ON w.WorkID = t.WorkID
RIGHT OUTER JOIN listofartists a ON w.ArtistID = a.ArtistID
WHERE t.TransactionID IS NULL;

-- 5
SELECT DISTINCT c.LastName, c.FirstName, c.PhoneNumber
FROM customer c
JOIN trans t ON c.CustomerID = t.CustomerID;

-- 6
SELECT DISTINCT c.LastName, c.FirstName, c.PhoneNumber
FROM customer c
LEFT JOIN trans t ON c.CustomerID = t.CustomerID
WHERE t.TransactionID IS NULL;

-- 7
SELECT w.Title, a.LastName
FROM work w
JOIN listofartists a ON w.ArtistID = a.ArtistID
WHERE w.Copy = 'Unique';

-- 8
SELECT DISTINCT a.LastName
FROM work w
JOIN listofartists a ON w.ArtistID = a.ArtistID
WHERE lower(w.Description) LIKE '%impressionist%';

-- 9
SELECT DISTINCT a.LastName
FROM customer_artist_int c_a
JOIN listofartists a ON c_a.ArtistID = a.ArtistID;

-- 10
SELECT DISTINCT w.Title
FROM work w
JOIN customer_artist_int c_a ON c_a.ArtistID = w.ArtistID
LEFT JOIN trans t ON t.WorkID = w.WorkID
WHERE t.WorkID IS NULL;