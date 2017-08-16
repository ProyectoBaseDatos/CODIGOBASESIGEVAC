CREATE DATABASE SIGEVAC;
USE SIGEVAC;

CREATE TABLE Cliente 
	(cedCliente		   varchar(10) NOT NULL,
	 nombreCliente	   varchar(30) NOT NULL,
     apellidoCliente   varchar(30) NOT NULL,
	 direccionCliente  varchar(50) NOT NULL,
	 telefonoCliente   varchar(10),
     emailCliente      VARCHAR(45),
	 PRIMARY KEY(cedCliente));

CREATE TABLE FormaPago
	(idFormaPago		INTEGER NOT NULL,
	 tipoPago       	varchar(15) NOT NULL,
	 PRIMARY KEY (idFormaPago));
     
CREATE TABLE Pago 
	(idPago	            INTEGER NOT NULL,
	 FormaPago_idFormaPago 	INTEGER NOT NULL,
	 PRIMARY KEY (idPago),
	  FOREIGN KEY (FormaPago_idFormaPago) REFERENCES FormaPago (idFormaPago)); 

CREATE TABLE TipoCortina 
	(idTipoTela		   INTEGER NOT NULL,
	 materialCortina	   VARCHAR(15),
	 PRIMARY KEY(idTipoTela	));
 
 CREATE TABLE ColorCortina 
	(idColorCortina		   INTEGER NOT NULL,
	 nombreColor	       VARCHAR(10) NOT NULL,
	 PRIMARY KEY(idColorCortina)); 
       
CREATE TABLE Cortina
	(idCortina	                INTEGER NOT NULL,
	 descripcion	            VARCHAR(45) NOT NULL,
	 TipoCortina_idTipoTela	    INTEGER NOT NULL,
     ColorCortina_ColorCortina  INTEGER NOT NULL,
     PrecioCortina              FLOAT NOT NULL,
	 PRIMARY KEY (idCortina),
	 FOREIGN KEY (TipoCortina_idTipoTela) REFERENCES TipoCortina (idTipoTela),
	 FOREIGN KEY (ColorCortina_ColorCortina) REFERENCES ColorCortina (idColorCortina));  
     
  CREATE TABLE Empleado
	(idEmpleado	                INTEGER NOT NULL,
	 nombreEmpleado	            VARCHAR(50) NOT NULL,
     apellidoEmpleado           VARCHAR(50) NOT NULL,
	 direccionEmpleado          VARCHAR(50) NOT NULL,
     telefonoEmpleado           VARCHAR(10) NOT NULL,
	 rolEmpleado	            VARCHAR(15) NOT NULL,
	 PRIMARY KEY (idEmpleado));
     
	CREATE TABLE Alquiler
	(idAlquiler                 INTEGER NOT NULL,
	 fechaAlquiler              DATE,
	 Cortina_IdCortina          INTEGER NOT NULL,
     Empleado_IdEmpleado        INTEGER NOT NULL,
	 PRIMARY KEY (idAlquiler),
     FOREIGN KEY (Cortina_IdCortina) REFERENCES Cortina (IdCortina),
	 FOREIGN KEY (Empleado_IdEmpleado) REFERENCES Empleado (idEmpleado)); 
     
     CREATE TABLE Venta
	(idVenta                    INTEGER NOT NULL,
	 fechaVenta                 DATE,
     Empleado_IdEmpleado        INTEGER NOT NULL,
	 PRIMARY KEY (idVenta),
	 FOREIGN KEY (Empleado_IdEmpleado) REFERENCES Empleado (idEmpleado)); 
     
