CREATE DATABASE AKADEMIK;

USE AKADEMIK;

CREATE TABLE mahasiswa(

	nim VARCHAR(10) NOT NULL PRIMARY KEY,
	nama VARCHAR(50) NOT NULL,
	alamat VARCHAR(100) NOT NULL,
	jenis_kelamin ENUM('laki-laki','perempuan') NOT NULL
		
	);
	
CREATE TABLE dosen(
	NIK INTEGER(10) NOT NULL PRIMARY KEY,
	nama_dos VARCHAR(20) NOT NULL,
	tgl_lhr_dos DATE NOT NULL,
	alamat_dos VARCHAR(50)
);

CREATE TABLE mata_kuliah(
	kd_MK VARCHAR(10) NOT NULL,
	matakuliah VARCHAR(15) NOT NULL,
	SKS INTEGER(2) NOT NULL
);

CREATE TABLE nilai(

	kd_nilai INTEGER(3) NOT NULL,
	nilai_angka INTEGER(3),
	nilai_huruf CHAR(2) NOT NULL,
	kd_MK VARCHAR(10) NOT NULL,
	NIM INTEGER(10) NOT NULL
);

CREATE TABLE kelas(
	kd_kelas INTEGER(3) NOT NULL,
	kelas VARCHAR(2) NOT NULL,
	kd_mk VARCHAR(10) NOT NULL,
	NIK VARCHAR(10) NOT NULL 

);