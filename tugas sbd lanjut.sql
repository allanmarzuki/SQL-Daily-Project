CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE kategori(
	kode_kategori INT(11) NOT NULL AUTO_INCREMENT,
	nama_kategori VARCHAR(30) NOT NULL,
	PRIMARY KEY(kode_kategori)
);

CREATE TABLE pengarang(
	kode_pengarang INT (11) NOT NULL AUTO_INCREMENT,
	nama_pengarang VARCHAR (30) NOT NULL,
	alamat_pengarang VARCHAR (100) NOT NULL,
	no_telp_pengarang VARCHAR (14),
	PRIMARY KEY(kode_pengarang)
);
CREATE TABLE penerbit(
	kode_penerbit INT (11) NOT NULL AUTO_INCREMENT,
	nama_penerbit VARCHAR (30) NOT NULL,
	alamat_penerbit VARCHAR (100) NOT NULL,
	no_telp_penerbit VARCHAR (14) NOT NULL,
	PRIMARY KEY(kode_penerbit)
);
CREATE TABLE petugas(
	kode_petugas INT(11) NOT NULL AUTO_INCREMENT,
	nama_petugas VARCHAR(30) NOT NULL,
	alamat_petugas VARCHAR (100) NOT NULL,
	no_telp_petugas VARCHAR (14) NOT NULL,
	foto_petugas VARCHAR (255) NOT NULL,
	PRIMARY KEY(kode_petugas)
);
CREATE TABLE anggota(
	kode_anggota INT (11) NOT NULL AUTO_INCREMENT,
	nama_anggota VARCHAR(30) NOT NULL,
	alamat_anggota VARCHAR(100) NOT NULL,
	no_telp_anggota VARCHAR(14) NOT NULL,
	foto_anggota VARCHAR(255) NOT NULL,
	jenis_kelamin ENUM('0','1'),
	PRIMARY KEY(kode_anggota)
);
CREATE TABLE buku(
	kode_buku INT (11) NOT NULL AUTO_INCREMENT,
	judul_buku VARCHAR(30) NOT NULL,
	deskripsi VARCHAR(100) NOT NULL,
	jumlah VARCHAR (2) NOT NULL,
	tahun CHAR (4) NOT NULL,
	kode_kategori INT (11) NOT NULL,
	kode_pengarang INT (11) NOT NULL,
	kode_penerbit INT (11) NOT NULL,
	PRIMARY KEY(kode_buku),
	FOREIGN KEY (kode_kategori) REFERENCES kategori (kode_kategori),
	FOREIGN KEY (kode_pengarang) REFERENCES pengarang (kode_pengarang),
	FOREIGN KEY (kode_penerbit) REFERENCES penerbit (kode_penerbit)
);
CREATE TABLE peminjaman(
	kode_peminjaman INT(11) NOT NULL AUTO_INCREMENT,
	tanggal_pinjaman DATETIME NOT NULL,
	tanggal_kembali DATETIME NOT NULL,
	kode_buku INT (11) NOT NULL,
	kode_petugas INT(11) NOT NULL,
	kode_anggota INT (11) NOT NULL,
	statuss VARCHAR(10) NOT NULL,
	PRIMARY KEY (kode_peminjaman),
	FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku),
	FOREIGN KEY (kode_petugas) REFERENCES petugas (kode_petugas),
	FOREIGN KEY (kode_anggota) REFERENCES anggota (kode_anggota)
	
);
CREATE TABLE pengembalian(
	kode_pengembalian INT (11) NOT NULL AUTO_INCREMENT,
	tanggal_pengembalian DATETIME NOT NULL,
	denda INT (11) NOT NULL,
	kode_peminjaman INT (11) NOT NULL,
	PRIMARY KEY(kode_pengembalian),
	FOREIGN KEY (kode_peminjaman) REFERENCES peminjaman (kode_peminjaman)
);

#2
ALTER TABLE anggota ADD COLUMN jenis_kelamin ENUM ('0','1') NOT NULL;
ALTER TABLE petugas ADD COLUMN jenis_kelamin ENUM ('0','1') NOT NULL;
ALTER TABLE pengarang DROP COLUMN alamat_pengarang;
ALTER TABLE pengarang DROP COLUMN no_telp_pengarang;
ALTER TABLE kategori MODIFY nama_kategori VARCHAR(30) NOT NULL;
ALTER TABLE buku MODIFY COLUMN jumlah INT;
ALTER TABLE buku CHANGE tahun tahun_terbit CHAR (4);

