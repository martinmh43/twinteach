
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
JOIN CursosProfesores CP ON c.id = CP.id_curso
JOIN CursosAlumnos CA ON c.id = CA.id_curso
where c.id = CursosAlumnos.id_Alumno && c.id = CursosProfesores.id_Profesor;

/*
12. Ver mis cursos
*/
SELECT Cursos.nombre, Cursos.url_imagen 
FROM Cursos JOIN CursosAlumnos ON Cursos.id = CursosAlumnos.id_curso,
JOIN Alumnos ON CursosAlumnos.id_Alumno = Alumnos.id
WHERE Alumnos.id = 1;
/*
13. Entrar curso
*/
INSERT INTO CursosAlumnos(id_Alumno, id_curso)
VALUES (1,1);
/*
14. Abrir cofre -> buscar alumno, curso e id_item = 2 (cofre) ,
    cantidad - 1 y update
*/

UPDATE ObjetosAlumnos
SET id_objeto = 2, cantidad = 0
SET id_objeto = 201, cantidad = 1,
SET id_objeto = 1, cantidad = 5
JOIN Alumnos a ON a.id = ObjetosAlumnos.id_alumno
WHERE  id_alumno = 1;
/*
15. Insert de los nuevos objetos que han tocado con las nuevas cantidades
	2 monedas (update), id 56 piedra fuego cant(3), id 50 calabaza, 
    id 200 hansel (insert)
*/
/*15.1*/
INSERT INTO ObjetosAlumnos (id_objeto, cantidad, id_Alumno)
VALUES(1, 2, 1);
/*15.2*/
INSERT INTO ObjetosAlumnos (id_objeto, cantidad, id_Alumno)
VALUES(56, 3, 1);
/*15.3*/
INSERT INTO ObjetosAlumnos (id_objeto, cantidad, id_Alumno)
VALUES (50, 1, 1);
/*15.4*/
INSERT INTO ObjetosAlumnos (id_objeto, cantidad, id_Alumno)
VALUES (200, 1, 1);

/*
16. Ir al pueblo (200<=id<=500) mostrar todos los chibis
*/

SELECT id,
FROM Objetos
WHERE id BETWEEN 200 AND 500;

/*
17. Ver las softSkills, select sobre tabla evalua
*/

SELECT id, nombre, puntos
FROM Softskill;

/*
18. Evaluar compañeros -> cooperacion 3 puntos
*/

INSERT INTO Softskill (nombre, fehca_envio, puntos, id_alumno_envia, id_alumno_recive, id_curso)
VALUES ('cooperación', 13-03-2024, 3, 1, 2, 1);

/*
19. Mostrar el desplegable de los alumnos que hay dentro del curso
*/

SELECT Alumnos.*
FROM Alumnos
JOIN CursosAlumnos ON Alumnos.id = CursosAlumnos.id_Alumno
WHERE CursosAlumnos.id_curso = 1;

/*
20. Profesor -> administrar curso -> crea ranking nombre = ejercicioBBDD
*/

INSERT INTO Ranking (id, Nombre, fecha_creacion, id_curso)
VALUES (1, 'El pepito', 13-03-2024, 1);

/*
21. Crea tarea 1, ejercicioBBDD
*/

INSERT INTO Tareas(cantidad, fehca, id_ranking, id_profesor, id_curso)
VALUES (1,13-03-2024,1,1,1);

/*
22. Cambiar notas, guardar puntuaciones
*/
UPDATE TareasAlumnos
SET
nota = 10
WHERE nota = 0 AND id_alumno = 1, id_tarea = 1;

/*
23. Entregar recompensas -> insert en tabla inventario
*/
INSERT INTO ObjetosAlumnos (id_objeto, cantidad, id_Alumno)
VALUES (3, 1, 1);

/*
24. consulta muetra los rankings (desplegable)
*/
SELECT Ranking.id, Ranking.Nombre 
FROM Ranking 
JOIN Cursos ON id_curso = Cursos.id
WHERE id_curso = 1;