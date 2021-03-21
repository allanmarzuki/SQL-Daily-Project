USE latihan;

CREATE TABLE Departement(
	nama_dep VARCHAR (20) NOT NULL,
	jenis VARCHAR (20) NOT NULL,
	pemilik VARCHAR (20) NOT NULL,
	tempat VARCHAR (20) NOT NULL,
	ordinat VARCHAR (20) NOT NULL,
	PRIMARY KEY (nama_dep)
);

CREATE TABLE Jabatan(
	sk_jab VARCHAR (20)NOT NULL,
	nama_jab VARCHAR (20) NOT NULL,
	golongan VARCHAR (20) NOT NULL,
	nama_dep VARCHAR (20) NOT NULL,
	PRIMARY KEY (sk_jab)
);

CREATE TABLE Pegawai(
	id_peg VARCHAR (20) NOT NULL,
	nama_peg VARCHAR (20)NOT NULL,
	no_tlp VARCHAR (20)NOT NULL,
	PRIMARY KEY (id_peg)
);

CREATE TABLE Presensi(
	nama_pres VARCHAR (20) NOT NULL,
	id_peg VARCHAR (20) NOT NULL,
	nama_peg VARCHAR (20) NOT NULL,
	PRIMARY KEY (nama_pres)
);

CREATE TABLE hobi(
	nama_hob VARCHAR (20) NOT NULL,
	jenis_hob VARCHAR (20) NOT NULL
);

CREATE TABLE gaji(
	jumlah INT NOT NULL,
	tgl_terima DATE NOT NULL
);

ALTER TABLE Departement ADD CONSTRAINT ordinat_unique UNIQUE(ordinat);

ALTER TABLE Jabatan ADD CONSTRAINT relasi_dep_jab FOREIGN KEY(nama_dep)
REFERENCES Departement(nama_dep);

ALTER TABLE Pegawai ADD CONSTRAINT no_tlp_unique UNIQUE(no_tlp);

ALTER TABLE Presensi ADD CONSTRAINT relasi_pres_peg FOREIGN KEY(id_peg)
REFERENCES Pegawai (id_peg);

DESC Departement;
DESC Jabatan;
DESC Pegawai;
DESC Presensi;
DESC hobi;
DESC gaji;