CREATE TABLE direcciones(
id serial, 	
calle VARCHAR(255) not null,
numero  VARCHAR(255)not null,
comuna VARCHAR(255) not null,
PRIMARY KEY (id)
);

CREATE TABLE socios(
rut VARCHAR(255) not null,
nombre VARCHAR(255) not null, 
apellido VARCHAR(255) not null,
direccion_id integer not null,
telefono VARCHAR(255)not null, 
PRIMARY KEY (rut),
FOREIGN KEY (direccion_id) REFERENCES
direcciones(id)
);

CREATE TABLE libros(
isbn VARCHAR(255) not null,
titulo  VARCHAR(255)not null,
paginas VARCHAR(255) not null,
dias_prestamo integer not null, 	
PRIMARY KEY (isbn)
);

CREATE TABLE autores(
codigo VARCHAR(255) not null,
nombre VARCHAR(255)not null,
apellido VARCHAR(255) not null,
nacimiento date not null,
muerte date,
tipo_autor VARCHAR(255) not null, 	
PRIMARY KEY (codigo)
);

create table libros_autores(
tipo_autor VARCHAR(255) not null, 
libro_isbn VARCHAR(255) not null,  
autor_codigo VARCHAR(255) not null,
primary key(libro_isbn,autor_codigo),
FOREIGN KEY (libro_isbn) REFERENCES
libros(isbn),
FOREIGN KEY (autor_codigo) REFERENCES
autores(codigo)	
);

CREATE TABLE prestamos (
socio_rut VARCHAR(255) not null,
libro_isbn VARCHAR(255)not null,
fecha_prestamo date not null, 
fecha_devolucion date not null,
id serial,	
PRIMARY KEY (id),
FOREIGN KEY (socio_rut) REFERENCES
socios(rut),
FOREIGN KEY (libro_isbn) REFERENCES
libros(isbn)	
);
--INSERT INTO nombre_tabla (columna1, columna2, columna3) VALUES
--(valor1, valor2, valor3)
