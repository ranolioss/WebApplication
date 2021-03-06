USE [master]
GO
/****** Object:  Database [UNI]    Script Date: 12/10/2014 13:58:06 ******/
CREATE DATABASE [UNI] ON  PRIMARY 
( NAME = N'Uni', FILENAME = N'D:\Uni.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Uni_log', FILENAME = N'D:\Uni_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UNI] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNI] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [UNI] SET ANSI_NULLS OFF
GO
ALTER DATABASE [UNI] SET ANSI_PADDING OFF
GO
ALTER DATABASE [UNI] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [UNI] SET ARITHABORT OFF
GO
ALTER DATABASE [UNI] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [UNI] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [UNI] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [UNI] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [UNI] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [UNI] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [UNI] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [UNI] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [UNI] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [UNI] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [UNI] SET  DISABLE_BROKER
GO
ALTER DATABASE [UNI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [UNI] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [UNI] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [UNI] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [UNI] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [UNI] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [UNI] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [UNI] SET  READ_WRITE
GO
ALTER DATABASE [UNI] SET RECOVERY SIMPLE
GO
ALTER DATABASE [UNI] SET  MULTI_USER
GO
ALTER DATABASE [UNI] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [UNI] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'UNI', N'ON'
GO
USE [UNI]
GO
/****** Object:  Table [dbo].[TBLTerm]    Script Date: 12/10/2014 13:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLTerm](
	[TermID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_TBLTerm] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBLTerm] ON
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (1, N'نیمسال اول 86-87', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (2, N'نیمسال دوم 86-87', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (3, N'نیمسال اول 87-88', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (4, N'نیمسال دوم 87-88', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (5, N'نیمسال اول 88-89', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (6, N'نیمسال دوم 88-89', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (7, N'نیمسال اول 89-90', 0)
INSERT [dbo].[TBLTerm] ([TermID], [Name], [IsCurrent]) VALUES (8, N'نیمسال دوم 89-90', 1)
SET IDENTITY_INSERT [dbo].[TBLTerm] OFF
/****** Object:  Table [dbo].[TBLTeacher]    Script Date: 12/10/2014 13:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TBLTeacher](
	[TeacherID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Family] [nvarchar](30) NOT NULL,
	[Sh-Sh] [varchar](10) NULL,
 CONSTRAINT [PK_TBLTeacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBLTeacher] ON
INSERT [dbo].[TBLTeacher] ([TeacherID], [Name], [Family], [Sh-Sh]) VALUES (1, N'Mohammmad', N'Shokri', N'12')
INSERT [dbo].[TBLTeacher] ([TeacherID], [Name], [Family], [Sh-Sh]) VALUES (2, N'Ali', N'Mohamadi', N'32')
SET IDENTITY_INSERT [dbo].[TBLTeacher] OFF
/****** Object:  Table [dbo].[TBLCourse]    Script Date: 12/10/2014 13:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCourse](
	[CourseID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Unitcount] [tinyint] NOT NULL,
 CONSTRAINT [PK_TBLCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBLCourse] ON
INSERT [dbo].[TBLCourse] ([CourseID], [Name], [Unitcount]) VALUES (1, N'C#', 2)
INSERT [dbo].[TBLCourse] ([CourseID], [Name], [Unitcount]) VALUES (3, N'Vb.NET', 3)
INSERT [dbo].[TBLCourse] ([CourseID], [Name], [Unitcount]) VALUES (4, N'Algiritms', 3)
SET IDENTITY_INSERT [dbo].[TBLCourse] OFF
/****** Object:  Table [dbo].[TBLBranch]    Script Date: 12/10/2014 13:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLBranch](
	[BranchID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TBLBranch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBLBranch] ON
INSERT [dbo].[TBLBranch] ([BranchID], [Name]) VALUES (1, N'IT')
INSERT [dbo].[TBLBranch] ([BranchID], [Name]) VALUES (2, N'Computer')
SET IDENTITY_INSERT [dbo].[TBLBranch] OFF
/****** Object:  Table [dbo].[TBLCoursegroup]    Script Date: 12/10/2014 13:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLCoursegroup](
	[CoursegroupID] [tinyint] IDENTITY(1,1) NOT NULL,
	[BranchID] [tinyint] NULL,
	[CourseID] [tinyint] NULL,
	[TermID] [tinyint] NULL,
	[TeacherID] [bigint] NULL,
	[Day] [nvarchar](8) NULL,
	[Time] [varchar](5) NOT NULL,
 CONSTRAINT [PK_TBLCoursegroup] PRIMARY KEY CLUSTERED 
(
	[CoursegroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBLCoursegroup] ON
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (18, 1, 3, 8, 2, N'شنبه', N'8-10')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (19, 1, 4, 8, 1, N'شنبه', N'8-10')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (20, 1, 1, 8, 1, N'شنبه', N'10-12')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (21, 2, 1, 8, 1, N'شنبه', N'4-6')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (22, 1, 1, 8, 2, N'شنبه', N'6-8')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (23, 2, 3, 8, 1, N'یکشنبه', N'10-12')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (24, 2, 3, 8, 1, N'یکشنبه', N'10-12')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (25, 2, 3, 8, 1, N'پنج شنبه', N'12-2')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (26, 2, 3, 8, 1, N'سه شنبه', N'10-12')
INSERT [dbo].[TBLCoursegroup] ([CoursegroupID], [BranchID], [CourseID], [TermID], [TeacherID], [Day], [Time]) VALUES (27, 1, 4, 8, 1, N'سه شنبه', N'4-6')
SET IDENTITY_INSERT [dbo].[TBLCoursegroup] OFF
/****** Object:  StoredProcedure [dbo].[Sample]    Script Date: 12/10/2014 13:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sample]
AS
BEGIN
	SELECT *from TBLBranch
END
GO
/****** Object:  Table [dbo].[TBLStudent]    Script Date: 12/10/2014 13:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLStudent](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Family] [nvarchar](30) NOT NULL,
	[Sh-Sh] [varchar](10) NOT NULL,
	[Startyear] [varchar](4) NOT NULL,
	[BranchID] [tinyint] NOT NULL,
 CONSTRAINT [PK_TBLStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBLStudent] ON
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (13, N'ahmadi', N'habibi', N'3270', N'54', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (14, N'ali', N'asadi', N'3270', N'1385', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (15, N'????', N'?????', N'2514', N'1385', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (16, N'???? ', N'????????', N'2555', N'1385', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (17, N'ali', N'yari', N'1034', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (18, N'reza', N'AMIRI', N'12', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (19, N'ZAHRA', N'SABERI', N'291', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (20, N'ZAHRA', N'SABERI', N'291', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (21, N'ZAHRA', N'SABERI', N'291', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (22, N'hamed', N'khandestani', N'1057', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (23, N'hamed', N'khandestani', N'1057', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (24, N'hamiid', N'yari', N'19', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (25, N'hamiid', N'yari', N'19', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (26, N'ali', N'ahmadi', N'210', N'1389', 1)
INSERT [dbo].[TBLStudent] ([StudentID], [Name], [Family], [Sh-Sh], [Startyear], [BranchID]) VALUES (27, N'ali', N'saberi', N'12', N'1389', 1)
SET IDENTITY_INSERT [dbo].[TBLStudent] OFF
/****** Object:  Table [dbo].[TBLGrade]    Script Date: 12/10/2014 13:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLGrade](
	[CoursegroupID] [tinyint] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK_TBLGrade] PRIMARY KEY CLUSTERED 
(
	[CoursegroupID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (18, 13, 12)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (18, 14, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (18, 21, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (18, 22, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (19, 13, 16)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (19, 27, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (20, 13, 14)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (22, 21, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (22, 23, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (22, 27, NULL)
INSERT [dbo].[TBLGrade] ([CoursegroupID], [StudentID], [Score]) VALUES (27, 22, NULL)
/****** Object:  Default [DF_TBLTerm_IsCurrent]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLTerm] ADD  CONSTRAINT [DF_TBLTerm_IsCurrent]  DEFAULT ((0)) FOR [IsCurrent]
GO
/****** Object:  Check [CK_TBLCourse]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLCourse]  WITH NOCHECK ADD  CONSTRAINT [CK_TBLCourse] CHECK  (([Unitcount]>(0) AND [Unitcount]<(5)))
GO
ALTER TABLE [dbo].[TBLCourse] CHECK CONSTRAINT [CK_TBLCourse]
GO
/****** Object:  Check [CK_TBLGrade]    Script Date: 12/10/2014 13:58:09 ******/
ALTER TABLE [dbo].[TBLGrade]  WITH NOCHECK ADD  CONSTRAINT [CK_TBLGrade] CHECK  (([Score]>=(0) AND [Score]<=(20)))
GO
ALTER TABLE [dbo].[TBLGrade] CHECK CONSTRAINT [CK_TBLGrade]
GO
/****** Object:  ForeignKey [FK_TBLCoursegroup_TBLBranch]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLCoursegroup]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLCoursegroup_TBLBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[TBLBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TBLCoursegroup] CHECK CONSTRAINT [FK_TBLCoursegroup_TBLBranch]
GO
/****** Object:  ForeignKey [FK_TBLCoursegroup_TBLCourse]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLCoursegroup]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLCoursegroup_TBLCourse] FOREIGN KEY([CourseID])
REFERENCES [dbo].[TBLCourse] ([CourseID])
GO
ALTER TABLE [dbo].[TBLCoursegroup] CHECK CONSTRAINT [FK_TBLCoursegroup_TBLCourse]
GO
/****** Object:  ForeignKey [FK_TBLCoursegroup_TBLTeacher]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLCoursegroup]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLCoursegroup_TBLTeacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TBLTeacher] ([TeacherID])
GO
ALTER TABLE [dbo].[TBLCoursegroup] CHECK CONSTRAINT [FK_TBLCoursegroup_TBLTeacher]
GO
/****** Object:  ForeignKey [FK_TBLCoursegroup_TBLTerm]    Script Date: 12/10/2014 13:58:07 ******/
ALTER TABLE [dbo].[TBLCoursegroup]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLCoursegroup_TBLTerm] FOREIGN KEY([TermID])
REFERENCES [dbo].[TBLTerm] ([TermID])
GO
ALTER TABLE [dbo].[TBLCoursegroup] CHECK CONSTRAINT [FK_TBLCoursegroup_TBLTerm]
GO
/****** Object:  ForeignKey [FK_TBLStudent_TBLBranch]    Script Date: 12/10/2014 13:58:09 ******/
ALTER TABLE [dbo].[TBLStudent]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLStudent_TBLBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[TBLBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TBLStudent] CHECK CONSTRAINT [FK_TBLStudent_TBLBranch]
GO
/****** Object:  ForeignKey [FK_TBLGrade_TBLCoursegroup]    Script Date: 12/10/2014 13:58:09 ******/
ALTER TABLE [dbo].[TBLGrade]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLGrade_TBLCoursegroup] FOREIGN KEY([CoursegroupID])
REFERENCES [dbo].[TBLCoursegroup] ([CoursegroupID])
GO
ALTER TABLE [dbo].[TBLGrade] CHECK CONSTRAINT [FK_TBLGrade_TBLCoursegroup]
GO
/****** Object:  ForeignKey [FK_TBLGrade_TBLStudent]    Script Date: 12/10/2014 13:58:09 ******/
ALTER TABLE [dbo].[TBLGrade]  WITH NOCHECK ADD  CONSTRAINT [FK_TBLGrade_TBLStudent] FOREIGN KEY([StudentID])
REFERENCES [dbo].[TBLStudent] ([StudentID])
GO
ALTER TABLE [dbo].[TBLGrade] CHECK CONSTRAINT [FK_TBLGrade_TBLStudent]
GO
