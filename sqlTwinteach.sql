CREATE TABLE Ranking {
     id int AUTO_INCREMENT primary key,
    Nombre varchar,
    fecha_creacion datetime ,
    id_curso int,
    id_curso FK Cursos (id)
};

CREATE TABLE Tareas {
    id int AUTO_INCREMENT primary key,
    cantidad int,
    fecha datetime,
    id_ranking int,
    id_ranking FK Ranking (id),
    id_profesor int,
    id_profesor FK Profesores (id),
    id_curso int,
    id_curso FK Cursos (id)
};

CREATE TABLE TareasAlumnos {
    nota int,
    id_alumno int,
    id_tarea int,
    id_alumno FK Alumnos (id),
    id_tarea FK Tareas (id),
    id int AUTO_INCREMENT primary key,
    Nombre varchar,
    fecha_creacion datetime,
     id_curso int,
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE Tareas {
    id int AUTO_INCREMENT primary key,
    cantidad int,
    fecha datetime,
    id_ranking int,
    FOREIGN KEY id_ranking REFERENCES Ranking (id),
    id_profesor int,
    FOREIGN KEY id_profesor REFERENCES Profesores (id),
    id_curso int,
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE TareasAlumnos {
    nota int,
    id_alumno int,
    id_tarea int,
    FOREIGN KEY id_alumno REFERENCES Alumnos (id),
    FOREIGN KEY id_tarea REFERENCES Tareas (id),
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
    posicion int primary key,
    id_propietario int,
    tipo_terreno varchar ,
    FOREIGN KEY id_propietario REFERENCES Alumnos(id)
};

CREATE TABLE Softskill {
    id int AUTO_INCREMENT primary key,
    nombre varchar,
    fehca_envio datetime,
    puntos int,
    id_alumno_envia int,
    id_alumno_recive int,
    id_curso int,
    FOREIGN KEY id_alumno_envia REFERENCES Alumnos (id),
    FOREIGN KEY id_alumno_recive REFERENCES Alumnos (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE Notificaciones {
    id int AUTO_INCREMENT primary key,
    titulo varchar,
    url_imagen varchar,
    fecha datetime,
    id_alumno_recive int,
    FOREIGN KEY id_alumno_recive REFERENCES Alumnos (id),
    id_curso int,
    FOREIGN KEY id_curso REFERENCES Cursos (id);
>>>>>>> Stashed changes
};

CREATE TABLE Inventario {
    id int AUTO_INCREMENT primary key,
    id_curso int,
<<<<<<< Updated upstream
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
=======
    FOREIGN KEY id_curso REFERENCES Cursos (id);
};

CREATE TABLE Objetos (
    id int AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha_creacion,
    datetime fecha_modificacion,
    int id_inventario,
    FOREIGN KEY id_inventario REFERENCES Inventario (id_inventario)
); 

CREATE TABLE Cursos (
    int id AUTO_INCREMENT primary key,
    varchar url_imagen,
    datetime fecha_creacion,
    int administrador,
    FOREIGN KEY administrador REFERENCES Profesores(id)
);

CREATE TABLE Alumnos (
    int id AUTO_INCREMENT primary key,
    varchar nombre_apellidos (200),
    varchar nick (50),
    varchar contraseña (100),
    varchar correo (50),
    varchar url_imagen
);

CREATE TABLE Profesores (
    int id AUTO_INCREMENT primary key,
    varchar nombre_apellidos (200),
    varchar nick (50),
    varchar contraseña (100),
    varchar correo (50),
    varchar url_imagen
);

CREATE TABLE CursosAlumnos (
    int id_Alumno,
    int id_curso,
    FOREIGN KEY id_usuario REFERENCES Alumnos (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id),
    int matricular default(0),
>>>>>>> Stashed changes
    PRIMARY(id_Alumno, id_curso)
);

<<<<<<< Updated upstream
CREATE TABLE CursosProfesores {
    id_Profesor int,
    id_curso int,
    matricular int default(0),
    id_Profesor FK Profesores (id),
    id_curso Fk Cursos (id),
=======
CREATE TABLE CursosProfesores (
    int id_Profesor,
    int id_curso,
    int matricular default(0),
    FOREIGN KEY id_Profesor REFERENCES Profesores (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id),
>>>>>>> Stashed changes
    PRIMARY(id_Profesor, id_curso)
);

<<<<<<< Updated upstream
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
=======
CREATE TABLE CursosInventarios (
    int id_curso,
    int id_inventario,
    FOREIGN KEY id_curso REFERENCES Cursos (id),
    FOREIGN KEY id_inventario REFERENCES Inventario (id)
);

CREATE TABLE InventariosUsuarios (
    int id_inventario,
    int id_usuario,
    FOREIGN KEY id_usuario REFERENCES Usuarios (id),
    FOREIGN KEY id_inventario REFERENCES Inventario (id)
);

CREATE TABLE ErroresProfesores (
    int id AUTO_INCREMENT primary key,
    varchar texto (2000),
    datetime fecha
    int id_profesor,
    FOREIGN KEY id_profesor REFERENCES Profesores (id)
);

CREATE TABLE ErroresAlumnos (
    int id AUTO_INCREMENT primary key,
    varchar texto (2000),
    datetime fecha
    int id_alumno,
    FOREIGN KEY id_alumno REFERENCES Alumnos (id)
);
>>>>>>> Stashed changes
