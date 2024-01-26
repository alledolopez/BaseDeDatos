CREATE TABLE FABRICANTE(
    CODFAB NUMBER(3)NOT NULL,
    FABRICANTE VARCHAR(30)NOT NULL,
    
    CONSTRAINT PK_FABBRICANTE PRIMARY KEY (CODFAB)
);
CREATE TABLE MARCA(
    CODMARCA NUMBER(3) NOT NULL,
    MARCA VARCHAR(30)NOT NULL,
    
    CONSTRAINT PK_MARCA PRIMARY KEY (CODMARCA)
);
CREATE TABLE VEHICULO(
    CODVEH NUMBER(3)NOT NULL,
    MODELO VARCHAR(30)NOT NULL,
    TIPO VARCHAR(30)NOT NULL,
    COLOR VARCHAR(30)NOT NULL,
    CODFAB NUMBER(3)NOT NULL,
    CODMARCA NUMBER(3) NOT NULL,
    
    CONSTRAINT PK_VEHICULO PRIMARY KEY (CODVEH),
    CONSTRAINT FK_CODFAB FOREIGN KEY (CODFAB) REFERENCES FABRICANTE(CODFAB),
    CONSTRAINT FK_CODMARCA FOREIGN KEY (CODMARCA) REFERENCES MARCA(CODMARCA)
);
CREATE TABLE CLIENTE(
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    AP1 VARCHAR (30) NOT NULL,
    AP2 VARCHAR (30),
    DOMICILIO VARCHAR(40) NOT NULL,
    NUMTARJETA VARCHAR(24) NOT NULL,
    
    CONSTRAINT PK_CLIENTE PRIMARY KEY(DNI)
);
CREATE TABLE OFICINA(
    CODOFICINA NUMBER (3) NOT NULL,
    DOMICILIO VARCHAR(40) NOT NULL,
    TELEFONO NUMBER (10) NOT NULL,
    
    CONSTRAINT PK_OFICINA PRIMARY KEY (CODOFICINA)
);
CREATE TABLE CURSO(
    CODCURSO NUMBER(3) NOT NULL,
    DESCRIPCION VARCHAR (30) NOT NULL,
    NUMHORAS NUMBER(4) NOT NULL,
    FECHA VARCHAR(30) NOT NULL,
    
    CONSTRAINT PK_CURSO PRIMARY KEY(CODCURSO)
);
CREATE TABLE EMPLEADO(
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    AP1 VARCHAR(30) NOT NULL,
    AP2 VARCHAR(30),
    DOMICILIO VARCHAR(40) NOT NULL,
    NUMCUENTA VARCHAR(24) NOT NULL,
    
    CONSTRAINT PK_EMPLEADO PRIMARY KEY(DNI)
);
CREATE TABLE CURSOEMPL(
    DNI VARCHAR(9) NOT NULL,
    CODCURSO NUMBER(3) NOT NULL,
    
    CONSTRAINT PK_CURSOEMPL PRIMARY KEY (DNI, CODCURSO)
);
CREATE TABLE ALQUILER(
    CODALQUILER NUMBER(3) NOT NULL,
    FECHA VARCHAR(20) NOT NULL,
    NUMDIAS NUMBER(3) NOT NULL,
    KMACTUAL NUMBER(6) NOT NULL,
    KMENTREFA NUMBER(6) NOT NULL,
    DNI_CLIENTE VARCHAR(9) NOT NULL,
    CODVEH NUMBER(3) NOT NULL,
    DNI_EMPLEADO VARCHAR(9) NOT NULL,
    
    CONSTRAINT PK_ALQUILER PRIMARY KEY(CODALQUILER),
    CONSTRAINT FK_DNI_CLIENTE FOREIGN KEY(DNI_CLIENTE) REFERENCES CLIENTE(DNI),
    CONSTRAINT FK_DNI_EMPLEADO FOREIGN KEY(DNI_EMPLEADO) REFERENCES EMPLEADO(DNI)
);
CREATE TABLE OFICINASALQ(
    CODOFICINA NUMBER(3) NOT NULL,
    CODALQUILER NUMBER(3) NOT NULL,
    
    CONSTRAINT PK_OFICINASALQ PRIMARY KEY (CODOFICINA, CODALQUILER)
);