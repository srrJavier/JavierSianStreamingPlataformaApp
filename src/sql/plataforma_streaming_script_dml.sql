-- =====================================================
-- COMANDOS INSERT (20 REGISTROS POR TABLA)
-- =====================================================

USE Plataforma_de_Streaming_in4cm;

-- =====================================================
-- ESTUDIOS_CINES
-- =====================================================

INSERT INTO estudios_cines(pais, nombre_estudio) VALUES
('Estados Unidos','Marvel Studios'),
('Estados Unidos','Warner Bros'),
('Japón','Studio Ghibli'),
('Estados Unidos','Pixar'),
('Canadá','Lionsgate'),
('Corea del Sur','CJ Entertainment'),
('India','Bollywood Studios'),
('Francia','Gaumont'),
('España','Filmax'),
('México','Videocine'),
('Alemania','Constantin Film'),
('Italia','Rai Cinema'),
('China','Tencent Pictures'),
('Brasil','Globo Filmes'),
('Argentina','Patagonik'),
('Reino Unido','BBC Films'),
('Australia','Village Roadshow'),
('Rusia','Mosfilm'),
('Suecia','SF Studios'),
('Noruega','Nordisk Film');

-- =====================================================
-- ACTORES
-- =====================================================

INSERT INTO actores(nombre_artistico, fecha_nacimiento, nacionalidad) VALUES
('Robert Downey Jr','1965-04-04','Estadounidense'),
('Scarlett Johansson','1984-11-22','Estadounidense'),
('Tom Holland','1996-06-01','Británico'),
('Chris Evans','1981-06-13','Estadounidense'),
('Emma Watson','1990-04-15','Británica'),
('Leonardo DiCaprio','1974-11-11','Estadounidense'),
('Jennifer Lawrence','1990-08-15','Estadounidense'),
('Keanu Reeves','1964-09-02','Canadiense'),
('Johnny Depp','1963-06-09','Estadounidense'),
('Natalie Portman','1981-06-09','Israelí'),
('Will Smith','1968-09-25','Estadounidense'),
('Margot Robbie','1990-07-02','Australiana'),
('Morgan Freeman','1937-06-01','Estadounidense'),
('Daniel Radcliffe','1989-07-23','Británico'),
('Zendaya','1996-09-01','Estadounidense'),
('Brad Pitt','1963-12-18','Estadounidense'),
('Angelina Jolie','1975-06-04','Estadounidense'),
('Ryan Reynolds','1976-10-23','Canadiense'),
('Gal Gadot','1985-04-30','Israelí'),
('Hugh Jackman','1968-10-12','Australiano');

-- =====================================================
-- PAPELES
-- =====================================================

INSERT INTO papeles(nombre_personaje) VALUES
('Iron Man'),
('Black Widow'),
('Spider-Man'),
('Captain America'),
('Hermione Granger'),
('Jack Dawson'),
('Katniss Everdeen'),
('John Wick'),
('Jack Sparrow'),
('Jane Foster'),
('Agent J'),
('Harley Quinn'),
('Red'),
('Harry Potter'),
('MJ'),
('Tyler Durden'),
('Maleficent'),
('Deadpool'),
('Wonder Woman'),
('Wolverine');

-- =====================================================
-- USUARIOS
-- =====================================================

INSERT INTO usuarios(correo, contrasena) VALUES
('usuario1@gmail.com','123'),
('usuario2@gmail.com','123'),
('usuario3@gmail.com','123'),
('usuario4@gmail.com','123'),
('usuario5@gmail.com','123'),
('usuario6@gmail.com','123'),
('usuario7@gmail.com','123'),
('usuario8@gmail.com','123'),
('usuario9@gmail.com','123'),
('usuario10@gmail.com','123'),
('usuario11@gmail.com','123'),
('usuario12@gmail.com','123'),
('usuario13@gmail.com','123'),
('usuario14@gmail.com','123'),
('usuario15@gmail.com','123'),
('usuario16@gmail.com','123'),
('usuario17@gmail.com','123'),
('usuario18@gmail.com','123'),
('usuario19@gmail.com','123'),
('usuario20@gmail.com','123');

