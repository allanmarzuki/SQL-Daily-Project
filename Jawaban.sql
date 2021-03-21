-- NIM

-- 1
SELECT * FROM dosen WHERE jenis_kelamin = 'pria'; 

-- 2
SELECT nip, nama_dosen FROM dosen;

-- 3 

SELECT dosen.nama_dosen FROM dosen LEFT JOIN pengampuan ON dosen.`nip` = pengampuan.`nip` WHERE pengampuan.`nip` IS NULL;

-- 4
SELECT dosen.nip, dosen.nama_dosen, matakuliah FROM dosen JOIN pengampuan ON dosen.`nip` = pengampuan.`nip`;

-- 5 
SELECT SUM(pengampuan.`sks`) FROM pengampuan JOIN dosen WHERE dosen.`nama_dosen` = 'asri';

-- 6
SELECT COUNT(pengampuan.`matakuliah`) FROM pengampuan JOIN dosen WHERE dosen.`nama_dosen` = 'asri';

-- 7
SELECT dosen.`nama_dosen`, SUM(pengampuan.`sks`) FROM dosen JOIN pengampuan ON dosen.`nip` = pengampuan.`nip` GROUP BY dosen.`nama_dosen`;

-- 8 

SELECT tb.nama_dosen FROM 
(SELECT nama_dosen, SUM(pengampuan.`sks`) AS total_sks FROM dosen 
JOIN pengampuan ON dosen.`nip` = pengampuan.`nip` 
GROUP BY dosen.`nama_dosen`) AS tb 
WHERE total_sks = (SELECT MAX(total_sks) FROM (SELECT nama_dosen, SUM(pengampuan.`sks`) AS total_sks FROM dosen 
JOIN pengampuan ON dosen.`nip` = pengampuan.`nip` 
GROUP BY dosen.`nama_dosen`) AS tb);

-- 9
SELECT dosen.`nama_dosen`, dosen.`alamat` FROM pengampuan JOIN dosen WHERE pengampuan.`matakuliah` = 'PKN';

-- 10

SELECT dosen.`nama_dosen` FROM dosen WHERE dosen.`kota` LIKE '%Jakarta%';