CREATE TABLE Factura 
	(idFactura		     INTEGER NOT NULL,
     Empleado_IdEmpleado INTEGER NOT NULL,
     Alquiler_IdAlquiler INTEGER,
	 Pago_idPago         INTEGER NOT NULL,
     Venta_idVenta       INTEGER,
	 Cliente_cedCliente  VARCHAR(10) NOT NUll,
	 PRIMARY KEY (idFactura),
	 FOREIGN KEY (Cliente_cedCliente) REFERENCES Cliente (cedCliente),
	 FOREIGN KEY (Pago_idPago)  REFERENCES PAGO (idPago),
     FOREIGN KEY (Empleado_IdEmpleado) REFERENCES Empleado (idEmpleado),
	 FOREIGN KEY (Venta_idVenta) REFERENCES Venta (idVenta),
     FOREIGN KEY (Alquiler_IdAlquiler)  REFERENCES Alquiler (IdAlquiler));
  
CREATE TABLE DetalleFactura 
	(idDetalleFctura		INTEGER NOT NULL,
	 cantidad	            INTEGER NOT NULL,
	 precioVenta			FLOAT NOT NULL,
	 iva			        FLOAT NOT NULL,
     Factura_idFactura      INTEGER NOT null,
     Cortina_IdCortina      INTEGER NOT NULL,
	 PRIMARY KEY (idDetalleFctura),
	 FOREIGN KEY (Cortina_IdCortina) REFERENCES Cortina (IdCortina),
	 FOREIGN KEY (Factura_idFactura) REFERENCES Factura (idFactura));
     
CREATE TABLE Proveedor 
	(idProveedor	           INTEGER NOT NULL,
	 empresa                   VARCHAR(30) NOT NULL,
	 nombreProveedor	       VARCHAR(20) NOT NULL,
     apellidoProveedor         VARCHAR(45) NOT NULL,
     direccionProveedor        VARCHAR(50) NOT NULL,
     telefonoProveedor         VARCHAR(10) NOT NULL,
     emailProveedor            VARCHAR(45),
	 PRIMARY KEY(idProveedor)); 

CREATE TABLE RegistroIngreso
	(idRegistroIngreso	   INTEGER NOT NULL,
     fechaIngreso          DATE NOT NULL,
	 cantidad	           INTEGER NOT NULL,
     Proveedor_IdProveedor INTEGER NOT NULL,
	 PRIMARY KEY(idRegistroIngreso),
	 FOREIGN KEY (Proveedor_IdProveedor)  REFERENCES Proveedor (idProveedor));
     
     
CREATE TABLE Stock 
	(idStock	                       INTEGER NOT NULL,
	 cantidad	                       INTEGER NOT NULL,
     Cortina_idCortina                 INTEGER NOT NULL,
     RegistroIngreso_IdRegistroIngreso INTEGER NOT NULL,
	 PRIMARY KEY(idStock),
	 FOREIGN KEY (RegistroIngreso_IdRegistroIngreso)  REFERENCES RegistroIngreso (idRegistroIngreso),    
	 FOREIGN KEY (Cortina_idCortina)  REFERENCES Cortina (idCortina));

CREATE TABLE Compra
	(idCompra	                INTEGER NOT NULL,
	 cantidad	                INTEGER NOT NULL,
	 precio	                    FLOAT NOT NULL,
	 RegistroIngreso_IdRegistroIngreso INTEGER NOT NULL,
     Cortina_idCortina          INTEGER NOT NULL,
	 Empleado_idEmpleado        INTEGER NOT NULL,
	 PRIMARY KEY (idCompra),
     FOREIGN KEY (Cortina_idCortina)  REFERENCES Cortina (idCortina),
	 FOREIGN KEY (RegistroIngreso_IdRegistroIngreso)  REFERENCES RegistroIngreso (idRegistroIngreso),    
     FOREIGN KEY (Empleado_idEmpleado) REFERENCES Empleado (idEmpleado));


