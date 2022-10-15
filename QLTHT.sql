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
	[NGAYCAP] date Default FORMAT(getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYCAP >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[NGAYHETHAN] date NULL,
	[MALTK] Varchar(10) NOT NULL,
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
Primary Key ([MADV])
) 
go
create table [GIADICHVU]
(
	[MADV] Varchar(10) NOT NULL,
	[GIA] decimal(10,1) NOT NULL Check(Gia >0),
Primary key ([MADV])
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
	[NGAYDL] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYDL >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[GIODL] time(0) Default FORMAT (getdate(), 'hh:mm') NOT NULL Check (GIODL > FORMAT (getdate(), 'hh:mm')),
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
	[SOHD] Varchar(50) NOT NULL, UNIQUE ([SOHD]),
	[NGAYTHANHTOAN] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYTHANHTOAN >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[TONG_TIEN] decimal(10,1) NULL,
	[MAKM] Varchar(10) default 'KM01' NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL Check (TRANGTHAI IN (1,0)),
	[MAPTTT] Varchar(20) default 'MAPT01' NULL,
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
	[SOPSDDV] varchar(50) NOT NULL, UNIQUE ([SOPSDDV]),
	[NGAYSD] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL,
	[SOHD] Varchar(50) NULL,
	[MADV] Varchar(10) NULL,
	[SOPDL] Varchar(10) NOT NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL Check (TRANGTHAI IN (1,0)),
	[MALTK] Varchar(10) default 'LTKTC' NULL,
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
	[SOPHIEUMH] Varchar(20) NOT NULL, UNIQUE ([SOPHIEUMH]),
	[MANV] Varchar(10) NULL,
	[MAKH] Varchar(20)  NULL,
	[NGAYLAP] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYLAP >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[SOHD] Varchar(50)  NULL,
	[MAKHO] Varchar(10) NULL,
Primary Key ([SOPHIEUMH])
) 
go

Create table [CHITIETPMH]
(
	[SOPHIEUMH] Varchar(20) NOT NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOLUONG] int NOT NULL Check (SOLUONG >= 1),
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
	[MABL] Varchar(50) NOT NULL, UNIQUE ([MABL]),
	[DANHGIA] Decimal(5,1) Default 0 NOT NULL Check (DANHGIA <= 5),
	[NOIDUNG] NVarchar(500) NULL,
	[MASP] Varchar(10) NOT NULL,
	[SOHD] Varchar(50) NOT NULL,
Primary Key ([MABL])
) 
go

Create table [SUKIEN]
(
	[MASK] Varchar(10) NOT NULL, UNIQUE ([MASK]),
	[TENSUKIEN] Nvarchar(50) NOT NULL,
	[NGAYBATDAU] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYBATDAU >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[MASP] Varchar(10) NULL,
	[NOIDUNGSK] NVarchar(500) NOT NULL,
	[MALOAI] Varchar(10) NOT NULL,
	[MADV] Varchar(10) NULL,
Primary Key ([MASK])
) 
go

Create table [LOAIPPTT]
(
	[MALOAI] Varchar(10) NOT NULL, UNIQUE ([MALOAI]),
	[TENLOAI] Nvarchar(100) NOT NULL,
Primary Key ([MALOAI])
) 
go

Create table [PHUONGTHUCTHANHTOAN]
(
	[MAPTTT] Varchar(20) NOT NULL, UNIQUE ([MAPTTT]),
	[TENPTTT] Nvarchar(50) NOT NULL,
	[MALOAI] Varchar(10) NOT NULL,
	[TIENTE] Varchar(100) NOT NULL default 'VND',
Primary Key ([MAPTTT])
) 
go

Create table [LICHSUDAT]
(
	[MALSD] Varchar(20) NOT NULL, UNIQUE ([MALSD]),
	[NGAYDADAT] date default getdate() NOT NULL,
	[Stylist] Nvarchar(50) NULL,
	[Skinner] Nvarchar(50) NULL,
	[ANH] NVARCHAR(1000) NULL,
	[SOHD] Varchar(50) NOT NULL,
Primary Key ([MALSD])
) 
go

Create table [PHIEUGIAOHANG]
(
	[MAPHIEU] Varchar(20) NOT NULL, UNIQUE ([MAPHIEU]),
	[MAHANGVC] Varchar(10) default 'HVC01' NOT NULL,
	[PHIVANCHUYEN] Decimal(10,1) default 20000.0 NULL,
	[TRANGTHAI] Bit Default 0 NOT NULL check (TRANGTHAI IN (1,0)),
	[NGAYVANCHUYEN] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYVANCHUYEN >= FORMAT (getdate(), 'yyyy-MM-dd')),
	[DIACHI] Nvarchar(100) NULL,
	[SOHD] Varchar(50) NOT NULL,
Primary Key ([MAPHIEU],[SOHD])
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
	[MALS] Varchar(50) NOT NULL, UNIQUE ([MALS]),
	[TRANGTHAIDH] Nvarchar(100) NOT NULL,
	[NGAYCAPNHAT] date NOT NULL,
	[NOIDUNG] Nvarchar(100) NULL,
	[SOHD] Varchar(50) NOT NULL,
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
	[ANH] Varchar(500) NULL,
	[MALOAI] Varchar(10) NOT NULL,
	[MASP] Varchar(10) NULL,
	[MADV] Varchar(10) NULL,
	[NGAYVIETBAI] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (NGAYVIETBAI >= FORMAT (getdate(), 'yyyy-MM-dd')),
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
	[MALUONG] Varchar(20) NOT NULL, UNIQUE ([MALUONG]),
	[MUCLUONGCOBAN] Decimal(10,1) NOT NULL Check (MUCLUONGCOBAN > 0),
	[NGAYNHANLUONG] date NOT NULL,
	[MANV] Varchar(10) NOT NULL,
Primary Key ([MALUONG])
) 
go

Create table [CHITIETLUONG]
(
	[MALUONG] Varchar(20) NOT NULL,
	[MAPC] Varchar(10) NOT NULL,
Primary Key ([MALUONG],[MAPC])
) 
go

Create table [BANGCHAMCONG]
(
	[MABCC] Varchar(50) NOT NULL, UNIQUE ([MABCC]),
	[TUNGAY] date NOT NULL,
	[DENNGAY] date Default FORMAT (getdate(), 'yyyy-MM-dd') NOT NULL Check (DENNGAY <= FORMAT (getdate(), 'yyyy-MM-dd')),
Primary Key ([MABCC])
) 
go

