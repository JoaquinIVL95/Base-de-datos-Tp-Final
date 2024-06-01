CREATE DATABASE viajes_de_placer;

CREATE TABLE personas (
  tipoDoc varchar(11) NOT NULL,
  nroDocumento int NOT NULL,
  apellido varchar(20) NOT NULL,
  nombre varchar(20) NOT NULL,
  fechaNacimiento date NOT NULL,
  telefono int NOT NULL,
  direccion varchar(50) NOT NULL,
  PRIMARY KEY (tipoDoc, nroDocumento)
);

CREATE TABLE pasajeros (
  tipoDoc varchar(11) NOT NULL,
  nroDocumento int NOT NULL,
  situacionFiscal varchar(20) NOT NULL,
  PRIMARY KEY (tipoDoc,nroDocumento),
  FOREIGN KEY (tipoDoc,nroDocumento) 
    REFERENCES personas(tipoDoc,nroDocumento) 
      ON UPDATE cascade 
      ON DELETE cascade
);

CREATE TABLE choferes (
  tipoDoc varchar(11) NOT NULL,
  nroDocumento int NOT NULL,
  legajo varchar(50) NOT NULL,
  categoria varchar(50) NOT NULL,
  PRIMARY KEY (tipoDoc,nroDocumento),
  FOREIGN KEY (tipoDoc,nroDocumento)
   REFERENCES personas(tipoDoc,nroDocumento) 
    ON UPDATE cascade 
    ON DELETE cascade
);

CREATE TABLE ciudades (
  codigo int PRIMARY KEY,
  nombre varchar(20)
);

CREATE TABLE colectivos (
  patente varchar(11) PRIMARY KEY,
  marca varchar(20),
  cantidadAsientos int,
  color varchar(20),
  tipoDocChofer varchar(11),
  nroDocumentoChofer int,
  FOREIGN KEY (tipoDocChofer, nroDocumentoChofer)
    REFERENCES choferes(tipoDoc, nroDocumento)
      ON UPDATE cascade
      ON DELETE restrict
);

CREATE TABLE asientos (
  patenteColectivo varchar(11),
  nroAsiento int,
  lado varchar(20),
  PRIMARY KEY (patenteColectivo,nroAsiento),
  FOREIGN KEY (patenteColectivo) 
    REFERENCES colectivos(patente)
      ON UPDATE cascade
      ON DELETE cascade
);

CREATE TABLE viajes (
  idViaje int PRIMARY KEY,
  fecha date,
  horaPartida time,
  idColectivo varchar(11),
  codCiudadOrigen int,
  codCiudadDestino int,
  FOREIGN KEY (idColectivo)
    REFERENCES colectivos(patente)
      ON UPDATE cascade
      ON DELETE restrict,
  FOREIGN KEY (codCiudadOrigen)
    REFERENCES ciudades (codigo)
      ON UPDATE cascade
      ON DELETE restrict,
  FOREIGN KEY (codCiudadDestino)
    REFERENCES ciudades (codigo)
      ON UPDATE cascade
      ON DELETE restrict
);

CREATE TABLE pasaje (
  NumeroPasaje int(11) ,
  tipoDocPasajero varchar(11),
  nroDocumentoPasajero int(11),
  nroAsiento int (11),
  patenteColectivo varchar(11),
  idViaje int(11),
  fechaEmision date,
  PRIMARY KEY (NumeroPasaje),
  FOREIGN KEY (tipoDocPasajero,nroDocumentoPasajero)
    REFERENCES pasajeros(tipoDoc, nroDocumento)
      ON UPDATE cascade
      ON DELETE restrict,
  FOREIGN KEY (patenteColectivo, nroAsiento)
    REFERENCES asientos (patenteColectivo,nroAsiento)
      ON UPDATE cascade
      ON DELETE restrict,
  FOREIGN KEY (idViaje) 
    REFERENCES viajes (idViaje)
      ON UPDATE cascade
      ON DELETE restrict
);