INSERT INTO CLIENTE VALUES ('0987372715', 'ANA MARIA', 'PITA VERA', 'Av. Carlos Luis Plaza DaÃ±Ã­n y Francisco BoloÃ±a', '298345','Ana@hotmail.com');
INSERT INTO CLIENTE VALUES ('0987372815', 'MARIA JOSE','VERA SAAD','Av. Victor Emilio Estrada y Av. Las Monjas', '367849','majo@hotmail.com');
INSERT INTO CLIENTE VALUES ('0990672715', 'MARIA VERONICA','PEREZ RODRIGUES','BenjamÃ­n CarriÃ³n s/n y Av. Felipe Pezo', '450949','vero@hotmail.com');
INSERT INTO CLIENTE VALUES ('0990612093', 'DIANA MARTHA','MERA VERA','Av. Juan Tanca Marengo y Av. ConstituciÃ³n', '476362','dayamar@gmail.com');
INSERT INTO CLIENTE VALUES ('0983727093', 'KAREN JENIFFER','PARRA PIZA','Av. 25 de Julio y Ernesto AlbÃ¡n', '098374','karen40@hotmail.com');
INSERT INTO CLIENTE VALUES ('0900493923', 'DEBORA JOSELYN','PARRALES CASTILLO','UrbanizaciÃ³n Porto Fino VÃ­a a la Costa', '947281','dejose@hotmail.com');
INSERT INTO CLIENTE VALUES ('0938371394', 'MISHELL KATE','ARBOLEDA BAQUE','Av. Daule Km. 9.5 diagonal al Fuerte Huancavilca ', '893721','mikakate@hotmail.com');
INSERT INTO CLIENTE VALUES ('0992819373', 'JONATHAN HERNAN','ROBLES BAQUE','Av. Francisco de Orellana y Av. Guillermo Pareja ', '954123','jhonny@hotmail.com');
INSERT INTO CLIENTE VALUES ('0999293932', 'CRISTOPHER JEAN','TOMALA ORDOÃ‘ES',' Av. San Jorge y Av. Carlos Luis Plaza DaÃ±Ã­n', '727172','crisjean@gmail.com');
INSERT INTO CLIENTE VALUES ('0909382182', 'BRUS DANIEL','AVILES MENDEZ',' Manuel Galecio N328 y Ximena', '034616','danny@hotmail.com');
INSERT INTO CLIENTE VALUES ('0991920203', 'ANGEL SAUL','SUAREZ RODRIGUEZ','BenjamÃ­n Rosales y AmÃ©ricas', '475064','angel_saul@hotmail.com');
INSERT INTO CLIENTE VALUES ('0909392818', 'JESUS MIGUEL',' VILLAMAR REYES',' Km 2.5 VÃ­a a SamborondÃ³n', '293829','jesus_miguel@gmail.com');

INSERT INTO FormaPago VALUES (1, 'CONTADO'); 
INSERT INTO FormaPago VALUES (2, 'CREDITO'); 
 
INSERT INTO PAGO VALUES (901,1);
INSERT INTO PAGO VALUES (902,2);
INSERT INTO PAGO VALUES (903,1);
INSERT INTO PAGO VALUES (904,1);
INSERT INTO PAGO VALUES (905,1);
INSERT INTO PAGO VALUES (906,2);
INSERT INTO PAGO VALUES (907,1);
INSERT INTO PAGO VALUES (908,1);
INSERT INTO PAGO VALUES (909,2);
INSERT INTO PAGO VALUES (910,1);
INSERT INTO PAGO VALUES (911,2);
INSERT INTO PAGO VALUES (912,1);
INSERT INTO PAGO VALUES (913,1);
INSERT INTO PAGO VALUES (914,2);
INSERT INTO PAGO VALUES (915,1);
INSERT INTO PAGO VALUES (916,1);
INSERT INTO PAGO VALUES (917,2);
INSERT INTO PAGO VALUES (918,2);

