
/*
1. Crear cuenta bbdd (alumnoEjercicioBBDD, ejercicioBBDD@gmail.com, 123456789,
ejercicioBBDD, ApellidosEjercicioBBDD) -> Insert
*/

INSERT INTO Alumnos (nombre_apellidos, nick, contraseña, correo, url_imagen)
VALUES ("alumnoEjercicioBBDD", "ejercicioBBDD", "123456789", "ejercicioBBDD@gmail.com", "url_example1");

/*
2. Log in como alumno
*/


SELECT nombre_apellidos, contraseña 
FROM Alumnos
WHERE nombre_apellidos="alumnoEjercicioBBDD" and contraseña="123456789";

/*
3. Cambiar icono del alumno
*/

UPDATE Alumnos 
SET 
url_imagen = 'tu jamon con calzon'
WHERE 
url_imagen = 'tu jamon bien panzon'

/*
4. Crear cuenta como profesor (profesorEjercicioBBDD...)
*/
INSERT INTO Profesores (nombre_apellidos,nick,contraseña,correo,url_imagen)
VALUES ("profesorEjercicioBBDD", "profEjercicioBBDD", "12345", "profesorEjercicioBBDD@gmail.com", "url_example2");


/*
5. Log in como profesor
*/

SELECT nombre_apellidos, contraseña 
FROM Profesores
WHERE nombre_apellidos="profesorEjercicioBBDD" and contraseña="12345";


/*
6- Crear curso (EjercicioBBDD)
*/

INSERT INTO Cursos (url_imagen, fecha_creacion, codigoAlumnos, codigoProfesores)
VALUES ("la mama de la mama de la mama", 12/12/1212, "78751488", "848718");

/*
7. Ver los codigos de acceso de los cursos
*/

SELECT codigoAlumnos,codigoProfesores
FROM Cursos
WHERE id=1;

/*
8. Alumno solicita unirse al curso
*/

INSERT INTO CursosAlumnos (id_Alumno, id_curso)
VALUES (1, 1);

/*
9- Mostrar los que tienen aceptado = 0
*/

SELECT matricular FROM CursosAlumnos WHERE matricular = 0;

/*
10- Aceptar al alumno -> (update) -> 
se hacen 3 consultas -> cofre madre(id-1), 
huevo(id-58), oro cant. 5
*/
/*10.1*/
UPDATE CursosAlumnos 
SET
matricular = 1
WHERE matricular = 0 AND id_Alumno = 1 AND id_curso = 1;
/*10.2*/

UPDATE ObjetosAlumnos
SET
cantidad = 1
WHERE
id_objeto = 2;
/*10.3*/
UPDATE ObjetosAlumnos
SET
cantidad = 1
WHERE
id_objeto = 58;
/*10.4*/
UPDATE ObjetosAlumnos
SET
cantidad = 5
WHERE
id_objeto = 1


/*
11. Saber cuantos miembros hay en el curso
*/

SELECT COUNT(DISTINCT CursosProfesores.id_Profesor) AS cantidad_profesores,
    COUNT(DISTINCT CursosAlumnos.id_Alumno) AS cantidad_alumnos
FROM Cursos c
INNER JOIN CursosProfesores CP ON c.id = CP.id_curso
INNER JOIN CursosAlumnos CA ON c.id = CA.id_curso
where c.id = CursosAlumnos.id_Alumno && c.id = CursosProfesores.id_Profesor;