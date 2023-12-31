create database furama_management;
use furama_management;

-- tạo bảng vi_tri
create table vi_tri(
	ma_vi_tri int auto_increment primary key,
    ten_vi_tri varchar(45)
);

-- tạo bảng trinh_do
create table trinh_do(
	ma_trinh_do int auto_increment primary key,
    ten_trinh_do varchar(45)
);

-- tạo bảng bo_phan
create table bo_phan(
	ma_bo_phan int auto_increment primary key,
    ten_bo_phan varchar(45)
);

-- tạo bảng nhan_vien
create table nhan_vien(
	ma_nhan_vien int auto_increment primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

-- tạo bảng loai_khach
create table loai_khach(
	ma_loai_khach int auto_increment primary key,
    ten_loai_khach varchar(45)
);

-- tạo bảng khach_hang
create table khach_hang(
	ma_khach_hang int auto_increment primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
	ma_loai_khach int,
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

-- tạo bảng loai_dich_vu
create table loai_dich_vu(
	ma_loai_dich_vu int auto_increment primary key,
    ten_loai_dich_vu varchar(45)
);

-- tạo bảng kieu_thue
create table kieu_thue(
	ma_kieu_thue int auto_increment primary key,
    ten_kieu_thue varchar(45)
);

-- tạo bảng dich_vu
create table dich_vu(
	ma_dich_vu int auto_increment primary key,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

-- tạo bảng dich_vu_di_kem
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int auto_increment primary key,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(10),
    trang_thai varchar(45)
);

-- tạo bảng hop_dong
create table hop_dong(
	ma_hop_dong int auto_increment primary key,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

-- tạo bảng hop_dong_chi_tiet
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int auto_increment primary key,
    so_luong int,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
