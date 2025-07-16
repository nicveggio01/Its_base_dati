
-- Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome 'Pegasus'

select  pj.nome as Nome, pj.inizio as dataInizio, pj.fine as dataFine
from Progetto pj
where Progetto.nome='Pegasus';



-- Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto 'Pegasus', ordinati per cognome decrescente?

Select p.nome, p.cognome, p.posizione 
  
from AttivitaProgetto ap
join Persona p
on p.id = ap.persona
join Progetto pj
on pj.id = ap.progetto
join WP w
on w.progetto = ap.progetto

where pj.nome = 'Pegasus' 
group by p.cognome having (count(w.progetto) > 0)
order by p.cognome desc;


-- Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di un attività nel progetto 'Pegasus'?
Select p.nome, p.cognome, p.posizione 
  
from AttivitaProgetto ap
join Persona p
on p.id = ap.persona
join Progetto pj
on pj.id = ap.progetto
join WP w
on w.progetto = ap.progetto

where pj.nome = 'Pegasus' 
group by p.cognome having (count(w.progetto) > 1);


--Quali sono il nome, cognome e la posizione dei professori ordinari che hanno fatto almeno un'assenza per malattia?
Select p.nome, p.cognome, p.posizione 
from Persona p
join Assenza a 
on a.persona = p.id
where p.posizione = 'Professore Ordinario' and a.tipo = 'Malattia'
group by p.id, p.nome, p.cognome, p.posizione having (count(case when a.tipo= 'Malattia' then 1 end) >=1 );


-- Quali sono il nome ed il cognome edl aposizione dei professori ordinari che hanno fatto più di un'assenza per malattia?
Select p.nome, p.cognome, p.posizione 
from Persona p
join Assenza a 
on a.persona = p.id
where p.posizione = 'Professore Ordinario' and a.tipo = 'Malattia'
group by p.id, p.nome, p.cognome, p.posizione having (count( case when a.tipo= 'Malattia' then 1 end) > 1);

-- Quali sono il nome, il cognome e la posizione dei ricercatori che hanno almeno un impegno per didatica?
Select p.nome, p.cognome, p.posizione 
  
from Persona p
join AttivitaNonProgettuale anp
on anp.persona = p.id
where p.posizione = 'Ricercatore' and anp.tipo = 'Didattica'
group by p.id, p.nome, p.cognome, p.posizione having (count( case when anp.tipo= 'Didattica' then 1 end) >= 1)

-- Quali sono il nome, il cognome e la posizione dei ricercatori che hanno più di un impegno per didattica
Select p.nome, p.cognome, p.posizione 
  
from Persona p
join AttivitaNonProgettuale anp
on anp.persona = p.id
where p.posizione = 'Ricercatore' and anp.tipo = 'Didattica'
group by p.id, p.nome, p.cognome, p.posizione having (count( case when anp.tipo='Didattica' then 1 end) > 1);

-- Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia attività progettuali che attività non progettuali?
Select p.nome, p.cognome
  
from Persona p
join AttivitaNonProgettuale anp
on anp.persona = p.id
join AttivitaProgetto ap
on ap.persona = p.id
where ap.giorno = anp.giorno;


--Quali sono il nome e il cognome degli strutturati che nello stesso giorno sono assenti e hanno attività progettuali?
Select p.nome, p.cognome
  
from Persona p
join Assenza a
on a.persona = p.id
join AttivitaProgetto ap
on ap.persona = p.id
where ap.giorno = a.giorno;

-- Quali sono il nome e il cognome degli strutturati che nello stesso giorno sono assenti e hanno attività progettuali? Si richiede di proiettare il giorno, il nome del progetto, la causa di assenza e la durata in ore della attività progettuale.

Select p.nome, p.cognome, ap.giorno, pj.nome, a.tipo, datediff(pj.fine, pj.inizio)
  
from Persona p
join Assenza a
on a.persona = p.id
join AttivitaProgetto ap
on ap.persona = p.id
join Progetto pj
on pj.id = ap.progetto
where ap.giorno = a.giorno;


-- Quali sono i WP che hanno lo stesso nome, ma appartengono a progetti diversi?

select w.nome, pj.nome

from WP w
join Progetto pj on w.progetto = pj.id
where w.nome in (select nome from WP group by nome having count(distinct progetto) > 1);