INSERT INTO TipoCortina VALUES (7001, 'ALGODON');   
INSERT INTO TipoCortina VALUES (7002, 'SEDA');  
INSERT INTO TipoCortina VALUES (7003, 'LANA');  
INSERT INTO TipoCortina VALUES (7004, 'MIXTA'); 
  
 INSERT INTO ColorCortina VALUES (5001, 'BEIGE');
 INSERT INTO ColorCortina VALUES (5002, 'BLANCA');  
 INSERT INTO ColorCortina VALUES (5003, 'ROJA');  
 INSERT INTO ColorCortina VALUES (5004, 'AMARILLO');  
 INSERT INTO ColorCortina VALUES (5005, 'CELESTE');  
 INSERT INTO ColorCortina VALUES (5006, 'CREMA');  
 INSERT INTO ColorCortina VALUES (5007, 'CAFE');   
 
 INSERT INTO CORTINA VALUES (6001,'JUVENIL', 7001, 5001,30);  
 INSERT INTO CORTINA VALUES (6002,'INFANTIL',7002,5002,20);
 INSERT INTO CORTINA VALUES (6003,'CLASICA',7003,5003,50);
 INSERT INTO CORTINA VALUES (6004,'ELEGANTE',7004,5003,80);
 
 
INSERT INTO Empleado VALUES (0001, 'JESUS MARTIN', 'ROMERO ZAMBRANO','SAMANES 7','0997626333','ADMINISTRADOR');
INSERT INTO Empleado VALUES (0002, 'HERMAN RAUL','ROJAS PIERO','MAPASINGUE OESTE','0987635621','VENDEDOR');
INSERT INTO Empleado VALUES (0003, 'KARINA ROMINA',' VILLAMAR VELEZ','GUASMO NORTE','0976392011','VENDEDOR');
INSERT INTO Empleado VALUES (0004, 'ROMAN AURELIO','BELTRAN CARDONA','LOMAS DE URDESA','0978900261','ADMINISTRADOR');
INSERT INTO Empleado VALUES (0005, 'MARIA GREGORIA','TOMALA RIVADENEIRA','CDLA LOS ESTEROS 432','0989043217','VENDEDOR');
INSERT INTO Empleado VALUES (0006, 'JEMIMA MAYRA','SOLIS ROCHA','SUBURBIO OESTE','0989432178','DESPACHADOR');
INSERT INTO Empleado VALUES (0007, 'RONALD DIEGO','CASTRO BRAVO','ENTRADA DE LA 8','0904732717','DESPACHDOR');
INSERT INTO Empleado VALUES (0008, 'MIGUEL TOMMY','REYES MOSQUERA','ISLA TRINITARIA','0989043280','BODEGUERO');

INSERT INTO Alquiler VALUES (22001,'2017-07-04',6001,0001);
INSERT INTO Alquiler VALUES (22002,'2017-07-10',6002,0002);
INSERT INTO Alquiler VALUES (22003,'2017-07-14',6003,0003);
INSERT INTO Alquiler VALUES (22004,'2017-08-01',6004,0005);
INSERT INTO Alquiler VALUES (22005,'2017-08-02',6002,0001);
INSERT INTO Alquiler VALUES (22006,'2017-08-04',6001,0003);
INSERT INTO Alquiler VALUES (22007,'2017-08-05',6003,0004);

INSERT INTO Venta VALUES (11001,'2017-07-03',0001);
INSERT INTO Venta VALUES (11002,'2017-07-14',0002);
INSERT INTO Venta VALUES (11003,'2017-07-15',0003);
INSERT INTO Venta VALUES (11004,'2017-07-25',0005);
INSERT INTO Venta VALUES (11005,'2017-08-02',0001);
INSERT INTO Venta VALUES (11006,'2017-08-04',0005);
INSERT INTO Venta VALUES (11007,'2017-08-05',0004);

INSERT INTO FACTURA VALUES (75001,0001,null,901,11001,'0987372715');
INSERT INTO FACTURA VALUES (75002,0002,22002,902,NULL,'0938371394');
INSERT INTO FACTURA VALUES (75003,0003,null,903,11003,'0909392818');
INSERT INTO FACTURA VALUES (75004,0004,null,904,11004,'0909392818'); 
INSERT INTO FACTURA VALUES (75005,0005,NULL,905,11005,'0990672715'); 
INSERT INTO FACTURA VALUES (75006,0001,22006,906,null,'0990672715'); 
INSERT INTO FACTURA VALUES (75007,0004,null,907,11007,'0999293932'); 

