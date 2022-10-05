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
	[TENKH] Nvarchar(100) NOT NULL,
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
	[TRANGTHAI] Bit default 0 NOT NULL check (TRANGTHAI IN (1,0)),
Primary Key ([ID],[MAKH])
) 
go

Create table [CHINHANH]
(
	[MACN] Varchar(10) NOT NULL, UNIQUE ([MACN]),
	[DIACHI] Nvarchar(1000) NOT NULL,
	[MAKV] Varchar(20) NOT NULL,
	[HOTLINE] Varchar(10) NULL default '1800282830' check(len(HOTLINE) = 10),
Primary Key ([MACN])
) 
go

Create table [DICHVU]
(
	[MADV] Varchar(10) NOT NULL, UNIQUE ([MADV]),
	[TENDV] Nvarchar(500) NOT NULL,
	[MOTA] NVarchar(2000) NOT NULL,
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
	[NAMSINH] date NOT NULL,
	[GIOITINH] Bit NOT NULL default 0 check(GIOITINH IN (1,0)), 
	[DIACHI] Nvarchar(50) NULL,
	[MACV] Varchar(10) NOT NULL,
	[MACN] Varchar(10) NOT NULL,
	[NGAYVAOLAM] date NOT NULL,
Primary Key ([MANV])
) 
go

Create table [SANPHAM]
(
	[MASP] Varchar(10) NOT NULL, UNIQUE ([MASP]),
	[MADM] Varchar(10) NOT NULL,
	[TENSP] Nvarchar(500) NOT NULL,
	[GIA] Numeric(10,1) Default 0 NOT NULL,
	[MOTA] NVarchar(500) NOT NULL,
	[GIAMGIA] Tinyint Default 0 NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL CHECK(TRANGTHAI IN (1,0)),
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
	[CHUTHICH] NVarchar(500) NULL,
	[MANV] Varchar(10) NOT NULL,
	[MAKH] Varchar(20) NOT NULL,
	[MACN] Varchar(10) NOT NULL,
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
	[TONG_TIEN] Numeric(10,1) NOT NULL,
	[MAKM] Varchar(10) NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL Check (TRANGTHAI IN (1,0)),
	[MAPTTT] Varchar(100) NOT NULL,
Primary Key ([SOHD])
) 
go

Create table [KHUYENMAI]
(
	[MAKM] Varchar(10) NOT NULL, UNIQUE ([MAKM]),
	[NOIDUNG] NVarchar(500) NOT NULL,
	[DIEUKIEN] NVarchar(500) NOT NULL,
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
	[DONGGIANHAP] Numeric(10,1) NOT NULL Check (DONGGIANHAP > 0),
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
	[DIACHI] NVarchar(500) NOT NULL,
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
	[NOIDUNG] NVarchar(500) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOHD] Varchar(10) NOT NULL,
Primary Key ([MABL])
) 
go

