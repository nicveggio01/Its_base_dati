
begin transaction;

set constraints all deferred;

-- Domini

create domain RealGEZ as real
check (value >=0);

create domain Stringa as varchar;

create type Indirizzo as (
    via Stringa,
    civico Stringa
);

-- Creazione Tabelle

create table Impiegato(

    id integer not null,
    nome Stringa not null,
    cognome Stringa not null,
    nascita date not null,
    stipendio RealGEZ not null,
    primary key (id)

);

create table Progetto(

    id integer not null,
    nome Stringa not null,
    budget RealGEZ not null,
    primary key (id)
    

);


create table Dipartimento(

    id integer not null,
    indirizzo Indirizzo,
    nome Stringa not null,
    primary key (id)



);


create table NumeroTelefono(

    telefono Stringa not null,
    primary key (telefono)


);

create table Afferenza(

    impiegato int not null,
    dipartimento int not null,
    data_afferenza date not null,

    primary key(dipartimento),

    foreign key(impiegato) references Impiegato(id) deferrable,
    foreign key(dipartimento) references Dipartimento(id) deferrable

);

create table Dip_telefono(

    dipartimento int not null,
    telefono Stringa not null,

    primary key(dipartimento, telefono),
    foreign key (dipartimento) references Dipartimento(id) deferrable,
    foreign key (telefono) references NumeroTelefono(telefono) deferrable

);

create table Coinvolto(

    impiegato integer not null,
    progetto integer not null,

    primary key(impiegato, progetto),
    foreign key (impiegato) references Impiegato(id) deferrable,
    foreign key(progetto) references Progetto(id) deferrable

);

create table Direzione(

    impiegato integer not null,
    dipartimento integer not null,

    primary key(impiegato),

    foreign key (impiegato) references Impiegato(id) deferrable,
    foreign key (dipartimento) references Dipartimento(id) deferrable

);

commit;





