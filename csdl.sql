USE [master]
GO
/****** Object:  Database [QL_VE_BUS_HALAN]    Script Date: 1/20/2022 11:10:10 AM ******/
CREATE DATABASE [QL_VE_BUS_HALAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_VE_BUS_HALAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QL_VE_BUS_HALAN.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_VE_BUS_HALAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QL_VE_BUS_HALAN_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_VE_BUS_HALAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET  MULTI_USER 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QL_VE_BUS_HALAN]
GO
/****** Object:  Table [dbo].[BaoCaoBanVe]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaoCaoBanVe](
	[mabaocao] [char](10) NOT NULL,
	[maNV] [char](10) NOT NULL,
	[matuyen] [char](10) NOT NULL,
	[ngaylap] [date] NOT NULL CONSTRAINT [DF_HoaDonBanVe_ngaylap]  DEFAULT (getdate()),
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[mabaocao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietBaoCao]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietBaoCao](
	[mabaocao] [char](10) NOT NULL,
	[maloaive] [char](10) NOT NULL,
	[soluong] [int] NULL,
	[dongiaban] [money] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[mabaocao] ASC,
	[maloaive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietVeThang]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietVeThang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maVe] [char](10) NOT NULL,
	[ngaymua] [date] NULL CONSTRAINT [DF_ChiTietVeThang_ngaymua_1]  DEFAULT (getdate()),
	[hansudung] [char](10) NOT NULL,
 CONSTRAINT [PK_ChiTietVeThang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [char](10) NOT NULL,
	[tenKH] [nvarchar](30) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nchar](3) NULL,
	[diachi] [nvarchar](50) NULL,
	[noilamviec] [nvarchar](50) NULL,
	[sdt] [varchar](20) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiVe](
	[maloai] [char](10) NOT NULL,
	[dongia] [money] NULL,
 CONSTRAINT [PK_LoaiVe] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[id] [char](10) NOT NULL,
	[maquyen] [char](10) NOT NULL,
	[tennguoidung] [nvarchar](50) NOT NULL,
	[tendangnhap] [char](20) NOT NULL,
	[matkhau] [char](20) NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [char](10) NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nvarchar](3) NULL,
	[diachi] [nvarchar](50) NULL,
	[cmnd] [varchar](20) NULL,
	[sdt] [varchar](20) NULL,
	[chucvu] [nvarchar](20) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[maquyen] [char](10) NOT NULL,
	[tenquyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[maquyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TuyenXe]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TuyenXe](
	[matuyen] [char](10) NOT NULL,
	[tentuyen] [nvarchar](50) NULL,
	[giohoatdong] [nvarchar](20) NULL,
	[tansuathoatdong] [nvarchar](20) NULL,
 CONSTRAINT [PK_TuyenXe] PRIMARY KEY CLUSTERED 
(
	[matuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VeThang]    Script Date: 1/20/2022 11:10:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VeThang](
	[maVe] [char](10) NOT NULL,
	[maKH] [char](10) NOT NULL,
	[maloai] [char](10) NOT NULL,
	[matuyen] [char](10) NOT NULL,
	[lotrinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_VeThang_1] PRIMARY KEY CLUSTERED 
(
	[maVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc01      ', N'px04      ', N'04        ', CAST(N'2021-01-04' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc02      ', N'px02      ', N'03        ', CAST(N'2022-01-13' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc03      ', N'px03      ', N'03        ', CAST(N'2022-01-13' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc04      ', N'tt01      ', N'04        ', CAST(N'2021-12-30' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc05      ', N'tt02      ', N'01        ', CAST(N'2021-05-29' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc06      ', N'px01      ', N'06        ', CAST(N'2022-01-13' AS Date))
INSERT [dbo].[BaoCaoBanVe] ([mabaocao], [maNV], [matuyen], [ngaylap]) VALUES (N'bc07      ', N'px05      ', N'04        ', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc01      ', N'VN10      ', 32, 10.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc01      ', N'VN13      ', 50, 13.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc01      ', N'VN15      ', 48, 15.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc01      ', N'VN18      ', 25, 18.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc01      ', N'VN5       ', 44, 5.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc02      ', N'VN10      ', 33, 10.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc02      ', N'VN15      ', 66, 25.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc02      ', N'VN18      ', 33, 18.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc03      ', N'VN13      ', 41, 13.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc03      ', N'VN18      ', 43, 18.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc03      ', N'VN20      ', 23, 20.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc03      ', N'VN5       ', 34, 5.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc04      ', N'VT200     ', 10, 200.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc04      ', N'VT240     ', 23, 240.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc04      ', N'VT270     ', 5, 270.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc04      ', N'VT380     ', 15, 380.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc04      ', N'VT400     ', 2, 400.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT200     ', 9, 200.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT270     ', 24, 270.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT290     ', 14, 290.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT320     ', 16, 320.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT380     ', 3, 380.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc05      ', N'VT400     ', 0, 400.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN10      ', 55, 10.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN13      ', 34, 13.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN15      ', 23, 15.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN18      ', 34, 18.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN20      ', 32, 20.0000)
INSERT [dbo].[ChiTietBaoCao] ([mabaocao], [maloaive], [soluong], [dongiaban]) VALUES (N'bc06      ', N'VN5       ', 24, 5.0000)
SET IDENTITY_INSERT [dbo].[ChiTietVeThang] ON 

INSERT [dbo].[ChiTietVeThang] ([id], [maVe], [ngaymua], [hansudung]) VALUES (1, N'mv02      ', CAST(N'2022-01-13' AS Date), N'01/2022   ')
INSERT [dbo].[ChiTietVeThang] ([id], [maVe], [ngaymua], [hansudung]) VALUES (2, N'mv11      ', CAST(N'2021-11-30' AS Date), N'12/2021   ')
INSERT [dbo].[ChiTietVeThang] ([id], [maVe], [ngaymua], [hansudung]) VALUES (3, N'mv04      ', CAST(N'2022-01-13' AS Date), N'01/2021   ')
INSERT [dbo].[ChiTietVeThang] ([id], [maVe], [ngaymua], [hansudung]) VALUES (4, N'mv12      ', CAST(N'2019-04-29' AS Date), N'5/2019    ')
SET IDENTITY_INSERT [dbo].[ChiTietVeThang] OFF
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh01      ', N'Trần Thị Duyên', CAST(N'2000-08-01' AS Date), N'nữ ', N'Phúc Thuận', N'Điềm Thụy', N'0923738382')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh02      ', N'Lò Thị H', CAST(N'1987-05-06' AS Date), N'nữ ', N'Phúc Thuận', N'SamSung', N'0936453321')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh03      ', N'Hoàng Văn A', CAST(N'1999-01-02' AS Date), N'nam', N'Bắc Sơn', N'DHKTCN', N'0928378333')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh04      ', N'Nguyễn Văn B', CAST(N'2000-04-06' AS Date), N'nam', N'Bắc Sơn', N'Sam Sung', N'0329487334')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh05      ', N'Vũ Văn D', CAST(N'1993-04-12' AS Date), N'nam', N'Sông Công', N'DHCNTT', N'0923848738')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh06      ', N'Trần Văn T', CAST(N'1999-03-11' AS Date), N'nam', N'PY', N'DHKTCN', N'0924746399')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh07      ', N'Nguyễn Thị N', CAST(N'1991-03-04' AS Date), N'nữ ', N'PT', N'SamSung ', N'0345544666')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh08      ', N'Lê Thúy N', CAST(N'1995-09-04' AS Date), N'nữ ', N'Võ Nhai', N'DHKTCN', N'0234653267')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh09      ', N'Vương Thu H', CAST(N'1889-01-04' AS Date), N'nữ ', N'Phú Lương', N'DHKTCN', N'0272543551')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [ngaysinh], [gioitinh], [diachi], [noilamviec], [sdt]) VALUES (N'kh10      ', N'Trần Tuấn A', CAST(N'1888-04-04' AS Date), N'nam', N'Phú Lương', N'DHKTCN', N'0923743647')
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN10      ', 10.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN13      ', 13.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN15      ', 15.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN18      ', 18.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN20      ', 20.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VN5       ', 5.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT200     ', 200.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT240     ', 240.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT270     ', 270.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT290     ', 290.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT320     ', 300.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT380     ', 380.0000)
INSERT [dbo].[LoaiVe] ([maloai], [dongia]) VALUES (N'VT400     ', 400.0000)
INSERT [dbo].[NguoiDung] ([id], [maquyen], [tennguoidung], [tendangnhap], [matkhau]) VALUES (N'id0002    ', N'user1     ', N'Lò Văn B', N'boss                ', N'boss1               ')
INSERT [dbo].[NguoiDung] ([id], [maquyen], [tennguoidung], [tendangnhap], [matkhau]) VALUES (N'id001     ', N'admin     ', N'Trần Thị Duyên', N'duyen54kmt          ', N'duyen123            ')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px01      ', N'Hoàng Thị Hà', CAST(N'2000-01-01' AS Date), N'nữ', N'TN', N'093843932', N'0939832237', N'Phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px02      ', N'Hà Văn Hoàng', CAST(N'1999-03-04' AS Date), N'nam', N'PL', N'093499999', N'0384663829', N'Phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px03      ', N'Nguyễn Văn Tùng', CAST(N'1979-04-05' AS Date), N'nam', N'VN', N'093874847', N'0236764834', N'Phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px04      ', N'Nguyễn Văn A', CAST(N'1989-09-05' AS Date), N'nam', N'TN', N'094854842', N'0949483273', N'Phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px05      ', N'Hồ Ngọc C', CAST(N'1993-01-14' AS Date), N'nam', N'VN', N'092833378', N'0919822233', N'phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'px06      ', N'Hoàng Thị T', CAST(N'2002-01-04' AS Date), N'nữ', N'TN', N'093846663', N'0133748829', N'phụ xe')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'tt01      ', N'Trần Bá Ba', CAST(N'1990-07-06' AS Date), N'nam', N'TN', N'099233489', N'0993847847', N'Thanh tra')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaysinh], [gioitinh], [diachi], [cmnd], [sdt], [chucvu]) VALUES (N'tt02      ', N'Hoàng Văn H', CAST(N'1994-01-04' AS Date), N'nam', N'PL', N'099489833', N'0837646733', N'Thanh tra')
INSERT [dbo].[Quyen] ([maquyen], [tenquyen]) VALUES (N'admin     ', N'Quản trị viên')
INSERT [dbo].[Quyen] ([maquyen], [tenquyen]) VALUES (N'user1     ', N'Nhân viên kiểm vé')
INSERT [dbo].[Quyen] ([maquyen], [tenquyen]) VALUES (N'user2     ', N'NV bán vé tháng')
INSERT [dbo].[TuyenXe] ([matuyen], [tentuyen], [giohoatdong], [tansuathoatdong]) VALUES (N'01        ', N'Tân Long - Phố Nỷ', N'6h-21h', N'15p/chuyến')
INSERT [dbo].[TuyenXe] ([matuyen], [tentuyen], [giohoatdong], [tansuathoatdong]) VALUES (N'03        ', N'Chợ Thái - Ký Phú', N'6h-21h', N'30p/chuyến')
INSERT [dbo].[TuyenXe] ([matuyen], [tentuyen], [giohoatdong], [tansuathoatdong]) VALUES (N'04        ', N'Đồng Hỷ - Phố Nỷ', N'6-21h', N'30p/chuyến')
INSERT [dbo].[TuyenXe] ([matuyen], [tentuyen], [giohoatdong], [tansuathoatdong]) VALUES (N'06        ', N'Thái Nguyên - Định Hóa', N'6h-21h', N'30p/chuyến')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv01      ', N'kh02      ', N'VT240     ', N'03        ', N'Quyết Thắng-TP')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv02      ', N'kh01      ', N'VT320     ', N'04        ', N'Thái Nguyên-Ngã 4 Phổ Yên')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv03      ', N'kh05      ', N'VT380     ', N'01        ', N'Thái Nguyên-Phố Nỷ')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv04      ', N'kh04      ', N'VT200     ', N'01        ', N'Thái Nguyên-Quá Tải')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv05      ', N'kh03      ', N'VT320     ', N'01        ', N'Tân Long- Phố Cò')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv06      ', N'kh06      ', N'VT290     ', N'04        ', N'Đồng Hỷ-KCN Sông Công')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv07      ', N'kh08      ', N'VT400     ', N'01        ', N'Tân Long-Phố Nỷ')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv08      ', N'kh09      ', N'VT270     ', N'03        ', N'UB Quyết Thắng-Đại Từ')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv09      ', N'kh07      ', N'VT240     ', N'01        ', N'Quyết Thắng-TP')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv10      ', N'kh10      ', N'VT320     ', N'04        ', N'Đồng Hỷ-Phố Cò')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv11      ', N'kh01      ', N'VT320     ', N'01        ', N'Tân Long- Phố Cò')
INSERT [dbo].[VeThang] ([maVe], [maKH], [maloai], [matuyen], [lotrinh]) VALUES (N'mv12      ', N'kh06      ', N'VT240     ', N'01        ', N'Quyết Thắng - TP')
ALTER TABLE [dbo].[BaoCaoBanVe]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BaoCaoBanVe] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietBaoCao]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([mabaocao])
REFERENCES [dbo].[BaoCaoBanVe] ([mabaocao])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietBaoCao] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietBaoCao]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_LoaiVe] FOREIGN KEY([maloaive])
REFERENCES [dbo].[LoaiVe] ([maloai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietBaoCao] CHECK CONSTRAINT [FK_ChiTietHoaDon_LoaiVe]
GO
ALTER TABLE [dbo].[ChiTietVeThang]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_VeThang] FOREIGN KEY([maVe])
REFERENCES [dbo].[VeThang] ([maVe])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietVeThang] CHECK CONSTRAINT [FK_HopDong_VeThang]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_Quyen] FOREIGN KEY([maquyen])
REFERENCES [dbo].[Quyen] ([maquyen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_Quyen]
GO
ALTER TABLE [dbo].[VeThang]  WITH CHECK ADD  CONSTRAINT [FK_VeThang_KhachHang] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VeThang] CHECK CONSTRAINT [FK_VeThang_KhachHang]
GO
ALTER TABLE [dbo].[VeThang]  WITH CHECK ADD  CONSTRAINT [FK_VeThang_LoaiVe] FOREIGN KEY([maloai])
REFERENCES [dbo].[LoaiVe] ([maloai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VeThang] CHECK CONSTRAINT [FK_VeThang_LoaiVe]
GO
ALTER TABLE [dbo].[VeThang]  WITH CHECK ADD  CONSTRAINT [FK_VeThang_TuyenXe] FOREIGN KEY([matuyen])
REFERENCES [dbo].[TuyenXe] ([matuyen])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VeThang] CHECK CONSTRAINT [FK_VeThang_TuyenXe]
GO
USE [master]
GO
ALTER DATABASE [QL_VE_BUS_HALAN] SET  READ_WRITE 
GO