-- =====================================================
-- PELICULAS
-- =====================================================

INSERT INTO pelicula(titulo, anio_estreno, clasificacion_edad) VALUES
('Avengers Endgame',2019,'PG-13'),
('Spider-Man No Way Home',2021,'PG-13'),
('El Viaje de Chihiro',2001,'PG'),
('Titanic',1997,'PG-13'),
('Harry Potter',2001,'PG'),
('John Wick',2014,'R'),
('Deadpool',2016,'R'),
('Wonder Woman',2017,'PG-13'),
('Matrix',1999,'R'),
('Avatar',2009,'PG-13'),
('Frozen',2013,'PG'),
('Toy Story',1995,'G'),
('Black Panther',2018,'PG-13'),
('Doctor Strange',2016,'PG-13'),
('Thor Ragnarok',2017,'PG-13'),
('Joker',2019,'R'),
('The Batman',2022,'PG-13'),
('Shrek',2001,'PG'),
('Cars',2006,'G'),
('Inside Out',2015,'PG');

-- =====================================================
-- LISTA_FAVORITOS
-- =====================================================

INSERT INTO lista_favoritos(id_pelicula) VALUES
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),
(16),(17),(18),(19),(20);

-- =====================================================
-- DETALLES_PELICULAS
-- =====================================================

INSERT INTO detalles_peliculas(id_username, id_pelicula) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);

-- =====================================================
-- DETALLES_LISTA
-- =====================================================

INSERT INTO detalles_lista(id_favoritos, id_pelicula, id_sede_central) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20);

-- =====================================================
-- PROCEDIMIENTOS ALMACENADOS
-- =====================================================

DELIMITER $$

CREATE PROCEDURE sp_insertar_usuario(
    IN p_correo VARCHAR(100),
    IN p_contrasena VARCHAR(100)
)
BEGIN
    INSERT INTO usuarios(correo, contrasena)
    VALUES(p_correo, p_contrasena);
END $$

DELIMITER ;

-- =====================================================

DELIMITER $$

CREATE PROCEDURE sp_insertar_pelicula(
    IN p_titulo VARCHAR(200),
    IN p_anio YEAR,
    IN p_clasificacion VARCHAR(100)
)
BEGIN
    INSERT INTO pelicula(titulo, anio_estreno, clasificacion_edad)
    VALUES(p_titulo, p_anio, p_clasificacion);
END $$

DELIMITER ;

-- =====================================================

DELIMITER $$

CREATE PROCEDURE sp_insertar_actor(
    IN p_nombre VARCHAR(100),
    IN p_fecha DATE,
    IN p_nacionalidad VARCHAR(100)
)
BEGIN
    INSERT INTO actores(nombre_artistico, fecha_nacimiento, nacionalidad)
    VALUES(p_nombre, p_fecha, p_nacionalidad);
END $$

DELIMITER ;

-- =====================================================
-- INVOCACION DE PROCEDIMIENTOS
-- =====================================================

CALL sp_insertar_usuario('nuevo@gmail.com','999');

CALL sp_insertar_pelicula('Super Mario Bros',2023,'PG');

CALL sp_insertar_actor('Chris Hemsworth','1983-08-11','Australiano');

-- =====================================================
-- VISTAS
-- =====================================================

CREATE VIEW vista_peliculas AS
SELECT
    id_pelicula,
    titulo,
    anio_estreno,
    clasificacion_edad
FROM pelicula;

-- =====================================================

CREATE VIEW vista_usuarios AS
SELECT
    id_username,
    correo
FROM usuarios;

-- =====================================================

CREATE VIEW vista_favoritos AS
SELECT
    dl.id_detalles_listas,
    p.titulo,
    ec.nombre_estudio
FROM detalles_lista dl
INNER JOIN pelicula p
ON dl.id_pelicula = p.id_pelicula
INNER JOIN estudios_cines ec
ON dl.id_sede_central = ec.id_sede_central;

-- =====================================================
-- INVOCACION DE VISTAS
-- =====================================================

SELECT * FROM vista_peliculas;

SELECT * FROM vista_usuarios;

SELECT * FROM vista_favoritos;

