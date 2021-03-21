CREATE DATABASE POS;
USE POS;

CREATE TABLE pembeli(
	id_pembeli VARCHAR(20) NOT NULL PRIMARY KEY,
	nama_pembeli VARCHAR(30) NOT NULL,
	telepon VARCHAR(15) NOT NULL,
	alamat VARCHAR(100) NOT NULL
	);
	
CREATE TABLE kasir(
	id_kasir VARCHAR(20) NOT NULL PRIMARY KEY,
	nama_kasir VARCHAR(30) NOT NULL,
	telepon VARCHAR(15)
	);
	
CREATE TABLE produk(
	id_produk VARCHAR(20) NOT NULL PRIMARY KEY,
	nama_produk VARCHAR(30) NOT NULL,
	stok INT,
	harga INT NOT NULL,
	id_sup VARCHAR(20) NOT NULL 
	);

CREATE TABLE supplier(
	id_sup VARCHAR(20) NOT NULL PRIMARY KEY,
	nama VARCHAR(30) NOT NULL,
	alamat VARCHAR(100) NOT NULL
	);
	
CREATE TABLE transaksi(
	no_transaksi VARCHAR(20) NOT NULL PRIMARY KEY,
	tanggal DATE,
	total_bayar INT NOT NULL,
	id_pembeli VARCHAR(20) NOT NULL,
	id_kasir VARCHAR(20) NOT NULL
	);
	
CREATE TABLE detail_transaksi(
	id_detail VARCHAR(20) NOT NULL PRIMARY KEY,
	no_transaksi VARCHAR(20) NOT NULL ,
	id_produk VARCHAR(20) NOT NULL,
	jumlah INT
);