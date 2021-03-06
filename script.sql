USE [master]
GO
/****** Object:  Database [CB_Assignment_2]    Script Date: 13/05/2019 10:37:16 AM ******/
CREATE DATABASE [CB_Assignment_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CB_Assignment_2', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CB_Assignment_2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CB_Assignment_2_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CB_Assignment_2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CB_Assignment_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CB_Assignment_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CB_Assignment_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CB_Assignment_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CB_Assignment_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CB_Assignment_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CB_Assignment_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CB_Assignment_2] SET  MULTI_USER 
GO
ALTER DATABASE [CB_Assignment_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CB_Assignment_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CB_Assignment_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CB_Assignment_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CB_Assignment_2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CB_Assignment_2]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[SubmissionDate] [datetime] NULL,
	[OralMark] [decimal](5, 2) NULL,
	[TotalMark] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignmentPerCourse]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentPerCourse](
	[AssignmentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_AssignmentPerCourse] PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](80) NOT NULL,
	[Stream] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TrainerID] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](30) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[TuitionFees] [decimal](6, 2) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentPerCourse]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPerCourse](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_StudentPerCourse] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 13/05/2019 10:37:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](30) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](80) NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AssignmentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerCourse_Assignment] FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[Assignment] ([ID])
GO
ALTER TABLE [dbo].[AssignmentPerCourse] CHECK CONSTRAINT [FK_AssignmentPerCourse_Assignment]
GO
ALTER TABLE [dbo].[AssignmentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[AssignmentPerCourse] CHECK CONSTRAINT [FK_AssignmentPerCourse_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Trainer] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainer] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Trainer]
GO
ALTER TABLE [dbo].[StudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentPerCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentPerCourse] CHECK CONSTRAINT [FK_StudentPerCourse_Course]
GO
ALTER TABLE [dbo].[StudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentPerCourse_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentPerCourse] CHECK CONSTRAINT [FK_StudentPerCourse_Student]
GO
USE [master]
GO
ALTER DATABASE [CB_Assignment_2] SET  READ_WRITE 
GO
