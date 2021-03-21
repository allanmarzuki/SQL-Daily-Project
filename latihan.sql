CREATE DATABASE latihan;

USE latihan;

CREATE TABLE IF NOT EXISTS dosen(
	nik INTEGER(10) NOT NULL,
	nama_dosen VARCHAR(20) NOT NULL,
	tgl_lhr_dos DATE NOT NULL,
	alamat_dos VARCHAR(50) NOT NULL,
	PRIMARY KEY(nik)
);

CREATE TABLE IF NOT EXISTS matakuliah(
	kd_mk VARCHAR(10) NOT NULL,
	matakuliah VARCHAR(15) NOT NULL,
	sks INTEGER(2) NOT NULL,
	PRIMARY KEY(kd_mk)
);

CREATE TABLE IF NOT EXISTS nilai(
	kd_nilai INTEGER(3) NOT NULL,
	nilaiangka INTEGER(3) NOT NULL,
	nilaihuruf CHAR(2) NOT NULL,
	kd_mk VARCHAR(10) NOT NULL,
	nim INTEGER(10) NOT NULL,
	PRIMARY KEY(kd_nilai,kd_mk,nim)
);

CREATE TABLE IF NOT EXISTS kelas(
	kd_kelas INTEGER(3) NOT NULL,
	kelas VARCHAR(2) NOT NULL,
	kd_mk VARCHAR(10) NOT NULL,
	nik VARCHAR(10) NOT NULL,
	PRIMARY KEY(kd_kelas, kd_mk, nik)
);