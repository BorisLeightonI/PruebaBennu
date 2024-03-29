-- MySQL Script generated by Boris
-- Mon Jun 24 15:55:46 2019
-- Model: New Model    Version: 1.0

-- 2.	Escribe un archivo .sql que contenga las siguientes consultas

-- a.	Consulta que obtenga todos los profesores de un colegio ordenados por nombre.
SELECT nombre FROM `profesores` ORDER BY nombre;

-- b.	Consulta que obtenga todos los alumnos con promedio rojo por asignatura.
SELECT alumnos.nombre,alumnos.nota,asignatura.nombre 
FROM `alumnos` INNER JOIN asignatura on alumnos.idAsignatura=asignatura.idAsignatura WHERE alumnos.nota<40 ;

-- c.	Consulta que contenga el alumno con mejor nota por asignatura.
SELECT alumnos.nombre, MAX(nota) as Promedio, asignatura.nombre FROM alumnos 
INNER JOIN asignatura ON alumnos.idAsignatura=asignatura.idAsignatura GROUP BY asignatura.nombre ;