CREATE DATABASE SIGEVAC;
USE SIGEVAC;

CREATE TABLE CLIENTES 
	(cedCliente		   varchar(10) NOT NULL,
	 nombreCliente	   varchar(30) NOT NULL,
     apellidoCliente   varchar(30) NOT NULL,
	 direccionCliente  varchar(50) NOT NULL,
	 telefonoCliente   varchar(10),
	 PRIMARY KEY(cedCliente));



     
     

CREATE TABLE FormaPago
	(idFormaPago		INTEGER NOT NULL,
	 tipoPago       	varchar(15) NOT NULL,
	 PRIMARY KEY (idFormaPago));
 
 

     
CREATE TABLE PAGO 
	(idPAGO		            INTEGER NOT NULL,
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
     
     

      
CREATE TABLE CORTINA
	(idCortina	                INTEGER NOT NULL,
	 descripcion	            VARCHAR(45) NOT NULL,
	 TipoCortina_idTipoTela	    INTEGER NOT NULL,
     ColorCortina_ColorCortina  INTEGER NOT NULL,
	 PRIMARY KEY (idCortina),
	 FOREIGN KEY (TipoCortina_idTipoTela) REFERENCES TipoCortina (idTipoTela),
	 FOREIGN KEY (ColorCortina_ColorCortina) REFERENCES ColorCortina (idColorCortina));  
     
  CREATE TABLE Empleado
	(idEmpleado	                INTEGER NOT NULL,
	 nombreEmpleado	            VARCHAR(45) NOT NULL,
	 rolEmpleado	            VARCHAR(15) NOT NULL,
	 PRIMARY KEY (idEmpleado));
     
CREATE TABLE FACTURA 
	(idFactura		     INTEGER NOT NULL,
	 fechaAlquiler	     DATE,
	 fechaVenta 	     DATE,
	 Pago_idPago         INTEGER NOT NULL,
	 Cliente_cedCliente  VARCHAR(10) NOT NUll,
     Empleado_idEmpleado INTEGER NOT NULL,
     CORTINA_idCortina   INTEGER NOT NULL,
	 PRIMARY KEY (idFactura),
	 FOREIGN KEY (Cliente_cedCliente) REFERENCES CLIENTES (cedCliente),
	 FOREIGN KEY (Pago_idPago)  REFERENCES PAGO (idPAGO),
     FOREIGN KEY (Empleado_idEmpleado) REFERENCES Empleado (idEmpleado),
     FOREIGN KEY (CORTINA_idCortina)  REFERENCES CORTINA (idCortina));




     
CREATE TABLE DetalleFactura 
	(idDetalleFctura		INTEGER NOT NULL,
	 cantidad	            INTEGER NOT NULL,
	 precioVenta			FLOAT NOT NULL,
	 iva			        FLOAT NOT NULL,
     FACTURA_idFactura      INTEGER NOT null,
	 PRIMARY KEY (idDetalleFctura),
	 FOREIGN KEY (FACTURA_idFactura) REFERENCES FACTURA (idFactura));
     
CREATE TABLE Proveedor 
	(idProveedor	   INTEGER NOT NULL,
	 nombreProveedor	       VARCHAR(20) NOT NULL,
     direccionProveedor        VARCHAR(50) NOT NULL,
     telefonoProveedor         VARCHAR(10) NOT NULL,
     emailProveedor        VARCHAR(45),
	 PRIMARY KEY(idProveedor)); 


     
     
CREATE TABLE Stock 
	(idStock	   INTEGER NOT NULL,
	 cantidad	       INTEGER NOT NULL,
     CORTINA_idCortina          INTEGER NOT NULL,
	 PRIMARY KEY(idStock),
      FOREIGN KEY (CORTINA_idCortina)  REFERENCES CORTINA (idCortina));
CREATE TABLE Compra
	(idCompra	                INTEGER NOT NULL,
	 cantidad	                INTEGER NOT NULL,
	 precio	                    FLOAT NOT NULL,
     fechaCompra                DATE NOT NULL,
     CORTINA_idCortina          INTEGER NOT NULL,
	 Empleado_idEmpleado        INTEGER NOT NULL,
     Proveedor_idProveedor      INTEGER NOT NULL,
     Stock_idStock              INTEGER NOT NULL,
	 PRIMARY KEY (idCompra),
     FOREIGN KEY (CORTINA_idCortina)  REFERENCES CORTINA (idCortina),
	 FOREIGN KEY (Empleado_idEmpleado) REFERENCES Empleado (idEmpleado),
	 FOREIGN KEY (Proveedor_idProveedor ) REFERENCES Proveedor (idProveedor),
	 FOREIGN KEY (Stock_idStock) REFERENCES Stock (idStock));	


INSERT INTO CLIENTES VALUES ('0987372715', 'ANA MARIA', 'PITA VERA', 'Av. Carlos Luis Plaza Dañín y Francisco Boloña', '298345');
INSERT INTO CLIENTES VALUES ('0987372815', 'MARIA JOSE','VERA SAAD','Av. Victor Emilio Estrada y Av. Las Monjas', '367849');
INSERT INTO CLIENTES VALUES ('0990672715', 'MARIA VERONICA','PEREZ RODRIGUES','Benjamín Carrión s/n y Av. Felipe Pezo', '450949');
INSERT INTO CLIENTES VALUES ('0990612093', 'DIANA MARTHA','MERA VERA','Av. Juan Tanca Marengo y Av. Constitución', '476362');
INSERT INTO CLIENTES VALUES ('0983727093', 'KAREN JENIFFER','PARRA PIZA','Av. 25 de Julio y Ernesto Albán', '098374');
INSERT INTO CLIENTES VALUES ('0900493923', 'DEBORA JOSELYN','PARRALES CASTILLO','Urbanización Porto Fino Vía a la Costa', '947281');
INSERT INTO CLIENTES VALUES ('0938371394', 'MISHELL KATE','ARBOLEDA BAQUE','Av. Daule Km. 9.5 diagonal al Fuerte Huancavilca ', '893721');
INSERT INTO CLIENTES VALUES ('0992819373', 'JONATHAN HERNAN','ROBLES BAQUE','Av. Francisco de Orellana y Av. Guillermo Pareja ', '954123');
INSERT INTO CLIENTES VALUES ('0999293932', 'CRISTOPHER JEAN','TOMALA ORDOÑES',' Av. San Jorge y Av. Carlos Luis Plaza Dañín', '727172');
INSERT INTO CLIENTES VALUES ('0909382182', 'BRUS DANIEL','AVILES MENDEZ',' Manuel Galecio N328 y Ximena', '034616');
INSERT INTO CLIENTES VALUES ('0991920203', 'ANGEL SAUL','SUAREZ RODRIGUEZ','Benjamín Rosales y Américas', '475064');
INSERT INTO CLIENTES VALUES ('0909392818', 'JESUS MIGUEL',' VILLAMAR REYES',' Km 2.5 Vía a Samborondón', '293829');

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
 
  INSERT INTO CORTINA VALUES (6001,'JUVENIL', 7001, 5001);  
 INSERT INTO CORTINA VALUES (6002,'INFANTIL',7002,5002);
 INSERT INTO CORTINA VALUES (6003,'CLASICA',7003,5003);
 INSERT INTO CORTINA VALUES (6004,'ELEGANTE',7004,5003);
 
 
INSERT INTO Empleado VALUES (0001, 'JESUS ROMERO','ADMINISTRADO');
INSERT INTO Empleado VALUES (0002, 'HERMAN PIERO','VENDEDOR');
INSERT INTO Empleado VALUES (0003, 'KARINA VELEZ','VENDEDOR');
INSERT INTO Empleado VALUES (0004, 'ROMAN CARDONA','ADMINISTRADO');
INSERT INTO Empleado VALUES (0005, 'MARIA RIVADENEIRA','VENDEDOR');

INSERT INTO FACTURA VALUES (75001,'2017-07-01',null,901,'0987372715',0001,6001);
INSERT INTO FACTURA VALUES (75002,null,'2017-07-01',902,'0938371394',0002,6002);
INSERT INTO FACTURA VALUES (75003,null,'2017-07-07',903,'0909392818',0003,6003);
INSERT INTO FACTURA VALUES (75004,null,'2017-07-08',904,'0909392818',0004,6003); 
INSERT INTO FACTURA VALUES (75005,'2017-07-08',null,905,'0990672715',0005,6001); 
INSERT INTO FACTURA VALUES (75006,'2017-07-12',null,906,'0990672715',0001,6002); 
INSERT INTO FACTURA VALUES (75007,'2017-07-15',null,907,'0999293932',0002,6004); 
INSERT INTO FACTURA VALUES (75008,'2017-07-17',null,908,'0991920203',0003,6003); 
INSERT INTO FACTURA VALUES (75009,'2017-07-19',null,909,'0983727093',0004,6002); 
INSERT INTO FACTURA VALUES (75010,'2017-07-20',null,910,'0909382182',0005,6003); 
INSERT INTO FACTURA VALUES (75011,'2017-07-21',null,911,'0983727093',0002,6003); 
INSERT INTO FACTURA VALUES (75012,'2017-07-22',null,912,'0990612093',0001,6002); 
INSERT INTO FACTURA VALUES (75013,'2017-07-23',null,913,'0938371394',0001,6002); 
INSERT INTO FACTURA VALUES (75014,'2017-07-23',null,914,'0900493923',0002,6003); 
INSERT INTO FACTURA VALUES (75015,'2017-07-23',null,915,'0990612093',0003,6003); 
INSERT INTO FACTURA VALUES (75016,'2017-07-24',null,916,'0990672715',0004,6001); 
INSERT INTO FACTURA VALUES (75017,'2017-07-24',null,917,'0992819373',0005,6004); 
INSERT INTO FACTURA VALUES (75018,'2017-07-25',null,918,'0992819373',0004,6004); 


INSERT INTO Proveedor VALUES (01, 'TEX MODA','Alemania y Suiza Esq.', '2521605', 'servicioalcliente@texmodaecuador.com'); 
INSERT INTO Proveedor VALUES (02, 'IVAN TEX','SUCRE 404 Y CHILE ESQ.', '320925', 'servicioalcliente@ivantex.com');    
INSERT INTO Proveedor VALUES (03, 'NEYMATEX','Km 7 1/2 Vía Daule Lotización Santa Cecilia ','3712311', 'ventas@neymatex.com'); 
INSERT INTO Proveedor VALUES (04, 'ECUACOTTON','kM 16 1/2 Via Daule','43701990', 'ecuacotton.com'); 	

Create Trigger No_Eliminar
on Cortina For Delete
as begin
Print 'No se permite eliminar informacion'
Rollback transaction
end

Create Trigger No_Insertar
on Cortina For insert
as begin
Print 'No se permite insertar'
Rollback transaction
end


      
      
