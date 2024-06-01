INSERT INTO personas (
  tipoDoc,
  nroDocumento,
  apellido,
  nombre,
  fechaNacimiento,
  telefono,
  direccion
) VALUES (
  "DNI",
  12345678,
  "Fernandez",
  "Patricio",
  2001-05-05,
  2994561234,
  "Av. Argentina 123"
);

INSERT INTO choferes (
  tipoDoc,
  nroDocumento,
  legajo,
  categoria
) VALUES (
  "DNI",
  12345678,
  "Legajo123",
  "D-2"
);

INSERT INTO personas (tipoDoc, nroDocumento, apellido, nombre, fechaNacimiento, telefono, direccion)
VALUES
('DNI', 33333333, 'Martinez', 'Laura', '1995-07-10', 123456782, 'Avenida Estrella 789'),
('DNI', 44444444, 'Rodriguez', 'Pedro', '1988-03-22', 123456783, 'Calle Cometa 101');

INSERT INTO pasajeros (tipoDoc, nroDocumento, situacionFiscal)
VALUES
('DNI', 33333333, 'Monotributista'),
('DNI', 44444444, 'Responsable Inscripto');


INSERT INTO personas (tipoDoc, nroDocumento, apellido, nombre, fechaNacimiento, telefono, direccion)
VALUES
('DNI', 11111111, 'Gomez', 'Carlos', '1975-08-20', 123456780, 'Calle del Sol 123'),
('DNI', 22222222, 'Fernandez', 'Ana', '1980-01-15', 123456781, 'Calle Luna 456');

INSERT INTO choferes (tipoDoc, nroDocumento, legajo, categoria)
VALUES
('DNI', 11111111, 'LEG001', 'Profesional'),
('DNI', 22222222, 'LEG002', 'Profesional');


INSERT INTO ciudades (codigo, nombre)
VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba');

INSERT INTO colectivos (patente, marca, cantidadAsientos, color, tipoDocChofer, nroDocumentoChofer)
VALUES
('ABC123', 'Mercedes', 45, 'Blanco', 'DNI', 12345678),
('DEF456', 'Scania', 50, 'Azul', 'DNI', 11111111),
('GHI789', 'Volvo', 55, 'Rojo', null, null);

INSERT INTO asientos (patenteColectivo, nroAsiento, lado)
VALUES
('ABC123', 1, 'Izquierdo'),
('DEF456', 2, 'Derecho');

INSERT INTO viajes (idViaje, fecha, horaPartida, idColectivo, codCiudadOrigen, codCiudadDestino)
VALUES
(1, '2024-06-01', '08:00:00', 'ABC123', 1, 2),
(2, '2024-06-02', '09:00:00', 'DEF456', 2, 1);

INSERT INTO pasaje (NumeroPasaje, tipoDocPasajero, nroDocumentoPasajero, nroAsiento, patenteColectivo, idViaje, fechaEmision)
VALUES
(1, 'DNI', 33333333, 1, 'ABC123', 1, '2024-05-29'),
(2, 'DNI', 44444444, 2, 'DEF456', 2, '2024-05-30');


/*Ejercicio B*/



UPDATE viajes SET horaPartida = '18:00:00' 
WHERE fecha = '2024-06-02';
/*Ejercicio C*/

DELETE FROM choferes 
WHERE NOT EXISTS (select * from colectivos
where choferes.tipoDoc = colectivos.tipoDocChofer
and choferes.nroDocumento = colectivos.nroDocumentoChofer);