INSERT INTO Proveedor VALUES (01, 'TEX MODA','JOSE MARTIN','DELGADO ROMERO','Alemania y Suiza Esq.', '2521605', 'servicioalcliente@texmodaecuador.com'); 
INSERT INTO Proveedor VALUES (02, 'IVAN TEX','CATALINA STEPHANIE','ANZULES CORDOVA','SUCRE 404 Y CHILE ESQ.', '320925', 'servicioalcliente@ivantex.com');    
INSERT INTO Proveedor VALUES (03, 'NEYMATEX','RICARDO RAFAEL','BAQUE PERALTA','Km 7 1/2 VÃ­a Daule LotizaciÃ³n Santa Cecilia ','3712311', 'ventas@neymatex.com'); 
INSERT INTO Proveedor VALUES (04, 'ECUACOTTON','GUSTAVO ROMMEL','CEDEÃ‘O MOSQUERA','kM 16 1/2 Via Daule','43701990', 'ecuacotton.com'); 

INSERT INTO DetalleFactura VALUES (330001,5,20.00,0.12,75001,6001);
INSERT INTO DetalleFactura VALUES (330002,10,10.00,0.12,75002,6002);
INSERT INTO DetalleFactura VALUES (330003,15,15.00,0.12,75003,6003);
INSERT INTO DetalleFactura VALUES (330004,3,20.00,0.12,75004,6004);
INSERT INTO DetalleFactura VALUES (330005,7,10.00,0.12,75005,6002);
INSERT INTO DetalleFactura VALUES (330006,10,20.00,0.12,75006,6004);
INSERT INTO DetalleFactura VALUES (330007,20,15.00,0.12,75007,6003);

INSERT INTO RegistroIngreso VALUES (440001,'2017-04-01',50,01);
INSERT INTO RegistroIngreso VALUES (440002,'2017-04-02',70,02);
INSERT INTO RegistroIngreso VALUES (440003,'2017-04-03',30,03);
INSERT INTO RegistroIngreso VALUES (440004,'2017-04-04',20,04);
INSERT INTO RegistroIngreso VALUES (440005,'2017-05-15',50,01);
INSERT INTO RegistroIngreso VALUES (440006,'2017-05-24',70,02);
INSERT INTO RegistroIngreso VALUES (440007,'2017-06-01',40,03);
INSERT INTO RegistroIngreso VALUES (440008,'2017-06-07',20,04);
INSERT INTO RegistroIngreso VALUES (440009,'2017-07-10',10,01);
INSERT INTO RegistroIngreso VALUES (440010,'2017-07-15',30,02);
INSERT INTO RegistroIngreso VALUES (440011,'2017-07-25',50,03);
INSERT INTO RegistroIngreso VALUES (440012,'2017-08-03',70,04);

INSERT INTO Stock VALUES (550001,50,6001,440001);
INSERT INTO Stock VALUES (550002,70,6002,440002);
INSERT INTO Stock VALUES (550003,30,6003,440003);
INSERT INTO Stock VALUES (550004,20,6004,440004);
INSERT INTO Stock VALUES (550005,50,6001,440005);
INSERT INTO Stock VALUES (550006,70,6002,440006);
INSERT INTO Stock VALUES (550007,40,6003,440007);
INSERT INTO Stock VALUES (550008,20,6004,440008);
INSERT INTO Stock VALUES (550009,10,6001,440009);
INSERT INTO Stock VALUES (550010,30,6002,440010);
INSERT INTO Stock VALUES (550011,50,6003,440011);
INSERT INTO Stock VALUES (550012,70,6004,440012);

