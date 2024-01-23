CREATE TABLE PROFESOR(
    DNI VARCHAR(9),
    NOMBRE VARCHAR(35) NOT NULL,
    APELLIDO1 VARCHAR(30) NOT NULL,
    APELLIDO2 VARCHAR(30),
    DIRECCION VARCHAR(40) NOT NULL,
    CUENTA VARCHAR(24) NOT NULL,
    TELEFONO NUMBER(9) NOT NULL,
    
    CONSTRAINT PK_PROFESOR PRIMARY KEY(DNI)
);
CREATE TABLE CICLOFORM(
    CODCICLO NUMBER(3) NOT NULL,
    NOMBRE VARCHAR (30) NOT NULL,
    TIPO VARCHAR (20) NOT NULL,
    
    CONSTRAINT PK_CICLOFORM PRIMARY KEY(CODCICLO)
);
CREATE TABLE ASIGNATURA(
    CODASIG NUMBER(3) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    NUMHORAS NUMBER(4) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    CODCICLO NUMBER(3) NOT NULL,
    
    CONSTRAINT PK_ASIGNATURA PRIMARY KEY(CODASIG),
    CONSTRAINT FK_PROFESOR FOREIGN KEY(DNI) REFERENCES PROFESOR(DNI),
    CONSTRAINT FK_CICLOFORM FOREIGN KEY(CODCICLO) REFERENCES CICLOFORM(CODCICLO)
);
CREATE TABLE  IDIOMA(
    CODIDIOMA NUMBER(3) NOT NULL,
    DESCRIPCION VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_IDIOMA PRIMARY KEY(CODIDIOMA)
);
CREATE TABLE ALUMNO(
    DNI VARCHAR(9)NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO1 VARCHAR(30) NOT NULL,
    APELLIDO2 VARCHAR(30),
    DIRECCION VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    TELEFONO NUMBER(9) NOT NULL,
    CODIDIOMA NUMBER(3),
    
    CONSTRAINT PK_ALUMNO PRIMARY KEY(DNI)
);
CREATE TABLE MATRICULA(
    DNI VARCHAR(9),
    CODASIG NUMBER(3),
    
    CONSTRAINT PK_MATRICULA PRIMARY KEY(DNI,CODASIG),
    CONSTRAINT FK_MATRICULA FOREIGN KEY(DNI) REFERENCES ALUMNO(DNI),
    CONSTRAINT FK_MATRICULA2 FOREIGN KEY(CODASIG) REFERENCES ASIGNATURA(CODASIG)
);
CREATE TABLE  IDIOMASPROF(
    CODIDIOMA NUMBER(3) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    
    CONSTRAINT PK_IDIOMASPROF PRIMARY KEY(DNI, CODIDIOMA),
    CONSTRAINT FK_IDIOMASPROF1 FOREIGN KEY(CODIDIOMA) REFERENCES IDIOMA(CODIDIOMA),
    CONSTRAINT FK_IDIOMASPROF2 FOREIGN KEY(DNI) REFERENCES PROFESOR(DNI)
);
CREATE TABLE DATOSPERSONALES(
    DNI VARCHAR(9),
    NOMBRE VARCHAR(35) NOT NULL,
    APELLIDO1 VARCHAR(30) NOT NULL,
    APELLIDO2 VARCHAR(30),
    DIRECCION VARCHAR(40) NOT NULL,
    TELEFONO NUMBER(9) NOT NULL,
    TIPO VARCHAR(10) NOT NULL,
    DNI_PROFESOR VARCHAR (9) NOT NULL,
    DNI_ALUMNO VARCHAR (9) NOT NULL,
    
    CONSTRAINT CK_TIPO CHECK (TIPO IN('ALUMNO','PROFESOR'))
);

ALTER TABLE PROFESOR DROP COLUMN NOMBRE;
ALTER TABLE PROFESOR DROP COLUMN APELLIDO1;
ALTER TABLE PROFESOR DROP COLUMN APELLIDO2;
ALTER TABLE PROFESOR DROP COLUMN DIRECCION;
ALTER TABLE PROFESOR DROP COLUMN TELEFONO;

ALTER TABLE ALUMNO DROP COLUMN NOMBRE;
ALTER TABLE ALUMNO DROP COLUMN APELLIDO1;
ALTER TABLE ALUMNO DROP COLUMN APELLIDO2;
ALTER TABLE ALUMNO DROP COLUMN DIRECCION;
ALTER TABLE ALUMNO DROP COLUMN TELEFONO;

ALTER TABLE DATOSPERSONALES ADD CONSTRAINT PK_DATOSPERSONALES PRIMARY KEY (DNI);
ALTER TABLE DATOSPERSONALES ADD DNI_PROFESOR VARCHAR(9) NOT NULL;
ALTER TABLE DATOSPERSONALES ADD DNI_ALUMNO VARCHAR(9) NOT NULL;
ALTER TABLE DATOSPERSONALES ADD CONSTRAINT FK_PROFESORDNI FOREIGN KEY (DNI_PROFESOR) REFERENCES PROFESOR(DNI);
ALTER TABLE DATOSPERSONALES ADD CONSTRAINT FK_ALUMNO FOREIGN KEY (DNI_ALUMNO) REFERENCES ALUMNO(DNI);

