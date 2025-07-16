
-- 1. Quali sono i voli (codice e nome della compagnia) la cui durata supera le 3 ore?

select v.codice, v.comp

from Volo v
join Compagnia c
on v.comp = c.nome

where v.durataMinuti > 180;




-- 2. Quali sono le compagnie che hanno voli che superano le 3 ore?

select distinct c.nome

from Compagnia c 
join Volo v
on c.nome= v.comp

where v.durataMinuti > 180;




-- 3. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto con codice 'CIA’ ?

select v.codice, v.comp

from Volo v
join ArrPart ap 
on v.codice = ap.codice and v.comp = ap.comp

where ap.partenza = 'CIA';




-- 4. Quali sono le compagnie che hanno voli che arrivano all’aeroporto con codice ‘FCO’ ?

select distinct c.nome

from Compagnia c
join Volo v
on v.comp = c. nome
join ArrPart ap
on v.codice = ap.codice and c.nome  =  ap.comp

where ap.arrivo= 'FCO';


-- 5. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto ‘FCO’ e arrivano all’aeroporto ‘JFK’ ?

select v.codice, v.comp

from Volo v
join ArrPart ap
on v.codice = ap.codice and c.nome = ap.comp
join Compagnia c
on c.nome = v.comp

where ap.partenza = 'FCO' and ap.arrivo = 'JFK';




-- 6. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’ e atterrano all’aeroporto ‘JFK’ ?

select distinct c.nome

from Compagnia c
join Volo v
on v.comp = c.nome
join ArrPart ap
on v.codice = ap.codice and c.nome = ap.comp

where ap.partenza = 'FCO' and ap.arrivo = 'JFK'


-- 7. Quali sono i nomi delle compagnie che hanno voli diretti dalla città di ‘Roma’ alla città di ‘New York’ ?

select distinct c.nome

from Compagnia c

join Volo v
on v.comp = c.nome
join ArrPart ap
on v.codice = ap.codice and v.comp = ap.comp
join Aeroporto aPart 
on aPart.codice = ap.partenza
join LuogoAeroporto laPart
on laPart.codice =  aPart.codice
join Aeroporto aArr
on aArr.codice = ap.arrivo
join LuogoAeroporto laArr
on laArr.aeroporto = aArr.codice

where laPart.citta = 'Roma' and laArr.citta = 'New York';






-- 8. Quali sono gli aeroporti (con codice IATA, nome e luogo) nei quali partono voli della compagnia di nome ‘MagicFly’ ?

select a.codice, a.nome, la.citta

from Volo v
join Compagnia c
on v.comp = c.nome 
join ArrPart ap
on ap.comp = c.nome and ap.codice = v.codice
join Aeroporto a
on a.codice = ap.partenza
join LuogoAeroporto la
on a.codice = la.aeroporto

where c.nome= 'MagicFly';




--9. Quali sono i voli che partono da un qualunque aeroporto della città di ‘Roma’ e atterrano ad un qualunque aeroporto della città di ‘New York’ ? Restituire: codice del volo, nome della compagnia, e aeroporti di partenza e arrivo.

select distinct v.codice, c.nome, ap.partenza, ap.arrivo

from Compagnia c

join Volo v
on v.comp = c.nome
join ArrPart ap
on v.codice = ap.codice and v.comp = ap.comp
join Aeroporto aPart 
on aPart.codice = ap.partenza
join LuogoAeroporto laPart
on laPart.aeroporto =  aPart.codice
join Aeroporto aArr
on aArr.codice = ap.arrivo
join LuogoAeroporto laArr
on laArr.aeroporto = aArr.codice

where laPart.citta = 'Roma' and laArr.citta = 'New York';




--10. Quali sono i possibili piani di volo con esattamente un cambio (utilizzando solo voli della stessa compagnia) da un qualunque aeroporto della città di ‘Roma’ ad un qualunque aeroporto della città di ‘New York’ ? Restituire: nome della compagnia, codici dei voli, e aeroporti di partenza, scalo e arrivo.

select distinct c.nome, v1.codice as volo1, ap1.partenza as aeroporto_partenza, ap1.arrivo as aeroporto_scalo, v2.codice as volo2, ap2.arrivo as aeroporto_arrivo

from Compagnia c

join Volo v1
on v1.comp = c.nome
join ArrPart ap1
on v1.codice = ap1.codice and v1.comp = ap1.comp
join Aeroporto aPart 
on aPart.codice = ap1.partenza
join LuogoAeroporto laPart
on laPart.aeroporto =  aPart.codice
join Aeroporto aArr
on aArr.codice = ap1.arrivo
join LuogoAeroporto laArr
on laArr.aeroporto = aArr.codice

join Volo volo2
on v2.comp = c.nome
join ArrPart ap2
on ap2.codice = v2.codice and v2.comp = ap2.comp
join Aeroporto aScalo 
on aScalo.codice = ap1.arrivo 
join Aeroporto aArrivo
on aArrivo = ap2.arrivo
join LuogoAeroporto laArr
on laArr.aeroporto = aArrivo.codice


where laPart.citta = 'Roma' and laArr.citta = 'New York' and aScalo.codice = ap2.partenza


-- 11. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’, atter-rano all’aeroporto ‘JFK’, e di cui si conosce l’anno di fondazione?

select distinct c.nome

from Compagnia c
join Volo v
on v.comp = c.nome
join ArrPart ap
on v.codice = ap.codice and v.comp = ap.comp

where ap.partenza = 'FCO' and ap.arrivo = 'JFK' and c.annoFondaz is not null;