Create table [SUKIEN]
(
	[MASK] Varchar(10) NOT NULL, UNIQUE ([MASK]),
	[TENSUKIEN] Nvarchar(50) NOT NULL,
	[NGAYBATDAU] date Default FORMAT (getdate(), 'dd-MM-yyyy') NOT NULL Check (NGAYBATDAU >= FORMAT (getdate(), 'dd-MM-yyyy')),
	[MASP] Varchar(10) NOT NULL,
	[NOIDUNGSK] NVarchar(500) NOT NULL,
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
	[ANH] NVARCHAR(1000) NULL,
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
	[NOIDUNG] NVarchar(500) NOT NULL,
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
Alter table [PHIEUDATLICH] add  foreign key([MACN]) references [CHINHANH] ([MACN])  on update no action on delete no action 
go
Alter table [NHANVIEN] add  foreign key([MACN]) references [CHINHANH] ([MACN])  on update no action on delete no action 
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
Alter table [BINHLUAN] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
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

Create TRIGGER updateDateHH on THETV for insert, update 
as
begin
	update THETV set NGAYHETHAN = DATEADD(DAY, 30, inserted.NGAYCAP) from THETV join inserted on THETV.ID = inserted.ID
	
end
go

create trigger deleteTHETV on THETV for delete
as
begin 
	declare @count int
	select @count = COUNT(*) from THETV join deleted on THETV.ID = deleted.ID and deleted.TRANGTHAI  < 1
	if(@count >= 1)
		begin
			print N'Khong duoc phep xoa'
			rollback tran
		end
end
go

create trigger deleteUser on KHACHHANG for delete
as
begin
	declare @count int
	select @count = COUNT(*) from KHACHHANG join deleted on deleted.MAKH = KHACHHANG.MAKH where KHACHHANG.MAKH  in (select THETV.MAKH from THETV)
	
	if(@count > 0)
	begin
	print N'Ban phai xoa khach hang trong bang THETV'
		rollback tran
	end

end
go

create trigger updatePriceProduct on SANPHAM for insert, update
as
begin
	update SANPHAM set SANPHAM.GIA = inserted.GIA *((100 - inserted.GIAMGIA) / 100), SANPHAM.TRANGTHAI = inserted.TRANGTHAI from SANPHAM join inserted on SANPHAM.MASP = inserted.MASP
end
go


create trigger updateStatusProductPX on CHITIETPHIEUXUAT for insert, update
as
begin
	declare @count int
	
	select @count =(inserted.SOLUONG - CHITIETPN.SOLUONG) from CHITIETPN join inserted on inserted.MASP = CHITIETPN.MASP
	if(@count > 0)
		begin
			Print N'So long san pham khong du'
			rollback tran
		end
	if(@count = 0)
		begin
			update SANPHAM set SANPHAM.TRANGTHAI = 1
		end
	if(@count < 0)
	begin
		update SANPHAM set SANPHAM.TRANGTHAI = 0
	end
end
go



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
insert into CHUCVU values('CV01',N'Stylist-thợ cắt', 2.0)
insert into CHUCVU values('CV02',N'Skinner-thợ gội', 1.5)
insert into CHUCVU values('CV03',N'Lễ tân', 1.5)
insert into CHUCVU values('CV04',N'Bảo vệ', 1.25)
insert into CHUCVU values('CV05',N'Quản lý',3.0)
go

insert into KHUVUC values('KVBT',N'Bình Thạnh')
insert into KHUVUC values('KVGV',N'Gò Vấp')
insert into KHUVUC values('KVQ9',N'Quận 9')
go
insert into CHINHANH(MACN,DIACHI,MAKV) values('CNQ901',N'194 Lê Văn Việt, P. Tăng Nhơn Phú B, Quận 9, TP Hồ Chí Minh','KVQ9')
insert into CHINHANH(MACN,DIACHI,MAKV) values('CNBT01',N'449 Bạch Đằng, Phường 2, Q.Bình Thạnh, TP Hồ Chí Minh','KVBT')
insert into CHINHANH(MACN,DIACHI,MAKV) values('CNGV01',N'1180 Quang Trung, Phường 8, Q.Gò Vấp, TP Hồ Chí Minh','KVGV')

go
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV01',N'Pham Văn Đồng', '1976-02-01',0,GETDATE(),'CV01','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV02',N'Nguyễn Văn Nghi', '1998-03-05',0,GETDATE(),'CV03','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV03',N'Trần Thị Nghỉ', '1999-05-12',1,GETDATE(),'CV02','CNGV01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV04',N'Nguyễn Văn Đậu', '1990-05-25',0,GETDATE(),'CV05','CNBT01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV05',N'Tạ Quang Bửu', '1992-08-02',0,GETDATE(),'CV05','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV06',N'Phan Văn Trị', '1988-02-15',0,GETDATE(),'CV05','CNGV01')

go
insert into DIADIEM values('DDBT',N'Đia điểm Bình Thạnh',N'số 12 Bạch Đằng, Phường 2, Q.Bình Thạnh, TP Hồ Chí Minh','NV04')
insert into DIADIEM values('DDGV',N'Đia điểm Gò Vấp',N'567 Lê Văn Thọ,Phường 16, Q.Gò Vấp, TP Hồ Chí Minh','NV06')
insert into DIADIEM values('DDQ9',N'Đia điểm Quận 9',N'189 Tây Hòa, P. Phước Long A, Quận 9, TP Hồ Chí Minh','NV05')

go
insert into KHO values('KBT',N'Kho Bình Thạnh','0123456789','DDBT','NV04')
insert into KHO values('KQ9',N'Kho Quận 9','0123456789','DDQ9','NV05')
insert into KHO values('KGV',N'Kho Gò Vấp','0123456789','DDGV','NV06')

go


insert into DICHVU values('DV01',N'ShineCombo cắt gội 10 bước',N'Combo “đặc sản” của 30Shine, bạn sẽ cùng chúng tôi trải nghiệm chuyến hành trình tỏa sáng đầy thú vị - nơi mỗi người đàn ông không chỉ cắt tóc mà còn tìm thấy nhiều hơn như thế',100,120)
insert into DICHVU values('DV02',N'Gội masssage dưỡng sinh', N'Thư giãn, giải tỏa mệt mỏi ư! Đơn giản, các bạn skinner với bài gội đầu massage dưỡng sinh sẽ giúp anh. Sau cùng stylist sẽ vuốt sáp tạo kiểu để đẹp trai cả ngày',40,40)
insert into DICHVU values('DV03',N'Combo Gội nâng cấp thư giãn và sấy vuốt tạo kiểu', N'Gội thư giãn Nâng cấp các động tác massage mới, gấp đôi thời gian cũ, sấy vuốt sáp tạo kiểu, miễn phí giường massage công nghệ mới, sửa rửa mặt nhập khẩu Hàn Quốc',50,50)
insert into DICHVU values('DV04',N'Massage cổ, vai, gáy bạc hà cam ngọt',N'Là thần dược giảm đau nhức cơ, xơ cứng, tinh dầu bạc hà mát lạnh kết hợp cùng đôi bàn tay uyển chuyển của skinner với bài massage cổ truyền tác động 12 huyệt đạo điệu nghệ cơn đau mỏi của anh sẽ nhanh chóng tan biến',45,45)

go

insert into LOAIDMCS values('LDMCS01',N'Tạo kiểu tóc')
insert into LOAIDMCS values('LDMCS02',N'Chăm sóc da mặt')
insert into LOAIDMCS values('LDMCS03',N'Chăm sóc tóc')
insert into LOAIDMCS values('LDMCS04',N'Chăm sóc cơ thể')
insert into LOAIDMCS values('LDMCS05',N'Thực phẩm chức năng')
go



INSERT into DANHMUCCHAMSOC VALUES('DMCS01',N'Sáp vuốt tóc','LDMCS01')
INSERT into DANHMUCCHAMSOC VALUES('DMCS02',N'Gôm giữ nếp','LDMCS01')
INSERT into DANHMUCCHAMSOC VALUES('DMCS03',N'Máy sấy tóc','LDMCS01')

INSERT into DANHMUCCHAMSOC VALUES('DMCS04',N'Sữa rửa mặt','LDMCS02')
INSERT into DANHMUCCHAMSOC VALUES('DMCS05',N'Dưỡng da','LDMCS02')
INSERT into DANHMUCCHAMSOC VALUES('DMCS06',N'Kem chống nắng','LDMCS02')

INSERT into DANHMUCCHAMSOC VALUES('DMCS07',N'Dầu gọi','LDMCS03')
INSERT into DANHMUCCHAMSOC VALUES('DMCS08',N'Dầu xã','LDMCS03')
INSERT into DANHMUCCHAMSOC VALUES('DMCS09',N'Dưỡng tóc','LDMCS03')

INSERT into DANHMUCCHAMSOC VALUES('DMCS010',N'Sữa tắm','LDMCS04')
INSERT into DANHMUCCHAMSOC VALUES('DMCS011',N'Nước hoa','LDMCS04')

INSERT into DANHMUCCHAMSOC VALUES('DMCS012',N'Làm đẹp','LDMCS05')
INSERT into DANHMUCCHAMSOC VALUES('DMCS013',N'Sức khỏe','LDMCS05')


go

INSERT into THUONGHIEU Values('TH01',N'SNP ACSYS FOR MEN')
INSERT into THUONGHIEU Values('TH02',N'30SHINE')
INSERT into THUONGHIEU Values('TH03',N'GLANZEN')
INSERT into THUONGHIEU Values('TH04',N'SKINK&DR')
INSERT into THUONGHIEU Values('TH05',N'REUZEL')
INSERT into THUONGHIEU Values('TH06',N'THE PLANT BASE')
go



INSERT into SANPHAM(MASP,MADM,TENSP,GIA,GIAMGIA,MOTA,MATH) VALUES('SP01','DMCS01',N'Sáp Reuzel Concrete Hold Matte Pomade - Bản mới nhất',424.0,16,N'Độ bóng mờ tạo sự tự nhiên cho mái tóc.Không gây nặng tóc, khó chịu, bết dính.Dễ dàng gội sạch bằng các loại đầu gội thông thường.Mùi hương Vani tinh tế mang đến cho anh em sự cuốn hút, lịch lãm và đẳng cấp.Concrete Hold Matte Pomade tạo độ kết dính, tăng độ kết cấu giúp tóc có những Texture hoặc Volume ấn tượng.Khả năng giữ nếp mạnh mẽ suốt cả ngày dài, đặc biệt không làm khô tóc nên anh em dễ dàng Restyle kiểu tóc theo ý muốn.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA,MOTA,MATH) VALUES('SP02','DMCS03',N'Combo Tóc Đẹp Máy Sấy Tóc Sharkway + Tinh Dầu Argan Phục Hồi Tóc Hư Tổn',359.0,N'Sở hữu ngay Shark Way - Siêu phẩm máy sấy quái vật công suất 1600W vượt trội về hiệu năng trong tầm giá. Sấy là đẹp, Có máy sấy Shark Way và tận hưởng trải nghiệm tự tạo kiểu tóc tại nhà đẹp chuẩn như bước ra từ Salon','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA,MOTA,GIAMGIA,MATH) VALUES('SP03','DMCS04',N'Combo Giảm Mụn, Mờ Nám, Da Trắng Mịn Màng Grinif Lớn',839.0,N'Combo Giảm Mụn, Mờ Nám, Da Trắng Mịn Màng Grinif Nhỏ',6,'TH01')



select * from SANPHAM








