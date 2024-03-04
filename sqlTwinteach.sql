CREATE TABLE Ranking {
    int id AUTO_INCREMENT primary key,
    varchar Nombre,
    int num_participantes,
    datetime fecha_creacion,
    int id_curso,
    id_curso FK Cursos (id)
};

CREATE TABLE Mapa {
    int row,
    int col,
    (row, col) primary key,
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

CREATE TABLE Tareas {
    int id AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha,
    int id_usuario,
    int id_curso,
    id_usuario FK Usuarios (id),
    id_curso FK Cursos (id)
};

CREATE TABLE Inventario {
    int id AUTO_INCREMENT primary key,
    int id_curso,
    id_curso FK Cursos (id);
};

CREATE TABLE Objetos {
    int id AUTO_INCREMENT primary key,
    int cantidad,
    datetime fecha_creacion,
    datetime fecha_modificacion,
    int id_inventario,
    id_inventario FK Inventario (id_inventario)
}; 

CREATE TABLE Cursos {
    int id AUTO_INCREMENT primary key,
    varchar url_imagen,
    datetime fecha_creacion
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
    id_usuario FK Alumnos (id),
    id_curso FK Cursos (id),
    int matricular default(0),
    PRIMARY(id_Alumno, id_curso)
};

CREATE TABLE CursosProfesores {
    int id_Profesor,
    int id_curso,
    int matricular default(0),
    id_Profesor FK Profesores (id),
    id_curso Fk Cursos (id),
    PRIMARY(id_Profesor, id_curso)
}

CREATE TABLE Administrador {
    
}

CREATE TABLE CursosInventarios {
    int id_curso,
    int id_inventario,
    id_curso FK Cursos (id),
    id_inventario FK Inventario (id)
};

CREATE TABLE InventariosUsuarios {
    int id_inventario,
    int id_usuario,
    id_usuario FK Usuarios (id),
    id_inventario FK Inventario (id)
};

CREATE TABLE Errores {
    int id AUTO_INCREMENT primary key,
    varchar texto (2000),
    datetime fecha
    int id_usuario,
    id_usuario FK Usuarios (id)
};