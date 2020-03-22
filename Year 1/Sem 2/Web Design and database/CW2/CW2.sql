DROP TABLE Category;
DROP TABLE Countries;
DROP TABLE Cities;
DROP TABLE Sites;
DROP TABLE Users;
DROP TABLE Visit;

CREATE TABLE Category (

ID VARCHAR (50) PRIMARY KEY, 
Type VARCHAR (50)
) ENGINE=INNODB;

CREATE TABLE Countries (

Country_Name VARCHAR (50) PRIMARY KEY, 
Currency VARCHAR (50),
Visa_Needed_UAE_PASSPORT_HOLDERS VARCHAR(50)
) ENGINE=INNODB;


CREATE TABLE Cities (

City_Name VARCHAR (50) PRIMARY KEY,
Country_Location VARCHAR(50),
FOREIGN KEY (Country_Location) REFERENCES Countries(Country_Name)
) ENGINE=INNODB;


CREATE TABLE Sites (

Name VARCHAR(50) PRIMARY KEY,
City_Location VARCHAR(50),
Category_ID VARCHAR (50),
FOREIGN KEY (Category_ID) REFERENCES Category(ID),
FOREIGN KEY (City_Location) REFERENCES Cities(City_Name)
) ENGINE=INNODB;


CREATE TABLE Users (
User_Name VARCHAR (50) PRIMARY KEY,
Email VARCHAR(50)
) ENGINE=INNODB;


CREATE TABLE Visit (

Site VARCHAR (50) PRIMARY KEY,
User VARCHAR(50),
Rating DECIMAL(2,1),
Reviews VARCHAR (500),
FOREIGN KEY (Site) REFERENCES Sites(Name),
FOREIGN KEY (User) REFERENCES Users(User_Name)
) ENGINE=INNODB;

INSERT INTO Category VALUES ("AR","Architecture");
INSERT INTO Category VALUES ("F&D","Food & Drink");
INSERT INTO Category VALUES ("MA","Market");
INSERT INTO Category VALUES ("MU","Museum");
INSERT INTO Category VALUES ("PA","Park");

INSERT INTO Countries VALUES ("France", "Euro", "No");
INSERT INTO Countries VALUES ("Italy", "Euro", "No");
INSERT INTO Countries VALUES ("Japan", "Japanese Yen", "No");
INSERT INTO Countries VALUES ("Spain", "Euro", "No");
INSERT INTO Countries VALUES ("Switzerland", "Swiss Franc", "No");

INSERT INTO Cities VALUES ("Bordeaux","France");
INSERT INTO Cities VALUES ("Paris","France");
INSERT INTO Cities VALUES ("Florence","Italy");
INSERT INTO Cities VALUES ("Venice","Italy");
INSERT INTO Cities VALUES ("Osaka","Japan");
INSERT INTO Cities VALUES ("Tokyo","Japan");
INSERT INTO Cities VALUES ("Barcelona","Spain");
INSERT INTO Cities VALUES ("Madrid","Spain");
INSERT INTO Cities VALUES ("Geneva","Switzerland");
INSERT INTO Cities VALUES ("Zurich","Switzerland");

INSERT INTO Sites VALUES ("Musee des Beaux-Arts","Bordeaux","MU");
INSERT INTO Sites VALUES ("Parc Bordelais","Bordeaux","PA");
INSERT INTO Sites VALUES ("Louvre Museum","Paris","MU");
INSERT INTO Sites VALUES ("Eiffel Tower","Paris","AR");
INSERT INTO Sites VALUES ("Piazza della Repubblica","Florence","AR");
INSERT INTO Sites VALUES ("Uffizi Gallery","Florence","AR");
INSERT INTO Sites VALUES ("Doge's Palace","Venice","AR");
INSERT INTO Sites VALUES ("Rialto Market","Venice","MA");
INSERT INTO Sites VALUES ("Dotonbori","Osaka","MA");
INSERT INTO Sites VALUES ("Japan Mint","Osaka","PA");
INSERT INTO Sites VALUES ("Hiroo","Tokyo","F&D");
INSERT INTO Sites VALUES ("Yanaka","Tokyo","AR");
INSERT INTO Sites VALUES ("Park Guell","Barcelona","PA");
INSERT INTO Sites VALUES ("Sagrada Familia","Barcelona","AR");
INSERT INTO Sites VALUES ("Plaza Mayor","Madrid","F&D");
INSERT INTO Sites VALUES ("Puerta del Sol","Madrid","AR");
INSERT INTO Sites VALUES ("Jardin Botanique","Geneva","PA");
INSERT INTO Sites VALUES ("Musee d'Art et d'Histoire","Geneva","MU");
INSERT INTO Sites VALUES ("Confiserie Sprungli","Zurich","F&D");
INSERT INTO Sites VALUES ("Kunsthaus Zurich","Zurich","MU");

INSERT INTO Users VALUES ("Aamir","lesilekug@gift-link.com");
INSERT INTO Users VALUES ("Abdul","ximuxes@webaward.online");
INSERT INTO Users VALUES ("Ali","linodikoce@mailfavorite.com");
INSERT INTO Users VALUES ("Fatema","corubewev@network-source.com");
INSERT INTO Users VALUES ("Zahra","nulewum@networkapps.info");

