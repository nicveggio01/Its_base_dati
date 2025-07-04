create table Studente ( 
matricola integer not null,
nome varchar(100)  not null,
cognome varchar(100) not null,
nascita date,
cf character (16) not null,

primary key(matricola),
unique(cf),
unique(nome, cognome, nascita)
);

create table Corso (
codice integer primary key,
nome varchar not null
);


create table Esame (
studente integer not null,
corso integer not null,
voto integer not null,
         check (voto >= 18 and voto <=30),
lode boolean not null,
check (lode=false or  voto=30),
primary key (studente, corso),
foreign key (studente)
references studente (matricola),
foreign key(corso)
references corso (codice)
);

insert into
studente(matricola, nome, cognome, cf)
values
(4, 'Biagio', 'Bruni', 'AAABBB02I29P567L');

insert into
studente(matricola, nome, cognome, cf)
values
(2, 'Domenico', 'Candido', 'AAABBC06I78C67K');

insert into
studente(matricola, nome, cognome, nascita, cf)
values
(3, 'Niccolò', 'Veggian' , '12-10-2001', 'VGGNCL01R12C415X');


