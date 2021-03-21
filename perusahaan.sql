CREATE DATABASE perusahaan;

USE perusahaan;

CREATE TABLE tb_pegawai(
	kd_pegawai VARCHAR(20) NOT NULL,
	nama_pegawai VARCHAR(50) NOT NULL,
	alamat_pegawai VARCHAR(100) NOT NULL,
	telepon VARCHAR(13) NOT NULL,
	jenis_kelamin VARCHAR(10),
	tanggal_lahir DATE,
	PRIMARY KEY(kd_pegawai)
);

CREATE TABLE tb_kehadiran(
	Kd_kehadiran VARCHAR(20) NOT NULL,
	kd_pegawai VARCHAR(50) NOT NULL,
	bulan VARCHAR(30) NOT NULL,
	hadir INTEGER NOT NULL,
	izin INTEGER NOT NULL,
	alfa INTEGER NOT NULL,
	lembur INTEGER NOT NULL,
	PRIMARY KEY(Kd_kehadiran)
);

INSERT INTO tb_pegawai VALUES ('P001','Andri Hendriawan','Semin, Gunung Kidul', '08562251436','Laki-Laki','1994-09-13'),
('P002','Ahmad Tri','Wates, Kulon Progo','08227272627','Laki-Laki','1990-08-01'),
('P003','Nur Suci','Kaliurang, Sleman','089268278288','Perempuan','1996-08-23'),
('P004','Heri Ariawan','Maguwoharjo, Sleman','089123232433','Laki-Laki','1994-08-02'),
('P005','Vicky Firdaus','Pakem, Sleman','08628827876','Laki-Laki','1995-07-20');

SELECT * FROM tb_pegawai;

SELECT nama_pegawai,(2018-YEAR(tanggal_lahir)) AS usia 
FROM tb_pegawai 
WHERE 
YEAR (tanggal_lahir) = (SELECT MIN(YEAR(tanggal_lahir))FROM tb_pegawai);

#soal nomor 1
SELECT nama_pegawai FROM tb_pegawai WHERE nama_pegawai LIKE '%riawan%';

#soal nomor 2
SELECT nama_pegawai,(2018-YEAR(tanggal_lahir)) AS usia 
FROM tb_pegawai;

#soal nomor 3
SELECT nama_pegawai FROM tb_pegawai WHERE tanggal_lahir LIKE '%08%';
SELECT nama_pegawai, MONTHNAME(tanggal_lahir)AS bulan FROM tb_pegawai WHERE MONTH(tanggal_lahir)=8;

#soal nomor 4
SELECT tb_pegawai.nama_pegawai, tb_kehadiran.*FROM tb_pegawai INNER JOIN tb_kehadiran ON tb_pegawai.kd_pegawai = tb_kehadiran.kd_pegawai;

#soal nomor 5
SELECT tb_pegawai.nama_pegawai, tb_kehadiran.izin FROM tb_pegawai INNER JOIN tb_kehadiran ON tb_pegawai.kd_pegawai = tb_kehadiran.kd_pegawai;

#soal nomor 6
SELECT tb_pegawai.nama_pegawai, (tb_kehadiran.hadir*100000) AS gaji FROM tb_pegawai INNER JOIN tb_kehadiran ON tb_pegawai.kd_pegawai = tb_kehadiran.kd_pegawai AND tb_kehadiran.bulan = 'Februari';
