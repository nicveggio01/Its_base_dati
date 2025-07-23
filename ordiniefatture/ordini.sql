begin transaction;

set constraints all deferred;

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

CREATE TABLE Citta (
    id integer PRIMARY KEY,
    nome varchar NOT NULL
    UNIQUE(nome, regione)
);

CREATE TABLE Regione (
    nome varchar PRIMARY KEY,
    citta integer NOT NULL,
    FOREIGN KEY (citta) REFERENCES Citta(id) deferrable,
    UNIQUE(nome, nazione)
);

CREATE TABLE Nazione (
    nome varchar PRIMARY KEY,
    regione varchar NOT NULL,
    FOREIGN KEY (regione) REFERENCES Regione(nome) deferrable

);

CREATE TABLE Direttore (
    nome varchar NOT NULL,
    cognome varchar NOT NULL,
    cf CodiceFiscale PRIMARY KEY,
    anni_servizio RealGEZ NOT NULL,
    data_nascita date NOT NULL,
    citta integer NOT NULL,
    FOREIGN KEY (citta) REFERENCES Citta(id) deferrable

);

CREATE TABLE Dipartimento (
    nome varchar PRIMARY KEY,
    indirizzo Indirizzo NOT NULL,
    direttore CodiceFiscale NOT NULL,
    citta integer not null,
    FOREIGN KEY (direttore) REFERENCES Direttore(cf) deferrable,
    FOREIGN KEY citta REFERENCES Citta(id) deferrable
);

CREATE TABLE StatoOrdine (
    id integer PRIMARY KEY,
    nome StatoOrdineEnum NOT NULL UNIQUE
);

CREATE TABLE Ordine (
    id integer PRIMARY KEY,
    data_stipula date NOT NULL,
    imponibile RealGEZ NOT NULL,
    aliquota Real_0_1 NOT NULL,
    descrizione varchar NOT NULL,
    dipartimento varchar NOT NULL,
    statoOrdine integer NOT NULL,
    FOREIGN KEY (dipartimento) REFERENCES Dipartimento(nome) deferrable,
    FOREIGN KEY (statoOrdine) REFERENCES StatoOrdine(id) deferrable
);

CREATE TABLE Fornitore (
    ragione_sociale varchar NOT NULL,
    partita_iva PartitaIva PRIMARY KEY,
    indirizzo Indirizzo NOT NULL,
    telefono Telefono NOT NULL,
    email Email NOT NULL,
    citta integer NOT NULL,
    FOREIGN KEY (citta) REFERENCES Citta(id) deferrable
);

commit;
















