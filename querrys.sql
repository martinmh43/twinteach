
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
7. Ver los codigos de acceso de los cursos
*/
INSERT INTO Cursos

/*
8. Alumno solicita unirse al curso
*/

