CREATE DATABASE akkademik;
USE DATABASE akkademik;

CREATE TABLE dosen (
NID VARCHAR(10) NOT NULL,
Nama_dosen VARCHAR(25) NOT NULL,
Tempat_lahir VARCHAR(20) NOT NULL,
Tgl_lahir DATE NOT NULL,
Jurusan VARCHAR(3) NOT NULL,
Alamat VARCHAR(40) NOT NULL,
Kota VARCHAR(20) NOT NULL,
Nomor_telp VARCHAR(12) NOT NULL,
Pendidikan_terakhir VARCHAR(3) NOT NULL,
PRIMARY KEY (NID)
);

CREATE TABLE mahasiswa(
NIM VARCHAR(9) NOT NULL,
Nama_mhs VARCHAR(25) NOT NULL,
Tempat_lahir VARCHAR(20) NOT NULL,
Tgl_lahir DATE NOT NULL,
Jenis_kelamin ENUM('P','W') NOT NULL,
Kode_jur VARCHAR(3) NOT NULL,
Alamat VARCHAR(40) NOT NULL,
Kota VARCHAR(20) NULL,
Asal_sekolah VARCHAR(25) NOT NULL,
Nomor_tlp VARCHAR(12) NULL,
Tgl_daftar DATE NULL,
PRIMARY KEY(NIM)
);

CREATE TABLE jurusan(
Kode_jur VARCHAR(3) NOT NULL,
Nama_jurusan VARCHAR(30) NOT NULL,
Jenjang VARCHAR(2) NULL,
Status_akreditasi VARCHAR(1) NOT NULL,
PRIMARY KEY(Kode_jur)
);

CREATE TABLE matakuliah(
	kode_mkul VARCHAR(7) PRIMARY KEY,
	nama_matakulaih VARCHAR(30),
	sks INT(1),
	semester INT(1),
	statuss INT(1)
);

CREATE TABLE transkrip(
	NIM VARCHAR(9),
	kode_matakuliah VARCHAR(7),
	nilai VARCHAR(1)
);

CREATE TABLE krs(
	NIM VARCHAR(9),
	kode_mkul VARCHAR(7),
	NID VARCHAR(10),
	tahun_akademik INT(4),
	semester INT(1),
	nilai VARCHAR(1)
);

INSERT INTO dosen VALUES ('1020300001', 'Sinta', 'Bantul', '1960-08-01','TI','Jl.Mawar No.2','Yogya','081788888888','S2');
INSERT INTO dosen VALUES ('1020300002', 'Suharyono', 'Klaten', '1980-05-30','SI','Jl.Bareng No.52','Klaten','085644444444','S2');
INSERT INTO dosen VALUES ('1020300003', 'Pujiyanto', 'Sleman', '1975-09-02','TI','Jl.Melati No.11','Yogya','085799999999','S2');
INSERT INTO dosen VALUES ('1020300004', 'Suharti', 'Semarang', '1985-10-10','TK','Jl.Anggur No.1','Solo','085755555555','S2');
INSERT INTO dosen VALUES ('1020300005', 'Fransiska', 'Bantul', '1978-01-23','MI','Jl.Panglima No.2','Yogya','089222222222','S3');
INSERT INTO dosen VALUES ('1020300006', 'Paryono', 'Cilacap', '1979-05-21','MI','Jl.Wolter Monginsidi No.4','Yogya','089222299222','S2');
INSERT INTO dosen VALUES ('1020300007', 'Indri', 'Jakarta', '1958-04-12','KA','Jl.Pengok No.2','Yogya','089222222233','S3');
INSERT INTO dosen VALUES ('1020300008', 'Raymond', 'Sydney', '1978-12-23','TI','Jl.Tentara Mataram No.5','Yogya','089225522245','S3');
INSERT INTO dosen VALUES ('1020300009', 'Rika', 'Banyuwangi', '1982-11-30','MI','Jl.Panglima No.44','Yogya','089222266721','S2');             
SELECT * FROM dosen;