INSERT INTO Compra VALUES (880001,30,15.00,440001,6001,0001);
INSERT INTO Compra VALUES (880002,20,10.00,440002,6002,0002);
INSERT INTO Compra VALUES (880003,10,15.00,440003,6003,0003);
INSERT INTO Compra VALUES (880004,30,10.00,440004,6004,0004);
INSERT INTO Compra VALUES (880005,20,15.00,440005,6001,0005);
INSERT INTO Compra VALUES (880006,10,15.00,440006,6002,0001);
INSERT INTO Compra VALUES (880007,15,10.00,440007,6003,0002);
INSERT INTO Compra VALUES (880008,30,10.00,440008,6004,0003);
INSERT INTO Compra VALUES (880009,20,15.00,440009,6001,0004);
INSERT INTO Compra VALUES (880010,20,10.00,440010,6002,0005);
INSERT INTO Compra VALUES (880011,40,15.00,440011,6003,0002);
INSERT INTO Compra VALUES (880012,50,10.00,440012,6004,0005);

CREATE VIEW CATALOGO_PRODUCTOS
AS 
SELECT C.descripcion AS DESCRIPCION, nombreColor AS COLOR, materialCortina AS MATERIAL
FROM Cortina C, ColorCortina CO, TipoCortina T
ORDER BY DESCRIPCION;

CREATE VIEW DETALLES_VENTAS
AS
SELECT IdCortina, descripcion, nombreColor, materialCortina, COUNT(CORTINA_IdCortina) AS TOTAL_VENTAS
FROM Cortina , ColorCortina , TipoCortina , detallefactura  
WHERE CORTINA_IdCortina=IdCortina AND TipoCortina_IdTipoTela=IdTipoTela AND ColorCortina_ColorCortina=IdColorCortina
GROUP BY IdCortina;


CREATE VIEW TOTAL_STOCK
AS
SELECT idCortina AS CODIGO_CORTINA, nombreColor as COLOR, materialCortina AS TIPO , s.cantidad AS TOTAL_EN_STOCK
FROM ColorCortina , TipoCortina , stock s, cortina c 
WHERE s.CORTINA_IdCortina=IdCortina AND TipoCortina_IdTipoTela=IdTipoTela AND ColorCortina_ColorCortina=IdColorCortina
GROUP BY idCortina;

DELIMITER /
CREATE PROCEDURE ventasPorFecha(IN fechaInicio DATE, IN fechaFinal DATE, OUT ventaTotal FLOAT)
BEGIN
  SELECT SUM(d.cantidad*d.precioVenta) INTO ventaTotal
  FROM venta v, factura f, detallefactura d
  WHERE v.Factura_idFactura =f.idFactura AND f.idFactura=d.FACTURA_idFactura AND v.fechaVenta BETWEEN fechaInicio AND fechaFinal;
  END; / 
DELIMITER ;

CREATE TABLE registroActualizacion 
	(idRegistro	                       INTEGER NOT NULL AUTO_INCREMENT,
	 nombreTabla	                   VARCHAR(30) NOT NULL,
     fechaActualizacion                DATE NOT NULL,
	 PRIMARY KEY(idRegistro));

DELIMITER /
CREATE TRIGGER actualizarStock AFTER INSERT ON registroingreso
FOR EACH ROW 
BEGIN 
	SET stock.cantidad = stock.cantidad + registroingreso.cantidad;
END / 
DELIMITER ;

DELIMITER /
CREATE TRIGGER registarEvento AFTER DELETE ON proveedor
FOR EACH ROW 
BEGIN 
	INSERT INTO registroActualizacion (idRegistro, nombreTabla, fechaActualizacion)
	VALUES (0, 'proveedor', CURRENT_DATE());
END / 
DELIMITER ;

CREATE UNIQUE INDEX indexCliente ON cliente (cedCliente) USING BTREE;

CREATE FULLTEXT INDEX modeloCortina ON cortina (tipoCortina);

CREATE INDEX indexProveedor ON proveedor (idProveedor) USING HASH;

