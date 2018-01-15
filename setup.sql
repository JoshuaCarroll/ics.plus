IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MapOverlays'))
BEGIN
  CREATE TABLE MapOverlays
  (
    MapOverlayId INT IDENTITY(1,1),
	EventID int,
	North varchar(255),
	South varchar(255),
	East varchar(255),
	West varchar(255),
    URL varchar(255),
    PRIMARY KEY(MapOverlayId)
  )

  	SET IDENTITY_INSERT [dbo].MapOverlays ON
	INSERT INTO [dbo].MapOverlays ([MapOverlayId], [EventId], [North], [South], [East], [West], [URL]) VALUES (1, 1, '50.406626367301044', '21.652538062803444', '-66.51793787681802', '-127.620375523875420', 'https://radar.weather.gov/ridge/Conus/RadarImg/latest_radaronly.gif')
	SET IDENTITY_INSERT [dbo].MapOverlays OFF
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Events'))
BEGIN
	CREATE TABLE [dbo].[Events] (
		[EventId]          INT           IDENTITY (1, 1) NOT NULL,
		[OpenDateTime]     DATETIME      NOT NULL,
		[CloseDateTime]    DATETIME      NULL,
		[EventName]        VARCHAR (255) NULL,
		[EventDescription] VARCHAR (255) NULL,
		[OwnerID]          INT           NULL,
		[CenterLocation]   VARCHAR (255) NULL,
		[ManagementType]   INT           NULL,
		[SecurityOption]   INT           NULL,
		PRIMARY KEY CLUSTERED ([EventId] ASC)
	)

	SET IDENTITY_INSERT [dbo].[Events] ON
	INSERT INTO [dbo].[Events] ([EventId], [OpenDateTime], [CloseDateTime], [EventName], [EventDescription], [OwnerID], [CenterLocation], [ManagementType], [SecurityOption]) VALUES (1, N'2017-01-01 00:00:00', NULL, N'Training and Demo', N'This event will remain open for training and demonstrations', 1, N'{"Latitude":-98.583333,"Longitude":39.833333,"Altitude":0.0}	', 1, 1)
	SET IDENTITY_INSERT [dbo].[Events] OFF
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users'))
BEGIN
  CREATE TABLE Users
  (
    UserId INT IDENTITY(1,1),
    Activated BIT NOT NULL,
    DateLastReviewedEULA datetime,
    Email VARCHAR(255),
    ReadOnly BIT,
	Username VARCHAR(255),
    Password VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
	NotifyAdminsOnLogin BIT,
	Administrator BIT,
    PRIMARY KEY(UserId)
  )

	SET IDENTITY_INSERT [dbo].[Users] ON
	INSERT INTO [dbo].[Users] ([UserId], [Activated], [DateLastReviewedEULA], [Email], [ReadOnly], [Username], [Password], [FirstName], [LastName], [NotifyAdminsOnLogin], [Administrator]) VALUES (1, 1, N'1970-01-01 00:00:00', N'joshcarroll21@gmail.com', 0, N'joshua', N'P@ssw0rd', N'Joshua', N'Carroll', 0, 1)
	SET IDENTITY_INSERT [dbo].[Users] OFF
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TraccarReports'))
BEGIN
  CREATE TABLE TraccarReports
  (
    ReportId INT IDENTITY(1,1),
    DeviceId VARCHAR(255),
	lat VARCHAR(20),
	lon VARCHAR(20),
	reportTime datetime,
	altitude VARCHAR(10),
	speed VARCHAR(5),
	bearing VARCHAR(5),
	battery VARCHAR(5),
	rawUrl VARCHAR(255),
    PRIMARY KEY(ReportId)
  )
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Messages'))
BEGIN
  CREATE TABLE Messages
  (
    MessageId INT IDENTITY(1,1),
    UserId INT,
	EventId INT,
	SentDateTime datetime,
	Message text,
    PRIMARY KEY(MessageId)
  )

	SET IDENTITY_INSERT [dbo].[Messages] ON
	INSERT INTO [dbo].[Messages] ([MessageId], [UserId], [SentDateTime], [Message], [EventId]) VALUES (1, 1, N'1970-01-01 00:00:00', N'Marco', 1)
	INSERT INTO [dbo].[Messages] ([MessageId], [UserId], [SentDateTime], [Message], [EventId]) VALUES (2, 1, N'2017-04-12 04:51:42', N'Polo', 1)
	INSERT INTO [dbo].[Messages] ([MessageId], [UserId], [SentDateTime], [Message], [EventId]) VALUES (3, 1, N'2017-04-12 04:55:51', N'Howdy', 1)
	INSERT INTO [dbo].[Messages] ([MessageId], [UserId], [SentDateTime], [Message], [EventId]) VALUES (4, 1, N'2017-04-12 05:02:11', N'Doody', 1)
	INSERT INTO [dbo].[Messages] ([MessageId], [UserId], [SentDateTime], [Message], [EventId]) VALUES (5, 1, N'2017-04-12 05:05:41', N'Sup', 1)
	SET IDENTITY_INSERT [dbo].[Messages] OFF
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LogEntries'))
BEGIN
  CREATE TABLE LogEntries
  (
    LogEntryId INT IDENTITY(1,1),
    UserId INT,
	EventId INT,
	SentDateTime datetime,
	LogEntry text,
    PRIMARY KEY(LogEntryId)
  )
END;
