CREATE DATABASE mahasiswa;

USE mahasiswa; 

CREATE TABLE MAHASISWA(
	nim VARCHAR(12) PRIMARY KEY,
	nama VARCHAR(30) NOT NULL,
	jenis_kelamin ENUM('L','P'),
	jurusan VARCHAR(15) NOT NULL
);