CREATE INDEX indexFactura ON stock (cantidad) USING BTREE;

CREATE FULLTEXT INDEX indexAlquiler ON alquiler (fechaAlquiler);

CREATE USER 'jesusro'@'localhost' identified by 'jesus';
CREATE USER 'romanbel'@'localhost' identified by 'roman';
CREATE USER 'karvilla'@'localhost' identified by 'karina';
CREATE USER 'hernanro'@'localhost' identified by 'hernan';
CREATE USER 'principal'@'localhost' identified by '1234';

GRANT ALL PRIVILEGES ON sigevac.alquiler TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.clientes TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.colorcortina TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.compra TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.cortina TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.detallefactura TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.empleado TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.factura TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.pago TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.proveedor TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.registroingreso TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.stock TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.tipocortina TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.venta TO 'principal'@'localhost' with grant option;
GRANT ALL PRIVILEGES ON sigevac.formapago TO 'principal'@'localhost' with grant option;
GRANT execute on procedure sigevac.ventasPorFecha TO 'principal'@'localhost';

GRANT delete, insert, select, update ON sigevac.alquiler TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.clientes TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.colorcortina TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update On sigevac.compra TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.cortina TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.detallefactura TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.empleado TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.factura TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.pago TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.proveedor TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.registroingreso TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.stock TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.tipocortina TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.venta TO 'jesusro'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.formapago TO 'jesusro'@'localhost' with grant option;
GRANT execute on procedure sigevac.ventasPorFecha TO 'jesusro'@'localhost' with grant option;

GRANT delete, insert, select, update ON sigevac.alquiler TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.clientes TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.colorcortina TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update On sigevac.compra TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.cortina TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.detallefactura TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.empleado TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.factura TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.pago TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.proveedor TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.registroingreso TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.stock TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.tipocortina TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.venta TO 'romanbel'@'localhost' with grant option;
GRANT delete, insert, select, update ON sigevac.formapago TO 'romanbel'@'localhost' with grant option;
GRANT execute on procedure sigevac.ventasPorFecha TO 'romanbel'@'localhost' with grant option;

GRANT insert, select ON sigevac.alquiler TO 'karvilla'@'localhost';
GRANT insert, select ON sigevac.clientes TO 'karvilla'@'localhost';
GRANT select ON sigevac.colorcortina TO 'karvilla'@'localhost';
GRANT select ON sigevac.cortina TO 'karvilla'@'localhost';
GRANT insert, select ON sigevac.detallefactura TO 'karvilla'@'localhost';
GRANT insert, select ON sigevac.factura TO 'karvilla'@'localhost';
GRANT insert, select ON sigevac.pago TO 'karvilla'@'localhost';
GRANT select ON sigevac.stock TO 'karvilla'@'localhost';
GRANT select ON sigevac.tipocortina TO 'karvilla'@'localhost';
GRANT insert, select ON sigevac.venta TO 'karvilla'@'localhost';
GRANT select ON sigevac.formapago TO 'karvilla'@'localhost';

GRANT insert, select ON sigevac.alquiler TO 'hernanro'@'localhost';
GRANT insert, select ON sigevac.clientes TO 'hernanro'@'localhost';
GRANT select ON sigevac.colorcortina TO 'hernanro'@'localhost';
GRANT select ON sigevac.cortina TO 'hernanro'@'localhost';
GRANT insert, select ON sigevac.detallefactura TO 'hernanro'@'localhost';
GRANT insert, select ON sigevac.factura TO 'hernanro'@'localhost';
GRANT insert, select ON sigevac.pago TO 'hernanro'@'localhost';
GRANT select ON sigevac.stock TO 'hernanro'@'localhost';
GRANT select ON sigevac.tipocortina TO 'hernanro'@'localhost';
GRANT insert, select ON sigevac.venta TO 'hernanro'@'localhost';
GRANT select ON sigevac.formapago TO 'hernanro'@'localhost';
