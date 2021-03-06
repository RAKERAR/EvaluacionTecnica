USE [master]
GO
/****** Object:  Database [DB_Banco]    Script Date: 29/01/2017 10:24:27 p. m. ******/
CREATE DATABASE [DB_Banco]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Banco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\DB_Banco.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_Banco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\DB_Banco_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_Banco] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Banco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Banco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Banco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Banco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Banco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Banco] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Banco] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Banco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Banco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Banco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Banco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Banco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Banco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Banco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Banco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Banco] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Banco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Banco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Banco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Banco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Banco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Banco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Banco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Banco] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Banco] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Banco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Banco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Banco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Banco] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_Banco] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_Banco]
GO
/****** Object:  Table [dbo].[T_Cliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](150) NOT NULL,
	[Nacionalidad] [varchar](50) NULL,
	[NumTarjeta] [numeric](18, 0) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Id_Estado] [int] NULL,
	[CodigoPostal] [numeric](10, 0) NULL,
	[Id_Sexo] [int] NOT NULL,
	[Id_EdoCivil] [int] NOT NULL,
	[Celular] [varchar](15) NULL,
	[Telefono] [varchar](15) NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Edad] [int] NULL,
	[FechaRegistro] [date] NULL,
	[Id_Ejecutivo] [varchar](50) NULL,
	[SaldoInicial] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_T_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EdoCivil]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EdoCivil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_T_EdoCivil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Estado]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Estado](
	[Id] [int] NOT NULL,
	[Estado] [varchar](100) NULL,
 CONSTRAINT [PK_T_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MovimientoCuenta]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MovimientoCuenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NULL,
	[NumCuenta] [numeric](18, 0) NULL,
	[Id_TipoMovimiento] [int] NOT NULL,
	[Importe] [numeric](18, 2) NULL,
	[FechaMovimiento] [date] NULL,
	[idCajero] [varchar](50) NULL,
 CONSTRAINT [PK_T_MovimientoCuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Rol]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL,
 CONSTRAINT [PK_T_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Sexo]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Sexo](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_T_Sexo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TipoMovimiento]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TipoMovimiento](
	[Id] [int] NOT NULL,
	[TipoMovimiento] [varchar](100) NULL,
 CONSTRAINT [PK_T_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Usuarios]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Usuarios](
	[Usuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NULL,
	[Nombre] [varchar](150) NULL,
	[Id_Rol] [int] NULL,
 CONSTRAINT [PK_T_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[T_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_T_Cliente_T_EdoCivil] FOREIGN KEY([Id_EdoCivil])
REFERENCES [dbo].[T_EdoCivil] ([Id])
GO
ALTER TABLE [dbo].[T_Cliente] CHECK CONSTRAINT [FK_T_Cliente_T_EdoCivil]
GO
ALTER TABLE [dbo].[T_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_T_Cliente_T_Ejecutivo] FOREIGN KEY([Id_Ejecutivo])
REFERENCES [dbo].[T_Usuarios] ([Usuario])
GO
ALTER TABLE [dbo].[T_Cliente] CHECK CONSTRAINT [FK_T_Cliente_T_Ejecutivo]
GO
ALTER TABLE [dbo].[T_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_T_Cliente_T_Estado] FOREIGN KEY([Id_Estado])
REFERENCES [dbo].[T_Estado] ([Id])
GO
ALTER TABLE [dbo].[T_Cliente] CHECK CONSTRAINT [FK_T_Cliente_T_Estado]
GO
ALTER TABLE [dbo].[T_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_T_Cliente_T_Sexo] FOREIGN KEY([Id_Sexo])
REFERENCES [dbo].[T_Sexo] ([Id])
GO
ALTER TABLE [dbo].[T_Cliente] CHECK CONSTRAINT [FK_T_Cliente_T_Sexo]
GO
ALTER TABLE [dbo].[T_MovimientoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_T_MovimientoCuenta_T_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[T_Cliente] ([Id])
GO
ALTER TABLE [dbo].[T_MovimientoCuenta] CHECK CONSTRAINT [FK_T_MovimientoCuenta_T_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarCliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarCliente]
	@Id_Cliente	   int,
	@Nombre		   varchar(100),
	@Apellidos	   varchar(150),
	@NumeroTarjeta numeric(18),
	@Direccion     varchar(200),
	@Id_Estado	   int,
	@CodigoPostal  numeric(10),
	@Id_Sexo	   int,
	@Id_EdoCivil   int,
	@Celular       varchar(15),
	@Telefono	   varchar(15),
	@CorreoElectronico varchar(50),
	@Edad int
AS
BEGIN
	UPDATE T_CLIENTE
	SET Nombre = @Nombre, Apellidos = @Apellidos,  Direccion = @Direccion, Id_Estado = @Id_Estado,
	 CodigoPostal = @CodigoPostal, Id_Sexo = @Id_Sexo, Id_EdoCivil = @Id_EdoCivil, Celular = @Celular, Telefono = @Telefono,
	 CorreoElectronico = @CorreoElectronico, Edad = @Edad
	 WHERE Id = @Id_Cliente;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_InsertarCliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_InsertarCliente]
	@Nombre		   varchar(100),
	@Apellidos	   varchar(150),
	@NumeroTarjeta numeric(18),
	@Direccion     varchar(200),
	@Id_Estado	   int,
	@CodigoPostal  numeric(10),
	@Id_Sexo	   int,
	@Id_EdoCivil   int,
	@Celular       varchar(15),
	@Telefono	   varchar(15),
	@CorreoElectronico varchar(50),
	@Edad		   int,
	@Id_Ejecutivo  varchar(50),
	@SaldoInicial  numeric(18)

AS
BEGIN
declare @Id_Cliente int

		INSERT INTO T_CLIENTE 
		       (Nombre, Apellidos, NumTarjeta, Direccion, Id_Estado, CodigoPostal, Id_Sexo, Id_EdoCivil, Celular, Telefono,
			    CorreoElectronico, Edad, FechaRegistro, Id_Ejecutivo, SaldoInicial)
		VALUES(@Nombre, @Apellidos,  @NumeroTarjeta, @Direccion, @Id_Estado, @CodigoPostal, @Id_Sexo, @Id_EdoCivil, @Celular, @Telefono,
			@CorreoElectronico, @Edad, GETDATE(), @Id_Ejecutivo, @SaldoInicial);


		select @Id_Cliente = scope_identity();

		INSERT INTO T_MOVIMIENTOCUENTA
		(Id_Cliente, NumCuenta, Id_TipoMovimiento, Importe, FechaMovimiento)
		VALUES (@Id_Cliente,@NumeroTarjeta, 1, @SaldoInicial, GETDATE());

		SELECT Id, Nombre, Edad, Id_EdoCivil, Direccion, Id_Estado, Telefono, 
		       Celular, Apellidos, Id_Sexo, CodigoPostal  FROM T_Cliente
		WHERE Id = @Id_Cliente
END

GO
/****** Object:  StoredProcedure [dbo].[pa_InsertarMovimiento]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_InsertarMovimiento]
		@Id_Cliente int,
		@NumCuenta numeric(18),
		@Id_TipoMovimiento int,
		@Importe numeric(18,2)
as
begin
		INSERT INTO T_MOVIMIENTOCUENTA
		( Id_Cliente, NumCuenta, Id_TipoMovimiento, Importe, FechaMovimiento)
		VALUES
		(@Id_Cliente, @NumCuenta, @Id_TipoMovimiento, @Importe, GETDATE());
end

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerCliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerCliente]
		@Id_Cliente int
AS
BEGIN
	
		SELECT Id, Nombre,NumTarjeta, Edad, Id_EdoCivil, Direccion, Id_Estado, Telefono, 
		       Celular, Apellidos, Id_Sexo, CodigoPostal, CorreoElectronico, SaldoInicial  FROM T_Cliente
		WHERE Id = @Id_Cliente
END

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerEstados]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerEstados]
AS
BEGIN
		SELECT Id, Estado FROM T_Estado
		
END 

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerMovimientoCliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerMovimientoCliente]
	@Id_Cliente int
AS
BEGIN
	SELECT M.Id_Cliente, M.NumCuenta, M.Id_TipoMovimiento, T.TipoMovimiento Tipo, m.Importe, M.FechaMovimiento 
	  FROM T_MovimientoCuenta M,
	       T_TipoMovimiento T
	 WHERE M.Id_Cliente = @Id_Cliente
	  AND T.Id = M.Id_TipoMovimiento
END

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerSaldoCliente]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerSaldoCliente]
		@Id_Cliente int
AS
BEGIN

DECLARE @v_deposito numeric(18,2);
DECLARE @v_retiro  numeric(18,2);
DECLARE @V_SALDO numeric(18,2);


   SELECT  @v_deposito = SUM(IMPORTE) FROM T_MovimientoCuenta
	WHERE Id_Cliente= @Id_Cliente
	AND (Id_TipoMovimiento = 1 OR Id_TipoMovimiento = 2);


	SELECT @v_retiro = SUM(IMPORTE) FROM T_MovimientoCuenta
	WHERE Id_Cliente=  @Id_Cliente
	AND Id_TipoMovimiento = 3 ;

	SET @V_SALDO = @v_deposito - @v_retiro;

	SELECT @V_SALDO AS SALDO;

END
	

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerTiposMovimiento]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerTiposMovimiento]
AS
BEGIN
	SELECT Id, TipoMovimiento FROM T_TipoMovimiento
	 where id <>1
END 

GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerUsuarios]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ObtenerUsuarios]
	@Usuario varchar(50),
	@Pass varchar(50)
AS
BEGIN 
	SELECT Usuario,Nombre, Id_Rol
	  FROM T_Usuarios
	 WHERE Usuario = @Usuario
	   AND Contrasena = @Pass
END

GO
/****** Object:  StoredProcedure [dbo].[paObtenerEdoCivil]    Script Date: 29/01/2017 10:24:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paObtenerEdoCivil]
AS
BEGIN
	SELECT Id, Descripcion FROM T_EdoCivil
END

GO
USE [master]
GO
ALTER DATABASE [DB_Banco] SET  READ_WRITE 
GO
