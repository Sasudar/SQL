-- buat database baru
create database dbdarren_SI4Z;


-- hapus database 
drop database dbdarren_si4z;

-- aktifkan databasenya
use dbdarren_si4z;

-- buat table baru : anggota
create table anggota
(id_anggota char(10) not null primary key,
nama varchar(100),
alamat varchar (255),
no_telp varchar(100))engine = InnoDB;

-- buat table pustakawan 
create table pustakawan 
(id_pustakawan char(10) not null primary key,
nama varchar(100),
alamat varchar(100),
no_telp varchar(100)) engine=InnoDB;

-- buat table penerbit
create table penerbit
(id_penerbit char (10) not null primary key,
Nama_penerbit varchar(100),
alamat varchar (100),
no_telp varchar(100))engine=InnoDB;

-- buat table buku
create table buku
(id_buku char(10) not null primary key, 
id_penerbit char(10), -- foreign key must exist in line
judul varchar(155),
tahun_terbit year,
foreign key (id_penerbit) references penerbit(id_penerbit))engine=InnoDB;

-- buat table penulis 
create table penulis
(id_penulis char(10) not null primary key,
nama varchar(100),
alamat varchar(100),
bidang_ilmu varchar(100))engine=InnoDB;

-- buat table relasi penulisan
create table penulisan
(id_penulis char(10),
id_buku char(10),
foreign key (id_penulis) references penulis(id_penulis),
foreign key (id_buku) references buku(id_buku))engine=InnoDB;

-- buat table peminjaman
create table peminjaman
(id_peminjaman char(10) not null primary key,
id_anggota char(10),
id_pustakawan char (10),
tanggal_pinjam date,
lama_pinjam int,
tanggal_kembali date, -- perintah hapus kolom
foreign key (id_anggota) references anggota(id_anggota),
foreign key (id_pustakawan ) references pustakawan(id_pustakawan))engine=InnoDB;


-- buat table detail_peminjaman
create table detail_peminjaman
(id_peminjaman char(10),
id_buku char(10), -- jika boleh pinjam buku yang sama >1 tambahkan kolom jumlah
foreign key (id_buku) references buku(id_buku),
foreign key (id_peminjaman) references peminjaman(id_peminjaman))engine=InnoDB;

-- hapus kolom tanggal_kembali di peminjaman
alter table peminjaman drop column tanggal_kembali;




