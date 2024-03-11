CREATE TABLE Cursos (
    id int primary key AUTO_INCREMENT,
    url_imagen varchar (100),
    fecha_creacion datetime,
    codigoAlumnos varchar(50),
    codigoProfesores varchar(50)
);

CREATE TABLE Alumnos (
    id int primary key AUTO_INCREMENT,
    nombre_apellidos varchar(200),
    nick varchar(50),
    contraseña varchar(100),
    correo varchar(50),
    url_imagen varchar (100)
);

CREATE TABLE Profesores (
    id int primary key AUTO_INCREMENT,
    nombre_apellidos varchar(200),
    nick varchar(50),
    contraseña varchar(100),
    correo varchar(50),
    url_imagen varchar (100)
);

CREATE TABLE Ranking (
    id int primary key AUTO_INCREMENT,
    Nombre varchar (50),
    fecha_creacion datetime,
    id_curso int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE Tareas (
    id int primary key AUTO_INCREMENT,
    cantidad int,
    fecha datetime,
    id_ranking int,
    FOREIGN KEY (id_ranking) REFERENCES Ranking (id),
    id_profesor int,
    FOREIGN KEY (id_profesor) REFERENCES Profesores (id),
    id_curso int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE TareasAlumnos (
    nota int,
    id_alumno int,
    id_tarea int,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_tarea) REFERENCES Tareas (id),
    id int primary key AUTO_INCREMENT,
    Nombre varchar (50),
    fecha_creacion datetime,
    id_curso int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE Casillas (
    posicion int primary key,
    id_propietario int,
    tipo_terreno varchar (100),
    FOREIGN KEY (id_propietario) REFERENCES Alumnos(id)
);

CREATE TABLE Softskill (
    id int primary key AUTO_INCREMENT,
    nombre varchar (50),
    fehca_envio datetime,
    puntos int,
    id_alumno_envia int,
    id_alumno_recive int,
    id_curso int,
    FOREIGN KEY (id_alumno_envia) REFERENCES Alumnos (id),
    FOREIGN KEY (id_alumno_recive) REFERENCES Alumnos (id),
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE Notificaciones (
    id int primary key AUTO_INCREMENT,
    titulo varchar (50),
    url_imagen varchar (100),
    fecha datetime,
    id_alumno_recive int,
    FOREIGN KEY (id_alumno_recive) REFERENCES Alumnos (id),
    id_curso int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE Inventario (
    id int primary key AUTO_INCREMENT,
    id_curso int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE Objetos (
    id int primary key AUTO_INCREMENT,
    cantidad int,
    fecha_creacion datetime,
    fecha_modificacion datetime,
    id_inventario int,
    FOREIGN KEY (id_inventario) REFERENCES Inventario (id)
); 

CREATE TABLE CursosAlumnos (
    id_Alumno int,
    id_curso int,
    FOREIGN KEY (id_Alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_curso) REFERENCES Cursos (id),
    matricular int default(0)
);

CREATE TABLE CursosProfesores (
    id_Profesor int,
    id_curso int,
    matricular int default(0),
    FOREIGN KEY (id_Profesor) REFERENCES Profesores (id),
    FOREIGN KEY (id_curso) REFERENCES Cursos (id)
);

CREATE TABLE CursosInventarios (
    id_curso int,
    id_inventario int,
    FOREIGN KEY (id_curso) REFERENCES Cursos (id),
    FOREIGN KEY (id_inventario) REFERENCES Inventario (id)
);

CREATE TABLE InventariosAlumnos (
    id_inventario int,
    id_Alumno int,
    FOREIGN KEY (id_Alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_inventario) REFERENCES Inventario (id)
);

CREATE TABLE ErroresProfesores (
    id int primary key AUTO_INCREMENT,
    texto varchar(2000),
    fecha datetime,
    id_profesor int,
    FOREIGN KEY (id_profesor) REFERENCES Profesores (id)
);

CREATE TABLE ErroresAlumnos (
    id int primary key AUTO_INCREMENT,
    texto varchar (2000),
    fecha datetime,
    id_alumno int,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id)
);
