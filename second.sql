USE `artists`;

-- 1
SELECT *, MAX(DateDeceased - DateOfBirth)
FROM artists.listofartists;

-- 2
SELECT COUNT(*) ArtistCount
FROM artists.listofartists
WHERE DateOfBirth between 1900 and 1950;

-- 3
SELECT Nationality, COUNT(*) NumberOfArtists
FROM artists.listofartists
GROUP BY Nationality;

-- 4
SELECT LastName Name, Nationality, (DateDeceased - DateOfBirth) Age
FROM artists.listofartists
ORDER BY Age;

-- 5
SELECT DISTINCT Nationality
FROM artists.listofartists;

-- 6
SELECT LastName
FROM artists.listofartists
WHERE DateOfBirth >= 1900 and DateOfBirth <= 2000;

-- 7
SELECT DISTINCT Country
FROM artists.customer
ORDER BY Country;

-- 8
SELECT Country, count(*)
FROM artists.customer
GROUP BY Country
ORDER BY Country;

-- 9
SELECT concat(FirstName, ' ', LastName) Name, Nationality
FROM artists.listofartists;

-- 10
SELECT LastName , Nationality, DateDeceased
FROM artists.listofartists
ORDER BY DateDeceased DESC, LastName ASC;