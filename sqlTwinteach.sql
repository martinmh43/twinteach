CREATE TABLE Ranking {
    int id AUTO_INCREMENT primary key,
    varchar Nombre,
    datetime fecha_creacion,
    int id_curso,
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE Tareas {
    int id AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha,
    int id_ranking,
    FOREIGN KEY id_ranking REFERENCES Ranking (id),
    int id_profesor,
    FOREIGN KEY id_profesor REFERENCES Profesores (id),
    int id_curso,
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE TareasAlumnos {
    int nota,
    int id_alumno,
    int id_tarea,
    FOREIGN KEY id_alumno REFERENCES Alumnos (id),
    FOREIGN KEY id_tarea REFERENCES Tareas (id),
    (id_alumno,id_tarea) primary key
}

CREATE TABLE Casillas {
    int posicion primary key,
    int id_propietario,
    varchar tipo_terreno,
    FOREIGN KEY id_propietario REFERENCES Alumnos(id)
};

CREATE TABLE Softskill {
    int id AUTO_INCREMENT primary key,
    varchar nombre,
    datetime fehca_envio,
    int puntos,
    int id_alumno_envia,
    int id_alumno_recive,
    int id_curso,
    FOREIGN KEY id_alumno_envia REFERENCES Alumnos (id),
    FOREIGN KEY id_alumno_recive REFERENCES Alumnos (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id)
};

CREATE TABLE Notificaciones {
    int id AUTO_INCREMENT primary key,
    varchar titulo,
    varchar url_imagen,
    datetime fecha,
    int id_alumno_recive,
    FOREIGN KEY id_alumno_recive REFERENCES Alumnos (id),
    int id_curso,
    FOREIGN KEY id_curso REFERENCES Cursos (id);
};

CREATE TABLE Inventario {
    int id AUTO_INCREMENT primary key,
    int id_curso,
    FOREIGN KEY id_curso REFERENCES Cursos (id);
};

CREATE TABLE Objetos {
    int id AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha_creacion,
    datetime fecha_modificacion,
    int id_inventario,
    FOREIGN KEY id_inventario REFERENCES Inventario (id_inventario)
}; 

CREATE TABLE Cursos {
    int id AUTO_INCREMENT primary key,
    varchar url_imagen,
    datetime fecha_creacion,
    int administrador,
    FOREIGN KEY administrador REFERENCES Profesores(id)
};

CREATE TABLE Alumnos {
    int id AUTO_INCREMENT primary key,
    varchar nombre_apellidos (200),
    varchar nick (50),
    varchar contraseña (100),
    varchar correo (50),
    varchar url_imagen
};

CREATE TABLE Profesores {
    int id AUTO_INCREMENT primary key,
    varchar nombre_apellidos (200),
    varchar nick (50),
    varchar contraseña (100),
    varchar correo (50),
    varchar url_imagen
};

CREATE TABLE CursosAlumnos {
    int id_Alumno,
    int id_curso,
    FOREIGN KEY id_usuario REFERENCES Alumnos (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id),
    int matricular default(0),
    PRIMARY(id_Alumno, id_curso)
};

CREATE TABLE CursosProfesores {
    int id_Profesor,
    int id_curso,
    int matricular default(0),
    FOREIGN KEY id_Profesor REFERENCES Profesores (id),
    FOREIGN KEY id_curso REFERENCES Cursos (id),
    PRIMARY(id_Profesor, id_curso)
}

CREATE TABLE CursosInventarios {
    int id_curso,
    int id_inventario,
    FOREIGN KEY id_curso REFERENCES Cursos (id),
    FOREIGN KEY id_inventario REFERENCES Inventario (id)
};

CREATE TABLE InventariosUsuarios {
    int id_inventario,
    int id_usuario,
    FOREIGN KEY id_usuario REFERENCES Usuarios (id),
    FOREIGN KEY id_inventario REFERENCES Inventario (id)
};

CREATE TABLE ErroresProfesores {
    int id AUTO_INCREMENT primary key,
    varchar texto (2000),
    datetime fecha
    int id_profesor,
    FOREIGN KEY id_profesor REFERENCES Profesores (id)
};

CREATE TABLE ErroresAlumnos {
    int id AUTO_INCREMENT primary key,
    varchar texto (2000),
    datetime fecha
    int id_alumno,
    FOREIGN KEY id_alumno REFERENCES Alumnos (id)
};