INSERT INTO Visit VALUES ("Musee des Beaux-Arts","Aamir",5,"An amazing museum, has a lot of mixed art with it having historic,modern and,psychological pieces of art ");													
INSERT INTO Visit VALUES ("Parc Bordelais","Abdul",5,"A huge park with a lot of short plays which happen all over the park, great for relaxing and taking in the nature, with a lot of activies for kids adults can sit,relax and enjoy the views and if lucky enough play with some of the animals present in the park.");
INSERT INTO Visit VALUES ("Louvre Museum","Zahra",4,"Worth the visit, be sure to keep the whole day free as the museum will most definetly take a whole day or two depending from person to person. Must visit the mona lisa and see its beauty first hand, well worth the 15 pounds");
INSERT INTO Visit VALUES ("Eiffel Tower","Fatema",4,"The eiffel tower is a must see in Paris, better to get tickets from online for fast pass but worth going in the evening to the top and enjoy the breathtaking view of paris as the sun sets.");
INSERT INTO Visit VALUES ("Piazza della Repubblica","Ali",3.5,"The piazza is considered to be the centre of the town with street preformers going around and performing, the piazza also has a lot of rides to go on. personally I would recommend going on top of the ferris wheel and seeing the view from atop the wheel. but is frequently under construction with most of the piazza being closed down for construction purposes.");
INSERT INTO Visit VALUES ("Uffizi Gallery","Aamir",3.5,"Interesting mueseum with a lot of wonderful art but is a bit overrated. and I recommend not wasting money on the audio guide as there is a lot of information under each artwork. ");
INSERT INTO Visit VALUES ("Doge's Palace","Aamir",4,"Worth the visit, stunning rooms particualy the armoury and the prison section but the painting shown in the palace are something else... does a great job in showing how alot on how the city was run in the olden days and things they believed in.");
INSERT INTO Visit VALUES ("Rialto Market","Zahra",3,"Was looking forward to the market but was a bit dissapointed. It's good place to idle around but not stay too long as there isn't much to do  except having a lot of fish,fruits and vegetable stalls.");
INSERT INTO Visit VALUES ("Dotonbori","Fatema",4.5,"Love this shopping district a very lively area with a lot of neon lights, extravagant signage and the vast number of resturants and bars in the area. Would 100% recommend getting a takoyaki. Also has amazing prices with not needing to bargain with the locals.");
INSERT INTO Visit VALUES ("Japan Mint","Fatema",5,"Stunning cherry blossoms with a large variety of sakura trees blossoming and an amazing places to go and relax after a long and hectic day. After viewing the cherry blossoms you could also visit the coinm museum free of charge.");
INSERT INTO Visit VALUES ("Hiroo","Ali",5,"Its fairly new, with it having a lot new trendy street food (the ones you see on instagram and other social medias) also having a lot of photogenic food shops well worth going on an empty stomach and tour the whole of hiroo station while chowing down on delicious food items. ");
INSERT INTO Visit VALUES ("Yanaka","Aamir",4.5,"One of the best places to experince old town tokyo with a lot of indie cafes and senbei shops passed down through generation. Yanaka is the perfect place to spend an afternoon in. also a great place to shop for souvenirs in the yanaka ginza shopping district.");
INSERT INTO Visit VALUES ("Park Guell","Ali",3.5,"A very big park,very popular but very crowded..of course it's impressive to see the architecture and take a walk in the park. but most of the important place in the park you need to pay to see them.");
INSERT INTO Visit VALUES ("Sagrada Familia","Zahra",5,"The basallica is a must see piece of architecture in Barcelona. Nothing more to say other then its a mmust see and a beautiful landmark.");
INSERT INTO Visit VALUES ("Plaza Mayor","Ali",4,"Very very busy, a lot of traffic but a great architecture and beautiful plaza,extremely touristic with lots of mario and mickey mouse characters around the area. ");
INSERT INTO Visit VALUES ("Puerta del Sol","Fatema",3.5,"It's a decent area to visit with a couple of shopping centres and a few intresting statues but nothing that makes it a mnust visit place. but be cautious of thieves and looters going around trying to steal your wallet and phones. ");
INSERT INTO Visit VALUES ("Jardin Botanique","Aamir",4,"A greatpark, with a lake side view of the UN and a great place to chill also has a lot of nice resturants in the centre and if you are a botanical person, this park is for you.");
INSERT INTO Visit VALUES ("Musee d'Art et d'Histoire","Abdul",5,"Only one word to say WOW. An amazing place showing off a lot of work of the great artist hodler. with it veing a free entry its a must visit. as it has exhibits from various diffeent eras and a great place to see the historical and artistic tradional side of Geneva. ");
INSERT INTO Visit VALUES ("Confiserie Sprungli","Zahra",4.5,"Wow this place! So cute and Swiss. With soo many delicous pastries.. for a sweet tooth like me its a heaven of a place especially their macrons and latte and their heavenly cakes aare to die for.");
INSERT INTO Visit VALUES ("Kunsthaus Zurich","Ali",4,"Amazing collection of art in a beautiful building. Could be considered one of the best galleries in the world. With the museum having alot of well known art exhibits with noble names like Picasso, Monet and chagall and many many many more");