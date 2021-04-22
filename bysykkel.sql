DROP DATABASE IF EXISTS bysykkel;
CREATE DATABASE IF NOT EXISTS bysykkel;
USE bysykkel;

CREATE TABLE stations (
    station_id          INT             NOT NULL UNIQUE,
    name                VARCHAR(30)     NOT NULL,
    latitude            FLOAT(10,6)     NOT NULL,
    longitude           FLOAT(10,6)     NOT NULL,
    max_spots           INT             NOT NULL,
    available_spots     INT             NOT NULL,
    PRIMARY KEY (station_id)
    );

CREATE TABLE subscriptions (
    subscription_id  INT                                    NOT NULL UNIQUE,
    user_id          INT                                    NOT NULL,
    type             ENUM ('Day','Week', 'Month', 'Year')   NOT NULL, 
    start_time       TIMESTAMP                              NOT NULL,
    PRIMARY KEY (subscription_id)
    );

CREATE TABLE users (
    user_id                     INT             NOT NULL UNIQUE,
    name                        VARCHAR(30)     NOT NULL,
    phone_number                INT(8)          NOT NULL,   
    PRIMARY KEY (user_id)
    );

CREATE TABLE bikes (
    bike_id      INT                                  NOT NULL UNIQUE,
    name         VARCHAR(14)                          NOT NULL,
    status       ENUM ('Active','Parked', 'Missing')  NOT NULL,    
    station_id   INT                                  NOT NULL,
    PRIMARY KEY (bike_id)
    );

CREATE TABLE trips (
    trip_id         INT             NOT NULL UNIQUE,
    user_id         INT             NOT NULL,
    bike_id         INT             NOT NULL,
    start_station   INT             NOT NULL,
    end_station     INT             NOT NULL,
    start_time      TIMESTAMP       NOT NULL,
    end_time        TIMESTAMP       NOT NULL,
    PRIMARY KEY (trip_id)
    );

ALTER TABLE subscriptions
ADD FOREIGN KEY (user_id) REFERENCES users (user_id);

ALTER TABLE bikes
ADD FOREIGN KEY (station_id) REFERENCES stations (station_id);

ALTER TABLE trips
ADD FOREIGN KEY (user_id) REFERENCES users (user_id),
ADD FOREIGN KEY (bike_id) REFERENCES bikes (bike_id),
ADD FOREIGN KEY (start_station) REFERENCES stations (station_id),
ADD FOREIGN KEY (end_station) REFERENCES stations (station_id);

INSERT INTO stations
VALUES  (1, "Høyteknologisenteret", 60.382216, 5.332288, 66, 34),
        (2, "Nygårdsporten", 60.383964, 5.333448, 27, 8),
        (3, "Festplassen", 60.391270, 5.325756, 24, 23),
        (4, "Småstrandgaten", 60.393001, 5.326816, 24, 16),
        (5, "Torgallmenningen", 60.392954, 5.323628, 22, 4);

INSERT INTO users
VALUES (1, "Ole Olesen", 12345678),
       (2, "Vilde Sørensen", 54140106),
       (3, "Stig Wilhelmsen", 94390764),
       (4, "Markus Karlsen", 32507021),
       (5, "Kristine Halseth", 32641181),
       (6, "Anders Hansen", 57527858),
       (7, "Per Arnesen", 11223344),
       (8, "Kjersti Pham", 26720981),
       (9, "Erling Ruud", 83997261),
       (10, "Kine Pedersen", 33866539),
       (11, "Rune Vang", 42135422),
       (12, "Madeleine Sørensen", 21968827),
       (14, "Roger Lie", 79595257),
       (15, "Vibeke Indrebø", 37715005),
       (16, "Thomas Olsen", 76929790),
       (17, "Kari Hansen", 01884971),
       (18, "Mari Siljesen", 22115577),
       (19, "Anders Jakobsen", 63507721),
       (20, "Tor Antonsen", 63570173);

INSERT INTO subscriptions
VALUES  (1,2,"Week","2019-07-30 17:00:19"),
        (2,4,"Day","2020-05-12 22:38:24"),
        (3,10,"Year","2019-06-21 15:31:47"),
        (4,2,"Year","2018-01-20 04:59:03"),
        (5,15,"Week","2020-09-13 12:41:30"),
        (6,20,"Day","2019-05-26 15:00:32"),
        (7,5,"Day","2018-06-07 02:08:39"),
        (8,19,"Day","2018-06-13 22:48:22"),
        (9,11,"Week","2021-01-24 07:01:09"),
        (10,20,"Year","2019-06-23 18:11:02"),
        (11,6,"Year","2020-10-18 17:37:25"),
        (12,9,"Year","2018-01-02 08:19:11"),
        (13,12,"Year","2019-02-01 19:39:48"),
        (14,19,"Year","2020-02-24 16:11:38"),
        (15,14,"Month","2020-10-11 15:58:02"),
        (16,3,"Month","2020-06-14 12:45:57"),
        (17,16,"Month","2021-01-26 20:17:49"),
        (18,18,"Month","2020-03-07 01:46:37"),
        (19,4,"Week","2019-03-25 09:14:10"),
        (20,17,"Week","2018-08-26 17:10:37"),
        (21,17,"Week","2020-12-16 18:44:29"),
        (22,8,"Day","2020-12-04 18:00:22"),
        (23,8,"Week","2021-01-21 17:56:20"),
        (24,3,"Year","2018-08-30 10:40:59"),
        (25,12,"Month","2020-03-15 20:15:20"),
        (26,9,"Month","2021-02-07 13:53:14"),
        (27,16,"Month","2018-10-23 17:29:16"),
        (28,5,"Month","2021-01-18 19:30:07"),
        (29,15,"Month","2019-09-28 04:17:16"),
        (30,11,"Week","2018-12-12 12:53:52"),
        (31,3,"Week","2019-12-19 22:32:45"),
        (32,5,"Week","2018-10-13 14:48:46");

INSERT INTO bikes
VALUES  (1,"Morten","Missing",4),
        (2,"Sara","Active",2),
        (3,"Ida","Active",1),
        (4,"Hege","Active",3),
        (5,"Henrik","Parked",5),
        (6,"Trine","Parked",2),
        (7,"Frank","Parked",4),
        (8,"Thea","Parked",1),
        (9,"Roar","Parked",1),
        (10,"Preben","Missing",4),
        (11,"Marie","Parked",3),
        (12,"Annette","Parked",5),
        (13,"Elin","Active",2),
        (14,"Andreas","Missing",2),
        (15,"Runar","Active",5);

INSERT INTO trips
VALUES  (1, 2, 6, 4, 2, "2019-08-04 13:12:10", "2019-08-04 13:21:04"),
        (2, 9, 8, 3, 1, "2021-02-10 08:53:14", "2021-02-10 09:07:32"),
        (3, 11, 9, 1, 1, "2021-01-27 16:01:08", "2021-01-27 16:42:11"),
        (4, 16, 12, 2, 5, "2021-02-13 19:18:42", "2021-02-13 19:24:02"),
        (5, 5, 11, 5, 3, "2021-02-01 09:30:08", "2021-02-01 09:32:04");
