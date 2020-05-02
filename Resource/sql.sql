-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-04-27 15:43:36 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE city (
    id             INTEGER NOT NULL,
    name           VARCHAR(50),
    description    VARCHAR(100),
    department_id  INTEGER NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( id );

CREATE TABLE department (
    id           INTEGER NOT NULL,
    name         VARCHAR(50),
    description  VARCHAR(100)
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( id );

CREATE TABLE detailsale (
    id            INTEGER NOT NULL,
    inventory_id  INTEGER NOT NULL,
    sale_id       INTEGER NOT NULL,
    quantity      INTEGER
);

ALTER TABLE detailsale ADD CONSTRAINT detailsale_pk PRIMARY KEY ( id );

CREATE TABLE inventory (
    id              INTEGER NOT NULL,
    milligrams      INTEGER,
    name            VARCHAR(100),
    description     VARCHAR(5000),
    admissiondate   DATE,
    expirationdate  DATE,
    lotecode        VARCHAR(10),
    quantity        INTEGER,
    price           INTEGER,
    provider_id     INTEGER NOT NULL,
    shelf_id        INTEGER NOT NULL,
    typeproduct_id  INTEGER NOT NULL,
    laboratory_id   INTEGER NOT NULL,
    status_id       INTEGER NOT NULL,
    imagen          VARCHAR(100)
);

ALTER TABLE inventory ADD CONSTRAINT inventory_pk PRIMARY KEY ( id );

CREATE TABLE invoice (
    id           INTEGER NOT NULL,
    pharmacy_id  INTEGER NOT NULL,
    user_id      INTEGER NOT NULL,
    sale_id      INTEGER NOT NULL
);

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( id );

CREATE TABLE laboratory (
    id           INTEGER NOT NULL,
    name         VARCHAR(50),
    description  VARCHAR(100)
);

ALTER TABLE laboratory ADD CONSTRAINT laboratory_pk PRIMARY KEY ( id );

CREATE TABLE pharmacy (
    id    INTEGER NOT NULL,
    name  VARCHAR(50),
    logo  VARCHAR(5000),
    nit   VARCHAR(200)
);

ALTER TABLE pharmacy ADD CONSTRAINT pharmacy_pk PRIMARY KEY ( id );

CREATE TABLE provider (
    id       INTEGER NOT NULL,
    name     VARCHAR(50),
    nit      VARCHAR(100),
    address  VARCHAR(50),
    city_id  INTEGER NOT NULL
);

ALTER TABLE provider ADD CONSTRAINT provider_pk PRIMARY KEY ( id );

CREATE TABLE rol (
    id           INTEGER NOT NULL,
    name         VARCHAR(50),
    description  VARCHAR(100)
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id );

CREATE TABLE sale (
    id           INTEGER NOT NULL,
    saledate     DATE,
    saletotal    INTEGER,
    client_id    INTEGER NOT NULL,
    employee_id  INTEGER NOT NULL
);

ALTER TABLE sale ADD CONSTRAINT sale_pk PRIMARY KEY ( id );

CREATE TABLE shelf (
    id           INTEGER NOT NULL,
    name         VARCHAR(50),
    description  VARCHAR(100)
);

ALTER TABLE shelf ADD CONSTRAINT shelf_pk PRIMARY KEY ( id );

CREATE TABLE status (
    id      INTEGER NOT NULL,
    nombre  VARCHAR(50)
);

ALTER TABLE status ADD CONSTRAINT status_pk PRIMARY KEY ( id );

CREATE TABLE typeproduct (
    id           INTEGER NOT NULL,
    name         VARCHAR(50),
    description  VARCHAR(100)
);

ALTER TABLE typeproduct ADD CONSTRAINT typeproduct_pk PRIMARY KEY ( id );

CREATE TABLE user (
    id              INTEGER NOT NULL,
    name            VARCHAR(50),
    lastname        VARCHAR(50),
    documenttype    VARCHAR(50),
    documentnumber  VARCHAR(50),
    gender          VARCHAR(20),
    age             INTEGER,
    birthdate       DATE,
    points          INTEGER,
    password        VARCHAR(50),
    rol_id          INTEGER NOT NULL,
    city_id         INTEGER NOT NULL
);

ALTER TABLE user ADD CONSTRAINT user_pk PRIMARY KEY ( id );

ALTER TABLE city
    ADD CONSTRAINT city_department_fk FOREIGN KEY ( department_id )
        REFERENCES department ( id );

ALTER TABLE detailsale
    ADD CONSTRAINT detailsale_inventory_fk FOREIGN KEY ( inventory_id )
        REFERENCES inventory ( id );

ALTER TABLE detailsale
    ADD CONSTRAINT detailsale_sale_fk FOREIGN KEY ( sale_id )
        REFERENCES sale ( id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_laboratory_fk FOREIGN KEY ( laboratory_id )
        REFERENCES laboratory ( id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_provider_fk FOREIGN KEY ( provider_id )
        REFERENCES provider ( id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_shelf_fk FOREIGN KEY ( shelf_id )
        REFERENCES shelf ( id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_status_fk FOREIGN KEY ( status_id )
        REFERENCES status ( id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_typeproduct_fk FOREIGN KEY ( typeproduct_id )
        REFERENCES typeproduct ( id );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_pharmacy_fk FOREIGN KEY ( pharmacy_id )
        REFERENCES pharmacy ( id );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_sale_fk FOREIGN KEY ( sale_id )
        REFERENCES sale ( id );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_user_fk FOREIGN KEY ( user_id )
        REFERENCES user ( id );

ALTER TABLE provider
    ADD CONSTRAINT provider_city_fk FOREIGN KEY ( city_id )
        REFERENCES city ( id );

ALTER TABLE sale
    ADD CONSTRAINT sale_user_fk FOREIGN KEY ( client_id )
        REFERENCES user ( id );

ALTER TABLE sale
    ADD CONSTRAINT sale_user_fkv2 FOREIGN KEY ( employee_id )
        REFERENCES user ( id );

ALTER TABLE user
    ADD CONSTRAINT user_city_fk FOREIGN KEY ( city_id )
        REFERENCES city ( id );

ALTER TABLE user
    ADD CONSTRAINT user_rol_fk FOREIGN KEY ( rol_id )
        REFERENCES rol ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
