-- Javier Sian - 2026057 
-- drop database Plataforma_de_Streaming_in4cm;
create database if not exists Plataforma_de_Streaming_in4cm;
use Plataforma_de_Streaming_in4cm;

-- ESTUDIOS DE CINES
create table estudios_cines(
	id_sede_central int primary key,
    pais varchar(100),
    nombre_estudio varchar(100)
);

-- ACTORES
create table actores(
	id_actor int primary key,
	nombre_artistico varchar(100),
	fecha_nacimiento date,
	nacionalidad varchar(100)
);

-- PAPELES
create table papeles(
	id_papel int primary key,
    nombre_personaje varchar(100)
);

-- USUARIOS
create table usuarios(
	id_username int primary key,
    correo varchar(100),
	contraseña varchar(100)
);

-- PELICULAS 
create table pelicula(
	id_pelicula int primary key,
    titulo text,
    anio_estreno year,
    clasificion_edad varchar(100)
);

-- LISTA DE FAVORITOS
create table lista_favorito(
	id_favorito int primary key,
    id_pelicula int,
    foreign key (id_pelicula) references pelicula (id_pelicula)
);

-- DETALLES PELICULAS
create table detalle_pelicula(
	id_detalles_peliculas int primary key,
    id_username int,
    id_pelicula int,
    foreign key(id_username)references usuarios(id_username),
    foreign key(id_peliculas) references pelicula(id_pelicula)
);

-- DETALLES LISTA
create table detalles_lista(
	id_detalles_lista int auto_increment primary key,
    id_favoritos int not null,
    id_peliculas int not null,
    id_sede_central int,
    foreign key(id_favoritos)references lista_favoritos(id_favoritos),
    foreign key(id_peliculas)references peliculas(id_peliculas),
    foreign key(id_sede_central) references sede_central(id_sede_central)
);
insert into estudios_cines(pais, nombre_estudio)
values 
("Estados unidos", "Marvel studios"),
("Estados unidos", "Warner bros"),
("Japon", "Studio Ghibli");

insert into actores(nombre_artistico, fecha_nacimiento, nacionalidad)
values
("Robert Downey Jr", "1965-04-04", "Estadounidense"),
("Scarlett Johansson", "1984-11-22", "Estadounidense"),
("Tom Holland", "1996-06-01", "Británico");

insert into papeles(nombre_personaje)
values
("Iron Man"),
("Black Widow"),
("Spider-Man");

insert into usuarios(correo, contrasena)
values
("javier@gmail.com", "12345"),
("maria@gmail.com", "abc123"),
("carlos@gmail.com", "pass789");

insert into pelicula(titulo, anio_estreno, clasificacion_edad)
values
("Avengers Endgame", 2019, "PG-13"),
("Spider-Man No Way Home", 2021, "PG-13"),
("El Viaje de Chihiro", 2001, "PG");

insert into lista_favoritos(id_pelicula)
values
(1),
(2),
(3);

insert into detalles_peliculas(id_username, id_pelicula)
values
(1,1),
(2, 2),
(3, 3);

insert into detalles_lista(id_favoritos, id_pelicula, id_sede_central)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);
-- INSERTAR USUARIO
delimiter $$

create procedure insertar_usuario(
    in p_correo varchar(100),
    in p_contrasena varchar(100)
)
begin
    insert into usuarios(correo, contrasena)
    values(p_correo, p_contrasena);
end $$

delimiter ;

-- INSERTAR PELICULA
delimiter $$

create procedure insertar_pelicula(
    in p_titulo VARCHAR(200),
    in p_anio YEAR,
    in p_clasificacion VARCHAR(100)
)
begin
   insert into pelicula(titulo, anio_estreno, clasificacion_edad)
    values(p_titulo, p_anio, p_clasificacion);
end $$

DELIMITER ;

-- MOSTRAR PELICULAS
DELIMITER $$

create procedure mostrar_peliculas()
begin
    select * from pelicula;
end $$

delimiter ;

-- BUSCAR PELICULA POR TITULO
delimiter $$

create procedure buscar_pelicula(
    in p_titulo varchar(200)
)
begin
    select *
    from pelicula
    where titulo = p_titulo;
end $$

delimiter ;
