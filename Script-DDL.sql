create table armada (
	plat varchar not null primary key,
	kelas varchar not null,
	kapasitas int not null,
	bea_sarana int not null
)

insert into armada(plat,kelas,kapasitas,bea_sarana) values 
('B2601VPQ','VIP',30,1200000),
('B2602VPQ','AC Biasa',48,800000),
('B2603VPQ','AC Biasa',48,800000)

select * from armada

create table perjalanan (
	id_perjalanan int not null primary key,
	bea_prasarana int not null,
	rute varchar not null
)

insert into perjalanan (id_perjalanan,bea_prasarana,rute) values
(1,2200000,'JKT-BWI'),
(2,2200000,'BWI-JKT'),
(3,1200000,'SB-BWI'),
(4,1200000,'BWI-SB')

select  * from perjalanan

create table penumpang (
	penumpang_id int not null primary key,
	nama_penumpang varchar not null,
	tanggal_lahir date not null,
	jenis_kelamin varchar not null,
	nomor_telefon varchar not null,
	kabupaten varchar not null,
	kecamatan varchar not null
)

insert into penumpang(penumpang_id,nama_penumpang,tanggal_lahir,jenis_kelamin,nomor_telefon,kabupaten,kecamatan) values
(212410101001,'Ardi Buyamin','12-03-1999','Pria','08123456789','Lumajang','Pasirian'),
(212410101002,'Masud Shidiq','08-11-1972','Pria','08123456789','Jember','Patrang'),
(212410101003,'Yusri Abdulah','01-05-1992','Pria','08123456789','Banyuwangi','Kalibaru')

select * from penumpang

create table sopir (
	id_sopir VARCHAR NOT NULL PRIMARY KEY,
	nama varchar not null,
	telefon varchar not null,
	desa varchar not null,
	kecamatan varchar not null,
	kabupaten varchar not null,
	provinsi varchar not null,
	armada_plat varchar not null references armada (plat)
)

insert into sopir(id_sopir,nama,telefon,desa,kecamatan,kabupaten,provinsi,armada_plat) values
('SO001','Heri Wirawan','08123456789','Sumberasih','Bangsal','Jember','Jawa Timur','B2601VPQ'),
('SO002','Miswari','08123456789','Sumbergempol','Rambipuji','Jember','Jawa Timur','B2602VPQ'),
('SO003','Handoko','08123456789','Sumberasih','Bangsal','Jember','Jawa Timur','B2603VPQ')

select * from sopir

create table detail_perjalanan (
	id_waktu VARCHAR NOT NULL PRIMARY KEY,
	waktu_berangkat TIME NOT NULL,
	waktu_tiba TIME NOT NULL,
	armada_plat VARCHAR NOT NULL references armada(plat),
	id_rute int NOT NULL references perjalanan(id_perjalanan)
)
insert into detail_perjalanan(id_waktu,waktu_berangkat,waktu_tiba,armada_plat,id_rute) values
('T001','04:30','23:50','B2601VPQ',1),
('T002','04:30','23:50','B2602VPQ',2),
('T003','05:00','22:00','B2603VPQ',3)

select * from detail_perjalanan

create table tiket (
	id_tiket int not null primary key,
	perjalanan_id_rute int not null references perjalanan(id_perjalanan),
	penumpang_penumpang_id int not null references penumpang(penumpang_id)
)

insert into tiket (id_tiket,perjalanan_id_rute,penumpang_penumpang_id) values
(001,1,212410101001),
(002,1,212410101002),
(003,1,212410101003)

select * from tiket

create table metode_transaksi (
	id_metode varchar not null primary key,
	metode varchar not null,
	no_rekening varchar,
	nama_depan varchar,
	nama_belakang varchar,
	nomor_akun varchar
)

insert into metode_transaksi(id_metode,metode,no_rekening,nama_depan,nama_belakang,nomor_akun) values
('MT1','Transfer BRI','000102034567','Ardi','Buyamin',''),
('MT2','Ewallet Dana','','Andini','Difa','08123456789'),
('MT3','Transfer BRI','000456743327','Liana','Putri','')

select * from metode_transaksi

	
create table transaksi(
	transaksi_id int not null primary key,
	tanggal date not null,
	status varchar not null,
	detail_perjalanan_id_waktu varchar not null references detail_perjalanan(id_waktu),
	metode_transaksi_id_metode varchar not null references metode_transaksi(id_metode)
)

insert into transaksi(transaksi_id,tanggal,status,detail_perjalanan_id_waktu,metode_transaksi_id_metode) values
(15230912,'30-04-2022','Berhasil','T001','MT1'),
(15230910,'28-04-2022','Berhasil','T002','MT1'),
(15230924,'30-04-2022','Berhasil','T003', 'MT2')
select * from transaksi