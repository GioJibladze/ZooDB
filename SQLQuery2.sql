CREATE DATABASE Zoo;

CREATE TABLE Species (
    speciesId INT PRIMARY KEY,
    speciesName VARCHAR(50),
    typicalDiet VARCHAR(100),
    feedingTime VARCHAR(20)
);

CREATE TABLE Enclosures (
    enclosureId INT PRIMARY KEY,
    enclosureName VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Zookeepers (
    keeperId INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE Animals (
    animalId INT PRIMARY KEY,
    name VARCHAR(50),
    speciesId INT FOREIGN KEY REFERENCES Species(speciesId),
    enclosureId INT FOREIGN KEY REFERENCES Enclosures(enclosureId),
    keeperId INT FOREIGN KEY REFERENCES Zookeepers(keeperId),
    birthDate DATE
);

INSERT INTO Species (speciesId, speciesName, typicalDiet, feedingTime) VALUES
(1, 'Lion', 'Meat', '14:00'),
(2, 'Elephant', 'Plants', '10:00'),
(3, 'Penguin', 'Fish', '09:00');

INSERT INTO Enclosures (enclosureId, enclosureName, location) VALUES
(1, 'Savannah Zone', 'North Wing'),
(2, 'Tropical Zone', 'South Wing'),
(3, 'Arctic Zone', 'East Wing');

INSERT INTO Zookeepers (keeperId, name, phone) VALUES
(1, 'Giorgi Jibladze', '555-1234'),
(2, 'Dachi Kokolashvili', '555-5678');

INSERT INTO Animals (animalId, name, speciesId, enclosureId, keeperId, birthDate) VALUES
(1, 'Simba', 1, 1, 1, '2015-06-01'),
(2, 'Gorlock', 2, 2, 2, '2010-09-15'),
(3, 'Pingu', 3, 3, 1, '2018-12-25');

SELECT 
    a.name AS AnimalName,
    s.speciesName,
    s.typicalDiet,
    s.feedingTime,
    e.enclosureName,
    z.name AS KeeperName,
    z.phone
FROM Animals a
JOIN Species s ON a.speciesId = s.speciesId
JOIN Enclosures e ON a.enclosureId = e.enclosureId
JOIN Zookeepers z ON a.keeperId = z.keeperId;

BACKUP DATABASE Zoo
TO DISK = 'D:\backups\ZooDB.back'
WITH DIFFERENTIAL;




