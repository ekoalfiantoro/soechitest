Create database TestSoechi
GO

USE [TestSoechi]
GO
/****** Object:  Table [dbo].[Satuan]    Script Date: 3/9/2023 20:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Satuan](
	[Satuan] [varchar](20) NOT NULL,
	[Rate] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Satuan] ([Satuan], [Rate]) VALUES (N'PCS', 1)
INSERT [dbo].[Satuan] ([Satuan], [Rate]) VALUES (N'Lusin', 12)
INSERT [dbo].[Satuan] ([Satuan], [Rate]) VALUES (N'Box', 24)
