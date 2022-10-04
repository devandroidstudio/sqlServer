/*
Created		9/9/2022
Modified		9/19/2022
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/

create database QLTHT
go
use QLTHT
go



Create table [KHUVUC]
(
	[MAKV] Varchar(20) NOT NULL, UNIQUE ([MAKV]),
	[TENVC] Nvarchar(50) NOT NULL,
Primary Key ([MAKV])
) 
go

Create table [KHACHHANG]
(
	[MAKH] Varchar(20) NOT NULL, UNIQUE ([MAKH]),
	[TENKH] Nvarchar(50) NOT NULL,
	[SDT] Varchar(10) NOT NULL Check (len(SDT) = 10),
Primary Key ([MAKH])
) 
go

Create table [THETV]
(
	[ID] Varchar(20) NOT NULL, UNIQUE ([ID]),
	[MAKH] Varchar(20) NOT NULL,
	[NGAYCAP] date Default FORMAT(getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYCAP >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[NGAYHETHAN] date NULL,
	[MALTK] Varchar(10) NOT NULL,
Primary Key ([ID],[MAKH])
) 
go

Create table [CHINHANH]
(
	[MASALON] Varchar(10) NOT NULL, UNIQUE ([MASALON]),
	[DIACHI] Nvarchar(50) NOT NULL,
	[MAKV] Varchar(20) NOT NULL,
	[HOTLINE] Tinyint NULL,
Primary Key ([MASALON])
) 
go

Create table [DICHVU]
(
	[MADV] Varchar(10) NOT NULL, UNIQUE ([MADV]),
	[TENDV] Nvarchar(20) NOT NULL,
	[MOTA] Ntext NOT NULL,
	[GIALEVACUOITUAN] Decimal(10,1) NOT NULL Check (GIALEVACUOITUAN > 0),
	[GIANGAYTHUONG] Decimal(10,1) NOT NULL Check (GIANGAYTHUONG > 0),
Primary Key ([MADV])
) 
go

Create table [LOAITAIKHOAN]
(
	[MALTK] Varchar(10) NOT NULL, UNIQUE ([MALTK]),
	[TENLTK] Nvarchar(50) NOT NULL,
Primary Key ([MALTK])
) 
go

Create table [NHANVIEN]
(
	[MANV] Varchar(10) NOT NULL, UNIQUE ([MANV]),
	[TENNV] Nvarchar(50) NOT NULL,
	[NAMSINH] Varchar(15) NOT NULL,
	[GIOITINH] Varchar(10) NOT NULL,
	[DIACHI] Nvarchar(50) NULL,
	[MACV] Varchar(10) NOT NULL,
	[MASALON] Varchar(10) NOT NULL,
	[NGAYVAOLAM] date NOT NULL,
Primary Key ([MANV])
) 
go

Create table [SANPHAM]
(
	[MASP] Varchar(10) NOT NULL, UNIQUE ([MASP]),
	[MADM] Varchar(10) NOT NULL,
	[TENSP] Nvarchar(50) NOT NULL,
	[GIA] Numeric(10,2) Default 0 NOT NULL,
	[MOTA] Ntext NOT NULL,
	[GIAMGIA] Tinyint Default 0 NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL,
	[MATH] Varchar(10) NOT NULL,
Primary Key ([MASP])
) 
go

Create table [DANHMUCCHAMSOC]
(
	[MADM] Varchar(10) NOT NULL, UNIQUE ([MADM]),
	[TENDM] Nvarchar(50) NOT NULL,
	[MADML] Varchar(10) NOT NULL,
Primary Key ([MADM])
) 
go

Create table [PHIEUDATLICH]
(
	[SOPDL] Varchar(10) NOT NULL, UNIQUE ([SOPDL]),
	[NGAYDL] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYDL >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[GIODL] date Default FORMAT (getdate(), 'hh:mm') NOT NULL Check (GIODL > FORMAT (getdate(), 'hh:mm')),
	[CHUTHICH] Ntext NULL,
	[MANV] Varchar(10) NOT NULL,
	[MAKH] Varchar(20) NOT NULL,
	[MASALON] Varchar(10) NOT NULL,
Primary Key ([SOPDL])
) 
go

Create table [CHITIETDICHVU]
(
	[MADV] Varchar(10) NOT NULL,
	[SOPDL] Varchar(10) NOT NULL,
	[SOLUONG] Tinyint NOT NULL Check (SOLUONG >=1),
Primary Key ([MADV],[SOPDL])
) 
go

Create table [HOADON]
(
	[SOHD] Varchar(10) NOT NULL, UNIQUE ([SOHD]),
	[NGAYTHANHTOAN] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYTHANHTOAN >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[TONG_TIEN] Numeric(10,2) NOT NULL,
	[MAKM] Varchar(10) NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL Check (TRANGTHAI IN (1,0)),
	[MAPTTT] Varchar(100) NOT NULL,
Primary Key ([SOHD])
) 
go

Create table [KHUYENMAI]
(
	[MAKM] Varchar(10) NOT NULL, UNIQUE ([MAKM]),
	[NOIDUNG] Ntext NOT NULL,
	[DIEUKIEN] Ntext NOT NULL,
Primary Key ([MAKM])
) 
go

Create table [PHIEUSUDUNGDICHVU]
(
	[SOPSDDV] Varchar(10) NOT NULL, UNIQUE ([SOPSDDV]),
	[NGAYSD] date NOT NULL,
	[SOHD] Varchar(10) NOT NULL,
	[MADV] Varchar(10) NOT NULL,
	[SOPDL] Varchar(10) NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL Check (TRANGTHAI IN (1,0)),
	[MALTK] Varchar(10) NOT NULL,
Primary Key ([SOPSDDV])
) 
go

Create table [PHIEUNHAPSP]
(
	[SOPHIEU] Varchar(10) NOT NULL, UNIQUE ([SOPHIEU]),
	[NGAYNHAP] date NOT NULL,
	[MANV] Varchar(10) NOT NULL,
	[MANCC] Varchar(10) NOT NULL,
	[MAKHO] Varchar(10) NOT NULL,
Primary Key ([SOPHIEU])
) 
go

Create table [CHITIETPN]
(
	[SOPHIEU] Varchar(10) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOLUONG] Tinyint NOT NULL Check (SOLUONG >= 1),
	[DONGGIANHAP] Numeric(10,2) NOT NULL Check (DONGGIANHAP > 0),
Primary Key ([SOPHIEU],[MASP])
) 
go

Create table [PHIEUMUAHANG]
(
	[SOPHIEUMH] Varchar(10) NOT NULL, UNIQUE ([SOPHIEUMH]),
	[MANV] Varchar(10) NOT NULL,
	[MAKH] Varchar(20) NOT NULL,
	[NGAYLAP] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYLAP >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[SOHD] Varchar(10) NOT NULL,
Primary Key ([SOPHIEUMH])
) 
go

Create table [CHITIETPHM]
(
	[SOPHIEUMH] Varchar(10) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOLUONG] Tinyint NOT NULL Check (SOLUONG >= 1),
Primary Key ([SOPHIEUMH],[MASP])
) 
go

Create table [NHANCUNGCAP]
(
	[MANCC] Varchar(10) NOT NULL, UNIQUE ([MANCC]),
	[TENNCC] Nvarchar(50) NOT NULL,
	[DIACHI] Ntext NOT NULL,
	[EMAIL] Text NULL,
	[SDTNCC] Varchar(10) NULL Check (len(SDTNCC) = 10),
Primary Key ([MANCC])
) 
go

Create table [CHUCVU]
(
	[MACV] Varchar(10) NOT NULL, UNIQUE ([MACV]),
	[TENCV] Nvarchar(50) NOT NULL,
	[HESOLUONG] Decimal(2,1) Default 1 NOT NULL Check (HESOLUONG > 0),
Primary Key ([MACV])
) 
go

Create table [LOAIDMCS]
(
	[MADML] Varchar(10) NOT NULL,
	[TENDML] Nvarchar(50) NOT NULL,
Primary Key ([MADML])
) 
go

Create table [BINHLUAN]
(
	[MABL] Varchar(10) NOT NULL, UNIQUE ([MABL]),
	[DANHGIA] Decimal(5,1) Default 0 NOT NULL Check (DANHGIA <= 5),
	[NOIDUNG] Ntext NOT NULL,
	[MASP] Varchar(10) NOT NULL,
Primary Key ([MABL])
) 
go

Create table [SUKIEN]
(
	[MASK] Varchar(10) NOT NULL, UNIQUE ([MASK]),
	[TENSUKIEN] Nvarchar(50) NOT NULL,
	[NGAYBATDAU] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYBATDAU >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[MASP] Varchar(10) NOT NULL,
	[NOIDUNGSK] Ntext NOT NULL,
	[MALOAI] Varchar(10) NOT NULL,
	[MADV] Varchar(10) NOT NULL,
Primary Key ([MASK])
) 
go

Create table [LOAIPPTT]
(
	[MALOAI] Varbinary(10) NOT NULL, UNIQUE ([MALOAI]),
	[TENLOAI] Nvarchar(50) NOT NULL,
Primary Key ([MALOAI])
) 
go

Create table [PHUONGTHUCTHANHTOAN]
(
	[MAPTTT] Varchar(100) NOT NULL, UNIQUE ([MAPTTT]),
	[TENPTTT] Nvarchar(50) NOT NULL,
	[MALOAI] Varbinary(10) NOT NULL,
	[TIENTE] Varchar(100) NOT NULL,
Primary Key ([MAPTTT])
) 
go

Create table [LICHSUDAT]
(
	[MALSD] Varchar(10) NOT NULL, UNIQUE ([MALSD]),
	[NGAYDADAT] date NOT NULL,
	[Stylist] Nvarchar(50) NULL,
	[Skinner] Nvarchar(50) NULL,
	[ANH] Char(1) NULL,
	[SOHD] Varchar(10) NOT NULL,
Primary Key ([MALSD])
) 
go

Create table [PHIEUGIAOHANG]
(
	[MAPHIEU] Varchar(10) NOT NULL, UNIQUE ([MAPHIEU]),
	[SOPHIEUMH] Varchar(10) NOT NULL,
	[MAHANGVC] Varchar(10) NOT NULL,
	[PHIVANCHUYEN] Decimal(10,1) NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL,
	[NGAYVANCHUYEN] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYVANCHUYEN >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[DIACHI] Nvarchar(100) NOT NULL,
	[SOHD] Varchar(10) NOT NULL,
Primary Key ([MAPHIEU],[SOPHIEUMH],[SOHD])
) 
go

Create table [HANGVANCHUYEN]
(
	[MAHANGVC] Varchar(10) NOT NULL, UNIQUE ([MAHANGVC]),
	[TENHANGVC] Nvarchar(100) NOT NULL,
	[DIACHI] Nvarchar(100) NOT NULL,
	[HOTLINE] Tinyint NULL Check (HOTLINE = 10),
	[MAKV] Varchar(10) NOT NULL,
Primary Key ([MAHANGVC])
) 
go

Create table [KHUVUCVANCHUYEN]
(
	[MAKV] Varchar(10) NOT NULL, UNIQUE ([MAKV]),
	[TENKV] Nvarchar(100) NOT NULL,
Primary Key ([MAKV])
) 
go

Create table [LICHSUDONHANG]
(
	[MALS] Varchar(10) NOT NULL, UNIQUE ([MALS]),
	[TRANGTHAIDH] Nvarchar(100) NOT NULL,
	[NGAYCAPNHAT] date NOT NULL,
	[NOIDUNG] Nvarchar(100) NULL,
	[SOHD] Varchar(10) NOT NULL,
Primary Key ([MALS])
) 
go

Create table [THUONGHIEU]
(
	[MATH] Varchar(10) NOT NULL, UNIQUE ([MATH]),
	[TENTH] Nvarchar(100) NOT NULL,
Primary Key ([MATH])
) 
go

Create table [BAIVIET]
(
	[MAKPKT] Varchar(10) NOT NULL, UNIQUE ([MAKPKT]),
	[TIEUDE] Nvarchar(100) NOT NULL,
	[NOIDUNG] Ntext NOT NULL,
	[ANH] Varbinary(500) NULL,
	[MALOAI] Varchar(10) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[MADV] Varchar(10) NOT NULL,
	[NGAYVIETBAI] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYVIETBAI >= FORMAT (getdate(), 'dd-MM-yyyy')),
Primary Key ([MAKPKT])
) 
go

Create table [LOAIBAIVIET]
(
	[MALOAI] Varchar(10) NOT NULL, UNIQUE ([MALOAI]),
	[TENLOAI] Nvarchar(50) NOT NULL,
Primary Key ([MALOAI])
) 
go

Create table [PHUCAP]
(
	[MAPC] Varchar(10) NOT NULL, UNIQUE ([MAPC]),
	[TENPC] Nvarchar(100) NOT NULL,
	[SOTIENPHUCAP] Decimal(10,1) NOT NULL Check (SOTIENPHUCAP  > 0),
Primary Key ([MAPC])
) 
go

Create table [LUONG]
(
	[MALUONG] Varchar(10) NOT NULL, UNIQUE ([MALUONG]),
	[MUCLUONGCOBAN] Decimal(10,1) NOT NULL Check (MUCLUONGCOBAN > 0),
	[NGAYNHANLUONG] date NOT NULL,
	[MANV] Varchar(10) NOT NULL,
Primary Key ([MALUONG])
) 
go

Create table [CHITIETLUONG]
(
	[MALUONG] Varchar(10) NOT NULL,
	[MAPC] Varchar(10) NOT NULL,
Primary Key ([MALUONG],[MAPC])
) 
go

Create table [BANGCHAMCONG]
(
	[MABCC] Varchar(50) NOT NULL, UNIQUE ([MABCC]),
	[TUNGAY] date NOT NULL,
	[DENNGAY] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (DENNGAY <= FORMAT (getdate(), 'dd-MM-yyyy')),
Primary Key ([MABCC])
) 
go

Create table [CHITIETBANGCHAMCONG]
(
	[MANV] Varchar(10) NOT NULL,
	[MABCC] Varchar(50) NOT NULL,
	[SOGIO] Tinyint NOT NULL Check (SOGIO > 0),
Primary Key ([MANV],[MABCC])
) 
go

Create table [KHO]
(
	[MAKHO] Varchar(10) NOT NULL, UNIQUE ([MAKHO]),
	[TENKHO] Nvarchar(100) NOT NULL,
	[SDT] Varchar(10) NULL Check (len(SDT) = 10),
	[MADIADIEM] Varchar(10) NOT NULL,
	[MANV] Varchar(10) NOT NULL,
Primary Key ([MAKHO])
) 
go

Create table [PHIEUXUATHANG]
(
	[SOPHIEUXUAT] Varchar(10) NOT NULL, UNIQUE ([SOPHIEUXUAT]),
	[NGAYLAPPX] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYLAPPX >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[MANV] Varchar(10) NOT NULL,
	[MAKHO] Varchar(10) NOT NULL,
Primary Key ([SOPHIEUXUAT])
) 
go

Create table [CHITIETPHIEUXUAT]
(
	[SOPHIEUXUAT] Varchar(10) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOLUONG] Tinyint NOT NULL Check (SOLUONG >= 1),
Primary Key ([SOPHIEUXUAT],[MASP])
) 
go

Create table [DIADIEM]
(
	[MADIADIEM] Varchar(10) NOT NULL, UNIQUE ([MADIADIEM]),
	[TENDIADIEM] Nvarchar(100) NOT NULL,
	[DIACHIDIADIEM] Nvarchar(100) NOT NULL,
	[MANV] Varchar(10) NOT NULL,
Primary Key ([MADIADIEM],[MANV])
) 
go

Create table [LOAISUKIEN]
(
	[MALOAI] Varchar(10) NOT NULL, UNIQUE ([MALOAI]),
	[TENLOAISK] Nvarchar(100) NOT NULL,
Primary Key ([MALOAI])
) 
go


Alter table [CHINHANH] add  foreign key([MAKV]) references [KHUVUC] ([MAKV])  on update no action on delete no action 
go
Alter table [THETV] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH])  on update no action on delete no action 
go
Alter table [PHIEUDATLICH] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH])  on update no action on delete no action 
go
Alter table [PHIEUMUAHANG] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH])  on update no action on delete no action 
go
Alter table [PHIEUDATLICH] add  foreign key([MASALON]) references [CHINHANH] ([MASALON])  on update no action on delete no action 
go
Alter table [NHANVIEN] add  foreign key([MASALON]) references [CHINHANH] ([MASALON])  on update no action on delete no action 
go
Alter table [CHITIETDICHVU] add  foreign key([MADV]) references [DICHVU] ([MADV])  on update no action on delete no action 
go
Alter table [SUKIEN] add  foreign key([MADV]) references [DICHVU] ([MADV])  on update no action on delete no action 
go
Alter table [BAIVIET] add  foreign key([MADV]) references [DICHVU] ([MADV])  on update no action on delete no action 
go
Alter table [THETV] add  foreign key([MALTK]) references [LOAITAIKHOAN] ([MALTK])  on update no action on delete no action 
go
Alter table [PHIEUSUDUNGDICHVU] add  foreign key([MALTK]) references [LOAITAIKHOAN] ([MALTK])  on update no action on delete no action 
go
Alter table [PHIEUDATLICH] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [PHIEUNHAPSP] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [LUONG] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [CHITIETBANGCHAMCONG] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [PHIEUXUATHANG] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [DIADIEM] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [CHITIETPN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [CHITIETPHM] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [BINHLUAN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [SUKIEN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [CHITIETPHIEUXUAT] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [BAIVIET] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [SANPHAM] add  foreign key([MADM]) references [DANHMUCCHAMSOC] ([MADM])  on update no action on delete no action 
go
Alter table [CHITIETDICHVU] add  foreign key([SOPDL]) references [PHIEUDATLICH] ([SOPDL])  on update no action on delete no action 
go
Alter table [PHIEUSUDUNGDICHVU] add  foreign key([MADV],[SOPDL]) references [CHITIETDICHVU] ([MADV],[SOPDL])  on update no action on delete no action 
go
Alter table [PHIEUSUDUNGDICHVU] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [PHIEUMUAHANG] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [LICHSUDAT] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [PHIEUGIAOHANG] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [LICHSUDONHANG] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [HOADON] add  foreign key([MAKM]) references [KHUYENMAI] ([MAKM])  on update no action on delete no action 
go
Alter table [CHITIETPN] add  foreign key([SOPHIEU]) references [PHIEUNHAPSP] ([SOPHIEU])  on update no action on delete no action 
go
Alter table [CHITIETPHM] add  foreign key([SOPHIEUMH]) references [PHIEUMUAHANG] ([SOPHIEUMH])  on update no action on delete no action 
go
Alter table [PHIEUGIAOHANG] add  foreign key([SOPHIEUMH]) references [PHIEUMUAHANG] ([SOPHIEUMH])  on update no action on delete no action 
go
Alter table [PHIEUNHAPSP] add  foreign key([MANCC]) references [NHANCUNGCAP] ([MANCC])  on update no action on delete no action 
go
Alter table [NHANVIEN] add  foreign key([MACV]) references [CHUCVU] ([MACV])  on update no action on delete no action 
go
Alter table [DANHMUCCHAMSOC] add  foreign key([MADML]) references [LOAIDMCS] ([MADML])  on update no action on delete no action 
go
Alter table [PHUONGTHUCTHANHTOAN] add  foreign key([MALOAI]) references [LOAIPPTT] ([MALOAI])  on update no action on delete no action 
go
Alter table [HOADON] add  foreign key([MAPTTT]) references [PHUONGTHUCTHANHTOAN] ([MAPTTT])  on update no action on delete no action 
go
Alter table [PHIEUGIAOHANG] add  foreign key([MAHANGVC]) references [HANGVANCHUYEN] ([MAHANGVC])  on update no action on delete no action 
go
Alter table [HANGVANCHUYEN] add  foreign key([MAKV]) references [KHUVUCVANCHUYEN] ([MAKV])  on update no action on delete no action 
go
Alter table [SANPHAM] add  foreign key([MATH]) references [THUONGHIEU] ([MATH])  on update no action on delete no action 
go
Alter table [BAIVIET] add  foreign key([MALOAI]) references [LOAIBAIVIET] ([MALOAI])  on update no action on delete no action 
go
Alter table [CHITIETLUONG] add  foreign key([MAPC]) references [PHUCAP] ([MAPC])  on update no action on delete no action 
go
Alter table [CHITIETLUONG] add  foreign key([MALUONG]) references [LUONG] ([MALUONG])  on update no action on delete no action 
go
Alter table [CHITIETBANGCHAMCONG] add  foreign key([MABCC]) references [BANGCHAMCONG] ([MABCC])  on update no action on delete no action 
go
Alter table [PHIEUNHAPSP] add  foreign key([MAKHO]) references [KHO] ([MAKHO])  on update no action on delete no action 
go
Alter table [PHIEUXUATHANG] add  foreign key([MAKHO]) references [KHO] ([MAKHO])  on update no action on delete no action 
go
Alter table [CHITIETPHIEUXUAT] add  foreign key([SOPHIEUXUAT]) references [PHIEUXUATHANG] ([SOPHIEUXUAT])  on update no action on delete no action 
go
Alter table [KHO] add  foreign key([MADIADIEM],[MANV]) references [DIADIEM] ([MADIADIEM],[MANV])  on update no action on delete no action 
go
Alter table [SUKIEN] add  foreign key([MALOAI]) references [LOAISUKIEN] ([MALOAI])  on update no action on delete no action 
go


insert into LOAITAIKHOAN values('LTKTC', N'Tiêu chuẩn')
insert into LOAITAIKHOAN values('LTKBS', N'Back & Silver')
insert into LOAITAIKHOAN values('LTKG', N'Gold')
go

insert into KHACHHANG values('KH01',N'Nguyễn văn a', '0971232329')
insert into KHACHHANG values('KH02',N'Nguyễn văn b', '0127809234')
insert into KHACHHANG values('KH03',N'Nguyễn văn c', '0453345342')
go
insert into THETV(ID,MAKH,MALTK) values('TTV01','KH01','LTKG')
insert into THETV(ID,MAKH,MALTK) values('TTV02','KH02','LTKTC')
insert into THETV(ID,MAKH,MALTK) values('TTV03','KH03','LTKBS')

go

insert into DICHVU values('DV01',N'ShineCombo cắt gội 10 bước',N'Bước 1:Trải nghiệm bắt đầu khi bạn được đón tiếp chu đáo tận cửa bởi Quản lý cửa hàng (hoặc lễ tân trưởng) của 30Shine.Bước 2:Bạn sẽ được thưởng thức miễn phí món passion fruit mocktail đặc biệt, ngồi nghe nhạc trong không gian chờ riêng biệt để đợi đến lịch hẹn đã đặt trước.Bước 3:Sau đó, skinner xinh đẹp của 30Shine sẽ mời bạn nằm xuống giường massage đặc biệt (massage cột sống, chống đau lưng) để bắt đầu rửa mặt, massage, gội đầu đầy thư giãn. Bàn tay khéo léo của Skinner sẽ giúp anh quên đi mọi căng thẳng ngay từ những động tác khai huyệt điều hòa đầu tiên.Bước 4:Massage luôn là phần thưởng tuyệt vời sau những nỗ lực không ngừng của bạn. Thả hồn với từng huyệt đạo trên khuôn mặt được chăm sóc bởi Skinner, nghe tiếng nước chảy róc rách bên tai với màn rửa tai bọt sạch sâu sảng khoái.Bước 5:Đôi mắt làm việc nhiều trên điện thoại, máy tính cũng trở nên êm dịu hơn khi được xối nước ấm thác đổ. Cuối cùng, cổ vai gáy sẽ được chữa mỏi hoàn toàn với bước kéo khăn giãn cơ.Bước 6:Bạn cũng sẽ được chăm sóc da kỹ lưỡng bởi những loại mỹ phẩm và thiết bị tốt nhất của 30Shine, bao gồm 2 trải nghiệm tuyệt vời Rửa mặt – massage tinh chất nha đam thẩm thấu và Hút mụn – phun nước hoa hồng công nghệ cao. Tất cả nhằm giúp bạn có một làn da sáng, mịn hơn. Skinner sẽ hoàn tất việc chăm sóc cho bạn sau khi chắc chắn từng chiếc móng tay đã được cắt dũa cẩn thận.Bước 7:Trong lần đầu tiên bạn tới 30Shine, Stylist chuyên nghiệp sẽ trao đổi thật kỹ để thấu hiểu và chọn ra kiểu tóc tuyệt vời nhất với gương mặt và phong cách sống của bạn. Từ những lần sau, bạn chỉ cần ngả lưng và thư giãn giống như hàng ngàn thành viên quen thuộc khác. Stylist sẽ hiểu chính xác và cho bạn đúng kiểu tóc mong muốn.Bước 8:Kiểu tóc mới được tạo hình chuẩn xác dưới đôi tài hoa của Stylist. Với 30Shine, cắt tóc mới ở phái mạnh luôn là một nghi thức đánh dấu sự thay đổi tích cực trong cuộc sống.Bước 9:Bạn sẽ được theo dõi các video giải trí, bóng đá đầy thú vị trong quá trình mái tóc được tạo kiểu khiến thời gian như ngắn lại, giống như đang du hành trên chiếc máy bay hạng sang.Bước 10:Stylist sẽ xả sạch tóc con để đảm bảo sự hoàn hảo cho mái tóc của bạn. Sau đó là bước cạo mặt êm ái cho làn da mịn màng.Bước 11:Bước hoàn thiện cuối cùng, vuốt sáp – xịt gôm tạo kiểu cao cấp, tạo hình cho mái tóc. Stylist đồng thời giúp bạn cách để vuốt gôm sáp tại nhà để mái tóc đẹp chuẩn phong cách mỗi ngày.Bước 12:Cuối cùng, khi bước ra khỏi 30Shine, bạn hãy tiếp tục hành trình cuộc sống mới của riêng mình với tinh thần mới tràn đầy năng lượng một diện mạo mới tỏa sáng.',100,120)
insert into DICHVU values('DV02',N'Gội masssage dưỡng sinh', N'Thư giãn, giải tỏa mệt mỏi ư! Đơn giản, các bạn skinner với bài gội đầu massage dưỡng sinh sẽ giúp anh. Sau cùng stylist sẽ vuốt sáp tạo kiểu để đẹp trai cả ngày',40,40)
insert into DICHVU values('DV03',N'Combo Gội nâng cấp thư giãn và sấy vuốt tạo kiểu', N'Gội thư giãn Nâng cấp các động tác massage mới, gấp đôi thời gian cũ, sấy vuốt sáp tạo kiểu, miễn phí giường massage công nghệ mới, sửa rửa mặt nhập khẩu Hàn Quốc',50,50)
insert into DICHVU values('DV04',N'Massage cổ, vai, gáy bạc hà cam ngọt',N'Là thần dược giảm đau nhức cơ, xơ cứng, tinh dầu bạc hà mát lạnh kết hợp cùng đôi bàn tay uyển chuyển của skinner với bài massage cổ truyền tác động 12 huyệt đạo điệu nghệ cơn đau mỏi của anh sẽ nhanh chóng tan biến',45,45)

go

insert into LOAIDMCS values('LDMCS01',N'Tạo kiểu tóc')
insert into LOAIDMCS values('LDMCS02',N'Chăm sóc da mặt')
insert into LOAIDMCS values('LDMCS03',N'Chăm sóc tóc')
insert into LOAIDMCS values('LDMCS04',N'Chăm sóc cơ thể')
insert into LOAIDMCS values('LDMCS05',N'Chăm sóc cá nhân')
insert into LOAIDMCS values('LDMCS06',N'Thực phẩm chức năng')
go

insert into 




go
CREATE TRIGGER updateDateHH on THETV for insert 
as
begin
	update THETV set NGAYHETHAN = DATEADD(DAY, 30, NGAYCAP) 
end

go


select * from THETV