Create table [CHITIETBANGCHAMCONG]
(
	[MANV] Varchar(10) NOT NULL,
	[MABCC] Varchar(50) NOT NULL,
	[SOGIO] int NOT NULL Check (SOGIO >= 0),
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
Alter table [GIADICHVU] add  foreign key([MADV]) references [DICHVU] ([MADV])  on update no action on delete no action 
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
Alter table [DIADIEM] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [CHITIETPN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [CHITIETPMH] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [BINHLUAN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
go
Alter table [BINHLUAN] add  foreign key([SOHD]) references [HOADON] ([SOHD])  on update no action on delete no action 
go
Alter table [SUKIEN] add  foreign key([MASP]) references [SANPHAM] ([MASP])  on update no action on delete no action 
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
Alter table [PHIEUMUAHANG] add  foreign key([MAKHO]) references [KHO] ([MAKHO])  on update no action on delete no action 
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
Alter table [CHITIETPMH] add  foreign key([SOPHIEUMH]) references [PHIEUMUAHANG] ([SOPHIEUMH])  on update no action on delete no action 
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
Alter table [KHO] add  foreign key([MADIADIEM],[MANV]) references [DIADIEM] ([MADIADIEM],[MANV])  on update no action on delete no action 
go
Alter table [SUKIEN] add  foreign key([MALOAI]) references [LOAISUKIEN] ([MALOAI])  on update no action on delete no action 
go
/* show list branch of product*/
go
create procedure listBranch @BranchName Nvarchar(50)
as
select * from THUONGHIEU join SANPHAM on SANPHAM.MATH = THUONGHIEU.MATH where THUONGHIEU.TENTH = @BranchName
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
	select @count = COUNT(*) from deleted where deleted.NGAYHETHAN <= FORMAT(GETDATE(),'yyyy-dd-MM')
	if(@count >= 1)
		begin
			raiserror(N'Khong duoc phep xoa',0,1)
			rollback tran
		end
end
go

create trigger updatePriceProduct on SANPHAM for insert, update
as
begin
	declare @discount tinyint
	select @discount = inserted.GIAMGIA from inserted
	if(@discount > 0)
		begin
			update SANPHAM set SANPHAM.GIA = inserted.GIA *(100 - inserted.GIAMGIA) / 100, SANPHAM.TRANGTHAI = inserted.TRANGTHAI from SANPHAM join inserted on SANPHAM.MASP = inserted.MASP		
		end
	else
		begin
			update SANPHAM set SANPHAM.GIA = inserted.GIA , SANPHAM.TRANGTHAI = inserted.TRANGTHAI from SANPHAM join inserted on SANPHAM.MASP = inserted.MASP		
		end
end
go

create trigger insertPHIEUDATLICH on PHIEUDATLICH for insert, update
as
begin
	declare @count int
	
	select @count = COUNT(*) from inserted join NHANVIEN on inserted.MANV = NHANVIEN.MANV and inserted.MACN = NHANVIEN.MACN
	if(@count = 0)
	begin
		Print N'Nhap sai. Vui long nhap lai!!!'
		rollback tran
	end
end

go

create trigger insertNHANVIEN on NHANVIEN for insert
as
begin
	
	declare @dateInWork date
	declare @macc varchar(10)
	declare @timeWork int
	declare @manv varchar(10)
	declare @maluong varchar(20)
	declare @priceBasic decimal(10,1)
	declare @day int
	declare @mouth int
	declare @year int
	select @manv = inserted.MANV,@dateInWork = inserted.NGAYVAOLAM, @macc = 'MACC' + inserted.MANV, @maluong = 'MALUONG' + inserted.MANV from inserted
	set @day = 5
	set @mouth = MONTH(@dateInWork) + 1
	set @year = YEAR(@dateInWork)
	set @priceBasic = 4000000.0
	insert into BANGCHAMCONG(MABCC,TUNGAY) values(@macc,@dateInWork)
	SELECT @timeWork = DATEDIFF(HOUR, @dateInWork, BANGCHAMCONG.DENNGAY) from BANGCHAMCONG where BANGCHAMCONG.MABCC = @macc
	insert into CHITIETBANGCHAMCONG values(@manv,@macc,@timeWork)
	insert into LUONG(MALUONG,MUCLUONGCOBAN,NGAYNHANLUONG,MANV) values(@maluong,@priceBasic,DATEFROMPARTS(@year,@mouth,@day),@manv)
end	

go
create trigger updateNHANVIEN on NHANVIEN for update
as
begin
		declare @macc varchar(10)
		declare @dateInWork date
		declare @dateToWord date
		declare @manv varchar(10)
		select @manv = inserted.MANV , @dateInWork = inserted.NGAYVAOLAM from inserted
		select @macc = CHITIETBANGCHAMCONG.MABCC from CHITIETBANGCHAMCONG where CHITIETBANGCHAMCONG.MANV = @manv
		select * from BANGCHAMCONG
		update BANGCHAMCONG set TUNGAY = @dateInWork where BANGCHAMCONG.MABCC = @macc	
		update CHITIETBANGCHAMCONG set SOGIO = DATEDIFF(HOUR,@dateInWork,BANGCHAMCONG.DENNGAY) from BANGCHAMCONG join CHITIETBANGCHAMCONG on BANGCHAMCONG.MABCC = CHITIETBANGCHAMCONG.MABCC where BANGCHAMCONG.MABCC = @macc

end
go



create trigger insertPHIEUMUHANG on PHIEUMUAHANG for insert, update
as

begin
	declare @sohd varchar(50)
	declare @countHD int
	declare @price decimal(10,1)
	declare @makho varchar(10)
	declare @manv varchar(50)
	declare @sopmh varchar(20)
	select @sohd = 'SOHD' + inserted.MAKH+ FORMAT(GETDATE(),'yyyyMMddhh'), @manv = inserted.MANV, @sopmh = inserted.SOPHIEUMH from inserted
	select @countHD = COUNT(*) from HOADON where HOADON.SOHD = @sohd
	select @makho = KHO.MAKHO from KHO where KHO.MANV = @manv
	if(@makho is null)
	begin
		print N'Nhap sai ma nhan vien. Vui long nhap lai'
		rollback tran
	end
	if(@countHD <1)
	begin 
		insert into HOADON(SOHD) values(@sohd)
	end
	if(@makho is null)
	begin
		print N'Nhap sai ma nhan vien. Vui long nhap lai'
		rollback tran
	end
	update PHIEUMUAHANG set SOHD = @sohd, MAKHO = @makho where PHIEUMUAHANG.SOPHIEUMH = @sopmh	
	

end
go
create trigger insertCTPMH on CHITIETPMH for insert, update
as
begin
	declare @sl int
	declare @totalsl int
	declare @masp varchar(10)
	declare @sopmh varchar(20)
	declare @sohd varchar(50)
	declare @totalPrice decimal(10,1)
	select @masp = inserted.MASP, @sopmh = inserted.SOPHIEUMH from inserted
	select @totalsl = SUM(CHITIETPMH.SOLUONG) from CHITIETPMH where CHITIETPMH.MASP = @masp
	select @sl = CHITIETPN.SOLUONG - @totalsl  from CHITIETPN where CHITIETPN.MASP = @masp

	select @sohd = PHIEUMUAHANG.SOHD from PHIEUMUAHANG where PHIEUMUAHANG.SOPHIEUMH = @sopmh
	
	select @totalPrice = SUM(SANPHAM.GIA * CHITIETPMH.SOLUONG) from CHITIETPMH join SANPHAM on SANPHAM.MASP = CHITIETPMH.MASP where CHITIETPMH.SOPHIEUMH = @sopmh Group by CHITIETPMH.SOPHIEUMH
	
	if(@sl < 0)
		begin
			print N'Het hang'
			rollback tran
		end
	update HOADON set TONG_TIEN = @totalPrice where HOADON.SOHD = @sohd
end
go
create trigger insertPHIEUSUDUNGDICHVU on PHIEUSUDUNGDICHVU for insert, update
as
begin
	declare @sohd varchar(50)
	declare @countHD int
	declare @makh varchar(10)
	declare @sopsddv varchar(20)
	declare @loaitk varchar(10)
	declare @sopdl varchar(50)
	declare @status bit
	select @sopsddv = inserted.SOPSDDV, @sopdl = inserted.SOPDL, @status = inserted.TRANGTHAI from inserted
	
	select @sohd = 'SOHD' + PHIEUDATLICH.MAKH+ FORMAT(GETDATE(),'yyyyMMddhh'), @makh = PHIEUDATLICH.MAKH from PHIEUDATLICH where PHIEUDATLICH.SOPDL = @sopdl
	select @loaitk = THETV.MALTK from THETV where MAKH = @makh
	
	select @countHD = COUNT(*) from HOADON where HOADON.SOHD = @sohd
	if(@countHD = 0)
		begin
			insert into HOADON(SOHD) values(@sohd)
		end
	update PHIEUSUDUNGDICHVU set SOHD = @sohd, MALTK = @loaitk where PHIEUSUDUNGDICHVU.SOPSDDV = @sopsddv
	if(@status = 1)
		begin
			declare @priceservice decimal(10,1)
			declare @pricepercent decimal(10,1)
			declare @totalprice decimal(10,1)
			declare @pricemh decimal(10,1)
			declare @count int
			declare @sopmh varchar(50)
			select @priceservice = SUM(GIADICHVU.GIA * CHITIETDICHVU.SOLUONG) from CHITIETDICHVU join GIADICHVU on CHITIETDICHVU.MADV = GIADICHVU.MADV where CHITIETDICHVU.SOPDL = @sopdl group by CHITIETDICHVU.SOPDL
			
			select @count = COUNT(*) from PHIEUMUAHANG where PHIEUMUAHANG.SOHD = @sohd
			select @sopmh = PHIEUMUAHANG.SOPHIEUMH from PHIEUMUAHANG where PHIEUMUAHANG.SOHD = @sohd
			if(@count = 0)
				begin
					update HOADON set TONG_TIEN = @priceservice where HOADON.SOHD = @sohd		
				end
			select @pricemh = SUM(SANPHAM.GIA * CHITIETPMH.SOLUONG) from CHITIETPMH join SANPHAM on SANPHAM.MASP = CHITIETPMH.MASP where CHITIETPMH.SOPHIEUMH = @sopmh Group by CHITIETPMH.SOPHIEUMH
			set @totalprice = @pricemh + @priceservice
			update HOADON set TONG_TIEN = @totalprice where HOADON.SOHD = @sohd		
			
		end
end


go

create trigger insertCHITIETDICHVU on CHITIETDICHVU for update
as
begin
	declare @madv varchar(20)
	declare @sopdl varchar(50)
	declare @priceservice decimal(10,1)
	declare @sohd varchar(50)
	declare @totalprice decimal(10,1)
	select @sohd = PHIEUSUDUNGDICHVU.SOHD from PHIEUSUDUNGDICHVU, inserted where PHIEUSUDUNGDICHVU.MADV = inserted.MADV and PHIEUSUDUNGDICHVU.SOPDL = inserted.SOPDL
	declare @pricemh decimal(10,1)
	declare @count int
	declare @sopmh varchar(50)
	select @priceservice = SUM(GIADICHVU.GIA * CHITIETDICHVU.SOLUONG) from CHITIETDICHVU join GIADICHVU on CHITIETDICHVU.MADV = GIADICHVU.MADV where CHITIETDICHVU.SOPDL = @sopdl group by CHITIETDICHVU.SOPDL
	select @count = COUNT(*) from PHIEUMUAHANG where PHIEUMUAHANG.SOHD = @sohd
	select @sopmh = PHIEUMUAHANG.SOPHIEUMH from PHIEUMUAHANG where PHIEUMUAHANG.SOHD = @sohd
			if(@count = 0)
				begin
					update HOADON set TONG_TIEN = @priceservice where HOADON.SOHD = @sohd		
				end
			select @pricemh = SUM(SANPHAM.GIA * CHITIETPMH.SOLUONG) from CHITIETPMH join SANPHAM on SANPHAM.MASP = CHITIETPMH.MASP where CHITIETPMH.SOPHIEUMH = @sopmh Group by CHITIETPMH.SOPHIEUMH
			set @totalprice = @pricemh + @priceservice
			update HOADON set TONG_TIEN = @totalprice where HOADON.SOHD = @sohd		
end
go


create trigger insertHOADON on HOADON for update
as
begin
	declare @status bit
	declare @totalprice decimal(10,1)
	declare @priceend decimal(10,1)
	declare @sohd varchar(50)
	declare @pgh varchar(20)
	declare @malsd varchar(20)
	declare @date date
	declare @malsdh varchar(20)
	select @status = inserted.TRANGTHAI, @totalprice = inserted.TONG_TIEN, @sohd = inserted.SOHD, @pgh = 'PGH'+ inserted.SOHD, @malsd = 'LSD' + inserted.SOHD, @date = inserted.NGAYTHANHTOAN from inserted
	
	if(@status = 1)
	begin
		if(@totalprice > 200.0)
			begin
				set @priceend = @totalprice -(@totalprice * 0.1)
				update HOADON set TONG_TIEN = @priceend where HOADON.SOHD = @sohd
			end
		if((select COUNT(*) from PHIEUSUDUNGDICHVU where PHIEUSUDUNGDICHVU.SOHD = @sohd) = 0)
		begin
			
			insert into PHIEUGIAOHANG(MAPHIEU,SOHD) values(@pgh,@sohd)
			set @malsdh = 'MALSDH' + @pgh
			insert into LICHSUDONHANG(MALS,TRANGTHAIDH,NGAYCAPNHAT,SOHD) values(@malsdh,N'Đã xuất kho. Đang vận chuyển.',@date,@sohd)
			declare @sopmh varchar(20)
			select @sopmh = PHIEUMUAHANG.SOPHIEUMH from PHIEUMUAHANG where PHIEUMUAHANG.SOHD = @sohd
			insert into BINHLUAN(MABL,MASP,SOHD) select 'MABL'+@sohd+CHITIETPMH.MASP, CHITIETPMH.MASP, @sohd from CHITIETPMH join PHIEUMUAHANG on PHIEUMUAHANG.SOPHIEUMH = CHITIETPMH.SOPHIEUMH where PHIEUMUAHANG.SOPHIEUMH = @sopmh group by CHITIETPMH.MASP
		end
		if((select COUNT(*) from PHIEUSUDUNGDICHVU where PHIEUSUDUNGDICHVU.SOHD = @sohd) = 1)
		begin
			
			insert into LICHSUDAT(MALSD,NGAYDADAT,SOHD) values(@malsd,@date,@sohd)
		end


	end
end

go
go
insert into LOAIDMCS values('LDMCS01',N'Tạo kiểu tóc')
insert into LOAIDMCS values('LDMCS02',N'Chăm sóc da mặt')
insert into LOAIDMCS values('LDMCS03',N'Chăm sóc tóc')
insert into LOAIDMCS values('LDMCS04',N'Chăm sóc cơ thể')
insert into LOAIDMCS values('LDMCS05',N'Thực phẩm chức năng')
go



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

INSERT into DANHMUCCHAMSOC VALUES('DMCS10',N'Sữa tắm','LDMCS04')
INSERT into DANHMUCCHAMSOC VALUES('DMCS11',N'Nước hoa','LDMCS04')

INSERT into DANHMUCCHAMSOC VALUES('DMCS12',N'Làm đẹp','LDMCS05')
INSERT into DANHMUCCHAMSOC VALUES('DMCS13',N'Sức khỏe','LDMCS05')


go

INSERT into THUONGHIEU Values('TH01',N'SNP ACSYS FOR MEN')
INSERT into THUONGHIEU Values('TH02',N'30SHINE')
INSERT into THUONGHIEU Values('TH03',N'GLANZEN')
INSERT into THUONGHIEU Values('TH04',N'SKINK&DR')
INSERT into THUONGHIEU Values('TH05',N'REUZEL')
INSERT into THUONGHIEU Values('TH06',N'THE PLANT BASE')
INSERT INTO THUONGHIEU VALUES('TH07',N'FURIN')
go


INSERT into SANPHAM(MASP,MADM,TENSP,GIA,MOTA,GIAMGIA,MATH) VALUES('SP01','DMCS01',N'Sáp Reuzel Concrete Hold Matte Pomade - Bản mới nhất',600.0,N'Độ bóng mờ tạo sự tự nhiên cho mái tóc.Không gây nặng tóc, khó chịu, bết dính.Dễ dàng gội sạch bằng các loại đầu gội thông thường.Mùi hương Vani tinh tế mang đến cho anh em sự cuốn hút, lịch lãm và đẳng cấp.Concrete Hold Matte Pomade tạo độ kết dính, tăng độ kết cấu giúp tóc có những Texture hoặc Volume ấn tượng.Khả năng giữ nếp mạnh mẽ suốt cả ngày dài, đặc biệt không làm khô tóc nên anh em dễ dàng Restyle kiểu tóc theo ý muốn.',16,'TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA,MOTA,GIAMGIA,MATH) VALUES('SP02','DMCS03',N'Combo Tóc Đẹp Máy Sấy Tóc Sharkway + Tinh Dầu Argan Phục Hồi Tóc Hư Tổn',300.0,N'Sở hữu ngay Shark Way - Siêu phẩm máy sấy quái vật công suất 1600W vượt trội về hiệu năng trong tầm giá. Sấy là đẹp, Có máy sấy Shark Way và tận hưởng trải nghiệm tự tạo kiểu tóc tại nhà đẹp chuẩn như bước ra từ Salon',0,'TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA,MOTA,GIAMGIA,MATH) VALUES('SP03','DMCS04',N'Combo Giảm Mụn, Mờ Nám, Da Trắng Mịn Màng Grinif Lớn',839.0,N'Combo Giảm Mụn, Mờ Nám, Da Trắng Mịn Màng Grinif Nhỏ',6,'TH01')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP04','DMCS01',N'Glanzen box Tóc bồng bềnh Hương hoa cỏ',863 ,5 ,N'Combo bao gồm: Sáp Glanzen Prime (FLORAL),Dầu gội phục hồi hư tổn Farcom Seri,Tinh dầu Farcom seri','TH03')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP05','DMCS01',N'Sáp vuốt tóc Glanzen Fox',229 ,0 ,N'Glanzen Fox Dry paste là với công thức sóng đôi giúp dễ dàng lấy sáp, hòa tan & apply lên tóc, bổ sung độ ẩm tự nhiên giúp tăng độ phồng tự nhiên mà vẫn giữ nếp hiệu quả.  ','TH03')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP06','DMCS02',N'Xịt Tạo Phồng Reuzel Surf Tonic',376,0,N'Giữa một rừng các sản phẩm pre-styling trên thị trường, cái tên Reuzel Surf Tonic vẫn nổi bật lên như một ứng cử viên sáng giá. Từ thương hiệu uy tín tới chất lượng vượt trội với khả năng giữ nếp, cho volume và texture hoàn hảo, sản phẩm này đang ngày càng chiếm trọn lòng tin của đông đảo cánh mày râu châu Á cũng như toàn thế giới.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP07','DMCS02',N'Gôm xịt tóc giữ nếp Glanzen Prime Floral 380ml',259 ,14 ,N'Gôm xịt tóc thường được dùng để giữ nếp, cố định kiểu tóc. Gôm Xịt Tóc Glanzen là sản phẩm chuyên dụng tại các salon của 30Shine cũng như rất nhiều salon khác trên toàn quốc, được nhiều khách hàng yêu thích và tin dùng. Glanzen luôn đứng số 1 trong các sản phẩm gôm trên thị trường hiện nay với hàng loạt những ưu điểm vượt trội.','TH03')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP08','DMCS02',N'Gôm xịt tóc giữ nếp Glanzen Original 380ml',189 ,37 ,N'Mái tóc đẹp luôn vào nếp bồng bềnh là ước mơ nhưng cũng là thách thức của mọi anh em. Ngoài sáp vuốt tóc thì gôm xịt tóc là một sản phẩm rất cần thiết giúp anh em giữ được form tóc hoàn hảo. Gôm xịt tóc Glanzen – sản phẩm chính là “món hời trong tầm giá” tuyệt đối không nên bỏ lỡ.','TH03')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP09','DMCS02',N'Xịt Tạo Kiểu Reuzel Spray Grooming Tonic',453 ,0 ,N'Xịt tạo kiểu Reuzel Spray Grooming Tonic là phiên bản mới nhất của hãng REUZEL HÀ LAN đang dành được sự quan tâm của đông đảo anh em. Được coi là dòng sản phẩm hỗ trợ chủ lực trong tạo kiểu tóc khi sử dụng các dòng pomade reuzel, sản phẩm xịt làm phồng tóc này sẽ giúp định hình kiểu tóc tốt nhất và đem lại độ volume và texture tuyệt vời cho mái tóc!','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP10','DMCS02',N'Xịt Tạo Kiểu Reuzel Spray Grooming Tonic',453 ,0 ,N'Reuzel Spray Grooming Tonic là phiên bản pre styling mới nhất của hãng Reuzel Hà Lan. Sản phẩm đặc biệt phù hợp với anh em sở hữu mái tóc mỏng hoặc thưa, giúp giữ nếp và kiểm soát kiểu tóc hiệu quả mà không làm giảm độ phồng của tóc.','TH05')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP11','DMCS03',N'Máy sấy tóc Furin - Phiên bản 2022',429 ,0 ,N'Tiết kiệm điện năng và thời gian sấy tóc, hỗ trợ tạo kiểu hiệu quả, nhanh chóng chính là những ưu điểm vượt trội giúp máy sấy tóc Furin “chiều lòng” được rất nhiều anh em. Đây chắc chắn là sản phẩm không thể thiếu trong tủ đồ của cánh mày râu để luôn duy trì vẻ ngoài tự tin, thời thượng và cuốn hút.','TH07')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP12','DMCS03',N'Máy sấy tóc Flyco FH1610VN 2200W',359 ,0 ,N'Có thể sấy khô tóc ngắn trong 1 phút, tóc dài trong tầm 6 phút. Có đầu uốn tạo kiểu giúp tập trung nhiệt, cho luồng khí mạnh mẽ, sấy tóc và tạo kiểu dễ dàng, tiết iệm thời gian.','TH07')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP13','DMCS03',N'Combo Tóc Đẹp Máy Sấy Tóc Sharkway + Tinh Dầu DR. MACADAMIA',359 ,46 ,N'Việc sấy tóc tạo kiểu đúng cách quyết định tới 70% độ đẹp của mái tóc đặc biệt nam giới  tóc mỏng, tóc thưa xẹp thì lại càng phải sấy tóc thường xuyên để làm dày và duy trì độ phồng cho tóc. Muốn tóc đẹp thì phải có máy sấy chuẩn. Sở hữu ngay Shark Way - Siêu phẩm máy sấy quái vật công suất 1600W vượt trội về hiệu năng trong tầm giá. Sấy là đẹp, Có máy sấy Shark Way và tận hưởng trải nghiệm tự tạo kiểu tóc tại nhà đẹp chuẩn như bước ra từ Salon','TH07')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP14','DMCS03',N'Máy sấy tóc Furin - Mạnh gấp 10 máy sấy bạn có',455 ,0 ,N'Với những ưu điểm vượt trội về công dụng, tính năng, trong nhiều năm liền, máy sấy tóc Furin luôn lọt top những sản phẩm máy sấy được yêu thích nhất trên thị trường Nhật. Chính vì vậy, anh em hoàn toàn có thể yên tâm về chất lượng cũng như hiệu quả mà máy sấy tóc Furin đem lại. ','TH07')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP15','DMCS03',N'Combo Máy Sấy và Tinh Dầu Farcom',699 ,5 ,N'Máy sấy tóc Furin với công suất lớn gấp 10 lần máy sấy thường, luôn giúp bạn dễ dàng tạo kiểu tóc đẹp ưng ý. Với công nghệ cao đến từ Nhật Bản Furin giúp bảo vệ tóc bạn tối đa trong quá trình sử dụng.','TH07')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP16','DMCS04',N'Sữa Rửa Mặt SNP CICARONIC Làm Dịu, Cấp Ẩm Tức Thì - Chìa Khóa Cho Da Khô Nhạy Cảm',315 , 15 ,N'Sữa rửa mặt dưỡng ẩm cicaronic loại bỏ chất nhờn trên mặt, tẩy sạch bụi bẩn và trang điểm mà không làm cho da bạn bị khô ráp. Cung cấp nguồn năng lượng giúp làm dịu làn da đang bị tăng nhiệt vì bị kích thích đồng thời dưỡng ẩm hiệu quả.','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP17','DMCS04',N'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree - Khắc Tinh Của Mụn - Trị Mụn',229 ,0 ,N'Khói bụi, mồ hôi, bã nhờn... là những nguyên nhân trực tiếp dẫn đến tình trạng bít tắc lỗ chân lông, gây ra các loại mụn ẩn, mụn trứng cá, mụn đầu đen... trên làn da nam giới. Vậy làm thế nào để khắc phục được tình trạng này? Sữa rửa mặt tràm trà Skin&Dr Tea tree với khả năng làm sạch sâu, kháng khuẩn và không gây kích ứng cho da chính là cứu tinh dành cho các “đấng mày râu”.','TH04')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP18','DMCS04',N'Combo Sữa rửa mặt than hoạt tính + 5 Mặt nạ sâm SNP',229 ,21 ,N'Sữa rửa mặt than hoạt tính Skin&Dr với thành phần thiên nhiên, công nghệ lên men hiện đại giúp đánh bay mọi bụi bẩn, dưỡng chất thẩm thấu sâu giúp làn da trắng sáng, khoẻ mạnh, không còn dấu hiệu của mụn.','TH04')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP19','DMCS04',N'Gel Rửa Mặt BHA Cho Da Nhạy Cảm SNP Salicylic Gel Cleanser',480 ,0 ,N'Combo Giảm Mụn, Mờ Nám, Da Trắng Mịn Màng Grinif Nhỏ','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP20','DMCS04',N'Sữa rửa mặt Than hoạt tính SNP mini 25ml - Dành cho những chuyến đi',80 ,0 ,N'Sữa rửa mặt Than hoạt tính SNP sở hữu khả năng làm sạch sâu một cách nhẹ nhàng cho làn da. Với thành phần bột than củi và kết cấu dạng bọt dịu nhẹ, sản phẩm dễ dàng len lỏi vào từng lỗ chân lông, đánh bay mọi bụi bẩn, tế bào chết, bã nhờn còn tồn đọng trên da. Nhờ vậy, làn da anh em trở nên sạch sẽ, thông thoáng và tươi mát rõ rệt ngay sau khi sử dụng sản phẩm. ','TH01')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP21','DMCS05',N'Kem Dưỡng Trắng SNP Vitaronic Gel Cream - Nguồn Năng Lượng Cho Làn Da Tươi Mới',390,0 ,N'Gel dưỡng Vitaronic SNP làm sáng đều mầu da, ngăn ngừa sạm nám là kem dưỡng dạng gel với thành phần chiết xuất từ vitamin thực vật, vitamin C và hyaluronic acid 3 lớp; sản phẩm có công dụng','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP22','DMCS05',N'Serum dưỡng ẩm SNP mini 25ml - Dành cho những chuyến đi', 80,0 ,N'Chịu tác động xấu từ môi trường trong một thời gian dài khiến làn da bị sạm đi và gặp phải các vấn đề về nám tàn nhang. Các vấn đề này gây ảnh hưởng rất lớn tới diện mạo của các đấng mày râu. Khi đó anh em cần sản phẩm chăm sóc làn da từ bên trong giúp da đều màu trắng sáng hơn. 30Shine giới thiệu đến anh em một sản phẩm mang lại hiệu quả rõ rệt - Serum dưỡng ẩm SNP mini Shea Butter Moisture.Hơn thế nữa còn rất nhỏ gọn tiện lợi cho anh em sử dụng cả trong những chuyến đi xa. ','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP23','DMCS05',N'Kem dưỡng da sau cạo râu Reuzel Astringent Foam 200ml',337 ,0 ,N'Reuzel Astringent Foam là dạng Bọt có tác dụng làm sạch làn da của bạn đồng thời làm dịu và săn chắc da. Loại nước hoa hồng không khô, không chứa dầu, dành cho nam giới này thúc đẩy làn da mịn màng, cân bằng bằng cách loại bỏ bụi bẩn còn sót lại và các loại dầu mà không loại bỏ độ ẩm thiết yếu. Kết hợp sản phẩm dành cho nam này vào quy trình chăm sóc da của bạn để giảm đỏ và se khít cả da và lỗ chân lông. Sử dụng chất làm se da mặt này sau khi rửa mặt / cạo râu và trước khi bạn dưỡng ẩm cho da.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP24','DMCS05',N'Combo Tẩy da chết The Plant Base White Truffle + 5 Mặt nạ sâm SNP', 299,17 ,N' White Truffle HD Turn Over Peeling/ Gel Tẩy Tế Bào Chết là sản phẩm nằm trong Bộ sản phẩm White Truffle HD. Sản phẩm giúp làm sạch sâu da mang lại một làn da sạch hoàn hảo để tiến hành các bước dưỡng tiếp theo. Người dùng sẽ cảm nhận ngay một làn da sạch, sáng, nhẵn mịn thấy rõ chỉ sau 2 phút sử dụng sản phẩm.','TH06')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP25','DMCS05',N'Gel Tẩy Da Chết The Plant Base 50ml',249 ,0 ,N'Không chỉ dừng lại ở hiệu quả tẩy da chết thông thường, Gel tẩy da chết The Plant Base còn có khả năng làm sáng đều màu da, mang đến làn da căng mịn chỉ sau 2p sử dụng. Bởi vậy, dòng sản phẩm với tác dụng kép siêu ấn tượng này vẫn luôn là sự lựa chọn hàng đầu của nhiều anh em khi đến với 30Shine Store.','TH06')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP26','DMCS06',N'Kem chống nắng mát lạnh lên tone SNP UV Perfect Tone Up',510 ,0 ,N'Công thức khoa học cho da khỏe đẹp của SNP là da thuần khiết. Sử dụng những thành phần tinh chất thiên nhiên không gây dị ứng và không bao gồm các thành phần gây hại cho da nhạy cảm','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP27','DMCS06',N'Kem Chống Nắng SNP Prep Vitaronic Sun Cream', 390,0 ,N'Kem Chống Nắng SNP Prep Vitaronic Sun Cream Cấp Ẩm Dưỡng Trắng Ngăn Ngừa Nám Da,Chỉ số chống nắng SPF 50+ PA++++,Khối lượng tịnh: 50g','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP28','DMCS06',N'Kem Chống Nắng Air Safe SNP Tinh Chất Trà Xanh 20ml',560,0	 ,N'Với chỉ số SPF50+, PA++++ cùng các dưỡng chất chăm sóc da hữu hiệu, kem chống nắng Air Safe SNP Tinh Chất Trà Xanh không chỉ bảo vệ da tuyệt đối khỏi tác động của ánh nắng mặt trời mà còn giúp nâng tông, dưỡng ẩm da hiệu quả.','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP29','DMCS06',N'Kem Chống Nắng Mát Da Giải Nhiệt UV Perfect Aircool Sun Gel', 510, 0,N'Một sản phẩm đa tác động: chống nắng hiệu quả; giải nhiệt cho làn da; dưỡng da chuyên sâu nhưng lại hoàn toàn mỏng nhẹ, không gây bí da chắc chắn là điều anh em cần trong mùa hè này. Và nếu đang tìm kiếm một sản phẩm như vậy thì kem chống nắng mát da, giải nhiệt UV Perfect Aircool Sun Gel chính là lựa chọn hoàn hảo cho anh em.','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP30','DMCS06',N'Chống Nắng Dạng Xịt Mát Da Cấp Ẩm SNP Aqua Cooling Sun Spray', 480,0 ,N'Một làn da đen sạm, thâm nám, khô ráp... do nhiệt độ và ánh nắng mặt trời chắc hẳn là điều không ai mong muốn. Và xịt chống nắng Aqua Cooling Sun Spray với sức mạnh chống nắng, chống nhăn, dưỡng ẩm chuyên sâu... sẽ là giải pháp hoàn hảo cho anh em.','TH01')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP31','DMCS07',N'Dầu gội dưỡng da đầu kích thích mọc tóc Cafferonic - SNP Prep Cafferonic Shampoo 500ml',382 ,1 ,N'Được chiết xuất từ các hạt cafe tốt. Được sử dụng phương pháp lên men thuần túy suốt 72 tiếng đồng hồ giúp giữ lại các thành phần hữu hiệu từ các hạt cà phê tươi Ethiopia để bảo quản được lâu dài mà không cần các chất bảo quản riêng.','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP32','DMCS07',N'Dầu gội tóc chắc khỏe hàng ngày Reuzel Daily Shampoo',513 , 18,N'Dầu gội tóc chắc khỏe hàng ngày Reuzel Daily Shampoo 100ml','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP33','DMCS07',N'Dầu Gội - Xả - Tắm 3 Trong 1 Reuzel',652 , 0,N'Phần lớn nam giới luôn mong muốn tìm được một sản phẩm đơn giản, tiện lợi cho cuộc sống. Họ luôn lựa chọn sự tối ưu, nhanh gọn, phù hợp với cả những chuyến đi và đời sống sinh hoạt hàng ngày. Và nếu bạn cũng đang tìm kiếm sự tiện lợi đó, Reuzel 3-in-1 Tea Tree chính là sản phẩm dành cho bạn. Với khả năng tích hợp 3 công dụng tắm - gội - xả chỉ trong một sản phẩm, Reuzel 3-in-1 Tea Tree chắc chắn sẽ mang lại cho bạn những trải nghiệm tuyệt vời sau những ngày dài bận rộn.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP34','DMCS07',N'Dầu Gội Tẩy Tế Bào Chết Reuzel Scrub Shampoo',701 ,0 ,N'Với sức mạnh đa chiều: loại bỏ tạp chất, làm sạch dịu nhẹ da đầu; phá vỡ sự kết dính do sử dụng các sản phẩm tạo kiểu và chăm sóc tóc từ sâu bên trong, Reuzel Scrub Shampoo là sự lựa chọn hoàn hảo cho phái mạnh.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP35','DMCS07',N'Dầu gội phục hồi hư tổn Davines Nounou',958 ,0 ,N'Tóc được nuôi dưỡng sâu, bổ sung và làm sạch một cách tinh tế. Với thành phần quan trọng là cà chua Fiaschetto, có đầy đủ các chất chống oxy hóa và Vitamin C, giúp phục hồi và tiếp thêm sinh lực cho tó','TH01')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP36','DMCS08',N'Dầu xả suôn mượt Cafferonic - SNP Prep Cafferonic Hair Treatment 310ml',346 ,10 ,N'Được chiết xuất từ các hạt cafe tốt. Được sử dụng phương pháp lên men thuần túy suốt 72 tiếng đồng hồ giúp giữ lại các thành phần hữu hiệu từ các hạt cà phê tươi Ethiopia để bảo quản được lâu dài mà không cần các chất bảo quản riêng.','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP37','DMCS08',N'Dầu xả cho da nhạy cảm Dr. FORHAIR Phyto Therapy',605 , 0,N'Dầu xả Dr.ForHair Phyto Therapy Treatment giúp phục hồi tóc hư tổn, thành phần không chứa silicone, 98% thành phần có nguồn gốc tự nhiên như Moringa Oleifera Hoa Japonica, giúp phục hồi mái tóc hư tổn và giữ ẩm. Thành phần không chứa silicone thích hợp cả da đầu nhạy cảm.','TH06')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP38','DMCS08',N'Dầu xả Kayan Rich Oil dành cho tóc khô gãy rụng',190 ,18 ,N'Tóc thiếu độ ẩm và dưỡng chất cần thiết là nguyên nhân chính gây ra tình trạng tóc khô xơ và dễ gãy rụng thường thấy ở nam giới. Nguyên nhân chủ yếu do tóc chưa được chăm sóc thường xuyên lại phải chịu nhiều tác động xấu từ môi trường hoặc quá trình làm tóc. Giải pháp cho mái tóc đang gặp tình trạng khô xơ dễ gãy rụng chính là dầu xả Kayan Rich Oil. Sản phẩm bổ sung đủ ẩm và dưỡng chất từ thiên nhiên giúp tóc luôn chắc khỏe, mềm mượt.','TH06')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP39','DMCS08',N'Dầu xả Tigi RESURRECTION 400ml - Phiên bản mới 2021', 410,0 ,N'Dầu xả Tigi Resurrection Super Repair phiên bản 2021 là sản phẩm thứ 3 thuộc dòng dầu gội xả Tigi Bed Head đỏ lừng danh trong làng tóc. Được cải tiến nhiều về công nghệ giúp sản phẩm này có khả năng “hồi sinh” diệu kỳ ngay cả những mái tóc hư tổn nặng nề nhất do hóa chất và tác động môi trường. Dầu xả Tigi đỏ được rất nhiều khách hàng yêu thích và tin dùng, đem lại mái tóc khỏe hơn, đẹp hơn, chắc hơn và mềm mượt hơn chỉ sau lần gội đầu tiên!','TH06')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP40','DMCS08',N'Dầu xả phục hồi tóc Domashnij Doctor 500ml - Chiết xuất men bia và dầu oliu', 168,40 ,N'Biểu hiện dễ thấy nhất của mái tóc hư tổn chính khô xơ và dễ gãy rụng. Dầu xả phục hồi tóc Domashnij Doctor chính là cứu tinh của anh em lúc này. Sản phẩm mang lại hiệu quả phục hồi tóc hư tổn, giải quyết tận gốc vấn đề. Nhờ đó, trả lại mái tóc chắc khỏe, bóng mượt cho anh em.','TH06')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP41','DMCS09',N'Dưỡng Tóc Reuzel Grooming Tonic Giữ Nếp Nhẹ - Độ Bóng Nhẹ - Gốc Nước',453 ,0 ,N'Mái tóc xơ rối, xẹp, mất form sau một ngày làm việc, học tập khiến nhiều anh em mất tự tin. Nhưng với dưỡng tóc Reuzel Grooming Tonic, mái tóc anh em sẽ luôn chuẩn form suốt cả ngày, đồng thời cũng được chăm sóc và bảo vệ đa chiều.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP42','DMCS09',N'Xịt Dưỡng phục hồi và bảo vệ tóc DR. MACADAMIA',118 ,50 ,N'Có lẽ với nhiều anh em, sử dụng xịt dưỡng tóc là một bước không quá được coi trọng trong quy trình chăm sóc mái tóc. Chăm sóc tóc tới 2 3 bước là việc không cần thiết. Sự thật là xịt dưỡng tóc giúp bảo vệ mái tóc khỏi hư tổn cực kỳ tốt. Xịt dưỡng tóc Dr.Sante Macadamia không những giúp chăm sóc, tái tạo cấu trúc cho tóc mà còn bảo vệ tóc ngay tức thì trước tác động của nhiệt hay hóa chất trước khi tạo kiểu','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP43','DMCS09',N'Tinh Dầu Argan Phục Hồi Tóc Hư Tổn',284 ,0 ,N'Nếu đã thử nhiều sản phẩm chăm sóc tóc khác nhau nhưng tóc vẫn chưa đạt đến độ bóng mượt như mong muốn thì anh em nên thử ngay tinh dầu dưỡng Argan của Dr.Sante. Đến từ xứ sở Bắc Âu Ukraine nổi tiếng nhiều người đẹp, sản phẩm dầu Argan này được coi như loại thần dược giúp phục hồi sâu mái tóc hư tổn, giúp tóc chắc khỏe, mượt mà tức thì chỉ sau một lần vuốt!','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP44','DMCS09',N'Tinh Dầu Farcom Seri', 350, 0,N'Mái tóc khô xơ là nỗi ám ảnh của rất nhiều anh em, khiến anh em giảm sút điểm tự tin trước phái đẹp. Nếu đây là vấn đề của bạn thì đừng nên bỏ lỡ tinh dầu dưỡng tóc Farcom Seri đình đám đến từ Hy Lạp! Với công thức dưỡng tóc mới nhất, sản phẩm sẽ nhanh chóng trả lại cho bạn vẻ mượt mà, sáng bóng của mái tóc!','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP45','DMCS09',N'Tinh Dầu Dưỡng Tóc Expertia Professionel Color Glow - Hậu Duệ Mặt Trời',350 ,0 ,N'Giúp tóc thêm bóng mượt, tôn lên màu tóc, tăng cường độ sáng và giữ màu bền hơn. Phục hồi tóc, dưỡng và bảo vệ tóc màu, giúp ngăn ngừa chẻ ngọn, chăm sóc tóc chuyên sâu, giúp mền mại và bóng mượt.','TH02')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP46','DMCS10',N'Sữa tắm mềm da Cafferonic - SNP Prep Cafferonic Body Wash 500ml',346 ,10 ,N'Sữa tắm SNP Prep trắng da mịn màn tự nhiên Cafferonic Body Wash là dòng sản phẩm chăm sóc cơ thể thuộc công ty dược mỹ phẩm SNP Hàn Quốc. Với đặc tính lành tính, dịu nhẹ cho da, các sản phẩm của SNP phù hợp với hầu hết các loại da, kể cả da nhạy cảm. Sữa tắm Cafferonic có tác dụng làm sạch da, dưỡng ẩm và dưỡng trắng tự nhiên, mang đến làm da khỏe mạnh, mịn màn. ','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP47','DMCS10',N'Sữa tắm gội cho nam 2in1 Than hoạt tính Detox Carbon Cool Men 250ml',159 ,40 ,N'Không như chị em phụ nữ thường phức tạp trong việc chăm sóc cơ thể, cánh mày râu ưu tiên sự tối ưu và nhanh gọn. Do đó, các sản phẩm đơn giản, tiện lợi mà vẫn đáp ứng được nhu cầu sẽ luôn nhận nhiều sự quan tâm hơn. Nếu anh em cũng đang tìm kiếm sự tiện lợi đó vậy chắc chắn không nên bỏ qua Sữa tắm gội Than hoạt tính Detox Carbon Cool Men. Mặc dù tích hợp công dụng vừa tắm vừa gội chỉ trong một sản phẩm, ','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP48','DMCS10',N'Sữa Tắm Khử Mùi Perspi-Guard Odour Control Body Wash',250 ,0 ,N'Sữa Tắm Ngăn Mồ Hôi Perspi-Guard Odour Control Body Wash Original Khử Mùi Vượt Trội 200ml là loại sữa tắm có thể giải quyết tận gốc nguyên nhân của vấn đề. Công thức khoa học ban đầu được phát triển để điều trị mùi hôi. Perspi-Guard Odor Control Bodywash được bào chế để làm sạch da và loại bỏ mùi cơ thể từ các vùng thường bị ảnh hưởng, chẳng hạn như nách, bàn chân và bẹn.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP49','DMCS10',N'Gel Tắm Làm Sạch và Khử Mùi 2 in 1 Etiaxil Déo-Douche 24h 200ML', 308,0 ,N'Một trong những điểm ấn tượng làm nên chất đàn ông đó chính là mùi cơ thể. Cơ thể thơm tho sạch sẽ chắc chắn nhận về khối điểm cộng, ngược lại không dành sự quan tâm và chăm sóc đúng cách thì anh em chỉ khiến đối phương chạy xa mà thôi. Gel tắm Etiaxil Déo-Douche 2 in 1 chính là giải pháp tuyệt vời để loại bỏ nhược điểm này. Nhờ cơ chế tác động 2 trong 1 vừa nuôi dưỡng làm sạch sâu da vừa ngăn ngừa mùi suốt 24h, anh em sẽ thêm tự tin và thu hút với mùi hương đậm chất đàn ông của chính mình.','TH05')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP50','DMCS10',N'Xà Phòng Giảm Mụn Cơ Thể Derladie Body Cleansing Bar For Blemish Skin',119 ,21 ,N'Xà Phòng Giảm Mụn Cơ Thể Derladie Body Cleansing Bar For Blemish Skin là giải pháp chăm sóc và điều trị vùng da cơ thể có mụn hiệu quả với thành phần chính chiết xuất từ thiên nhiên, có hiệu quả làm sạch sâu lỗ chân lông, loại bỏ bã nhờn, bụi bẩn, đồng thời kháng viêm, phục hồi da hiệu quả, mang đến làn da sáng mịn và sạch mụn','TH02')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP51','DMCS11',N'Nước Hoa Hồng Cho Da Nhạy Cảm SNP LAB PHA 5%',610 ,0 ,N' Toner bổ sung dưỡng ẩm, loại bỏ tế bào chết.Bám dính trên da tạo lớp màng bảo vệ da.Tái tạo bề mặt da cho da mịn màng.  ','TH01')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP52','DMCS11',N'Tinh Dầu Nước Hoa FOGG',180 ,0 ,N'Một ngoại hình tự tin, tươi sáng cùng mùi hương cuốn hút đầy sức sống sẽ là “bí kíp” giúp cánh mày râu trở nên thật lôi cuốn và đặc biệt trong mắt chị em. Và bộ ba sản phẩm tinh dầu nước hoa FOGG BAB AL SHAMS, FOGG SHASMEEN và FOGG SULTAN là tuyệt chiêu giúp anh em “đánh gục” mọi cô nàng bằng mùi hương thu hút của mình','TH02')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP53','DMCS12',N'Viên uống bổ sung Vitamin tổng hợp DHC Multi Vitamins',130 ,0 ,N'Hàng ngày dưới áp lực công việc và cuộc sống, chúng ta không thể bổ sung đầy đủ dưỡng chất cho cơ thể thông qua thực phẩm hàng ngày. Do đó, sử dụng viên uống DHC Vitamin tổng hợp hàng ngày là cách cung cấp tối ưu dưỡng chất cho cơ thể phát triển khỏe mạnh hàng ngày.','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP54','DMCS12',N'Viên uống bổ sung Vitamin DHC - Vitamin C Hard Capsule',250 ,0 ,N'Thực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule bổ sung vitamin C, vitamin B2 cho cơ thể; hỗ trợ duy trì sức khỏe của da, hỗ trợ giảm thâm da; giúp da sáng mịn. Sản phẩm có thành phần chính là Vitamin C có thể hấp thụ vào cơ thể cao gấp 3 lần sản phẩm thông thường, giúp thúc đẩy quá trình sản sinh năng lượng, tăng cường sức dẻo dai cho cơ thể,','TH02')

INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP55','DMCS13',N'Nước Bổ Gan Giải Rượu Bia Condition - Hộp 10 chai', 440, 12,N'Nước giải rượu Condition xuất hiện từ năm 1992 tại Hàn Quốc, sản phẩm được sử dụng rất phổ biến tại Hàn Quốc cũng như trên toàn thế giới. Condition cũng đã được nhập khẩu về Việt Nam và được rất nhiều người tiêu dùng lựa chọn, công nhận sự tuyệt vời của sản phẩm trong việc giải rượu bia. ','TH02')
INSERT into SANPHAM(MASP,MADM,TENSP,GIA, GIAMGIA,MOTA,MATH) VALUES('SP56','DMCS13',N'Viên Sủi Giảm Stress Dr. Frei Magnesium + B Complex', 149, 0,N'DR. FREI MAGNESIUM + B COMPLEX HỖ TRỢ GIẢM CĂNG THẲNG TUÝP 20 VIÊN SỦI ','TH02')
go
insert into LOAITAIKHOAN values('LTKTC', N'Tiêu chuẩn')
insert into LOAITAIKHOAN values('LTKBS', N'Back & Silver')
insert into LOAITAIKHOAN values('LTKG', N'Gold')
go

insert into KHACHHANG values('KH01',N'Nguyễn văn a', '0971232329')
insert into KHACHHANG values('KH02',N'Nguyễn văn b', '0127809234')
insert into KHACHHANG values('KH03',N'Nguyễn văn c', '0453345342')
insert into KHACHHANG values('KH04',N'Nguyễn văn d', '0345345345')
go

