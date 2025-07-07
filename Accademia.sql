Create Type Strutturato as ENUM ('Ricercatore', 'Professore Associato', 'Professore Ordinario');
Create Type LavoroProgetto as ENUM ('Ricerca e Sviluppo', 'Dimostrazione', 'Managment', 'Altro');
Create Type LavoroNonProgettuale as Enum('Didattica', 'Ricerca', 'Missione', 'Incontro Dipartimentale', 'Incontro Accademico', 'Altro');
Create Type CausaAssenza as Enum('Chiusura Universitaria', 'Maternità', 'Malattia'); 
Create domain PosInteger as integer
check (value >=0)
Create domain StringaM as varchar(100);
Create domain Numero0re as integer
check (value >= 0 and value < =8)
Create domain Denaro as integer;
check(value >=0)

Create Table Persona(
	id PosInteger PRIMARY KEY,
	nome StringaM NOT NULL, 
	cognome StringaM NOT NULL, 
	posizione Strutturato NOT NULL,
	stipendio Denaro NOT NULL
	);

Create Table Progetto(
	id PosInteger PRIMARY KEY,
	nome StringaM NOT NULL UNIQUE,
	inizio DATE NOT NULL,
	fine DATE NOT NULL,
	check(inizio < fine),
	budget Denaro NOT NULL
	);

Create Table WP(
	progetto PosInteger UNIQUE,
	id PosInteger NOT NULL,
	PRIMARY KEY(progetto,id),
	nome StringaM NOT NULL UNIQUE, 
	inizio DATE NOT NULL,
	fine DATE NOT NULL,
	FOREIGN KEY(progetto) REFERENCES Progetto(id)
	);

Create Table AttivitaProgetto(
	id PosInteger PRIMARY KEY,
	persona PosInteger NOT NULL,
	progetto PosInteger NOT NULL,
	wp PosInteger NOT NULL,
	giorno DATE NOT NULL,
	tipo LavoroProgetto NOT NULL,
	oreDurata Numero0re NOT NULL,
	FOREIGN KEY(persona) REFERENCES Persona(id),
	FOREIGN KEY(progetto,wp) REFERENCES WP(progetto, id)
	);
	
Create Table Assenza(
	id PosInteger PRIMARY KEY,
	persona PosInteger NOT NULL UNIQUE,
	tipo CausaAssenza NOT NULL,
	giorno DATE NOT NULL UNIQUE,
	FOREIGN KEY(persona) REFERENCES Persona(id)
	);