USE t`pembeli`ugas;

ALTER TABLE pembeli CHANGE COLUMN nama_pembeli nama_pembeli VARCHAR(50) NOT NULL;

DESC pembeli;
DESC produk;
DESC transaksi;
DESC kasir;
DESC pembeli;
DESC detail_transaksi;
DESC supplier;
DESC dosen;

SHOW TABLES;

ALTER TABLE transaksi ADD PRIMARY KEY(no_transaksi);

ALTER TABLE pembeli DROP PRIMARY KEY;

ALTER TABLE pembeli ADD PRIMARY KEY(id_pembeli);

ALTER TABLE pembeli ADD CONSTRAINT telepon_unique UNIQUE(telepon);

ALTER TABLE pembeli DROP INDEX telepon_unique; 

ALTER TABLE produk ADD CONSTRAINT relasi_produk_sup FOREIGN KEY(id_sup)
REFERENCES supplier(id_sup);

ALTER TABLE transaksi ADD CONSTRAINT relasi_transak_kasir FOREIGN KEY(id_kasir)
REFERENCES kasir(id_kasir); 

ALTER TABLE transaksi ADD CONSTRAINT relasi_transak_pembel FOREIGN KEY(id_pembeli)
REFERENCES pembeli(id_pembeli);

ALTER TABLE detail_transaksi ADD CONSTRAINT relasi_det_transak FOREIGN KEY(no_transaksi)
REFERENCES transaksi(no_transaksi);

ALTER TABLE detail_transaksi ADD CONSTRAINT relasi_transak_prod FOREIGN KEY(id_produk)
REFERENCES produk(id_produk);

SHOW TABLES;

ALTER TABLE pembeli ADD jenis_kelamin VARCHAR(2) NOT NULL;

INSERT INTO pembeli(id_pembeli, nama_pembeli, telepon, alamat, jenis_kelamin)
VALUES ('P39','Alyn','0895','Jombir','L');

INSERT INTO pembeli(id_pembeli, nama_pembeli, telepon, alamat, jenis_kelamin)
VALUES ('p90','Alex','09876','Pelangan','L');

INSERT INTO produk(id_produk, nama_produk, stok, harga, id_sup)
VALUES ('123','apel',5,1000,'qw1');

INSERT INTO supplier(id_sup, nama, alamat)
VALUES ('qw1','alana','jombang');

INSERT INTO kasir(id_kasir, nama_kasir, telepon)
VALUES ('90q','opan','0876');

INSERT INTO transaksi(no_transaksi, tanggal, total_bayar, id_pembeli, id_kasir)
VALUES ('567','2017-02-01',1000,'p35','90q');

INSERT INTO detail_transaksi(id_detail, no_transaksi, id_produk, jumlah)
VALUES ('78A','567','123',10);

SELECT nama_pembeli, telepon FROM pembeli;

SELECT * FROM pembeli;

DELETE FROM pembeli; #menghapus semua isi record dari sebuah tabel pembeli

DELETE FROM pembeli WHERE jenis_kelamin = 'L'; #menghapus semua isi record yang berjenis kelamin L

DELETE FROM pembeli WHERE id_pembeli = 'p90'; #menghapus satu isi data dengan menggunakan primary key

UPDATE pembeli SET alamat ='ampenan'; #update semua record
UPDATE pembeli SET alamat ='Ampenan' WHERE jenis_kelamin = 'L'; #update record secara kolektif
UPDATE pembeli SET alamat = 'Ampenan' WHERE id_pembeli = 'p39'; #update hanya satu data menggunakan primary key





