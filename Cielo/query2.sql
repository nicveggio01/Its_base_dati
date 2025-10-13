
---QUERY CON RAGGRUPPAMENTI:CIELO 2---



-- 1. Quante sono le compagnie che operano (sia in arrivo che in partenza) nei diversi aeroporti?--

SELECT a.codice, a.nome, COUNT(ap.comp) as tot_comp
FROM Aeroporto a, ArrPart ap
WHERE a.codice=ap.arrivo or a.codice=ap.partenza
GROUP BY a.codice, a.nome
ORDER BY tot_comp DESC;

-- 2. Quanti sono i voli che partono dall’aeroporto ‘HTR’ e hanno una durata di almeno 100 minuti?--

SELECT count(*) as num_voli
FROM Volo v, ArrPart ap
WHERE v.codice=ap.codice and ap.partenza= 'HTR' and v.durataMinuti >=100;

-- 3. Quanti sono gli aeroporti sui quali opera la compagnia ‘Apitalia’, per ogni nazione nella quale opera?--

SELECT la.nazione, count(distinct ap.comp) as num_aereoporti
FROM ArrPart ap, LuogoAeroporto la
WHERE ap.comp='Apitalia' and (la.aeroporto= ap.arrivo or la.aeroporto=ap.partenza)
GROUP BY la.nazione
ORDER BY num_aereoporti DESC;

-- 4. Qual è la media, il massimo e il minimo della durata dei voli effettuati dalla compagnia ‘MagicFly’?--

SELECT avg(v.durataMinuti) as media_durata_voli_Magic_Fly,
max(v.durataMinuti) as durata_max,
min(durataMinuti) as durata_minima
FROM Volo v, Compagnia c
WHERE c.nome='MagicFly' and c.nome=v.comp;

-- 5. Qual è l’anno di fondazione della compagnia più vecchia che opera in ognuno degli --aeroporti?-- 

SELECT a.codice,  min(c.annoFondaz) as anno_della_compagnia_piu_vecchia
FROM Compagnia c, ArrPart ap, Aeroporto a
WHERE c.nome=ap.comp and (a.codice=ap.arrivo or a.codice= ap.partenza)
GROUP BY a.codice;

-- 6. Quante sono le nazioni (diverse) raggiungibili da ogni nazione tramite uno o più voli?--

SELECT lp.nazione as nazione_partenza, COUNT(distinct la.nazione) as nazioni_raggiungibili
FROM LuogoAeroporto lp, LuogoAeroporto la, ArrPart ap
WHERE lp.aeroporto= ap.partenza and la.aeroporto=ap.arrivo and lp.nazione != la.nazione
GROUP BY lp.nazione;


--7. Qual è la durata media dei voli che partono da ognuno degli aeroporti?--

SELECT ap.partenza,a.nome, avg(v.durataMinuti) as media_durata_voli 
FROM Arrpart ap, Volo v, Aeroporto a
WHERE v.codice=ap.codice and a.codice=ap.partenza
GROUP BY ap.partenza, a.nome
ORDER BY ap.partenza ASC, a.nome ASC;

-- 8. Qual è la durata complessiva dei voli operati da ognuna delle compagnie fondate a partire dal 1950?--

SELECT c.nome, sum(v.durataMinuti) as durata_totale
FROM Compagnia c, Volo v
WHERE c.nome= v.comp and c.annoFondaz >= 1950
GROUP BY c.nome
ORDER BY c.nome ASC;










