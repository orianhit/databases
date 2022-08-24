USE `artists`;

-- 1
SELECT *
FROM artists.listofartists;

-- 2
SELECT LastName, FirstName
FROM artists.listofartists;

-- 3
SELECT LastName, FirstName
FROM artists.listofartists
where Nationality = 'Russian';

-- 4
SELECT LastName, FirstName, DateOfBirth
FROM artists.listofartists
where LastName LIKE 'K%';

-- 5
SELECT LastName, FirstName, DateOfBirth
FROM artists.listofartists
where FirstName LIKE '%E%' OR FirstName LIKE '%e%';

-- 6
SELECT LastName, FirstName
FROM artists.customer
where Email IS NULL;

-- 7
SELECT LastName, FirstName
FROM artists.customer
where Email IS NOT NULL;

-- 8
SELECT LastName
FROM artists.listofartists
WHERE Nationality IN ('French', 'German')
ORDER BY LastName;

-- 9
SELECT LastName
FROM artists.listofartists
WHERE Nationality NOT IN ('Russian', 'Spanish');

-- 10
SELECT LastName, DateOfBirth
FROM artists.listofartists
WHERE Nationality NOT IN ('French', 'Spanish')
AND DateOfBirth > 1890;