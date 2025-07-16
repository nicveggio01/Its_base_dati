
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

from 




-- 8. Quali sono gli aeroporti (con codice IATA, nome e luogo) nei quali partono voli della compagnia di nome ‘MagicFly’ ?

--9. Quali sono i voli che partono da un qualunque aeroporto della città di ‘Roma’ e atterrano ad un qualunque aeroporto della città di ‘New York’ ? Restituire: codice del volo, nome della compagnia, e aeroporti di partenza e arrivo.

--10. Quali sono i possibili piani di volo con esattamente un cambio (utilizzando solo voli della stessa compagnia) da un qualunque aeroporto della città di ‘Roma’ ad un qualunque aeroporto della città di ‘New York’ ? Restituire: nome della compagnia, codici dei voli, e aeroporti di partenza, scalo e arrivo.

-- 11. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’, atter-rano all’aeroporto ‘JFK’, e di cui si conosce l’anno di fondazione?