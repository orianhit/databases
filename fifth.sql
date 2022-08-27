use artists;
-- 1 
DELETE FROM trans where workID in (select workID FROM work w JOIN `listofartists` a ON a.`Nationality` = 'American' and a.ArtistID = w.ArtistID);
DELETE FROM work WHERE artistID in (select artistID FROM `listofartists` WHERE `Nationality` = 'American');
DELETE FROM `listofartists` WHERE `Nationality` = 'American';
-- 2
UPDATE listofartists
SET Nationality = 'Belgium'
WHERE Nationality = 'French';
-- 3
ALTER TABLE work
ADD Sold boolean DEFAULT False;
-- 4
UPDATE work w
JOIN trans t ON t.WorkID = w.WorkID
SET w.Sold = True;
-- 5
INSERT INTO `customer_artist_int`
SELECT a.ArtistID, c.customerID FROM listofartists a
JOIN customer c ON c.LastName = 'Wu' AND c.FirstName = 'Susan' AND a.LastName in ('Matisse', 'Chagall');
-- 6
CREATE TABLE styles (
  StyleID    INT    NOT NULL AUTO_INCREMENT,
  StyleName  CHAR(50)      NOT NULL,
  PRIMARY KEY (StyleID)
);
-- 7
ALTER TABLE work
ADD StyleID  INT DEFAULT NULL,
ADD FOREIGN KEY w_StyleFK (StyleID)
    REFERENCES styles (StyleID)
    ON DELETE CASCADE;
-- 8
CREATE view OwnedWork AS
SELECT w.Title Title,
       concat(a.FirstName, ' ', a.LastName) Artist,
       concat(c.FirstName, ' ', c.LastName) Owner,
       t.`TransactionID` as TransID
FROM listofartists a
JOIN work w ON a.ArtistID = w.ArtistID
JOIN trans t ON t.WorkID = w.WorkID
JOIN customer c ON c.CustomerID = t.CustomerID;
-- 9
UPDATE listofartists a
SET a.DateofBirth = a.DateofBirth - 10
WHERE a.DateofBirth < 1900;
-- 10
ALTER TABLE work
ADD AcquisitionPrice  INT DEFAULT NULL;
--
UPDATE work w
SET w.AcquisitionPrice = (select AcquisitionPrice FROM trans WHERE WorkID =w.WorkID);
