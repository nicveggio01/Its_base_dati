
begin transaction;

set constraints all deferred;

insert into Impiegato(id, nome, cognome, nascita, stipendio) VALUES

('0',    'Anna',    'Bianchi',    '2000-12-12',    35000.00 ),
('1',   'Beatrice',    'Rossi',    '2001-10-12',   27000.00),
('2',   'Federico',   'Signore',   '1996-03-10', 45000.00),
('3', 'Luca', 'Verdi', '1995-07-21', 42000.00),
('4', 'Giulia', 'Russo', '1998-04-03', 36000.00),
('5', 'Marco', 'Galli', '1997-11-15', 39000.00),
('6', 'Sara', 'Fontana', '2000-01-30', 28000.00),
('7', 'Alessandro', 'De Luca', '1994-06-12', 47000.00),
('8', 'Chiara', 'Ferrari', '1999-09-05', 33000.00),
('9', 'Davide', 'Conti', '1996-02-20', 41000.00),
('10', 'Elisa', 'Greco', '2002-08-18', 25000.00),
('11', 'Matteo', 'Romano', '1995-12-09', 44000.00),
('12', 'Francesca', 'Marino', '2001-05-25', 31000.00);

insert into Progetto(id, nome, budjet ) VALUES

('1', 'Sito Web Aziendale', 15000.00),
('2', 'App Mobile Banking', 28000.00),
('3', 'Social sponsoring', 22000.00),
('4', 'Piattaforma E-learning', 35000.00),
('5', 'Sistema Gestione risorse umane', 18000.00),
('6', 'E-commerce', 40000.00),
('7', 'Login system', 12000.00),
('8', 'App permessi', 25000.00),
('9', 'Dashboard Analitica', 30000.00),
('10', 'Tool Automazione Marketing', 27000.00);

insert into Dipartimento(id, indirizzo, nome) VALUES

('1', 'Via Roma 12', 'Risorse Umane'),
('2', 'Via Giuseppe Garibaldi 45', 'IT e Sviluppo'),
('3', 'Via Verdi 10', 'Marketing'),
('4', 'Via Mazzini 77', 'Logistica'),
('5', 'via Ginori 1', 'Amministrazione'),
('6', 'Via Manzoni 3, Roma', 'Vendite');


insert into NumeroTelefono(telefono) VALUES

('320-456-7890'),
('333-123-4567'),
('345-678-9012'),
('389-555-1122'),
('327-890-3344'),
('351-234-5678'),
('339-876-5432'),
('366-789-0123'),
('328-112-2233'),
('340-998-7766');

insert into Afferenza(impiegato, dipartimento, data_afferenza) VALUES

('0', '1', '2022-01-15'),
('1', '3', '2023-02-10'),
('2', '2', '2021-11-01'),
('4', '4', '2023-01-10'),
('6', '1', '2023-03-12'),
('7', '5', '2022-04-18'),
('8', '3', '2023-05-01'),
('9', '6', '2021-09-25');

insert into Dip_telefono(dipartimento, telefono) VALUES

('1', '320-456-7890'),
('2', '333-123-4567'),
('3', '345-678-9012'),
('4', '389-555-1122'),
('5', '327-890-3344'),
('6', '351-234-5678');


insert into Coinvolto(impiegato, progetto) VALUES

('0', '1'),
('1', '2'),
('2', '3'),
('3', '1'),
('4', '4'),
('5', '2'),
('6', '5'),
('7', '6'),
('8', '7'),
('9', '3'),
('10', '8'),
('11', '9');


insert into Direzione(impiegato, dipartimento) VALUES

('0', '1'),  
('2', '2'),  
('4', '3'),  
('7', '4'),  
('8', '5'),  
('9', '6');

commit;














