
CREATE DOMAIN RealGEZ AS real
    CHECK (value >= 0);

CREATE DOMAIN Real_0_1 AS RealGEZ
    CHECK (value <= 1);

CREATE DOMAIN CodiceFiscale AS char(16)
    CHECK (value ~ '^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$');

CREATE DOMAIN PartitaIva AS char(11)
    CHECK (value ~ '^[0-9]{11}$');

CREATE DOMAIN Telefono AS char(10)
    CHECK (value ~ '^[0-9]{10}$');

CREATE DOMAIN Email AS varchar
    CHECK (value ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$');

CREATE TYPE Indirizzo AS (
    via VARCHAR,
    civico VARCHAR
);

CREATE TYPE StatoOrdineEnum AS ENUM (
    'in preparazione',
    'inviato',
    'da saldare',
    'saldato'
);