#3 DML
 INSERT INTO anggota VALUES (1,"Ivan","Bantul","081234555555","ivan.jpg",'0'),(2,"Indra","Yogyakarta","081234666666","indra.jpg",'0'),
 (3,"Dhea","Sleman","081234888888","dhea.jpg",'1');
 
 INSERT INTO petugas VALUES (1,"Aditya","Jakarta","081123456789","aditya.jpg",'0'),(2,"Putut","Bangka","081111222333","putut.jpg",'0');
 
 INSERT INTO kategori VALUES (1,"Novel"),(2,"Pelajaran");
 
 INSERT INTO penerbit VALUES (1,"Granudia","Jakarta Utara","0212345678"),(2,"Plex Media","Yogyakarta","0218765432"),(3,"Ando Publisher","Bandung","0214567898");
 
 INSERT INTO pengarang VALUES (1,"Tere Liye"),(2,"Sutopo"),(3,"Andrea"),(4,"Sri Kusumadewi");
 
 INSERT INTO buku VALUES (1,"Matematika Diskrit","ABC","5","2015","2","2","1"),(2,"Tentang Kamu","CBA","3","2016","1","1","2"),
 (3,"Hujan","GHJ","3","2016","1","1","1"),(4,"Computer Vision","FAS","6","2018","2","4","3"),(5,"Laskar Pelangi","HJK","2","2005","1","3","3");
 
 INSERT INTO peminjaman VALUES (1,'2019-02-04 10:30:00','2019-02-06 00:00:00',1,2,1,"pinjam"),(2,'2019-02-02 09:00:00','2019-02-04 00:00:00',2,1,2,"pinjam"),
 (3,'2019-02-12 09:10:00','2019-02-14 00:00:00',3,1,2,"kembali"),(4,'2019-02-08	 10:15:00','2019-02-11 00:00:00',4,1,3,"pinjam"),
 (5,'2019-02-01 10:10:00','2019-02-03 00:00:00',5,2,3,"kembali");
 
 INSERT INTO pengembalian VALUES (1,'2019-02-14 10:00:00',0,3),(2,'2019-02-05 08:50:00',2000,5);
 
 #4
 
 SELECT * FROM peminjaman WHERE statuss ='pinjam';
 
 SELECT * FROM buku ORDER BY tahun_terbit ASC;
 
 SELECT * FROM buku WHERE judul_buku LIKE '%kamu%';
 
 SELECT * FROM buku WHERE deskripsi LIKE '%A%';
 
 SELECT SUM(jumlah)AS total FROM buku;
 
 SELECT judul_buku,jumlah FROM buku ORDER BY jumlah DESC LIMIT 1;
 
 SELECT judul_buku,jumlah FROM buku ORDER BY jumlah ASC LIMIT 1;
 
 SELECT AVG(denda) AS ratarata FROM pengembalian;
 
 #5
 
 UPDATE anggota SET nama_anggota="Dian",alamat_anggota="Bantul" WHERE kode_anggota=3;
 
 UPDATE penerbit SET alamat_penerbit="Yogyakarta" WHERE kode_penerbit=3;
 
 UPDATE buku SET  tahun_terbit="2017" WHERE kode_buku=4;
 
 DELETE FROM peminjaman WHERE tanggal_pinjaman ='2019-02-08 10:15:00';
 
 #6 JOIN
 
 SELECT *FROM buku;
 SELECT *FROM anggota;
 SELECT *FROM peminjaman;
 
 SELECT buku.kode_buku, buku.judul_buku, buku.deskripsi, buku.jumlah, buku.tahun_terbit FROM buku 
 JOIN peminjaman ON buku.kode_buku = peminjaman.kode_buku 
 JOIN anggota ON peminjaman.kode_anggota = anggota.kode_anggota 
 WHERE nama_anggota = 'Ivan';
 
 SELECT c.kode_anggota, c.nama_anggota, c.alamat_anggota, c.no_telp_anggota, c.foto_anggota, c.jenis_kelamin, p.statuss
 FROM anggota c JOIN 
 peminjaman p ON c.kode_anggota = p.kode_anggota 
 JOIN petugas pet ON p.kode_petugas = pet.kode_petugas WHERE alamat_petugas = 'Jakarta';
 
 SELECT * FROM buku INNER JOIN peminjaman ON buku.kode_buku=peminjaman.kode_buku WHERE  statuss = 'Kembali';
 
 SELECT b.judul_buku, pb.nama_penerbit, k.nama_kategori, pg.nama_pengarang FROM penerbit pb ON
 b.kode_penerbit = pb.kode_penerbit JOIN kategori k ON b.kode_kategori = k.kode_kategori JOIN pengarang pg ON b.kode_pengarang = pg.kode_pengarang
 WHERE nama_anggota = 'Indra';
 
 SELECT nama_anggota FROM anggota WHERE (SELECT AVG(denda)>1000 FROM pengembalian);

SELECT buku.judul_buku, pengarang.nama_pengarang FROM buku INNER JOIN pengarang ON buku.kode_buku=pengarang.kode_pengarang;

SELECT peminjaman.statuss, pengarang.nama_pengarang FROM peminjaman LEFT JOIN pengarang ON peminjaman.kode_peminjaman=pengarang.kode_pengarang;

SELECT buku.judul_buku, petugas.alamat_petugas FROM buku RIGHT JOIN petugas ON buku.kode_buku=petugas.kode_petugas;

SELECT peminjaman.statuss, pengarang.nama_pengarang FROM peminjaman LEFT OUTER JOIN pengarang ON peminjaman.kode_peminjaman=pengarang.kode_pengarang;

SELECT buku.judul_buku, petugas.alamat_petugas FROM buku RIGHT OUTER JOIN petugas ON buku.kode_buku=petugas.kode_petugas;


(SELECT judul_buku FROM buku)
UNION
(SELECT nama_pengarang FROM pengarang);

#perbedaan :
#Inner Join merupakan perintah untuk menampilkan semua data yang mempunyai nilai sama
#Left Join merupakan cara menghubungkan tabel dan menampilkan semua data (kiri) pada tabel yang tidak berhubungan, sedangkan data yang kosong akan bernilai NULL
#Right Join akan menghubungkan tabel dan menampilkan semua data (kanan) pada tabel yang tidak berhubungan, dan data yang kosong akan bernilai NULL.
#Left Outer Join Operasi Join tipe ini akan menampilkan semua isi tabel sisi kiri, walaupun data di pasangan joinnya yg disisi kanan nilainya tidak sama ataupun bernilai null.
#Right Outer Join Operasi Join tipe ini akan menampilkan semua isi tabel sisi Kanan, walaupun data di pasangan joinnya yg disisi kiri nilainya tidak sama ataupun bernilai null.
#Union menggabungkan dua atau lebih query select dalam satu hasil keluaran.
	



 
 
 
 
 
 
 
 
 
 