ALTER TABLE DATOSPERSONALES DROP COLUMN DNI_PROFESOR;
ALTER TABLE DATOSPERSONALES DROP COLUMN DNI_ALUMNO;

ALTER TABLE PROFESOR ADD CONSTRAINT FK_DATOSPERSONALESPROFESOR FOREIGN KEY (DNI) REFERENCES PROFESOR(DNI);
ALTER TABLE ALUMNO ADD CONSTRAINT FK_DATOSPERSONALESALUMNO FOREIGN KEY (DNI) REFERENCES ALUMNO(DNI);

INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('71654896M', 'MARTA', 'MARTIN', 'RODRIGUEZ', 'C/Miravilla', 983652148, 'ALUMNO');
INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('44103779F', 'JESUS', 'LOPEZ', 'ANTON', 'C/ Lopez Gomez', 654987123, 'PROFESOR');
INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('11526987G', 'PEDRO', 'DIAZ', 'HERNANDEZ', 'C/ Transicion', 698741236, 'ALUMNO');
INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('89621477A', 'LUIS', 'VILA', 'GOMEZ', 'C/ Cardenal Torquemada', 654710236, 'PROFESOR');
INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('45986321N', 'ANDREA', 'RIVAS', 'ALONSO', 'C/ Salud', 654710236, 'ALUMNO');
INSERT INTO DATOSPERSONALES (DNI,NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, TELEFONO, TIPO) VALUES ('71056984D', 'MIRIAM', 'ALONSO', 'BERODAS', 'Paseo Zorrilla', 645897123, 'ALUMNO');

ALTER TABLE CICLOFORM MODIFY CODCICLO NUMBER(4);

INSERT INTO CICLOFORM(CODCICLO, NOMBRE, TIPO) VALUES (1565 , 'DAM' , 'CICLO SUPERIOR');
INSERT INTO CICLOFORM(CODCICLO, NOMBRE, TIPO) VALUES (2598 , 'SMR' , 'GRADO MEDIO');
INSERT INTO CICLOFORM(CODCICLO, NOMBRE, TIPO) VALUES (1489 , 'ARI' , 'GRADO SUPERIOR');

INSERT INTO PROFESOR(DNI,CUENTA) VALUES ('44103779F', 'ES2002399348396092013170');
INSERT INTO PROFESOR(DNI,CUENTA) VALUES ('89621477A', 'ES8501865417580989668301');

INSERT INTO ALUMNO(DNI,EMAIL, CODIDIOMA) VALUES ('71654896M' , 'marta.mr@gmail.com', '20');
INSERT INTO ALUMNO(DNI,EMAIL, CODIDIOMA) VALUES ('11526987G' , 'pedro.dh@gmail.com', '30');
INSERT INTO ALUMNO(DNI,EMAIL, CODIDIOMA) VALUES ('45986321N' , 'andrea.ra@gmail.com', '30');
INSERT INTO ALUMNO(DNI,EMAIL, CODIDIOMA) VALUES ('71056984D' , 'miriam.ab@gmail.com', '20');

INSERT INTO IDIOMA (CODIDIOMA, DESCRIPCION) VALUES (20 , 'INGLES');
INSERT INTO IDIOMA (CODIDIOMA, DESCRIPCION) VALUES (30, 'ESPAÑOL');

ALTER TABLE ASIGNATURA MODIFY CODCICLO NUMBER(4);

