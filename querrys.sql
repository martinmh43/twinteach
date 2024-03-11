
/*
1. Crear cuenta bbdd (alumnoEjercicioBBDD, ejercicioBBDD@gmail.com, 123456789,
ejercicioBBDD, ApellidosEjercicioBBDD) -> Insert
*/

INSERT INTO Alumnos (nombre_apellidos, nick, contraseña, correo, url_imagen)
VALUES ("alumnoEjercicioBBDD", "ejercicioBBDD", "123456789", "ejercicioBBDD@gmail.com", "url_example");

/*
2. Log in como alumno
*/


SELECT nombre_apellidos, contraseña 
FROM Alumnos
WHERE nombre_apellidos="alumnoEjercicioBBDD" and contraseña="123456789";


/*
Cambiar icono del alumno
*/

UPDATE Alumnos 
SET 
url_imagen = 'tu jamon con calzon'
WHERE 
url_imagen = 'tu jamon bien panzon'

/*

*/