insert into THETV(ID,MAKH,MALTK) values('TTV01','KH01','LTKG')
insert into THETV(ID,MAKH,MALTK) values('TTV02','KH02','LTKTC')
insert into THETV(ID,MAKH,MALTK) values('TTV03','KH03','LTKBS')
insert into THETV(ID,MAKH,MALTK) values('TTV04','KH04','LTKBS')
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
insert into DICHVU values('DV01',N'ShineCombo cắt gội 10 bước',N'Combo “đặc sản” của 30Shine, bạn sẽ cùng chúng tôi trải nghiệm chuyến hành trình tỏa sáng đầy thú vị - nơi mỗi người đàn ông không chỉ cắt tóc mà còn tìm thấy nhiều hơn như thế')
insert into DICHVU values('DV02',N'Gội masssage dưỡng sinh', N'Thư giãn, giải tỏa mệt mỏi ư! Đơn giản, các bạn skinner với bài gội đầu massage dưỡng sinh sẽ giúp anh. Sau cùng stylist sẽ vuốt sáp tạo kiểu để đẹp trai cả ngày')
insert into DICHVU values('DV03',N'Combo Gội nâng cấp thư giãn và sấy vuốt tạo kiểu', N'Gội thư giãn Nâng cấp các động tác massage mới, gấp đôi thời gian cũ, sấy vuốt sáp tạo kiểu, miễn phí giường massage công nghệ mới, sửa rửa mặt nhập khẩu Hàn Quốc')
insert into DICHVU values('DV04',N'Massage cổ, vai, gáy bạc hà cam ngọt',N'Là thần dược giảm đau nhức cơ, xơ cứng, tinh dầu bạc hà mát lạnh kết hợp cùng đôi bàn tay uyển chuyển của skinner với bài massage cổ truyền tác động 12 huyệt đạo điệu nghệ cơn đau mỏi của anh sẽ nhanh chóng tan biến')
go
insert into GIADICHVU values('DV01',100.0)
insert into GIADICHVU values('DV02',40)
insert into GIADICHVU values('DV03',50)
insert into GIADICHVU values('DV04',45)
go

insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV01',N'Pham Văn Đồng', '1976-02-01',0,GETDATE(),'CV01','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV02',N'Nguyễn Văn Nghi', '1998-03-05',0,GETDATE(),'CV03','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV03',N'Trần Thị Nghỉ', '1999-05-12',1,GETDATE(),'CV02','CNGV01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV04',N'Nguyễn Văn Đậu', '1990-05-25',0,GETDATE(),'CV05','CNBT01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV05',N'Tạ Quang Bửu', '1992-08-02',0,GETDATE(),'CV05','CNQ901')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV06',N'Phan Văn Trị', '1988-02-15',0,GETDATE(),'CV05','CNGV01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV07',N'Hoàng Hoa Thám', '1990-04-18',0,GETDATE(),'CV01','CNBT01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV08',N'Nguyễn Thái Sơn', '1987-09-26',0,GETDATE(),'CV01','CNGV01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV09',N'Nguyễn Thượng Hiền', '2000-04-29',1,'2022-10-11','CV02','CNBT01')
insert into NHANVIEN(MANV,TENNV,NAMSINH,GIOITINH,NGAYVAOLAM,MACV,MACN) values('NV10',N'Nguyễn Oanh', '2000-05-01',1,'2022-10-10','CV02','CNGV01')
go

insert into DIADIEM values('DDBT',N'Đia điểm Bình Thạnh',N'số 12 Bạch Đằng, Phường 2, Q.Bình Thạnh, TP Hồ Chí Minh','NV04')
insert into DIADIEM values('DDGV',N'Đia điểm Gò Vấp',N'567 Lê Văn Thọ,Phường 16, Q.Gò Vấp, TP Hồ Chí Minh','NV06')
insert into DIADIEM values('DDQ9',N'Đia điểm Quận 9',N'189 Tây Hòa, P. Phước Long A, Quận 9, TP Hồ Chí Minh','NV05')

