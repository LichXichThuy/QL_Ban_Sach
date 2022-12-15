create database QL_Ban_Sach;
use  QL_Ban_Sach;

create table khach_hang(
	ma_khach_hang int primary key auto_increment,
    ho_ten varchar(50),
    ngay_sinh date,
    gioi_tinh boolean,
    dien_thoai bigint,
    dia_chi varchar(50),
    email varchar(30),
    mat_khau varchar(30),
    tai_khoan varchar(30)
);

create table don_hang(
	ma_don_hang int primary key auto_increment,
    da_thanh_toan boolean,
    tinh_trang_giao_hang boolean,
    ngay_dat date,
    ngay_giao date,
    ma_khach_hang int,
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang)
);

create table chu_de(
	ma_chu_de int primary key auto_increment,
    ten_chu_de varchar(50)
);

create table nha_xuat_ban(
	ma_nha_san_xuat int primary key auto_increment,
    ten_nha_san_xuat varchar(50),
    dia_chi varchar(50),
    dien_thoai bigint
);

create table sach(
	ma_sach int primary key auto_increment,
    ten_sach varchar(50),
    gia_ban float,
    mo_ta text,
    anh_bia text,
    ngay_cap_nhat date,
    so_luong_ton int,
    ma_chu_de int,
    ma_nha_san_xuat int,
    foreign key (ma_chu_de) references chu_de(ma_chu_de),
    foreign key (ma_nha_san_xuat) references nha_xuat_ban(ma_nha_san_xuat)
);
create table tac_gia(
	ma_tac_gia int primary key auto_increment,
    ten_tac_gia varchar(50),
    dia_chi varchar(50),
    tieu_su text,
    dien_thoai bigint
);

create table don_hang_sach(
	ma_don_hang int,
    ma_sach int,
    so_luong int,
    don_gia float,
    primary key (ma_don_hang, ma_sach),
    foreign key (ma_don_hang) references don_hang(ma_don_hang),
    foreign key (ma_sach) references sach(ma_sach)
);

create table thuc_hien(
	ma_sach int,
    ma_tac_gia int,
    vi_tri varchar(50),
    vai_tro varchar(30),
    primary key (ma_sach, ma_tac_gia),
    foreign key (ma_sach) references sach(ma_sach),
    foreign key (ma_tac_gia) references tac_gia(ma_tac_gia)
);