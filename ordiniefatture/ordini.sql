

Create DOMAIN Real 0 1 as RealGEZ
check (value <= 1);
Create DOMAIN RealGEZ as real
check (value >=0);
Create DOMAIN CodiceFiscale as
char(16),
check VALUE ~^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$
;
Create DOMAIN PartitaIva as
char(11)
check (VALUE ~^[0-9](11));

Create DOMAIN Telefono as
char(10)
check (VALUE ~^[0-9](10));

Create DOMAIN Email as
Varchar
check (VALUE ~'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$');

Create Type StatoOrdine as ENUM(
"in preparazione", "inviato", "da saldare", "saldato"
);




