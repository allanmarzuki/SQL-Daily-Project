`tugas`CREATE	DATABASE tugas;

USE tugas;

CREATE TABLE IF NOT EXISTS  pembeli(
	id_pembeli VARCHAR(20) NOT NULL,
	nama_pembeli VARCHAR(30) NOT NULL,
	telepon VARCHAR(15) NOT NULL,
	alamat VARCHAR(100) NOT NULL, 
	PRIMARY KEY(id_pembeli)
);

CREATE TABLE IF NOT EXISTS kasir(
	id_kasir VARCHAR(20) NOT NULL,
	nama_kasir VARCHAR(30) NOT NULL,
	telepon VARCHAR(15) NOT NULL,
	PRIMARY KEY(id_kasir) 
);

CREATE TABLE IF NOT EXISTS produk(
	id_produk VARCHAR(20) NOT NULL,
	nama_produk VARCHAR(30) NOT NULL,
	stok INT NOT NULL,
	harga INT NOT NULL,
	id_sup VARCHAR(20) NOT NULL,
	PRIMARY KEY(id_produk,id_sup)
);

CREATE TABLE IF NOT EXISTS supplier(
	id_sup VARCHAR(20) NOT NULL,
	nama VARCHAR(30) NOT NULL,
	alamat VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_sup)
);

CREATE TABLE IF NOT EXISTS transaksi(
	no_transaksi VARCHAR(20) NOT NULL,
	tanggal DATE NOT NULL,
	total_bayar INT NOT NULL,
	id_pembeli VARCHAR(20) NOT NULL,
	id_kasir VARCHAR(20) NOT NULL,
	PRIMARY KEY(no_transaksi,id_pembeli,id_kasir)
);

CREATE TABLE IF NOT EXISTS detail_transaksi(
	id_detail VARCHAR(20) NOT NULL,
	no_transaksi VARCHAR(20) NOT NULL,
	id_produk VARCHAR(20) NOT NULL,
	jumlah INT NOT NULL,
	PRIMARY KEY(id_detail)
);	

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

SHOW TABLES;

INSERT INTO produk VALUES ('y2','kentang',800,9000,'yui');

SELECT id_produk,nama_produk AS name_prod FROM produk;

SELECT * FROM produk;

SELECT nama_produk, stok*harga AS keuntungan FROM produk;

SELECT nama_produk, MAX(stok) AS terbanyak FROM produk;

SELECT nama_produk, MAX(stok) AS terbanyak, COUNT(id_produk) AS 'total produk', AVG(harga) AS harga FROM produk;

SELECT * FROM supplier;




USE tugas;

#fungsi Date
SELECT CURRENT_DATE() AS 'hari ini';
SELECT YEAR (tanggal) AS 'tahun transaksi' FROM transaksi;
SELECT MONTH (tanggal) AS 'Bulan Sekarang' FROM transaksi;
SELECT MONTHNAME (tanggal) AS 'nama bulan' FROM transaksi;
SELECT CURRENT_TIMESTAMP(); #tanggal tahun sekarang

DESC transaksi;

INSERT INTO kasir VALUES ('90s','ogre','9870');

DESC kasir;


#fungsi Agregate

SELECT MAX(harga) AS 'harga tertinggi' FROM produk;
SELECT MIN(harga) AS 'harga terendah' FROM produk;
SELECT COUNT(id_produk) AS 'banyak produk' FROM produk;
SELECT SUM(stok) AS 'banyak stok' FROM produk;
SELECT AVG(stok) AS 'rata2' FROM produk;


#untuk menghilangkan duplikasi menggunakan distinct
SELECT DISTINCT(id_sup) FROM produk;
SELECT COUNT(DISTINCT(id_sup)) AS 'banyak supplier' FROM produk;

#fungsi order by

SELECT * FROM produk ORDER BY stok ASC; #mengurutkan data stok dari terkecil ke terbesar, kalo yang sebaliknya menggunakan desc

#untuk mengurutkan nama_produk yang sama namun dengan stok yang diurutkan dari yang terkecil.
(SELECT * FROM produk ORDER BY stok ASC) 
ORDER BY nama_produk ASC;

#group by
SELECT * FROM produk GROUP BY harga DESC; #mengurutkan data sama dengan order by

SELECT * FROM produk;
SELECT * FROM supplier;

SELECT p.nama_produk, s.nama FROM produk p, supplier s
WHERE p.id_sup = s.id_sup; #relasi dua table dengan fungsi where

SELECT p.nama_produk, s.nama FROM produk p INNER JOIN supplier s
ON p.id_sup = s.id_sup; #relasi dua table dengan fungsi join

#relasi 3 tabel dengan join
SELECT 
	detail_transaksi.no_transaksi,
	produk.nama_produk,
	supplier.nama
FROM
	detail_transaksi INNER JOIN produk INNER JOIN supplier
ON
	detail_transaksi.id_produk = produk.id_produk AND
	produk.id_sup = supplier.id_sup;
	
#relasi dengan right dan left join dengan menampilkan sesuai navigasi kiri kanan

SELECT
	supplier.nama,
	produk.nama_produk
FROM 	
	supplier LEFT JOIN produk
ON
	produk.id_sup = supplier.id_sup;
	
#relasi dengan union dengan right left join

SELECT
	supplier.nama,
	produk.nama_produk
FROM 	
	supplier LEFT JOIN produk
ON
	produk.id_sup = supplier.id_sup
UNION

SELECT
	supplier.nama,
	produk.nama_produk
FROM 	
	supplier RIGHT JOIN produk
ON
	produk.id_sup = supplier.id_sup;
	
#like
SELECT supplier.`nama` FROM supplier WHERE supplier.`alamat` LIKE '%jombang%';

#subquery

SELECT * FROM produk WHERE stok < (SELECT AVG(stok)FROM produk);