go
insert into KHO values('KBT',N'Kho Bình Thạnh','0123456789','DDBT','NV04')
insert into KHO values('KQ9',N'Kho Quận 9','0123456789','DDQ9','NV05')
insert into KHO values('KGV',N'Kho Gò Vấp','0123456789','DDGV','NV06')

go

insert into NHANCUNGCAP(MANCC,TENNCC,DIACHI) values('NCC01',N'Đại lý KissA Skincare',N'376 Võ Văn Tần, Phường 5, Quận 3, Tp.HCM')
insert into NHANCUNGCAP(MANCC,TENNCC,DIACHI) values('NCC02',N'Bici Cosmetic',N'285/26 Cách mạng tháng 8, Phường 12, Q.10, TPHCM – 97C, Lê Quang Định, Phường 14, Q.Bình Thạnh, TPHCM.')
insert into NHANCUNGCAP(MANCC,TENNCC,DIACHI) values('NCC03',N'Bo shop',N'111B Nguyễn Lâm, Phường 3, Q. Bình Thạnh. TP. HCM')
insert into NHANCUNGCAP(MANCC,TENNCC,DIACHI) values('NCC04',N'Nino House',N'57a Tháp Mười, P. 2, Q. 6, TP Hồ Chí Minh')
go
insert into PHIEUNHAPSP values('PNSP01',GETDATE(),'NV04','NCC01','KBT')
insert into PHIEUNHAPSP values('PNSP02',GETDATE(),'NV05','NCC03','KQ9')
insert into PHIEUNHAPSP values('PNSP03',GETDATE(),'NV05','NCC04','KGV')

