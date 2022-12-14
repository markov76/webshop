drop database if EXISTS webshop;

CREATE DATABASE webshop;

USE webshop;

CREATE TABLE user(
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    passwd VARCHAR(255) NOT NULL
) ;

INSERT INTO user VALUES ('user', 'user');

/* ASIAKAS */

CREATE TABLE asiakas (
id int auto_increment,
astunnus VARCHAR(20) NOT NULL,
etunimi VARCHAR(20) NOT NULL,
sukunimi VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
osoite VARCHAR(30),
postinro CHAR(5), 
postitmp VARCHAR(10), 
salasana VARCHAR(255),
user_type VARCHAR(20),
created_at TIMESTAMP,
CONSTRAINT asiakas_pk PRIMARY KEY (id)
) ;

/* TUOTERYHMÄ */
CREATE TABLE tuoteryhma (
trnro SMALLINT AUTO_INCREMENT ,
trnimi VARCHAR(40) NOT NULL,
CONSTRAINT tuoteryhma_pk PRIMARY KEY (trnro)
) ;
INSERT INTO tuoteryhma VALUES (1,'Lautapelit');
INSERT INTO tuoteryhma VALUES (2,'Konsolipelit');
INSERT INTO tuoteryhma VALUES (3,'Tietokonepelit');
INSERT INTO tuoteryhma VALUES (4,'Tarvikkeet');
INSERT INTO tuoteryhma VALUES (5,'Uutuudet');

/* TUOTE */

CREATE TABLE tuote (
tuoteid INT(255) AUTO_INCREMENT,
tuotenimi VARCHAR(40) NOT NULL,
hinta DECIMAL(5,2),
tarjoushinta DECIMAL (5,2),
saldo SMALLINT(5),
trnro SMALLINT,
tuotekuvaus TEXT,
img VARCHAR(50),

CONSTRAINT tuote_pk PRIMARY KEY (tuoteid),
CONSTRAINT tuote_ryhma_fk FOREIGN KEY (trnro) 
           REFERENCES tuoteryhma (trnro)  

) ;
INSERT INTO tuote VALUES (1,'Afrikan tähti',13.99,NULL,250,1,'Pelaajien lukumäärä:2 - 6 pelaajaa, Ikäsuositus: 5+, Pelin kesto n. 15-60 min, Kielet: Suomi, ruotsi, viro, englanti','lautapelit/Afrikan tähti.png');
INSERT INTO tuote VALUES (2,'Kimble',14.95,NULL,250,1,'Pelaajien lukumäärä: 2 - 4 pelaajaa, Pelityyppi: Lasten peli, Tyyppi: Klassisia pelejä','lautapelit/kimble.png');
INSERT INTO tuote VALUES (3,'Monopoli',32.90,NULL,150,1,'Pelaajien lukumäärä: 2 - 8 pelaajaa, Ikäsuositus: 8 - 99 vuotta, Pelityyppi: Vuoroihin perustuva, Perhepeli, Survival','lautapelit/monopoly.png');
INSERT INTO tuote VALUES (4, 'Trivial Pursuit',39.95,NULL,150,1,'Pelaajien lukumäärä: 2 - 6 pelaajaa, Ikäsuositus: 16 - 99 vuotta, Pelityyppi: Vuoroihin perustuva, Perhepeli, Juhlapelit, Tietokilpailu, Lasten peli','lautapelit/Trivial Pursuit.png');
INSERT INTO tuote VALUES (5, 'Tammi',17.90,NULL,100,1,'Klassinen Tammi peli puisena, taitettavana pelinä. Näppärä koko, n 20x20cm.','lautapelit/tammi.png');
INSERT INTO tuote VALUES (6, 'Tetris',19.90,NULL,50,2,'Tetriksen Game Boy versio. Tämä klassikko on yksi maailman myydyimmistä pelisarjoista','Konsolipelit/Tetris.jpg');
INSERT INTO tuote VALUES (7, 'Donkey Kong',19.90,NULL,50,2,'Donkey Kong-peli Nintendolle','Konsolipelit/Donkey Kong.jpg');
INSERT INTO tuote VALUES (8, 'The Legend of Zelda',19.90,NULL,50,2,'Zelda-peli Golden Edition Nintendolle','Konsolipelit/Legend of Zelda.png');
INSERT INTO tuote VALUES (9, 'Super Mario 3',19.90,12.90,50,2,'Super Mario 3-peli Nintendo Game Boy Advancelle','Konsolipelit/Super Mario 3.jpg');
INSERT INTO tuote VALUES (10, 'Duck Hunt',19.90,NULL,50,2,'Duck Hunt-peli Nintendolle','Konsolipelit/DuckHunt.jpg');
INSERT INTO tuote VALUES (11, 'Pac-Man',10.90,NULL,100,3,'Pac-Man original Japan edition','Tietokonepelit/Pac-Man original.jpg');
INSERT INTO tuote VALUES (12, 'Duke Nukem 3D',10.90,NULL,20,3,'Duke Nukem 3D 1996','Tietokonepelit/Duke Nukem 3D.jpg');
INSERT INTO tuote VALUES (13, 'Prince of Persia 2',10.90,NULL,100,3,'Prince of Persia 2 1993','Tietokonepelit/Prince of Persia 2.jpg');
INSERT INTO tuote VALUES (14, 'Lemmings',10.90,NULL,100,3,'Lemmings-peli tietokoneelle','Tietokonepelit/Lemmings.jpg');
INSERT INTO tuote VALUES (15, 'Hugo-peikkopeli',10.90,6.90,100,3,'Hugo Peikko-peli tietokoneelle','Tietokonepelit/Hugo.png');
INSERT INTO tuote VALUES (16,'Scart-johto',6.95,NULL,100,4,'Uusi scart-johto vanhan tilalle. Sopii kaikiin laitteisiin joissa käytetään tavallista scart-liitintiä.','tarvikkeet/Scart johto.png');
INSERT INTO tuote VALUES (17,'Super Nintendo peliohjain', 12.90,NULL,15,4,'Uusi ohjain super nintendo pelikonsolille.','tarvikkeet/nintendo ohjain.png');
INSERT INTO tuote VALUES (18,'NES-Zapper', 4.95,NULL,150,4,'Pistooliohjain Nintendo Duck Hunt peliin.','tarvikkeet/Nes_zapper.jpg');
INSERT INTO tuote VALUES (19,'MOMO Ratti ja polkimet', 49.95,NULL,50,4,'Ratti ja polkimet -ohjain PC:lle.','tarvikkeet/MOMO Ratti ja polkimet.png');
INSERT INTO tuote VALUES (20,'Amiga power supply', 10.00,NULL,20,4,'Amigan virtalähde.','tarvikkeet/Amiga power supply.jpg');
INSERT INTO tuote VALUES (21,'PlayStation5 pelikonsoli', 509.00,NULL,10,5,'Pelikonsoli.','uutuudet/PS5.png');
INSERT INTO tuote VALUES (22,'X-Box Series X pelikonsoli', 509.00,NULL,10,5,'Pelikonsoli.','uutuudet/X-box X.png');
INSERT INTO tuote VALUES (23,'X-Box Series s pelikonsoli', 249.00,199.00,10,5,'Pelikonsoli.','uutuudet/X-box S.jpeg');
INSERT INTO tuote VALUES (24,'Nintendo Switch Oled pelikonsoli', 369.00,NULL,10,5,'Pelikonsoli.','uutuudet/Nintendo Switch.png');
INSERT INTO tuote VALUES (25,'Nintendo Swtich lataustelakka', 47.95,NULL,10,5,'Lataustelakka Nintendo Switch Oled-pelikonsolille.','uutuudet/Nintendo Switch lataustelakka.png');


