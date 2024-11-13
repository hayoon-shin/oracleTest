-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 17:18:30 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cus_num NUMBER(4) NOT NULL,
    name    VARCHAR2(10 CHAR) NOT NULL,
    address VARCHAR2(50 CHAR) NOT NULL,
    phone   CHAR(13 CHAR) NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cus_num );
ALTER TABLE customer add constraint customer_address_uk unique(address);
CREATE TABLE delivery (
    del_num NUMBER(4) NOT NULL,
    ord_num NUMBER(4) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    del_day DATE NOT NULL
);

ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY ( del_num );
ALTER TABLE delivery
    ADD CONSTRAINT delivery_order_ord_num_fk
        FOREIGN KEY ( ord_num )
            REFERENCES "ORDER" ( ord_num )
                ON DELETE CASCADE;
                
CREATE TABLE "ORDER" (
    ord_num   NUMBER(4) NOT NULL,
    pro_num   NUMBER(4) NOT NULL,
    cus_num   NUMBER(4) NOT NULL,
    quantity  NUMBER(4) NOT NULL,
    tot_price NUMBER(10) NOT NULL
);

ALTER TABLE "ORDER" ADD CONSTRAINT order_pk PRIMARY KEY ( ord_num );
ALTER TABLE "ORDER"
    ADD CONSTRAINT order_customer_cus_num_fk
        FOREIGN KEY ( cus_num )
            REFERENCES customer ( cus_num )
                ON DELETE CASCADE;

ALTER TABLE "ORDER"
    ADD CONSTRAINT order_product_pro_num_fk
        FOREIGN KEY ( pro_num )
            REFERENCES product ( pro_num )
                ON DELETE CASCADE;
                
CREATE TABLE product (
    pro_num  NUMBER(4) NOT NULL,
    price    NUMBER(10) NOT NULL,
    pro_name VARCHAR2(20 CHAR) NOT NULL,
    stock    NUMBER(4) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( pro_num );







-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
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