INSERT INTO mahasiswa VALUES ('145410001','Felix Raharja', 'Bantul','1998-08-01','P','TI','Jl.Afandi No.56','Yogya','SMA BOPKRI 1','087666666666','2014-02-20');
INSERT INTO mahasiswa VALUES ('145410002','Rahmat Umam', 'Klaten','1998-04-30','P','TI','Jl.Jeruk No.5','Klaten','SMA N 1 Klaten','085999999999','2014-07-05');
INSERT INTO mahasiswa VALUES ('145610001','Cicilia Rihastuti', 'Sleman','1998-10-02','W','SI','Jl.Arjuna No.21','Yogya','SMA BOPKRI 2','087555555555','2014-04-20');
INSERT INTO mahasiswa VALUES ('143110001','Danang Septiawan', 'Klaten','1997-11-10','P','TK','Jl.Blibis No.2','Solo','SMA N 2 Klaten','085744444444','2014-04-20');
INSERT INTO mahasiswa VALUES ('143310001','Beta Sonata', 'Bantul','1997-01-12','W','MI','Jl.Seraton No.9','Yogya','SMA N 5 Yogya','081888888888','2014-02-28');
INSERT INTO mahasiswa VALUES ('143210001','Felix Harjono', 'Sleman','1998-03-05','P','KA','Jl.Pandawa No.3','Yogya','SMA N 3 Yogya','081777777777','2014-03-10');
INSERT INTO mahasiswa VALUES ('143210002','Priska', 'Gunung Kidul','1997-03-09','W','KA','Jl.Pancasila No.3','Yogya','SMK N 2 Playen','085722222222','2014-02-10');
SELECT * FROM mahasiswa;

DELETE FROM mahasiswa;

INSERT INTO mahasiswa VALUES ('145410001', 'Felix Raharja', 'Bantul', '1998-08-01','P','TI','Jl.Afandi No.56','Yogya','SMA BOPKRI 1','087666666666','2014-02-20');
INSERT INTO mahasiswa VALUES ('145410002', 'Rahmat Umam', 'Klaten', '1998-04-30','P','TI','Jl.Jeruk No.5','Klaten','SMA N 1 Klaten ','085999999999','2014-07-05');
INSERT INTO mahasiswa VALUES ('145610001', 'Cicilia Rihastuti', 'Sleman', '1998-10-02','W','SI','Jl.Arjuna No.21','Yogya','SMA BOPKRI 2','087555555555','2014-04-20');
INSERT INTO mahasiswa VALUES ('143110001', 'Danang Septiawan', 'Klaten', '1997-11-10','P','TK','Jl.Blibis No.2','Solo','SMA N 2 Klaten','085744444444','2014-04-20');
INSERT INTO mahasiswa VALUES ('143310001', 'Beta Sonata', 'Bantul', '1997-01-12','W','MI','Jl.Seraton No.9','Yogya','SMA N 5 Yogya','081888888888','2014-02-28');
INSERT INTO mahasiswa VALUES ('143210001', 'Harjono', 'Sleman', '1998-03-05','P','KA','Jl.Pandawa No.3','Yogya','SMA N 3 Yogya','081777777777','2014-03-10');
INSERT INTO mahasiswa VALUES ('143210002', 'Priska', 'Gunung Kidul', '1997-03-09','W','KA','Jl.Pancasila No.3','Yogya','SMK N 2 Playen','085722222222','2014-02-10');
SELECT * FROM mahasiswa;

INSERT INTO jurusan VALUES ('TI', 'Teknik Informatika', 'S1', 'A');
INSERT INTO jurusan VALUES ('SI', 'Sistem Informasi', 'S1', 'B');
INSERT INTO jurusan VALUES ('KA', 'Komputer Akuntansi', 'D3', 'A');
INSERT INTO jurusan VALUES ('TK', 'Teknik Komputer', 'D3', 'B');
INSERT INTO jurusan VALUES ('MI', 'Manajemen Informatika', 'D3', 'C');
SELECT * FROM jurusan;


/*No.11*/
SELECT * FROM mahasiswa WHERE Tempat_lahir='Sleman';

/*No.12*/
SELECT * FROM dosen WHERE Pendidikan_terakhir='S3';

/*No.13*/
SELECT * FROM dosen WHERE jurusan='TK' OR jurusan='MI';

/*No.14*/
SELECT * FROM mahasiswa WHERE Jenis_kelamin='P';