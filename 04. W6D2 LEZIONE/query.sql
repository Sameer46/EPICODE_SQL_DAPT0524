CREATE TABLE Prodotti(
IDprodotti INT NOT NULL,
NomeProdotto VARCHAR(100),
Prezzo DECIMAL(10),
CONSTRAINT PK_IDprodotti PRIMARY KEY (IDprodotti)
);
CREATE TABLE Clienti(
IDCliente INT NOT NULL,
Nome VARCHAR(50),
Email VARCHAR(100),
CONSTRAINT PK_IDCliente PRIMARY KEY (IDCliente)
);
CREATE TABLE Ordini(
IDOrdine INT NOT NULL,
IDprodotti INT,
IDCliente INT,
Quantità INT,
CONSTRAINT PK_IDOrdine PRIMARY KEY (IDOrdine),
CONSTRAINT FK_Ordini_Prodotti FOREIGN KEY (IDprodotti) REFERENCES prodotti(IDprodotti),
CONSTRAINT FK_Ordini_Clienti FOREIGN KEY (IDCliente) REFERENCES Clienti(IDCliente)
);
CREATE TABLE DettaglioOrdini(
IDOrdine INT,
IDprodotti INT,
IDCliente INT,
PrezzoTotale DECIMAL(10),
CONSTRAINT PK_OrdiniProdottiClienti PRIMARY KEY (IDOrdine, IDProdotti,IDCliente),
CONSTRAINT FK_DettaglioOrdini_Prodotti FOREIGN KEY (IDprodotti) REFERENCES prodotti(IDprodotti),
CONSTRAINT FK_DettaglioOrdini_Clienti FOREIGN KEY (IDCliente) REFERENCES Clienti(IDCliente),
CONSTRAINT FK_DettaglioOrdini_Ordini FOREIGN KEY (IDOrdine) REFERENCES Ordini(IDOrdine)
);
ALTER TABLE Prodotti
CHANGE COLUMN IDProdotti IDProdotto INT;
ALTER TABLE Ordini
CHANGE COLUMN IDProdotti IDProdotto INT;
ALTER TABLE DettaglioOrdini
CHANGE COLUMN IDProdotti IDProdotto INT;

INSERT INTO Prodotti (IDProdotto, NomeProdotto, Prezzo)
VALUES
(1, 'Tablet', 300.00),
(2, 'Mouse', 20.00),
(3, 'Tastiera', 25.00),
(4, 'Monitor', 180.00),
(5, 'HHD', 90.00),
(6, 'SSD', 200.00),
(7, 'RAM', 100.00),
(8, 'Router', 80.00),
(9, 'Webcam', 45.00),
(10, 'GPU', 1250.00),
(11, 'Trackpad', 500.00),
(12, 'Techmagazine', 5.00),
(13, 'Martech', 50.00);

INSERT INTO Ordini (IDOrdine, IDProdotto, Quantità)
VALUES
(1, 2, 10),
(2, 6, 2),
(3, 5, 3),
(4, 1, 1),
(5, 9, 1),
(6, 4, 2),
(7, 11, 6),
(8, 10, 2),
(9, 3, 3),
(10, 3, 1),
(11, 2, 1);
INSERT INTO Clienti (IDCliente, Nome, Email)
VALUES
(1,"Antonio",null),
(2,"Battista","battista@mailmail.it"),
(3,"Maria","maria@posta.it"),
(4,"Franca","franca@lettere.it"),
(5,"Ettore",null),
(6,"Arianna","arianna@posta.it"),
(7,"Piero","piero@lavoro.it");


