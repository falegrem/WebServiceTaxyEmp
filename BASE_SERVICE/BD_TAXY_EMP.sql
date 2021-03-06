USE [TAXY_EMP]
GO
/****** Object:  Table [dbo].[TB_empresa]    Script Date: 11/16/2012 12:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_empresa](
	[cod_emp] int NOT NULL,
	[raz_soc_emp] [varchar](20) NULL,
	[ruc_emp] [varchar](11) NULL,
 CONSTRAINT [PK__TB_empre__FE22B4FA7F60ED59] PRIMARY KEY CLUSTERED 
(
	[cod_emp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ruta]    Script Date: 11/16/2012 12:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ruta](
	[cod_ruta] int NOT NULL,
	[des_ruta_ini] [varchar](255) NULL,
	[des_ruta_fin] [varchar](255) NULL,
	[costo_ruta] [decimal](12, 2) NULL,
	[disponible] [nchar](10) NULL,
	[activo] [char](1) NULL,
 CONSTRAINT [PK_TB_ruta] PRIMARY KEY CLUSTERED 
(
	[cod_ruta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_user]    Script Date: 11/16/2012 12:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_user](
	[cod_user] int NOT NULL,
	[cod_emp] int NOT NULL,
	[nombre_user] [varchar](20) NULL,
	[dni_user] [varchar](11) NULL,
 CONSTRAINT [PK__TB_user__799599220519C6AF] PRIMARY KEY CLUSTERED 
(
	[cod_user] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_servicio]    Script Date: 11/16/2012 12:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_servicio](
	[cod_servicio] [int] NOT NULL,
	[cod_ruta] int NULL,
	[fec_servicio] [datetime] NULL,
 CONSTRAINT [PK_TB_Servicio] PRIMARY KEY CLUSTERED 
(
	[cod_servicio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_reserva]    Script Date: 11/16/2012 12:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_reserva](
	[cod_reserva] [int] NOT NULL,
	[cod_user] int NULL,
	[cod_servicio] [int] NULL,
	[fec_reserva] [datetime] NULL,
	[costo_ruta] [nchar](10) NULL,
	[est_reserva] [nchar](10) NULL,
 CONSTRAINT [PK_TB_reserva] PRIMARY KEY CLUSTERED 
(
	[cod_reserva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_TB_reserva_TB_servicio1]    Script Date: 11/16/2012 12:07:34 ******/
ALTER TABLE [dbo].[TB_reserva]  WITH CHECK ADD  CONSTRAINT [FK_TB_reserva_TB_servicio1] FOREIGN KEY([cod_servicio])
REFERENCES [dbo].[TB_servicio] ([cod_servicio])
GO
ALTER TABLE [dbo].[TB_reserva] CHECK CONSTRAINT [FK_TB_reserva_TB_servicio1]
GO
/****** Object:  ForeignKey [FK_TB_reserva_TB_user]    Script Date: 11/16/2012 12:07:34 ******/
ALTER TABLE [dbo].[TB_reserva]  WITH CHECK ADD  CONSTRAINT [FK_TB_reserva_TB_user] FOREIGN KEY([cod_user])
REFERENCES [dbo].[TB_user] ([cod_user])
GO
ALTER TABLE [dbo].[TB_reserva] CHECK CONSTRAINT [FK_TB_reserva_TB_user]
GO
/****** Object:  ForeignKey [FK_TB_servicio_TB_ruta1]    Script Date: 11/16/2012 12:07:34 ******/
ALTER TABLE [dbo].[TB_servicio]  WITH CHECK ADD  CONSTRAINT [FK_TB_servicio_TB_ruta1] FOREIGN KEY([cod_ruta])
REFERENCES [dbo].[TB_ruta] ([cod_ruta])
GO
ALTER TABLE [dbo].[TB_servicio] CHECK CONSTRAINT [FK_TB_servicio_TB_ruta1]
GO
/****** Object:  ForeignKey [FK_TB_user_TB_empresa]    Script Date: 11/16/2012 12:07:34 ******/
ALTER TABLE [dbo].[TB_user]  WITH CHECK ADD  CONSTRAINT [FK_TB_user_TB_empresa] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[TB_empresa] ([cod_emp])
GO
ALTER TABLE [dbo].[TB_user] CHECK CONSTRAINT [FK_TB_user_TB_empresa]
GO
