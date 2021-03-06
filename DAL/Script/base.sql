/****** Object:  Database [Medialunas]    Script Date: 24/11/2017 00:25:08 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Medialunas')
BEGIN
CREATE DATABASE [Medialunas]
 CONTAINMENT = NONE
 END
GO
ALTER DATABASE [Medialunas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Medialunas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Medialunas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Medialunas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Medialunas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Medialunas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Medialunas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Medialunas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Medialunas] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Medialunas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Medialunas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Medialunas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Medialunas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Medialunas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Medialunas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Medialunas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Medialunas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Medialunas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Medialunas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Medialunas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Medialunas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Medialunas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Medialunas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Medialunas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Medialunas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Medialunas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Medialunas] SET  MULTI_USER 
GO
ALTER DATABASE [Medialunas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Medialunas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Medialunas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Medialunas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Medialunas]
GO
/****** Object:  StoredProcedure [dbo].[bitacora_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bitacora_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[bitacora_alta]
@usuario varchar(50), @accion varchar(50),@fecha Datetime, @dvh varchar(50) as
begin
insert into bitacora values (@usuario,@accion, @fecha, @dvh);
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[bitacora_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bitacora_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[bitacora_leer]
 as
begin
select * from bitacora
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[digitoverificador_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[digitoverificador_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[digitoverificador_alta]
@tabla varchar(50), @dvv varchar(50), @dvh varchar(50) as
begin
insert into digitoverificador values (@tabla, @dvv, @dvh);
end;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[digitoverificador_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[digitoverificador_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[digitoverificador_leer]
 as
begin
select * from digitoverificador
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[digitoverificador_modificar]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[digitoverificador_modificar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[digitoverificador_modificar]
@tabla varchar(50), @dvv varchar(50), @dvh varchar(50) as
begin
update digitoverificador set dvv = @dvv, DVH = @dvh where tabla = @tabla ;
end;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[item_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[item_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[item_alta]
@pedido int, @producto int, @cantidad int, @precio float as
begin
insert into item values (@pedido,@producto, @cantidad, @precio);
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[item_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[item_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[item_leer]
 as
begin
select * from item
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[panaderia_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[panaderia_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[panaderia_leer]
 as
begin
select * from panaderia
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pedido_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedido_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[pedido_alta]
@panaderia int, @usuario varchar(50)as
begin
insert into pedido values (@panaderia,@usuario);
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pedido_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedido_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[pedido_leer]
 as
begin
select * from pedido
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[permiso_buscar]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permiso_buscar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[permiso_buscar]
@id int as
begin
select * from Permiso where permiso.id = @id;

end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[permiso_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permiso_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[permiso_leer]
 as
begin
select * from permiso
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[producto_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[producto_alta]
@descripcion varchar(50), @imagen varchar(50), @dvh varchar(50) as
begin
insert into producto values (@descripcion, @imagen, @dvh);
end;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[producto_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[producto_leer]
 as
begin
select * from producto
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[producto_modificar]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto_modificar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[producto_modificar]
@id int, @descripcion varchar(50), @imagen varchar(50), @dvh varchar(50) as
begin
update producto set descripcion = @descripcion, imagen = @imagen, DVH = @dvh where id = @id ;
end;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_alta]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_alta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[usuario_alta]
@login varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50), @dvh varchar(50) as
begin
insert into Usuario values (@login,@pass, @nombre,@apellido,@correo, 0, 0,@dvh);
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_buscar]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_buscar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[usuario_buscar]
@login varchar(50) as
begin
select * from usuario where usuario.login = @login;

end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[usuario_leer]
 as
begin
select * from usuario
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_login]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_login]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[usuario_login]
@login varchar(50), @pass varchar(50) as
begin
select * from usuario where usuario.login = @login and usuario.pass = @pass;

end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_modificar]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_modificar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[usuario_modificar]
@login varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50), @intentos int , @habilitado int,  @dvh varchar(50) as
begin
update Usuario set nombre = @nombre, apellido = @apellido, correo = @correo, intentos = @intentos, 
habilitado = @habilitado, DVH = @dvh where login = @login;
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_modificarPass]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_modificarPass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[usuario_modificarPass]
@login varchar(50),@pass varchar(50) as
begin
update Usuario set pass = @pass where login = @login;
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_permiso_leer]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_permiso_leer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[usuario_permiso_leer]
 as
begin
select * from usuario_permiso
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usuario_permisos]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_permisos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[usuario_permisos]
@usuario varchar(50) as
begin
select * from usuario_permiso where Usuario_permiso.usuario = @usuario;
end

' 
END
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[accion] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[DVH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[digitoverificador]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[digitoverificador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[digitoverificador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabla] [varchar](50) NOT NULL,
	[DVV] [varchar](50) NOT NULL,
	[DVH] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item](
	[pedido] [int] NOT NULL,
	[producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[pedido] ASC,
	[producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Panaderia]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Panaderia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Panaderia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ubicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Panaderia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pedido](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[panaderia] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[imagen] [varchar](50) NOT NULL,
	[DVH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[intentos] [int] NOT NULL,
	[habilitado] [int] NOT NULL,
	[DVH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario_permiso]    Script Date: 24/11/2017 00:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario_permiso](
	[usuario] [varchar](50) NOT NULL,
	[permiso] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (16, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A831013603F0 AS DateTime), N'd5325567fce54c5b505ed8aed29d3db649b51266')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (17, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83101747528 AS DateTime), N'b42f4de243c5da4d536f794d3a69972b54a00684')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (18, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83101756730 AS DateTime), N'cc1cccc1f2cd5264a74cdab382e78baa21a0b09b')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (19, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83101762ADF AS DateTime), N'2bb031c691b74ccf2054a9ad1c467a74f80d5baa')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (20, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8310177004A AS DateTime), N'8459a595434b4efec2dce8c423f009c66a8391e8')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (21, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A831017728A7 AS DateTime), N'2e512723a82a364852c1ba97e276a48a98ece37f')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (22, N'palermo', N'Login erroneo intento: 1', CAST(0x0000A83101776823 AS DateTime), N'53b458735ea93572bd2718bb6fc4d4e125e24019')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (23, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83101777557 AS DateTime), N'b301b3be2100c47d7ae0e33eb90dbf1086ff2203')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (24, N'palermo', N'Login erroneo intento: 2', CAST(0x0000A83101797F01 AS DateTime), N'cb1e56a2d8cea55eafa219eba05b7ca3ddca15e3')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (25, N'palermo', N'Login erroneo intento: 3', CAST(0x0000A831017982B2 AS DateTime), N'76ddfe8c89b9273e1c54b659ce8b8253bc0b271c')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (26, N'palermo', N'Login erroneo intento: 4', CAST(0x0000A83101798684 AS DateTime), N'ddb5a8d429ebf325b87a40e291a27605fc71a8ac')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (27, N'palermo', N'Login erroneo intento: 5', CAST(0x0000A8310179898F AS DateTime), N'6c3993ff6f81f02c6543bca9f11b1e55ed93e03d')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (28, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A831018017A6 AS DateTime), N'e582972b38531b2c2ff3b2701d062ba62f6a7a51')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (29, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8310181ADC6 AS DateTime), N'03d03d2bfb775c619d21e08065e7404e54f51d23')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (30, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8310185EB77 AS DateTime), N'893d2f1789be924ba956fd713bc538a1a189d979')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (31, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83101862D4B AS DateTime), N'fe2cffc5c287ddbcc91b604335f82dc357001d16')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (32, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8320005988D AS DateTime), N'1aafe2780b0272fa402b9196d372326141c7c070')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (33, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A832016B765B AS DateTime), N'c6738b7f556d4e44b5e0c5289fdea4cae0ce9adc')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (34, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A832016C53D2 AS DateTime), N'ae2cb10d5cd8f43f4dfbed1029f81a029538cef6')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (35, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A832017275EA AS DateTime), N'0b2bab61ea307d94f9bb442ae74ed022a5652f56')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (36, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A83201727AFD AS DateTime), N'530f24e0c17c4ccd8ce6818d5df2531231ac43c4')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (37, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A83201728757 AS DateTime), N'7387d0c8c0c06f2f163c4f82766d6ac27d86b756')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (38, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8320172F7ED AS DateTime), N'b00dcebb1ca4845685ad32c271ed2a4b6acaaf44')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (39, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A8320172FC8F AS DateTime), N'd9bd68faf60976da03f952fa0307e392cffa771b')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (40, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A83201730A46 AS DateTime), N'779be20e645f1e8facf91b4e63d0dfc29aabe9a9')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (41, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83201742003 AS DateTime), N'36051ce4f8dcd4a11e929fb0116288f70991e810')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (42, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A83201742619 AS DateTime), N'f398fa2fea70413c8d3e9bb52817cb9db0a7ab56')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (43, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A8320174360E AS DateTime), N'd7a05af709cbab800aa9cc285798c300e3ada34c')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (44, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8320174415D AS DateTime), N'7aebf87340a2620c70892d956c61f6bb26ec4e08')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (45, N'webmaster', N'Se realizo Copia de seguridad', CAST(0x0000A8320174682B AS DateTime), N'b2dbd4a5fd6e8041092af9489767e4343a0d9073')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (46, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A8320174DEB0 AS DateTime), N'3e1fdc01fed3c83ffe42a52aba7d37a3d56aed55')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (47, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8320174E26E AS DateTime), N'0f7dd975600a9a214f2c06aa81b9b07e3b07842f')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (48, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A8320174EC86 AS DateTime), N'5920dc171e9678ab2988a069c11cebd57ede8c55')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (49, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8320174F295 AS DateTime), N'22fa6b5adede9a74d6d4e0e8d3964829e4855d6c')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (50, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A83201751070 AS DateTime), N'b7833694bbff0afe0f6499f230b1af5fcb017522')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (51, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A83201751636 AS DateTime), N'4cb8576149873801f93c43825c6fd04b7e04b646')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (52, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A83201756E04 AS DateTime), N'4c11c650e9d560302cd0dc4596dea8781211166b')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (53, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A832017571C0 AS DateTime), N'6bb04fef2e89ba28ffb8aaf0bd278c9b749b8573')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (54, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A83201757DEA AS DateTime), N'cde0d318c46d0dd9d15008b83f3007a5e19d80c5')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (55, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8320177653F AS DateTime), N'd1c55563b5a4ee0639283ab07b69a7d3dba3693d')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (56, N'webmaster', N'Se realizo Copia de seguridad', CAST(0x0000A83201776A98 AS DateTime), N'ebcffcd12e5fc4ab9ee7d0014600cf510236d06f')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (57, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8320177FE17 AS DateTime), N'5b9fef33536f5985c9b3a32766ede15c0cb29bab')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (58, N'administrador', N'Logueo de: Administrador', CAST(0x0000A83201781A3B AS DateTime), N'ad8b000656b3763a7eb7ae8e33ab82fef6c9d0dd')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (59, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A8330175C75B AS DateTime), N'38b643809023919452a4ebc5da72a8c54da4d0d8')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (60, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A8330175CBAF AS DateTime), N'5aa7ee949afe06bba3d904290e287f3fb68f9c52')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (61, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8330175D25A AS DateTime), N'c7c51eb59df7910d398229b10deacde6668a8a46')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (62, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A8330175D9F4 AS DateTime), N'6835ddb11400d6da3c7c9adcd505c68228637a14')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (63, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8330175DFA9 AS DateTime), N'6d8f2566dac04def031822dbea42a1b42c4a9252')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (64, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A8330176F93A AS DateTime), N'ba541ffe01618293fc88fb317d64e975021f472e')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (65, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A8330176FE1D AS DateTime), N'a4b7dcc9a80beb0467eeb831cf3453e36d29a895')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (66, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A833017B55CC AS DateTime), N'94a560a8aef4c9ba62f6d0ce821dd0efa87a5c06')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (67, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A833017B5951 AS DateTime), N'049aa72666845e2b949ebb0a92054d88636a61ee')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (68, N'webmaster', N'Recalculo DV Vertical ', CAST(0x0000A833017B5C1E AS DateTime), N'a041d06600ab915f1fce99a1a1e08fcc5def8aff')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (69, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A833017B5EC5 AS DateTime), N'fa70bfb1e1296448892e4f79544123ea3b253a34')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (70, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A833017B64F7 AS DateTime), N'8e73bac0a87328e13f5b23b006ba37daeeb608da')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (71, N'webmaster', N'Verificación DV Vertical ', CAST(0x0000A833017FDD9E AS DateTime), N'f1655c9e284cf01ed148338995753be476e2be85')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (72, N'webmaster', N'Verificación DV Horizontal', CAST(0x0000A833017FE8C4 AS DateTime), N'4ac30b1b8fb2b9daac5e588e599f62eabc888dcc')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (73, N'webmaster', N'Logueo de: Webmaster', CAST(0x0000A833018041E5 AS DateTime), N'3d899b6f834f4ce78d34e5ed2f41ae3a0026b216')
INSERT [dbo].[Bitacora] ([id], [usuario], [accion], [fecha], [DVH]) VALUES (74, N'webmaster', N'Se realizo Copia de seguridad', CAST(0x0000A83301804C04 AS DateTime), N'a5493af3b4ba76d0da40417add0e0ded0814cd7a')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[digitoverificador] ON 

INSERT [dbo].[digitoverificador] ([id], [tabla], [DVV], [DVH]) VALUES (1, N'Usuario', N'648d32f4333fb7d173c56d7cac7fdfcc0704fa1b', N'74b7d1fd820bfc4ce561f0392f138742f05cdb0d')
INSERT [dbo].[digitoverificador] ([id], [tabla], [DVV], [DVH]) VALUES (3, N'Producto', N'0cab4075ebec894352d6896a952237009e3614a9', N'a2f64c985d08c0c9a9982b81539036e734197ae0')
INSERT [dbo].[digitoverificador] ([id], [tabla], [DVV], [DVH]) VALUES (6, N'Bitacora', N'e4906c5900fb6ef264a3ecc843303869b213c4e9', N'c468dcd0cc1459c12a48af0f418ef98aa2d7f31f')
SET IDENTITY_INSERT [dbo].[digitoverificador] OFF
SET IDENTITY_INSERT [dbo].[Panaderia] ON 

INSERT [dbo].[Panaderia] ([id], [nombre], [ubicacion]) VALUES (1, N'Panaderia 1', N'1')
INSERT [dbo].[Panaderia] ([id], [nombre], [ubicacion]) VALUES (2, N'Panaderia 2', N'2')
INSERT [dbo].[Panaderia] ([id], [nombre], [ubicacion]) VALUES (3, N'Panaderia 3', N'3')
INSERT [dbo].[Panaderia] ([id], [nombre], [ubicacion]) VALUES (4, N'Panaderia 4', N'4')
SET IDENTITY_INSERT [dbo].[Panaderia] OFF
SET IDENTITY_INSERT [dbo].[Permiso] ON 

INSERT [dbo].[Permiso] ([id], [descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Permiso] ([id], [descripcion]) VALUES (2, N'Webmaster')
SET IDENTITY_INSERT [dbo].[Permiso] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id], [descripcion], [imagen], [DVH]) VALUES (1, N'Medialuna', N'1.png', N'4d696ac08ece69700303ccceabaa39b12cae8a63')
INSERT [dbo].[Producto] ([id], [descripcion], [imagen], [DVH]) VALUES (2, N'Vigilante', N'2.png', N'834f94c6053a6c46d40df4c87b681bdca4f06a2d')
INSERT [dbo].[Producto] ([id], [descripcion], [imagen], [DVH]) VALUES (3, N'Tortita Negra', N'3.png', N'4453abbe897d6278d09d0273075bd568d4f4befb')
INSERT [dbo].[Producto] ([id], [descripcion], [imagen], [DVH]) VALUES (4, N'Bolita de Fraile', N'4.png', N'2b6c8e66bd92c15b3320400cc8f3e4c62417756e')
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [login], [pass], [nombre], [apellido], [correo], [intentos], [habilitado], [DVH]) VALUES (1, N'administrador', N'9dbf7c1488382487931d10235fc84a74bff5d2f4', N'juan', N'sanchez', N'juansanchez@gmail.com', 0, 0, N'650cdbd0276e67ca9ed87fe8c93363e9239e9085')
INSERT [dbo].[Usuario] ([id], [login], [pass], [nombre], [apellido], [correo], [intentos], [habilitado], [DVH]) VALUES (3, N'palermo', N'429a95c0a134b81387eb7d4ec9b42ee10b7ad325', N'Martin', N'Palermo', N'palermo@gmail.com', 0, 0, N'211ac7c28ed4e96c3db7f921323b3ebc76439af5')
INSERT [dbo].[Usuario] ([id], [login], [pass], [nombre], [apellido], [correo], [intentos], [habilitado], [DVH]) VALUES (2, N'webmaster', N'50f3f01caa053693ce619d596e14b0ff3901ab49', N'roberto', N'piombi', N'robertopiombi@gmail.com', 0, 0, N'76b1de50a1573565c55b5bb11b7ed0b3dba2fc2b')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[Usuario_permiso] ([usuario], [permiso]) VALUES (N'administrador', 1)
INSERT [dbo].[Usuario_permiso] ([usuario], [permiso]) VALUES (N'webmaster', 2)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Pedido]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Pedido] FOREIGN KEY([pedido])
REFERENCES [dbo].[Pedido] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Pedido]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Pedido]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Producto] FOREIGN KEY([producto])
REFERENCES [dbo].[Producto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Panaderia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Panaderia] FOREIGN KEY([panaderia])
REFERENCES [dbo].[Panaderia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Panaderia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Panaderia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([login])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_usuario_permiso_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_permiso]'))
ALTER TABLE [dbo].[Usuario_permiso]  WITH CHECK ADD  CONSTRAINT [FK_usuario_permiso_Permiso] FOREIGN KEY([permiso])
REFERENCES [dbo].[Permiso] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_usuario_permiso_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_permiso]'))
ALTER TABLE [dbo].[Usuario_permiso] CHECK CONSTRAINT [FK_usuario_permiso_Permiso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_usuario_permiso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_permiso]'))
ALTER TABLE [dbo].[Usuario_permiso]  WITH CHECK ADD  CONSTRAINT [FK_usuario_permiso_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([login])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_usuario_permiso_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_permiso]'))
ALTER TABLE [dbo].[Usuario_permiso] CHECK CONSTRAINT [FK_usuario_permiso_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Medialunas] SET  READ_WRITE 
GO
