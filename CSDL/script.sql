USE [master]
GO
/****** Object:  Database [CRM02]    Script Date: 05/02/2019 11:34:12 AM ******/
CREATE DATABASE [CRM02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_walcool', FILENAME = N'D:\HCSDL\CSDL\QL_walcool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_walcool_log', FILENAME = N'D:\HCSDL\CSDL\QL_walcool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRM02] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRM02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRM02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRM02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRM02] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRM02] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CRM02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRM02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRM02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRM02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRM02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRM02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRM02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRM02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRM02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRM02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRM02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRM02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRM02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRM02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRM02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRM02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRM02] SET RECOVERY FULL 
GO
ALTER DATABASE [CRM02] SET  MULTI_USER 
GO
ALTER DATABASE [CRM02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRM02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRM02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRM02] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CRM02] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRM02] SET QUERY_STORE = OFF
GO
USE [CRM02]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Get_MaDonHang_Next]    Script Date: 05/02/2019 11:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Get_MaDonHang_Next](@MaDH VARCHAR(15))
RETURNS VARCHAR(15) 
AS
BEGIN
	SET @MaDH+='%'; 
    DECLARE @MaDH_Next VARCHAR(15)
    SELECT @MaDH_Next = (
        SELECT TOP 1 madonhang
        FROM donhang    
        WHERE madonhang like @MaDH
		ORDER BY madonhang DESC
    )    
	DECLARE  @n INT
	SET @n = CONVERT(INT, RIGHT(@MaDH_Next,3)) +1
	SET @MaDH_Next = LEFT(@MaDH,10) + RIGHT('000'+CONVERT(varchar(3),@n),3)
    RETURN @MaDH_Next
END
GO
/****** Object:  Table [dbo].[chitietdonhang]    Script Date: 05/02/2019 11:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdonhang](
	[madonhang] [varchar](15) NOT NULL,
	[masanpham] [varchar](15) NOT NULL,
	[soluong] [int] NULL,
	[giaban] [int] NULL,
 CONSTRAINT [PK_chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[madonhang] ASC,
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhang]    Script Date: 05/02/2019 11:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang](
	[madonhang] [varchar](15) NOT NULL,
	[makhachhang] [varchar](15) NULL,
	[thanhtien] [int] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaytao] [date] NULL,
 CONSTRAINT [PK_donhang] PRIMARY KEY CLUSTERED 
(
	[madonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hangthanhvien]    Script Date: 05/02/2019 11:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hangthanhvien](
	[mahang] [varchar](15) NOT NULL,
	[tenhang] [nvarchar](50) NULL,
	[dieukienlenhang] [nvarchar](200) NULL,
	[quyenloi] [nvarchar](200) NULL,
 CONSTRAINT [PK_hangthanhvien] PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 05/02/2019 11:34:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makhachhang] [varchar](15) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](100) NULL,
	[dienthoai] [varchar](20) NOT NULL,
	[diemthuong] [int] NULL,
	[mahang] [varchar](15) NULL,
	[ngaydangki] [date] NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[loainguoidung]    Script Date: 05/02/2019 11:34:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loainguoidung](
	[maloai] [varchar](15) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loainguoidung] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 05/02/2019 11:34:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[tendangnhap] [varchar](30) NOT NULL,
	[matkhau] [varchar](50) NULL,
	[tennguoidung] [nvarchar](50) NULL,
	[maloai] [varchar](15) NULL,
	[hinhanh] [varbinary](max) NULL,
 CONSTRAINT [PK_nguoidung] PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 05/02/2019 11:34:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masanpham] [varchar](15) NOT NULL,
	[tensanpham] [nvarchar](50) NULL,
	[dongia] [int] NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_khachhang]    Script Date: 05/02/2019 11:34:13 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_khachhang] ON [dbo].[khachhang]
(
	[dienthoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_chitietdonhang_donhang] FOREIGN KEY([madonhang])
REFERENCES [dbo].[donhang] ([madonhang])
GO
ALTER TABLE [dbo].[chitietdonhang] CHECK CONSTRAINT [FK_chitietdonhang_donhang]
GO
ALTER TABLE [dbo].[chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_chitietdonhang_sanpham] FOREIGN KEY([masanpham])
REFERENCES [dbo].[sanpham] ([masanpham])
GO
ALTER TABLE [dbo].[chitietdonhang] CHECK CONSTRAINT [FK_chitietdonhang_sanpham]
GO
ALTER TABLE [dbo].[donhang]  WITH CHECK ADD  CONSTRAINT [FK_donhang_khachhang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[khachhang] ([makhachhang])
GO
ALTER TABLE [dbo].[donhang] CHECK CONSTRAINT [FK_donhang_khachhang]
GO
ALTER TABLE [dbo].[donhang]  WITH CHECK ADD  CONSTRAINT [FK_donhang_nguoidung] FOREIGN KEY([nguoitao])
REFERENCES [dbo].[nguoidung] ([tendangnhap])
GO
ALTER TABLE [dbo].[donhang] CHECK CONSTRAINT [FK_donhang_nguoidung]
GO
ALTER TABLE [dbo].[khachhang]  WITH CHECK ADD  CONSTRAINT [FK_khachhang_hangthanhvien] FOREIGN KEY([mahang])
REFERENCES [dbo].[hangthanhvien] ([mahang])
GO
ALTER TABLE [dbo].[khachhang] CHECK CONSTRAINT [FK_khachhang_hangthanhvien]
GO
ALTER TABLE [dbo].[nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_nguoidung_loainguoidung] FOREIGN KEY([maloai])
REFERENCES [dbo].[loainguoidung] ([maloai])
GO
ALTER TABLE [dbo].[nguoidung] CHECK CONSTRAINT [FK_nguoidung_loainguoidung]
GO
USE [master]
GO
ALTER DATABASE [CRM02] SET  READ_WRITE 
GO
