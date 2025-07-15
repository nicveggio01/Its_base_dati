
-- Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome 'Pegasus'

select  Progetto.nome as Nome, Progetto.inizio as dataInizio ,Progetto.fine as dataFine
from Progetto
where Progetto.nome='Pegasus';



-- Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto 'Pegasus', ordinati per cognome decrescente?

select DISTINCT Persona.nome as nome, Persona.cognome as cognome, Persona.posizione as posizione
from Persona, Progetto
where Persona.posizione= 'Ricercatore' or Persona.posizione='Professore Associato' or Persona.posizione='Professore Ordinario' and Progetto.nome='Pegasus'
order by cognome DESC;


-- Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di un attività nel progetto 'Pegasus'?


--Quali sono il nome, cognome e la posizione dei professori ordinari che hanno fatto almeno un'assenza per malattia?

-- Quali sono il nome ed il cognome edl aposizione dei professori ordinari che hanno fatto più di un'assenza per malattia?

-- Quali sono il nome, il cognome e la posizione dei ricercatori che hanno almeno un impegno per didatica?

-- Quali sono il nome, il cognome e la posizione dei ricercatori che hanno più di un impegno per didattica

-- Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia attività progettuali che attività non progettuali?

-- Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia attività progettuali che attività non progettuali?

--Quali sono il nome e il cognome degli strutturati che nello stesso giorno assenti e hanno attività progettuali?

-- Quali sono il nome e il cognome degli strutturati che nello stesso giorno sono assenti e hanno attività progettuali? Si richiede di proiettare il giorno, il nome del progetto, la causa di assenza e la durata in ore della attività progettuale.

-- Quali sono i WP che hanno lo stesso nome, ma appartengono a progetti diversi?


