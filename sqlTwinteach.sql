CREATE TABLE Ranking {
    int id AUTO_INCREMENT primary key,
    varchar Nombre,
    datetime fecha_creacion,
    int id_curso,
    id_curso FK Cursos (id)
};

CREATE TABLE Tareas {
    int id AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha,
    int id_ranking,
    id_ranking FK Ranking (id),
    int id_profesor,
    id_profesor FK Profesores (id),
    int id_curso,
    id_curso FK Cursos (id)
};

CREATE TABLE TareasAlumnos {
    int nota,
    int id_alumno,
    int id_tarea,
    id_alumno FK Alumnos (id),
    id_tarea FK Tareas (id),
    (id_alumno,id_tarea) primary key
}

CREATE TABLE Casillas {
    int posicion primary key,
    int id_propietario,
    varchar tipo_terreno,
    id_propietario FK Alumnos(id)
};

CREATE TABLE Softskill {
    int id AUTO_INCREMENT primary key,
    varchar nombre,
    datetime fehca_envio,
    int puntos,
    int id_alumno_envia,
    int id_alumno_recive,
    int id_curso,
    id_alumno_envia FK Alumnos (id),
    id_alumno_recive FK Alumnos (id),
    id_curso FK Cursos (id)
};

CREATE TABLE Notificaciones {
    int id AUTO_INCREMENT primary key,
    varchar titulo,
    varchar url_imagen,
    datetime fecha,
    int id_alumno_recive,
    id_alumno_recive FK Alumnos (id),
    int id_curso,
    id_curso FK Cursos (id);
};

CREATE TABLE Inventario {
    id int AUTO_INCREMENT primary key,
    id_curso int,
    id_curso FK Cursos (id)
};

CREATE TABLE Objetos {
    id int AUTO_INCREMENT primary key,
    cantidad int,
    fecha_creacion datetime,
    fecha_modificacion datetime,
    id_inventario int,
    id_inventario FK Inventario (id_inventario)
}; 

CREATE TABLE Cursos {
    id int primary key AUTO_INCREMENT,
    url_imagen varchar,
    fecha_creacion datetime
};

CREATE TABLE Alumnos (
    id int AUTO_INCREMENT primary key,
    nombre_apellidos varchar(200),
    nick varchar(50),
    contraseña varchar(100),
    correo varchar(50),
    url_imagen varchar
);

CREATE TABLE Profesores {
    id varchar AUTO_INCREMENT primary key,
    nombre_apellidos varchar(200),
    nick varchar(50),
    contraseña varchar(100),
    correo varchar(50),
    url_imagen varchar
};

CREATE TABLE CursosAlumnos {
    id_Alumno int,
    id_curso int,
    id_usuario FK Alumnos (id),
    id_curso FK Cursos (id),
    matricular int default(0),
    PRIMARY(id_Alumno, id_curso)
};

CREATE TABLE CursosProfesores {
    id_Profesor int,
    id_curso int,
    matricular int default(0),
    id_Profesor FK Profesores (id),
    id_curso Fk Cursos (id),
    PRIMARY(id_Profesor, id_curso)
}

CREATE TABLE Administrador {
    
}

CREATE TABLE CursosInventarios {
    id_curso int,
    id_inventario int,
    id_curso FK Cursos (id),
    id_inventario FK Inventario (id)
};

CREATE TABLE InventariosUsuarios {
    id_inventario int,
    id_usuario int,
    id_usuario FK Usuarios (id),
    id_inventario FK Inventario (id)
};

CREATE TABLE ErroresProfesores {
    id int AUTO_INCREMENT primary key,
    texto varchar(2000),
    fecha datetime,
    id_profesor int,
    id_profesor FK Profesores (id)
};

CREATE TABLE ErroresAlumnos {
    id int AUTO_INCREMENT primary key,
    texto varchar (2000),
    fecha datetime,
    id_alumno int,
    id_alumno FK Alumnos (id)
};