go

insert into CHITIETPN values('PNSP01','SP01',50,600.0)
insert into CHITIETPN values('PNSP01','SP02',30,300.0)
insert into CHITIETPN values('PNSP01','SP03',70,839.0)
insert into CHITIETPN values('PNSP02','SP01',50,600.0)
insert into CHITIETPN values('PNSP02','SP02',30,300.0)
insert into CHITIETPN values('PNSP02','SP03',70,839.0)
go
insert into LOAIPPTT values('ML01',N'Trực tiếp')
insert into LOAIPPTT values('ML02',N'Online')
go


insert into PHUONGTHUCTHANHTOAN(MAPTTT,TENPTTT,MALOAI) values('MAPT01',N'Tiền mặt','ML01')
insert into PHUONGTHUCTHANHTOAN(MAPTTT,TENPTTT,MALOAI) values('MAPT02',N'Thẻ ngân hàng','ML02')
insert into PHUONGTHUCTHANHTOAN(MAPTTT,TENPTTT,MALOAI) values('MAPT03',N'Ví điện tử','ML02')
insert into PHUONGTHUCTHANHTOAN(MAPTTT,TENPTTT,MALOAI) values('MAPT04',N'Ví điện tử','ML02')
insert into PHUONGTHUCTHANHTOAN(MAPTTT,TENPTTT,MALOAI) values('MAPT05',N'Thẻ tín dụng','ML02')
go
insert into KHUYENMAI values('KM01',N'Không',N'Không')
insert into KHUYENMAI values('KM02',N'Giảm giá 20% khi đơn hàng trên 200k',N'Áp dụng cho đơn hàng trên 200k. Có hiệu khi sử dụng dịch vụ tại cửa hàng. Không áp dụng khi mua hàng.')
insert into KHUYENMAI values('KM03',N'Giảm giá 50k khi đơn hàng trên 500k',N'Áp dụng cho đơn hàng trên 500k. Có hiệu khi sử dụng mua hàng. Không áp dụng khi sử dụng dịch vụ tại cửa hàng.')
insert into KHUYENMAI values('KM04',N'Giảm giá 40% khi đơn hàng trên 1000k',N'Áp dụng cho đơn hàng trên 1000k. Có hiệu khi sử dụng mua hàng hoặc sử dụng dịch vụ.')
insert into KHUYENMAI values('KM05',N'Giảm giá 10% khi đơn hàng trên 200k',N'Áp dụng cho đơn hàng trên 200k. Có hiệu khi sử dụng mua hàng hoặc sử dụng dịch vụ.')
go
insert into PHIEUDATLICH(SOPDL,NGAYDL,GIODL,MANV,MAKH,MACN) values('PDL01',GETDATE(),'12:50','NV01','KH01','CNQ901');
insert into PHIEUDATLICH(SOPDL,NGAYDL,GIODL,MANV,MAKH,MACN) values('PDL02',GETDATE(),'12:51','NV08','KH02','CNGV01');
insert into PHIEUDATLICH(SOPDL,NGAYDL,GIODL,MANV,MAKH,MACN) values('PDL03',GETDATE(),'12:55','NV07','KH03','CNBT01');
insert into PHIEUDATLICH(SOPDL,NGAYDL,GIODL,MANV,MAKH,MACN) values('PDL04',GETDATE(),'12:58','NV08','KH04','CNGV01');
go
insert into CHITIETDICHVU values('DV01','PDL01',1)
insert into CHITIETDICHVU values('DV02','PDL01',1)
insert into CHITIETDICHVU values('DV01','PDL02',1)
insert into CHITIETDICHVU values('DV01','PDL03',1)
insert into CHITIETDICHVU values('DV01','PDL04',1)
/*update CHITIETDICHVU set SOLUONG = 3 where CHITIETDICHVU.MADV = 'DV01' and CHITIETDICHVU.SOPDL = 'PDL04'*/

