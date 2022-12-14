USE [BoodDonationApp]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [nvarchar](255) NULL,
	[Thoigianhien] [datetime] NULL,
	[Nguoitaohien] [nvarchar](50) NULL,
	[StatusDothien] [int] NULL,
	[Thoigianthemluothien] [datetime] NULL,
	[Thoigianbatdau] [datetime] NULL,
	[Thoigianketthuc] [datetime] NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodDonation]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodDonation](
	[BloodID] [int] IDENTITY(1,1) NOT NULL,
	[Hovaten] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[Phone] [nvarchar](13) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[BatchID] [int] NOT NULL,
	[NhomMau] [nvarchar](50) NULL,
	[Solanhienmau] [int] NULL,
	[CMND] [nvarchar](50) NULL,
	[gioitinh] [int] NULL,
	[IsActive] [int] NULL,
	[IdUser] [int] NOT NULL,
	[CCCD] [nvarchar](50) NULL,
	[Donvicongtac] [nvarchar](100) NULL,
	[IDPhuong] [int] NULL,
	[IDQuan] [int] NULL,
	[IDTinh] [int] NULL,
	[IDQuocGia] [int] NULL,
	[Nest] [nvarchar](50) NULL,
	[sonha] [nvarchar](50) NULL,
	[duong] [nvarchar](50) NULL,
	[truocdayquividatunghienmauchuacau1] [bit] NULL,
	[tamthankinhcau2] [bit] NULL,
	[sutcan4kgcau3] [bit] NULL,
	[noihachkeodaicau4] [bit] NULL,
	[phauthuatcau5] [bit] NULL,
	[xamminhxolocau6] [bit] NULL,
	[duoctruyenmaucau7] [bit] NULL,
	[sudungmatuycau8] [bit] NULL,
	[quanhetinhduccau9] [bit] NULL,
	[quanhetinhducvoinguoidonggioicau10] [bit] NULL,
	[tiemvacxinphongbenhcau11] [bit] NULL,
	[songtrongvungcodichluuhanhcau12] [bit] NULL,
	[bicumhonhucdausotcau13] [bit] NULL,
	[dungthuockhangsinhcau14] [bit] NULL,
	[denkhamsuckhoelamxetnghiemchuarangcau15] [bit] NULL,
	[quivihienladoituongtantatcau16] [bit] NULL,
	[chihiendangnuoiconduoi12thangtuoicau17] [bit] NULL,
	[chidatungcothaihoacsinhconchuacau18] [bit] NULL,
	[ngayhienmaugannhat] [datetime] NULL,
	[doituonghienmau] [nvarchar](max) NULL,
	[hinhthuchienmau] [nvarchar](max) NULL,
	[huyetsacto] [int] NULL,
	[tieucau] [int] NULL,
	[veinkhongdat] [bit] NULL,
	[cannang] [int] NULL,
	[mach] [int] NULL,
	[huyetaptamtruong] [int] NULL,
	[huyetaptamthu] [int] NULL,
	[tinhtranglamsan] [nvarchar](max) NULL,
	[ketluan] [nvarchar](max) NULL,
	[Lydo] [nvarchar](max) NULL,
	[ktvketluan] [nvarchar](max) NULL,
	[HBV] [bit] NULL,
	[HCV] [bit] NULL,
	[HIV] [bit] NULL,
	[Giangmai] [bit] NULL,
	[HBsAg] [bit] NULL,
 CONSTRAINT [PK_BloodDonation] PRIMARY KEY CLUSTERED 
(
	[BloodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodDonation_Detail]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodDonation_Detail](
	[Blood_DetalID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NOT NULL,
	[BloodID] [int] NOT NULL,
	[Thoigianhien] [datetime] NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_BloodDonation_Detail] PRIMARY KEY CLUSTERED 
(
	[Blood_DetalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Log_Time] [datetime] NULL,
	[BloodID] [int] NULL,
	[action] [nvarchar](50) NULL,
	[nguoithaotac] [nvarchar](50) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phuong]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phuong](
	[IDPhuong] [int] NOT NULL,
	[IDQuan] [int] NULL,
	[IDTinh] [int] NULL,
	[MaPhuong] [char](10) NULL,
	[TenP] [nvarchar](50) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPhuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quan]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quan](
	[IDQuan] [int] NOT NULL,
	[IDTinh] [int] NULL,
	[MaQuan] [char](10) NULL,
	[TenQ] [nvarchar](50) NULL,
	[ACTIVE] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[IDQuocGia] [int] IDENTITY(1,1) NOT NULL,
	[MaQG] [char](50) NULL,
	[TenQG] [nvarchar](200) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQuocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[NameRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tinh]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tinh](
	[IDTinh] [int] NOT NULL,
	[MaT] [char](10) NULL,
	[TenT] [nvarchar](50) NULL,
	[ACTIVE] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/20/2022 8:19:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](255) NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Batch] ON 

INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (18, N' hiến máu  22/07/2022', CAST(N'2022-07-22T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-07-22T09:53:15.477' AS DateTime), CAST(N'2022-07-22T09:53:00.000' AS DateTime), CAST(N'2022-07-22T11:53:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (19, N' hiến máu  03/08/2022', CAST(N'2022-08-03T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-01T14:11:08.653' AS DateTime), CAST(N'2022-08-01T15:11:00.000' AS DateTime), CAST(N'2022-08-01T20:16:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (20, N'   hiến máu   01/09/2022', CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-01T14:26:56.913' AS DateTime), CAST(N'2023-08-01T06:25:00.000' AS DateTime), CAST(N'2022-08-01T15:26:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (21, N' hiến máu  03/08/2022', CAST(N'2022-08-03T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-01T15:54:45.783' AS DateTime), CAST(N'2022-08-01T05:54:00.000' AS DateTime), CAST(N'2022-08-01T18:54:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (22, N'   hiến máu   05/08/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-03T08:06:20.807' AS DateTime), CAST(N'2022-08-03T08:06:00.000' AS DateTime), CAST(N'2022-08-03T21:06:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1022, N' hiến máu  17/08/2022', CAST(N'2022-08-17T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-09T14:06:31.203' AS DateTime), CAST(N'2022-08-09T02:06:00.000' AS DateTime), CAST(N'2022-08-09T20:06:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1023, N' hiến máu  30/08/2022', CAST(N'2022-08-30T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-13T13:58:51.467' AS DateTime), CAST(N'2022-08-13T13:58:00.000' AS DateTime), CAST(N'2022-08-13T02:59:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1024, N' hiến máu  29/08/2022', CAST(N'2022-08-29T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-13T14:01:53.063' AS DateTime), CAST(N'2022-08-13T14:01:00.000' AS DateTime), CAST(N'2022-08-13T17:01:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1025, N' hiến máu  23/08/2022', CAST(N'2022-08-23T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-08-13T19:37:15.790' AS DateTime), CAST(N'2022-08-13T19:37:00.000' AS DateTime), CAST(N'2022-08-13T22:40:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1027, N' hienmaus 28/09/2022', CAST(N'2022-09-28T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-09-13T13:50:53.807' AS DateTime), CAST(N'2022-09-13T01:50:00.000' AS DateTime), CAST(N'2022-09-13T17:50:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1028, N' hienmaus 15/09/2022', CAST(N'2022-09-15T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-09-14T09:30:27.697' AS DateTime), CAST(N'2022-09-15T07:29:00.000' AS DateTime), CAST(N'2022-09-15T19:29:00.000' AS DateTime))
INSERT [dbo].[Batch] ([BatchID], [BatchName], [Thoigianhien], [Nguoitaohien], [StatusDothien], [Thoigianthemluothien], [Thoigianbatdau], [Thoigianketthuc]) VALUES (1029, N' hienmaus 20/09/2022', CAST(N'2022-09-20T00:00:00.000' AS DateTime), N'thanhtan', NULL, CAST(N'2022-09-19T16:17:33.433' AS DateTime), CAST(N'2022-09-20T06:17:00.000' AS DateTime), CAST(N'2022-09-20T18:17:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Batch] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodDonation] ON 

INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1063, N'huynh thu thao12312311', CAST(N'1990-11-11' AS Date), N'0914139267', N'128 hải phòng', N'tanoscar2810@gmail.com', 1025, N'0', 1, N'123123123123', 0, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1064, N'Lê Thanh Tân23', CAST(N'1995-01-01' AS Date), N'0166762958', N'128 hải phòng', N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 18, 26, 17, 17, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1065, N'Lê Thanh Tân123', CAST(N'1995-01-01' AS Date), N'0166762958', N'128 hải phòng', N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 17, 26, 17, 16, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1072, N'Lê Thanh Tân', CAST(N'1995-09-05' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 18, 27, NULL, 17, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1073, N'Lê Thanh Tân112312312', CAST(N'1998-01-01' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 0, 1, 1, NULL, NULL, 18, 27, NULL, 17, N'301', N'40', N'ông ích đường', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1074, N'Lê Thanh Tân112312312a', CAST(N'1990-01-01' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 19, 27, NULL, 17, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, NULL, NULL, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1075, N'lê quốc tuấn', CAST(N'1990-01-01' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1027, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 19, 27, NULL, 18, NULL, N'40', N'ông ích đường', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1076, N'Nguyễn huy chương', CAST(N'1986-01-01' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1028, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 17, 27, NULL, 15, N'301', N'40', NULL, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1077, N'TRẦN ĐÌNH NHẬT', CAST(N'1991-09-06' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1028, N'A', 0, N'201785132112', 1, 1, 1, NULL, NULL, 17, 26, NULL, 17, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, 0, NULL, 0, 1, 0, 1, 1, 1, NULL, 0, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1078, N'ĐINH NGỌC BẢO', CAST(N'1989-01-01' AS Date), N'0166762958', NULL, N'tanoscar2810@gmail.com', 1028, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 15, 21, NULL, 12, N'301', N'40', N'ông ích đường', 1, 1, 1, 1, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1079, N'PHẠM VIẾT HUY', CAST(N'1995-09-05' AS Date), N'0166762958', N'301,40,ông ích đường,Phường Thành Công,Huyện Sóc Sơn,Tỉnh Cà Mau,Việt Nam', N'tanoscar2810@gmail.com', 1028, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 14, 16, 96, NULL, N'301', N'40', N'ông ích đường', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1081, N'TRẦN ĐÌNH NHẬT', CAST(N'1991-09-06' AS Date), N'0166762958', NULL, NULL, 1028, N'A', 1, N'201785132112', 1, 1, 1, NULL, NULL, 14, 16, 96, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1082, N'NGUYỄN NGỌC KHÁNH VÂN', CAST(N'1992-01-01' AS Date), N'0166762958', N'Tổ301,Số nhà40,Đườngông ích đường,Phường Đồng Xuân,Huyện Đồng Văn,Tỉnh Bắc Giang,Việt Nam', N'tanoscar2810@gmail.com', 1028, N'A', 0, N'201785132111', 0, 1, 1, NULL, NULL, 16, 26, 24, NULL, N'301', N'40', N'ông ích đường', 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser], [CCCD], [Donvicongtac], [IDPhuong], [IDQuan], [IDTinh], [IDQuocGia], [Nest], [sonha], [duong], [truocdayquividatunghienmauchuacau1], [tamthankinhcau2], [sutcan4kgcau3], [noihachkeodaicau4], [phauthuatcau5], [xamminhxolocau6], [duoctruyenmaucau7], [sudungmatuycau8], [quanhetinhduccau9], [quanhetinhducvoinguoidonggioicau10], [tiemvacxinphongbenhcau11], [songtrongvungcodichluuhanhcau12], [bicumhonhucdausotcau13], [dungthuockhangsinhcau14], [denkhamsuckhoelamxetnghiemchuarangcau15], [quivihienladoituongtantatcau16], [chihiendangnuoiconduoi12thangtuoicau17], [chidatungcothaihoacsinhconchuacau18], [ngayhienmaugannhat], [doituonghienmau], [hinhthuchienmau], [huyetsacto], [tieucau], [veinkhongdat], [cannang], [mach], [huyetaptamtruong], [huyetaptamthu], [tinhtranglamsan], [ketluan], [Lydo], [ktvketluan], [HBV], [HCV], [HIV], [Giangmai], [HBsAg]) VALUES (1083, N'VÕ HUY TOÀN', CAST(N'1995-01-01' AS Date), N'0166762958', N'Tổ301,Số nhà40,Đườngông ích đường,Phường Hòa Thọ Đông,Quận Cẩm Lệ,Thành phố Đà Nẵng,Việt Nam', N'tanoscar2810@gmail.com', 1029, N'A', 0, N'201785132111', 1, 1, 1, NULL, NULL, 44, 6, 48, NULL, N'301', N'40', N'ông ích đường', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BloodDonation] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (1, CAST(N'2022-03-28T16:35:57.920' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (2, CAST(N'2022-03-29T10:59:03.610' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (3, CAST(N'2022-03-29T11:11:00.330' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (4, CAST(N'2022-03-29T11:12:07.673' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (5, CAST(N'2022-03-29T13:03:30.510' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (6, CAST(N'2022-03-29T13:03:44.267' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (7, CAST(N'2022-03-29T13:36:54.117' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (8, CAST(N'2022-03-29T15:57:30.117' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (9, CAST(N'2022-03-29T16:04:27.910' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (10, CAST(N'2022-04-12T07:56:39.713' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (11, CAST(N'2022-04-12T07:57:01.960' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (12, CAST(N'2022-04-12T07:57:13.630' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (13, CAST(N'2022-04-13T08:32:40.723' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (14, CAST(N'2022-04-13T20:58:32.090' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (15, CAST(N'2022-04-13T20:59:22.430' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (16, CAST(N'2022-05-19T08:32:35.783' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (17, CAST(N'2022-05-19T08:33:03.603' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (18, CAST(N'2022-05-19T08:33:25.383' AS DateTime), NULL, N'sửa', N'thanhtan')
INSERT [dbo].[Log] ([LogID], [Log_Time], [BloodID], [action], [nguoithaotac]) VALUES (19, CAST(N'2022-09-14T14:30:49.767' AS DateTime), NULL, N'sửa', N'thanhtan')
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (1, 1, 48, N'	20194    ', N'	Phường Hòa Hiệp Bắc', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (2, 1, 48, N'20195     ', N'	Phường Hòa Hiệp Nam', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (3, 1, 48, N'	20197    ', N'Phường Hòa Khánh Bắc', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (4, 1, 48, N'	20198    ', N'Phường Hòa Khánh Nam', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (5, 1, 48, N'20200     ', N'Phường Hòa Minh', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (6, 2, 48, N'20203     ', N'	Phường Tam Thuận', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (7, 2, 48, N'20206     ', N'Phường Thanh Khê Tây', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (8, 2, 48, N'	20207    ', N'Phường Thanh Khê Đông', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (9, 2, 48, N'20209     ', N'Phường Xuân Hà', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (10, 2, 48, N'	20212    ', N'Phường Tân Chính', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (11, 2, 48, N'	20215    ', N'	Phường Chính Gián', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (12, 2, 48, N'20218     ', N'	Phường Vĩnh Trung', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (13, 2, 48, N'	20221    ', N'Phường Thạc Gián', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (14, 2, 48, N'	20224    ', N'Phường An Khê', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (15, 2, 48, N'	20225    ', N'Phường Hòa Khê', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (16, 3, 48, N'	20227    ', N'Phường Thanh Bình', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (17, 3, 48, N'20230     ', N'Phường Thuận Phước', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (18, 3, 48, N'	20233    ', N'Phường Thạch Thang', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (19, 3, 48, N'	20236    ', N'Phường Hải Châu I', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (20, 3, 48, N'20239     ', N'Phường Hải Châu II', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (21, 3, 48, N'20242     ', N'	Phường Phước Ninh', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (22, 3, 48, N'	20245    ', N'Phường Hòa Thuận Tây', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (23, 3, 48, N'	20246    ', N'Phường Hòa Thuận Đông', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (24, 3, 48, N'20248     ', N'Phường Nam Dương', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (25, 3, 48, N'20251     ', N'Phường Bình Hiên', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (26, 3, 48, N'	20254    ', N'Phường Bình Thuận', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (27, 3, 48, N'20257     ', N'Phường Hòa Cường Bắc', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (28, 3, 48, N'	20258    ', N'Phường Hòa Cường Nam', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (29, 4, 48, N'	20263    ', N'Phường Thọ Quang', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (30, 4, 48, N'	20266    ', N'Phường Nại Hiên Đông', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (31, 4, 48, N'	20269    ', N'Phường Mân Thái', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (32, 4, 48, N'20272     ', N'Phường An Hải Bắc', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (33, 4, 48, N'	20275    ', N'Phường Phước Mỹ', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (34, 4, 48, N'	20278    ', N'Phường An Hải Tây', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (35, 4, 48, N'	20281    ', N'Phường An Hải Đông', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (36, 4, 48, N'20284     ', N'	Phường Mỹ An', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (37, 4, 48, N'	20285    ', N'Phường Khuê Mỹ', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (38, 4, 48, N'20287     ', N'Phường Hoà Quý', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (39, 4, 48, N'20290     ', N'	Phường Hoà Hải', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (40, 5, 48, N'	20260    ', N'Phường Khuê Trung', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (41, 5, 48, N'20305     ', N'	Phường Hòa Phát', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (42, 5, 48, N'	20306    ', N'Phường Hòa An', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (43, 5, 48, N'20311     ', N'Phường Hòa Thọ Tây', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (44, 5, 48, N'20312     ', N'Phường Hòa Thọ Đông', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (45, 5, 48, N'20314     ', N'	Phường Hòa Xuân', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (46, 6, 48, N'	20293    ', N'Xã Hòa Bắc', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (47, 6, 48, N'20296     ', N'Xã Hòa Liên', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (48, 6, 48, N'20299     ', N'Xã Hòa Ninh', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (49, 6, 48, N'20302     ', N'Xã Hòa Sơn', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (50, 6, 48, N'20308     ', N'	Xã Hòa Nhơn', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (51, 6, 48, N'20317     ', N'	Xã Hòa Phú', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (52, 6, 48, N'20320     ', N'Xã Hòa Phong', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (53, 6, 48, N'	20323    ', N'Xã Hòa Châu', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (54, 6, 48, N'20326     ', N'Xã Hòa Tiến', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (55, 6, 48, N'20329     ', N'Xã Hòa Phước', 1)
INSERT [dbo].[Phuong] ([IDPhuong], [IDQuan], [IDTinh], [MaPhuong], [TenP], [active]) VALUES (56, 6, 48, N'20332     ', N'Xã Hòa Khương', 1)
GO
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (1, 48, N'490       ', N'	Quận Liên Chiểu', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (2, 48, N'	491      ', N'Quận Thanh Khê', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (3, 48, N'492       ', N'	Quận Hải Châu', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (4, 48, N'493       ', N'Quận Sơn Trà', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (5, 48, N'494       ', N'Quận Ngũ Hành Sơn', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (6, 48, N'495       ', N'Quận Cẩm Lệ', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (7, 48, N'497       ', N'	Huyện Hòa Vang', 1)
INSERT [dbo].[Quan] ([IDQuan], [IDTinh], [MaQuan], [TenQ], [ACTIVE]) VALUES (8, 48, N'498       ', N'	Huyện Hoàng Sa', 1)
GO
SET IDENTITY_INSERT [dbo].[QuocGia] ON 

INSERT [dbo].[QuocGia] ([IDQuocGia], [MaQG], [TenQG], [active]) VALUES (1, N'VN                                                ', N'Việt Nam', 1)
SET IDENTITY_INSERT [dbo].[QuocGia] OFF
GO
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (2, N'User')
GO
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (1, N'01        ', N'Thành phố Hà Nội', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (2, N'02        ', N'Tỉnh Hà Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (4, N'04        ', N'Tỉnh Cao Bằng', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (6, N'06        ', N'Tỉnh Bắc Kạn', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (8, N'08        ', N'Tỉnh Tuyên Quang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (10, N'10        ', N'Tỉnh Lào Cai', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (11, N'11        ', N'Tỉnh Điện Biên', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (12, N'12        ', N'Tỉnh Lai Châu', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (14, N'14        ', N'Tỉnh Sơn La', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (15, N'15        ', N'Tỉnh Yên Bái', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (17, N'17        ', N'Tỉnh Hoà Bình', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (19, N'19        ', N'Tỉnh Thái Nguyên', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (20, N'20        ', N'Tỉnh Lạng Sơn', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (22, N'22        ', N'Tỉnh Quảng Ninh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (24, N'24        ', N'Tỉnh Bắc Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (25, N'25        ', N'Tỉnh Phú Thọ', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (26, N'26        ', N'Tỉnh Vĩnh Phúc', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (27, N'27        ', N'Tỉnh Bắc Ninh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (30, N'30        ', N'Tỉnh Hải Dương', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (31, N'31        ', N'Thành phố Hải Phòng', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (33, N'33        ', N'Tỉnh Hưng Yên', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (34, N'34        ', N'Tỉnh Thái Bình', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (35, N'35        ', N'Tỉnh Hà Nam', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (36, N'36        ', N'Tỉnh Nam Định', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (37, N'37        ', N'Tỉnh Ninh Bình', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (38, N'38        ', N'Tỉnh Thanh Hóa', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (40, N'40        ', N'Tỉnh Nghệ An', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (42, N'42        ', N'Tỉnh Hà Tĩnh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (44, N'44        ', N'Tỉnh Quảng Bình', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (45, N'45        ', N'Tỉnh Quảng Trị', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (46, N'46        ', N'Tỉnh Thừa Thiên Huế', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (48, N'48        ', N'Thành phố Đà Nẵng', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (49, N'49        ', N'Tỉnh Quảng Nam', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (51, N'51        ', N'Tỉnh Quảng Ngãi', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (52, N'52        ', N'Tỉnh Bình Định', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (54, N'54        ', N'Tỉnh Phú Yên', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (56, N'56        ', N'Tỉnh Khánh Hòa', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (58, N'58        ', N'Tỉnh Ninh Thuận', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (60, N'60        ', N'Tỉnh Bình Thuận', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (62, N'62        ', N'Tỉnh Kon Tum', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (64, N'64        ', N'Tỉnh Gia Lai', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (66, N'66        ', N'Tỉnh Đắk Lắk', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (67, N'67        ', N'Tỉnh Đắk Nông', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (68, N'68        ', N'Tỉnh Lâm Đồng', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (70, N'70        ', N'Tỉnh Bình Phước', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (72, N'72        ', N'Tỉnh Tây Ninh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (74, N'74        ', N'Tỉnh Bình Dương', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (75, N'75        ', N'Tỉnh Đồng Nai', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (77, N'77        ', N'Tỉnh Bà Rịa - Vũng Tàu', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (79, N'79        ', N'Thành phố Hồ Chí Minh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (80, N'80        ', N'Tỉnh Long An', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (82, N'82        ', N'Tỉnh Tiền Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (83, N'83        ', N'Tỉnh Bến Tre', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (84, N'84        ', N'Tỉnh Trà Vinh', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (86, N'86        ', N'Tỉnh Vĩnh Long', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (87, N'87        ', N'Tỉnh Đồng Tháp', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (89, N'89        ', N'Tỉnh An Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (91, N'91        ', N'Tỉnh Kiên Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (92, N'92        ', N'Thành phố Cần Thơ', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (93, N'93        ', N'Tỉnh Hậu Giang', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (94, N'94        ', N'Tỉnh Sóc Trăng', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (95, N'95        ', N'Tỉnh Bạc Liêu', 1)
INSERT [dbo].[Tinh] ([IDTinh], [MaT], [TenT], [ACTIVE]) VALUES (96, N'96        ', N'Tỉnh Cà Mau', 1)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (1, N'thanhtan', N'123', 1)
INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (2, N'lethanhtan', N'123', 2)
INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (4, N'thanhtan123', N'123', 2)
INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (5, N'tan1234', N'123', 2)
INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (6, N'tan12345', N'123', 2)
INSERT [dbo].[User] ([IdUser], [UserName], [Password], [RoleID]) VALUES (7, N'admin', N'123', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[BloodDonation] ADD  CONSTRAINT [DF_BloodDonation_Solanhienmau]  DEFAULT ((0)) FOR [Solanhienmau]
GO
ALTER TABLE [dbo].[BloodDonation] ADD  CONSTRAINT [DF_BloodDonation_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Phuong] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Quan] ADD  DEFAULT ((1)) FOR [ACTIVE]
GO
ALTER TABLE [dbo].[Tinh] ADD  DEFAULT ((1)) FOR [ACTIVE]
GO
ALTER TABLE [dbo].[BloodDonation]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_Batch1] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[BloodDonation] CHECK CONSTRAINT [FK_BloodDonation_Batch1]
GO
ALTER TABLE [dbo].[BloodDonation]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_Tinh] FOREIGN KEY([IDTinh])
REFERENCES [dbo].[Tinh] ([IDTinh])
GO
ALTER TABLE [dbo].[BloodDonation] CHECK CONSTRAINT [FK_BloodDonation_Tinh]
GO
ALTER TABLE [dbo].[BloodDonation]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[BloodDonation] CHECK CONSTRAINT [FK_BloodDonation_User]
GO
ALTER TABLE [dbo].[BloodDonation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_Detail_Batch] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[BloodDonation_Detail] CHECK CONSTRAINT [FK_BloodDonation_Detail_Batch]
GO
ALTER TABLE [dbo].[BloodDonation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_Detail_BloodDonation] FOREIGN KEY([BloodID])
REFERENCES [dbo].[BloodDonation] ([BloodID])
GO
ALTER TABLE [dbo].[BloodDonation_Detail] CHECK CONSTRAINT [FK_BloodDonation_Detail_BloodDonation]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_BloodDonation] FOREIGN KEY([BloodID])
REFERENCES [dbo].[BloodDonation] ([BloodID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_BloodDonation]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
