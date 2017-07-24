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
     
CREATE TABLE FACTURA 
	(idFactura		     INTEGER NOT NULL,
	 fechaAlquiler	     DATE NOT NULL,
	 fechaVenta 	     DATE NOT NULL,
	 Pago_idPago         INTEGER NOT NULL,
	 Cliente_cedCliente  VARCHAR(10) NOT NUll,
     CORTINA_idCortina   INTEGER NOT NULL,
	 PRIMARY KEY (idFactura),
	 FOREIGN KEY (Cliente_cedCliente) REFERENCES CLIENTES (cedCliente),
	 FOREIGN KEY (Pago_idPago)  REFERENCES PAGO (idPAGO),
     FOREIGN KEY (CORTINA_idCortina)  REFERENCES CORTINA (idCortina));     
 
 CREATE TABLE Empleado
	(idEmpleado	                INTEGER NOT NULL,
	 nombreEmpleado	            VARCHAR(45) NOT NULL,
	 rolEmpleado	            VARCHAR(15) NOT NULL,
     FACTURA_idFactura          INTEGER NOT NULL,
	 PRIMARY KEY (idEmpleado),
	 FOREIGN KEY (FACTURA_idFactura) REFERENCES FACTURA (idFactura));
      


     
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






      
      