go
insert into PHIEUSUDUNGDICHVU(SOPSDDV,MADV,SOPDL) values('SPDV01','DV01','PDL01')
insert into PHIEUSUDUNGDICHVU(SOPSDDV,MADV,SOPDL) values('SPDV02','DV01','PDL04')
go
update PHIEUSUDUNGDICHVU set TRANGTHAI = 1 where PHIEUSUDUNGDICHVU.SOPSDDV = 'SPDV01'
update PHIEUSUDUNGDICHVU set TRANGTHAI = 1 where PHIEUSUDUNGDICHVU.SOPSDDV = 'SPDV02'
go
insert into LOAIBAIVIET(MALOAI,TENLOAI) values('MBVDV',N'DICH VU')
insert into LOAIBAIVIET(MALOAI,TENLOAI) values('MBVSP',N'San Pham')
go

insert into PHIEUMUAHANG(SOPHIEUMH,MAKH,MANV) values('PMH01','KH01','NV05')
insert into PHIEUMUAHANG(SOPHIEUMH,MAKH,MANV) values('PMH02','KH02','NV04')
insert into PHIEUMUAHANG(SOPHIEUMH,MAKH,MANV) values('PMH03','KH04','NV06')
go
insert into CHITIETPMH values('PMH01','SP01',40)
insert into CHITIETPMH values('PMH01','SP02',10)
insert into CHITIETPMH values('PMH02','SP01',10)
insert into CHITIETPMH values('PMH03','SP02',10)
go
insert into KHUVUCVANCHUYEN values('KVVC01','Ho Chi Minh')
insert into KHUVUCVANCHUYEN values('KVVC02','Da Nang')
insert into KHUVUCVANCHUYEN values('KVVC03','Han Noi')
go
insert into HANGVANCHUYEN(MAHANGVC,TENHANGVC,DIACHI,MAKV) values('HVC01',N'Giao Hang Nhanh','số 47 Nguyễn Xí,P.26,Q.BT','KVVC01')
insert into HANGVANCHUYEN(MAHANGVC,TENHANGVC,DIACHI,MAKV) values('HVC02',N'Giao Hang Tiết Kiệm','số 61 Nguyễn Gia Trí,P.25,Q.BT','KVVC01')
go


insert into BAIVIET(MAKPKT,TIEUDE,NOIDUNG,MALOAI,MADV) values('MAKPKT01',N'Bùng Nổ',N'Lookbook 21 Kiểu tóc Trend đón 2022 cổ vũ bạn thay đổi, làm mới bản thân để tái tạo năng lượng, tiếp thêm tư tin, củng cố sức mạnh - hướng tới những cơ hội mới, tận hưởng cuộc đời và làm chủ cuộc chơi! Nếu với 2021, “giãn cách xã hội” trở thành keyword, thì 2021 chính là cơ hội để chúng ta thử thách bản thân bằng một cuộc hành trình hoàn toàn mới! Thay đổi diện mạo, tái tạo năng lượng, hướng ra bên ngoài và không ngại dấn thân!','MBVDV','DV01')

insert into BAIVIET(MAKPKT,TIEUDE,NOIDUNG,MALOAI,MADV) values('MAKPKT02',N'Bứt Phá',N'SIDE PART BLACK Shine Combo + Nhuộm đen Kiểu tóc vuốt cao làm sáng bừng gương mặt bạn, tôn lên những đường nét, khắc họa một vẻ ngoài đầy nam tính.CHỈ TỪ 242K','MBVDV','DV01')
go
insert into LOAISUKIEN values('MSK01',N'Grand Opening')
insert into LOAISUKIEN values('MSK02',N'Trúng thưởng')
go

insert into SUKIEN(MASK,TENSUKIEN,NOIDUNGSK,NGAYBATDAU,MADV,MALOAI) values('SK01',N'Grand Opening Tầng 2 Chelse Park',N'Chào mừng 30Shine có thêm một chi nhánh mới. Concept thế hệ mới. Dịch vụ chu chưa từng có.','2022-10-29','DV01','MSK01')
go
insert into PHUCAP values('MAPC01',N'Phụ cấp chức vụ',1000000.0)
insert into PHUCAP values('MAPC02',N'Phụ cấp lao động',500000.0)
insert into PHUCAP values('MAPC03',N'Phụ cấp khu vực',1500000.0)
go
insert into CHITIETLUONG values('MALUONGNV01','MAPC01')
insert into CHITIETLUONG values('MALUONGNV02','MAPC02')
insert into CHITIETLUONG values('MALUONGNV04','MAPC03')
insert into CHITIETLUONG values('MALUONGNV05','MAPC03')
go

/*update HOADON set TRANGTHAI = 1 where HOADON.SOHD = 'SOHDKH022022101510' // SOHD + MAKH + yyyyMMddhh
update HOADON set TRANGTHAI = 1 where HOADON.SOHD = 'SOHDKH042022101510'
update PHIEUGIAOHANG set DIACHI = N'475A Điện Biên Phủ,P.25,Q.BT,TPHCM'

update BINHLUAN set DANHGIA = 3.5, NOIDUNG = N'Hàng sử dụng tốt' where BINHLUAN.MABL = 'MABLSOHDKH022022101510SP01'

select * from PHIEUSUDUNGDICHVU
select * from HOADON
select * from PHIEUMUAHANG
select * from CHITIETPMH
select * from PHIEUGIAOHANG
select * from LICHSUDONHANG
select * from LICHSUDAT
select * from BINHLUAN*/


exec listBranch @BranchName = N'30Shine'
go




