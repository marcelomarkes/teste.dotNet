USE [db_biblioteca]
GO
/****** Object:  Table [dbo].[tb_autor]    Script Date: 08/12/2018 20:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_autor](
	[au_cod] [int] NOT NULL,
	[au_nome] [varchar](50) NOT NULL,
	[au_contato] [varchar](11) NULL,
	[au_email] [varchar](50) NULL,
 CONSTRAINT [PK_tb_autor] PRIMARY KEY CLUSTERED 
(
	[au_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_categoria]    Script Date: 08/12/2018 20:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_categoria](
	[ca_cod] [int] NOT NULL,
	[ca_nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_categoria] PRIMARY KEY CLUSTERED 
(
	[ca_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_editora]    Script Date: 08/12/2018 20:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_editora](
	[ed_cod] [int] NOT NULL,
	[ed_nome] [varchar](50) NOT NULL,
	[ed_contato] [varchar](11) NOT NULL,
 CONSTRAINT [PK_tb_editora] PRIMARY KEY CLUSTERED 
(
	[ed_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_empresa]    Script Date: 08/12/2018 20:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_empresa](
	[em_cod] [int] NOT NULL,
	[em_nome] [varchar](50) NOT NULL,
	[em_contato] [varchar](11) NOT NULL,
 CONSTRAINT [PK_tb_empresa] PRIMARY KEY CLUSTERED 
(
	[em_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_livro]    Script Date: 08/12/2018 20:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_livro](
	[li_cod] [int] NOT NULL,
	[li_nomliv] [varchar](50) NOT NULL,
	[li_edicao] [varchar](50) NULL,
	[li_colecao] [varchar](50) NULL,
	[li_ano] [date] NULL,
	[li_peso] [decimal](18, 0) NULL,
	[li_medida] [int] NULL,
 CONSTRAINT [PK_tb_livro] PRIMARY KEY CLUSTERED 
(
	[li_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 08/12/2018 20:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[us_cod] [int] NOT NULL,
	[us_nome] [varchar](50) NOT NULL,
	[us_senha] [varchar](10) NULL,
 CONSTRAINT [PK_tb_usuario] PRIMARY KEY CLUSTERED 
(
	[us_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_autor]  WITH CHECK ADD  CONSTRAINT [FK_tb_autor_tb_usuario] FOREIGN KEY([au_cod])
REFERENCES [dbo].[tb_usuario] ([us_cod])
GO
ALTER TABLE [dbo].[tb_autor] CHECK CONSTRAINT [FK_tb_autor_tb_usuario]
GO
ALTER TABLE [dbo].[tb_categoria]  WITH CHECK ADD  CONSTRAINT [FK_tb_categoria_tb_usuario] FOREIGN KEY([ca_cod])
REFERENCES [dbo].[tb_usuario] ([us_cod])
GO
ALTER TABLE [dbo].[tb_categoria] CHECK CONSTRAINT [FK_tb_categoria_tb_usuario]
GO
ALTER TABLE [dbo].[tb_editora]  WITH CHECK ADD  CONSTRAINT [FK_tb_editora_tb_usuario] FOREIGN KEY([ed_cod])
REFERENCES [dbo].[tb_usuario] ([us_cod])
GO
ALTER TABLE [dbo].[tb_editora] CHECK CONSTRAINT [FK_tb_editora_tb_usuario]
GO
ALTER TABLE [dbo].[tb_livro]  WITH CHECK ADD  CONSTRAINT [FK_tb_livro_tb_autor] FOREIGN KEY([li_cod])
REFERENCES [dbo].[tb_autor] ([au_cod])
GO
ALTER TABLE [dbo].[tb_livro] CHECK CONSTRAINT [FK_tb_livro_tb_autor]
GO
ALTER TABLE [dbo].[tb_livro]  WITH CHECK ADD  CONSTRAINT [FK_tb_livro_tb_categoria] FOREIGN KEY([li_cod])
REFERENCES [dbo].[tb_categoria] ([ca_cod])
GO
ALTER TABLE [dbo].[tb_livro] CHECK CONSTRAINT [FK_tb_livro_tb_categoria]
GO
ALTER TABLE [dbo].[tb_livro]  WITH CHECK ADD  CONSTRAINT [FK_tb_livro_tb_editora] FOREIGN KEY([li_cod])
REFERENCES [dbo].[tb_editora] ([ed_cod])
GO
ALTER TABLE [dbo].[tb_livro] CHECK CONSTRAINT [FK_tb_livro_tb_editora]
GO
ALTER TABLE [dbo].[tb_livro]  WITH CHECK ADD  CONSTRAINT [FK_tb_livro_tb_usuario] FOREIGN KEY([li_cod])
REFERENCES [dbo].[tb_usuario] ([us_cod])
GO
ALTER TABLE [dbo].[tb_livro] CHECK CONSTRAINT [FK_tb_livro_tb_usuario]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_empresa] FOREIGN KEY([us_cod])
REFERENCES [dbo].[tb_empresa] ([em_cod])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_empresa]
GO
