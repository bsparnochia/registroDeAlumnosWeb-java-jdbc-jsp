DROP DATABASE IF EXISTS seleniumDB;
CREATE DATABASE seleniumDB;
USE seleniumDB;
CREATE TABLE CURSOS(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(35) NOT NULL,
    PROFESOR VARCHAR(50) NOT NULL,
    DIA ENUM('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES'),
    TURNO ENUM('MAÑANA','TARDE','NOCHE')
);
CREATE TABLE ALUMNOS(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    EDAD INT UNSIGNED,
    IDCURSO INT NOT NULL,
    FOREIGN KEY (IDCURSO) REFERENCES CURSOS(ID)
);
-- ALTER TABLE ALUMNOS
--     ADD CONSTRAINT FK_ALUMNOS_IDCURSO
--     FOREIGN KEY(IDCURSO)
--     REFERENCES CURSOS(ID);

# INSERCION DE CURSOS ---------------------------------------------------------------------------------------

INSERT INTO CURSOS(ID, TITULO, PROFESOR, DIA, TURNO) VALUES
    (0,'Angular','Carlos Rios','MARTES','TARDE'),
    (0,'PHP', 'Eduardo Gomez','MIERCOLES','MAÑANA'),
    (0,'Photoshop','Lucia Azcuenaga','JUEVES','NOCHE'),
    (0,'C#','Arnold Schmidt','LUNES','NOCHE'),
    (0,'Python','Luciano Castro','VIERNES','MAÑANA'),
    (0,'Java Spring','Antonio Bernasconi','LUNES','NOCHE'),
    (0,'Java Spring','Antonio Bernasconi','MARTES','TARDE'),
    (0,'NodeJs','Irina Palacios','VIERNES','MAÑANA'),
    (0,'Javascript','Liliana Ramos','MIERCOLES','TARDE'),
    (0,'Introducción a base de datos','Andres García','LUNES','MAÑANA');

# INSERCION DE ALUMNOS --------------------------------------------------------------------------------------

INSERT INTO ALUMNOS(ID, NOMBRE, APELLIDO, EDAD, IDCURSO) VALUES 
    (0,'José','Mujica',44,1),
    (0,'Antonella','Cirillo',32,4),
    (0,'Damián','Venegas', 29, 5),
    (0,'Mariana', 'Fabiani', 17,5),
    (0,'Sabrina','Valenzuela', 24, 3),
    (0,'Tamara','Rojas',22,2),
    (0,'Viviana','Rojas',22,2),
    (0,'Rosario','García',25,7),
    (0,'Mauricio','Rivera',28,6),
    (0,'Joaquín','Sabina',33,10),
    (0,'fabian','Pastorutti',40,9);