/* TILAUS */

CREATE TABLE tilaus (
id int primary key auto_increment, 
tilauspvm timestamp default CURRENT_TIMESTAMP,
astunnus int not null,
index id(id),
foreign key (id) REFERENCES asiakas(id)
on delete RESTRICT
) ; 



/* TILAUSRIVI */

CREATE TABLE tilausrivi (
tilausnro INTEGER NOT NULL,
tuoteid INT not null
);

/* CREATE TABLE tilausrivi (
tilausnro INTEGER NOT NULL,
index tilausnro (tilausnro),
foreign key (tilausnro)REFERENCES `tilaus` (id),
tuoteid INT not null,
CONSTRAINT tilausrivi_pk PRIMARY KEY (tilausnro),
CONSTRAINT tilausrivi_tuote_fk FOREIGN KEY (tuoteid) 
           REFERENCES tuote (tuoteid)
); */


/* Palaute */
CREATE TABLE palaute(
palauteid INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL, 
timestamp TIMESTAMP,
message VARCHAR (255) NOT NULL,
CONSTRAINT tilausrivi_pk PRIMARY KEY (palauteid)
);

insert into palaute values ( 1,' Minni Hiiri', ' minni@hiiricom ', CURRENT_TIMESTAMP , ' Hei! Teillä on kiva kauppa, olisiko mahdollista ottaa myyntiin pieniä eriä second-handtuotteita? '),
 ( 2,' Aku Ankka', ' aku.ankka@ankkalinna.com ', CURRENT_TIMESTAMP , ' Hei! Ankkalinnan väki haluaa toivottaa hyvää ja rentouttavaa joululomaa kaikille opiskelijoille, erityisesti TIK22KM-ryhmälle! ');

 CREATE TABLE tarjous(
tuoteid INT(255) AUTO_INCREMENT NOT NULL,
tuotenimi VARCHAR(40) NOT NULL,
normihinta DECIMAL(9,2),
tarjoushinta DECIMAL(9,2),
img VARCHAR(50),
CONSTRAINT tuote_pk PRIMARY KEY (tuoteid));

INSERT INTO tarjous values (1, 'Hugo-peikkopeli',10.90,6.90,'Tietokonepelit/Hugo.png'),
(2, 'Super Mario 3',19.90,12.90,'Konsolipelit/Super Mario 3.jpg'),(3,'X-Box Series s', 249.00,199.00,'uutuudet/X-box S.jpeg');