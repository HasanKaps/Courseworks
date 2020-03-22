-- this enables warnings to be displayed about invalid data warnings;

-- you can type in the SQL commmands in any case,
-- but you must type in the correct case for tablenames

-- drop the table if it already exists

DROP TABLE spy;



CREATE TABLE Skill (

SkillName VARCHAR (50), 
SkillCode INT PRIMARY KEY
) ENGINE=INNODB;



CREATE TABLE BankAccount (

AccountNumber INT PRIMARY KEY,
Balances VARCHAR(8)
) ENGINE=INNODB;

CREATE TABLE Spy (

CodeName VARCHAR(3),
FirstName VARCHAR(50) PRIMARY KEY,
LastName VARCHAR(50),
IdentifyingMark VARCHAR(50),
SpyMaster VARCHAR(50),
BankAccount INT,
FOREIGN KEY (BankAccount) REFERENCES BankAccount(AccountNumber)
) ENGINE=INNODB;

CREATE TABLE SpyMaster (
BankAccount INT,
FOREIGN KEY (BankAccount) REFERENCES BankAccount(AccountNumber),
ContactAddress VARCHAR(50),
CodeName VARCHAR(50) PRIMARY KEY
) ENGINE=INNODB;

CREATE TABLE SpySkill (

Code INT,
Name VARCHAR(50),
PRIMARY KEY (Name, Code),
FOREIGN KEY (Code) REFERENCES Skill(SkillCode),
FOREIGN KEY (Name) REFERENCES Spy(FirstName)
) ENGINE=INNODB;

INSERT INTO Skill VALUES ("High Intelligence", 1);
INSERT INTO Skill VALUES ("Master of Disguise", 2);
INSERT INTO Skill VALUES ("Observation", 3);
INSERT INTO Skill VALUES ("Hacking", 4);
INSERT INTO Skill VALUES ("Quick Shot", 5);

INSERT INTO BankAccount VALUES (135792468,100000);
INSERT INTO BankAccount VALUES (173973538,7500000);
INSERT INTO BankAccount VALUES (190105933,8400000);
INSERT INTO BankAccount VALUES (239157486,0);
INSERT INTO BankAccount VALUES (517285968,3500000);
INSERT INTO BankAccount VALUES (643521987,6500000);
INSERT INTO BankAccount VALUES (793154682,11000000);
INSERT INTO BankAccount VALUES (839176485,10000000);
INSERT INTO BankAccount VALUES (880234968,9500000);
INSERT INTO BankAccount VALUES (973518642,250860);

INSERT INTO SpyMaster VALUES (239157486,0504206553,000);
INSERT INTO SpyMaster VALUES (880234968,0509736542,001);
INSERT INTO SpyMaster VALUES (517285968,0508426957,003);
INSERT INTO SpyMaster VALUES (190105933,0503164278,004);
INSERT INTO SpyMaster VALUES (173973538,0501357924,005);

INSERT INTO Spy VALUES ("TMP","Ashab","Uddin","IQ 200","Vermouth",839176485);
INSERT INTO Spy VALUES ("RIO","Benjamin","Reji","BirthMark on Hand","Rum",135792468);
INSERT INTO Spy VALUES ("BCM","Brenden","Monteiro","Mark on Elbow","Whiskey",973518642);
INSERT INTO Spy VALUES ("MSY","Sharil","Arfin","Glasses","Gin",643521987);
INSERT INTO Spy VALUES ("VDS","Vishan","Silver","Big Dick","Brandy",793154682);

INSERT INTO SpySkill VALUES (1,"Brenden");
INSERT INTO SpySkill VALUES (3,"Brenden");
INSERT INTO SpySkill VALUES (5,"Brenden");
INSERT INTO SpySkill VALUES (2,"Sharil");
INSERT INTO SpySkill VALUES (1,"Sharil");
INSERT INTO SpySkill VALUES (5,"Sharil");
INSERT INTO SpySkill VALUES (3,"Ashab");
INSERT INTO SpySkill VALUES (4,"Ashab");
INSERT INTO SpySkill VALUES (5,"Ashab");
INSERT INTO SpySkill VALUES (4,"Benjamin");
INSERT INTO SpySkill VALUES (1,"Benjamin");
INSERT INTO SpySkill VALUES (2,"Benjamin");
INSERT INTO SpySkill VALUES (5,"Vishan");
INSERT INTO SpySkill VALUES (3,"Vishan");
INSERT INTO SpySkill VALUES (1,"Vishan");
















