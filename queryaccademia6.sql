

--Definire in SQL le seguenti interrogazioni, in cui si chiedono tutti risultati distinti:--



--1. Quanti sono gli strutturati di ogni fascia?--

Select p.posizione,
COUNT(*) as numero_strutturati
from Persona p
GROUP BY p.posizione
ORDER BY p.posizione DESC;



--2. Quanti sono gli strutturati con stipendio ≥ 40000?--

SELECT COUNT(*) as numero_strutturati
FROM Persona p
where p.stipendio >= 40000;


--3. Quanti sono i progetti già finiti che superano il budget di 50000?--

Select COUNT(*)
FROM Progetto p
WHERE p.fine <= current_date and p.budget > 50000;


--4. Qual è la media, il massimo e il minimo delle ore delle attività relative al progetto 'Pegasus'?--

Select 
avg(ap.oreDurata) as media_ore,
min(ap.oreDurata) as min_ore,
max(ap.oreDurata) as massimo_ore
from Progetto p, AttivitaProgetto ap
where ap.progetto = p.id and p.nome= 'Pegasus';

--5. Quali sono le medie, i massimi e i minimi delle ore giornaliere dedicate al progetto 'Pegasus' da ogni singolo docente?'

Select ps.nome, ps.cognome, ps.id, avg(ap.oreDurata) as media_ore,
max(ap.oreDurata) as massimo_ore,
min(ap.oreDurata) as min_ore
from Progetto p, AttivitaProgetto ap, Persona ps
where ps.id=ap.persona and progetto = p.id and p.nome= 'Pegasus'
group by ps.nome, ps.cognome, ps.id
order by media_ore desc;

--6. Qual è il numero totale di ore dedicate alla didattica da ogni docente?--

Select ps.id, ps.nome, ps.cognome, sum(anp.oreDurata) as ore_totali
from AttivitaNonProgettuale anp, Persona ps
where anp.tipo = 'Didattica' and anp.persona=ps.id
group by ps.id, ps.nome, ps.cognome
order by ps.nome asc;

--7.Qual è la media, il massimo e il minimo degli stipendi dei ricercatori? --

Select avg(p.stipendio) as media_stipendi_ricercatori,
min(p.stipendio) as  minimo_stipendio_ricercatori,
max(p.stipendio) as massimo_stipendi_ricercatori
from Persona p
where p.posizione = 'Ricercatore';

-- 8. Quali sono le medie, i massimi e i minimi degli stipendi dei ricercatori, dei professori associati e dei professori ordinari?--

Select p.posizione,
avg(p.stipendio) as media_stipendi,
min(p.stipendio) as  minimo_stipendio,
max(p.stipendio) as massimo_stipendi
from Persona p
group by p.posizione
order by p.posizione;

--9. Quante ore ‘Ginevra Riva’ ha dedicato ad ogni progetto nel quale ha lavorato?

Select pj.id, pj.nome, sum(a.oreDurata) as ore_totali_Ginevra_Riva
from Progetto pj, Persona p, AttivitaProgetto a
where a.progetto= pj.id and p.id= a.persona and p.nome='Ginevra' and p.cognome='Riva'
group by pj.id;