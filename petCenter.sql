USE [master]
GO

/****** Object:  Database [PetCenter]    Script Date: 1/30/2024 4:12:03 PM ******/
CREATE DATABASE [PetCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetCenter', FILENAME = N'D:\MSSQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetCenter_log', FILENAME = N'D:\MSSQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PetCenter] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PetCenter] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PetCenter] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PetCenter] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PetCenter] SET ARITHABORT OFF 
GO

ALTER DATABASE [PetCenter] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PetCenter] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PetCenter] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [PetCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PetCenter] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PetCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PetCenter] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PetCenter] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PetCenter] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PetCenter] SET  ENABLE_BROKER 
GO

ALTER DATABASE [PetCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PetCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PetCenter] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PetCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PetCenter] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PetCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [PetCenter] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PetCenter] SET RECOVERY FULL 
GO

ALTER DATABASE [PetCenter] SET  MULTI_USER 
GO

ALTER DATABASE [PetCenter] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PetCenter] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PetCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PetCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [PetCenter] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [PetCenter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [PetCenter] SET QUERY_STORE = ON
GO

ALTER DATABASE [PetCenter] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [PetCenter] SET  READ_WRITE 
GO


