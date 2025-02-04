USE [master]
GO

/****** Object:  Database [EscapePeruBD]    Script Date: 1/07/2022 00:24:31 ******/
CREATE DATABASE [EscapePeruBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EscapePeruBD', FILENAME = N'C:\Program Files (x86)\SQL SERVER 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\EscapePeruBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EscapePeruBD_log', FILENAME = N'C:\Program Files (x86)\SQL SERVER 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\EscapePeruBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EscapePeruBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EscapePeruBD] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [EscapePeruBD] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [EscapePeruBD] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [EscapePeruBD] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [EscapePeruBD] SET ARITHABORT OFF 
GO

ALTER DATABASE [EscapePeruBD] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [EscapePeruBD] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [EscapePeruBD] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [EscapePeruBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [EscapePeruBD] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [EscapePeruBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [EscapePeruBD] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [EscapePeruBD] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [EscapePeruBD] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [EscapePeruBD] SET  DISABLE_BROKER 
GO

ALTER DATABASE [EscapePeruBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [EscapePeruBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [EscapePeruBD] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [EscapePeruBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [EscapePeruBD] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [EscapePeruBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [EscapePeruBD] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [EscapePeruBD] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [EscapePeruBD] SET  MULTI_USER 
GO

ALTER DATABASE [EscapePeruBD] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [EscapePeruBD] SET DB_CHAINING OFF 
GO

ALTER DATABASE [EscapePeruBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [EscapePeruBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [EscapePeruBD] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [EscapePeruBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [EscapePeruBD] SET QUERY_STORE = OFF
GO

ALTER DATABASE [EscapePeruBD] SET  READ_WRITE 
GO

