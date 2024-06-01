/*INSERT
Para realizar un insert si hay una foranea, debe estar creado en la otra entidad por ejemplo, debe haber un accidente creado con en el idaccidente
*/
INSERT into transito(idAccidente,motivo) VALUES
(80, 'algo')

/*UPDATE
PAra modificar una tupla especifca utilizamos la clave primaria
*/
UPDATE bombero SET localidad = 'General Roca'
WHERE anios_servicio = 1

/*DELETE
Puede que si o puede no funcione segun las politicas 
*/

DELETE FROM Vehiculo 
WHERE modelo = 'Audi Q7'
AND anio =2012


/*SELECT SIMPLES
LIKE
Fecha
condiciones con AND OR 
*/

DELETE FROM Vehiculo 
WHERE modelo LIKE 'Audi%' || '%Audi' || '%Audi%' /* Contiene a*/

/*SELECT
Mostrar registros 
*/

SELECT FROM 'bombero' WHERE localidad = 'Neuquen' OR localidad = 'Cipolletti'

/*Listar la cantidad de años trasncurridos desde el accidente */

SELECT idAccidente as Accidente  DATEDIFF(curdate(), fecha)/365 as CantidadAnios,
(DATEDIFF(crudate(),fecha)/365 * 12 as Meses)
FROM 'accidente'

/*Listar registros con fecha mayores a tal*/
SELECT * FROM 'accidente' WHERE fecha >= '2009-01-01'

/* Los bomberos con "an en el nombre" y el rol que cumplio*/

SELECT bombero.tipodoc,nombre,rol FROM 'bombero'
JOIN asiste /*AS A -> para renombrar asiste = A*/
ON asiste.tipoDoc = bombero.tipodoc
AND asiste.nrodoc = bombero.nrodoc 
WHERE nombre LIKE '%an%'


SELECT bombero.tipodoc,nombre,rol FROM 'bombero'
JOIN asiste /*AS A -> para renombrar asiste = A*/
ON asiste.tipoDoc = bombero.tipodoc
AND asiste.nrodoc = bombero.nrodoc 
WHERE nombre LIKE '%an%'
AND idaccidente IN
(select idaccidente from accidente where localidad = 'Neuquen')


SELECT * FROM bombero
WHERE NOT EXISTS (select * from accidente
INNER JOIN accidente AS A
/*Falta Join*/
Where bombero.tipodoc = accidente.tipodoc
and bombero.nrodoc = accidente.nrodoc)
and localidad = 'Cipolletti'


/*para mostrar el primer registro y el ultimo min y max 
contar la cantidad de accidentes por bombero

*/

SELECT tipodoc as tipoDocumento,nrodoc as NumeroDocument,count(*)
FROM asiste
GROUP BY tipodoc,nrodoc