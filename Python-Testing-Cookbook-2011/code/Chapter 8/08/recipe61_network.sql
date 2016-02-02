DROP TABLE IF EXISTS SERVICE_MAPPING;
DROP TABLE IF EXISTS SERVICE_EVENTS;
DROP TABLE IF EXISTS ACTIVE_EVENTS;
DROP TABLE IF EXISTS EQUIPMENT;
DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS EVENTS;

CREATE TABLE EQUIPMENT (
    ID        INTEGER PRIMARY KEY,
    HOST_NAME TEXT    UNIQUE,
    STATUS    INTEGER
    );

CREATE TABLE SERVICE (
    ID INTEGER PRIMARY KEY,
    NAME TEXT UNIQUE,
    STATUS TEXT
    );

CREATE TABLE SERVICE_MAPPING (
    ID INTEGER PRIMARY KEY,
    SERVICE_FK,
    EQUIPMENT_FK,
    FOREIGN KEY(SERVICE_FK) REFERENCES SERVICE(ID),
    FOREIGN KEY(EQUIPMENT_FK) REFERENCES EQUIPMENT(ID)
    );

CREATE TABLE EVENTS (
    ID INTEGER PRIMARY KEY,
    HOST_NAME TEXT,
    SEVERITY INTEGER,
    EVENT_CONDITION TEXT
    );

CREATE TABLE SERVICE_EVENTS (
    ID INTEGER PRIMARY KEY,
    SERVICE_FK,
    EVENT_FK,
    FOREIGN KEY(SERVICE_FK) REFERENCES SERVICE(ID),
    FOREIGN KEY(EVENT_FK) REFERENCES EVENTS(ID)
    );

CREATE TABLE ACTIVE_EVENTS (
    ID INTEGER PRIMARY KEY,
    EVENT_FK,
    FOREIGN KEY(EVENT_FK) REFERENCES EVENTS(ID)
    );

INSERT into EQUIPMENT (ID, HOST_NAME, STATUS) values (1, 'pyhost1', 1);
INSERT into EQUIPMENT (ID, HOST_NAME, STATUS) values (2, 'pyhost2', 1);
INSERT into EQUIPMENT (ID, HOST_NAME, STATUS) values (3, 'pyhost3', 1);

INSERT into SERVICE (ID, NAME, STATUS) values (1, 'service-abc', 'Operational');

INSERT into SERVICE_MAPPING (SERVICE_FK, EQUIPMENT_FK) values (1,1);
INSERT into SERVICE_MAPPING (SERVICE_FK, EQUIPMENT_FK) values (1,2);