INSERT INTO ASIGNATURA ( CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (1 , 'EMPRESA', 128, '44103779F', 1565);
INSERT INTO ASIGNATURA ( CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (2 , 'Informática Industrial', 269, '44103779F', 1565);
INSERT INTO ASIGNATURA ( CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (3 , 'Aplicaciones Web', 200, '89621477A', 2598);
INSERT INTO ASIGNATURA ( CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (4 , 'Bases de datos', 170, '89621477A', 1489);
INSERT INTO ASIGNATURA ( CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (5 , 'Programación', 225, '89621477A', 2598);


INSERT INTO IDIOMASPROF (CODIDIOMA, DNI) VALUES ( 30, '44103779F');
INSERT INTO IDIOMASPROF (CODIDIOMA, DNI) VALUES ( 20, '89621477A');
INSERT INTO IDIOMASPROF (CODIDIOMA, DNI) VALUES ( 30, '89621477A');


INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('71654896M', 1);
INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('11526987G', 2);
INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('45986321N', 3);
INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('71056984D', 4);
INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('71654896M', 5);
INSERT INTO MATRICULA ( DNI, CODASIG) VALUES ('11526987G', 1);



SELECT 
    NOMBRE 
FROM 
    DATOSPERSONALES, PROFESOR, IDIOMASPROF , IDIOMA 
WHERE 
    TIPO='PROFESOR'     
AND 
    idioma.descripcion = 'ESPAÑOL'
AND
    datospersonales.dni = profesor.dni
AND
    profesor.dni = idiomasprof.dni
AND
    idiomasprof.codidioma = idioma.codidioma;
    
SELECT asignatura.nombre FROM asignatura, cicloform WHERE asignatura.codciclo = cicloform.codciclo AND cicloform.nombre ='DAM';

SELECT profesor.cuenta FROM datospersonales, profesor WHERE datospersonales.dni = profesor.dni;

SELECT datospersonales.nombre FROM datospersonales, alumno WHERE datospersonales.dni = alumno.dni;

SELECT datospersonales.nombre FROM datospersonales, profesor WHERE datospersonales.dni = profesor.dni;


/*SELECT * FROM ASIGNATURA, DATOSPERSONALES, MATRICULA WHERE datospersonales.nombre = 'PEDRO' AND */

SELECT
    ASIGNATURA.NOMBRE
FROM 
    cicloform , ASIGNATURA
WHERE
    CICLOFORM.nombre = 'DAM'
AND
    CICLOFORM.CODCICLO = ASIGNATURA.CODASIG;

SELECT 
    CICLOFORM.NOMBRE
FROM 
    CICLOFORM
WHERE
    CICLOFORM.TIPO = 'GRADO SUPERIOR'
AND
    CICLOFORM.TIPO = 'CICLO SUPERIOR';
    
SELECT 
    cicloform.codciclo, asignatura.nombre
FROM
    ASIGNATURA, CICLOFORM
WHERE
    asignatura.codciclo = cicloform.codciclo;
    
SELECT * FROM asignatura WHERE ASIGNATURA.numhoras < 200;

SELECT * FROM datospersonales WHERE DATOSPERSONALES.nombre = 'ANDREA';

UPDATE datospersonales SET DATOSPERSONALES.apellido2 = NULL WHERE DATOSPERSONALES.nombre = 'ANDREA' ;

SELECT * FROM  asignatura, matricula WHERE MATRICULA.CODASIG = ASIGNATURA.CODASIG AND ASIGNATURA.NOMBRE = 'Programación';

DELETE FROM matricula WHERE MATRICULA.codasig=5;

SELECT ASIGNATURA.*  FROM asignatura, matricula WHERE matricula.codasig = asignatura.codasig AND asignatura.nombre = ' EMPRESA';

DELETE FROM MATRICULA WHERE matricula.codasig = 1;

DELETE FROM asignatura WHERE ASIGNATURA.CODASIG = 1;

SELECT * FROM asignatura WHERE asignatura.nombre = 'BBDD';

UPDATE asignatura SET asignatura.nombre = 'BBDD' WHERE asignatura.nombre = 'Bases de datos';

INSERT INTO CICLOFORM (CODCICLO,NOMBRE, TIPO) VALUES (6365, 'ELEC', 'GRADO MEDIO');

INSERT INTO ASIGNATURA (CODASIG, NOMBRE, NUMHORAS, DNI, CODCICLO) VALUES (6 ,'Circuitos Baja Potencia', 100, '89621477A' , 6365);

SELECT MATRICULA.* FROM matricula, datospersonales WHERE datospersonales.dni = matricula.dni AND datospersonales.nombre = 'PEDRO';

UPDATE matricula SET matricula.codasig = 3 WHERE matricula.codasig = 2;

INSERT INTO idioma (CODIDIOMA, DESCRIPCION) VALUES (50, 'ALEMAN');

INSERT INTO idiomasprof (CODIDIOMA, DNI) VALUES ( 50, '44103779F');


SELECT * FROM MATRICULA;
DELETE FROM MATRICULA; 

DELETE FROM ASIGNATURA;
SELECT * FROM ASIGNATURA;

CREATE SEQUENCE SEQ_ASIGNATURA START WITH 1  INCREMENT BY 1 MAXVALUE 999 NOCYCLE;


INSERT INTO ASIGNATURA VALUES(SEQ_ASIGNATURA.NEXTVAL,'BASE DE DATOS',165, '89621477A', 1489);
INSERT INTO ASIGNATURA VALUES(SEQ_ASIGNATURA.NEXTVAL,'EMPRESA',128, '44103779F', 1565);
INSERT INTO ASIGNATURA VALUES(SEQ_ASIGNATURA.NEXTVAL,'INFORMÁTICA INDUSTRIAL',269, '44103779F', 1565);
INSERT INTO ASIGNATURA VALUES(SEQ_ASIGNATURA.NEXTVAL,'APLICACIONES WEB',200, '89621477A', 2598);
INSERT INTO ASIGNATURA VALUES(SEQ_ASIGNATURA.NEXTVAL,'PROGRAMACIÓN', 255, '89621477A', 2598);




