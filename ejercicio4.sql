/*Ejercicio A*/



SELECT p.NumeroPasaje, p.nroAsiento, p.patenteColectivo, p.idViaje
FROM pasaje p
INNER JOIN viajes v
ON v.idViaje = p.idViaje
WHERE DATEDIFF(p.fechaEmision, v.fecha) <= 3;

/*Ejercicio B*/



SELECT a.patenteColectivo, NroAsiento, lado
FROM asientos as a JOIN colectivos as c
ON a.patenteColectivo = c.patente
WHERE c.marca LIKE '%Volvo%' 
AND NOT EXISTS (SELECT * FROM pasaje as p
WHERE p.NroAsiento = a.nroAsiento)

/*  4C */

SELECT codCiudadOrigen, ciudades.nombre, COUNT(codCiudadOrigen) AS CantVIajes
FROM viajes JOIN ciudades ON viajes.codCiudadOrigen = ciudades.codigo
WHERE viajes.fecha >= '2024-01-01' AND viajes.fecha <= '2024-12-31'
GROUP BY codCiudadOrigen , ciudades.nombre;

/* EJ 4D */




SELECT fechaEmision, COUNT(numeroPasaje) AS cant
FROM pasaje JOIN viajes ON pasaje.idViaje = viajes.idViaje
JOIN ciudades ON viajes.codCiudadDestino = ciudades.codigo
WHERE viajes.fecha >= '2024-04-01' AND viajes.fecha <= '2025-04-30'
AND ciudades.nombre IN ('Cordoba')
GROUP BY pasaje.fechaEmision;