USE [BoodDonationApp]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 7/22/2022 10:42:44 AM ******/
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
/****** Object:  Table [dbo].[BloodDonation]    Script Date: 7/22/2022 10:42:44 AM ******/
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
 CONSTRAINT [PK_BloodDonation] PRIMARY KEY CLUSTERED 
(
	[BloodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodDonation_Detail]    Script Date: 7/22/2022 10:42:44 AM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 7/22/2022 10:42:44 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 7/22/2022 10:42:44 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 7/22/2022 10:42:44 AM ******/
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
SET IDENTITY_INSERT [dbo].[Batch] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodDonation] ON 

INSERT [dbo].[BloodDonation] ([BloodID], [Hovaten], [NgaySinh], [Phone], [DiaChi], [Email], [BatchID], [NhomMau], [Solanhienmau], [CMND], [gioitinh], [IsActive], [IdUser]) VALUES (54, N'huynh thu thao', CAST(N'2022-07-22' AS Date), N'0914139267', N'asdasd', N'tanoscar2810@gmail.com', 18, N'o', 0, N'123123123123', 0, 1, 1)
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
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (2, N'User')
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
ALTER TABLE [dbo].[BloodDonation]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonation_Batch1] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[BloodDonation] CHECK CONSTRAINT [FK_BloodDonation_Batch1]
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
