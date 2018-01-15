USE ICS;


CREATE TABLE IF NOT EXISTS MapOverlays 
(
	MapOverlayId INT AUTO_INCREMENT NOT NULL,
	EventID int,
	North varchar(255),
	South varchar(255),
	East varchar(255),
	West varchar(255),
	URL varchar(255),
	PRIMARY KEY(MapOverlayId)
);

INSERT INTO MapOverlays (MapOverlayId, EventId, North, South, East, West, URL) 
    VALUES (1, 1, '50.406626367301044', '21.652538062803444', '-66.51793787681802', '-127.620375523875420', 
    'https://radar.weather.gov/ridge/Conus/RadarImg/latest_radaronly.gif');

CREATE TABLE IF NOT EXISTS Events (
	EventId          INT      NOT NULL     AUTO_INCREMENT ,
	OpenDateTime     DATETIME      NOT NULL,
	CloseDateTime    DATETIME      NULL,
	EventName        VARCHAR (255) NULL,
	EventDescription VARCHAR (255) NULL,
	OwnerID          INT           NULL,
	CenterLocation   VARCHAR (255) NULL,
	ManagementType   INT           NULL,
	SecurityOption   INT           NULL,
	PRIMARY KEY (EventId ASC)
);

INSERT INTO Events (EventId, OpenDateTime, CloseDateTime, EventName, EventDescription, OwnerID, CenterLocation, ManagementType, SecurityOption) 
    VALUES (1, N'2017-01-01 00:00:00', NULL, N'Training and Demo', N'This event will remain open for training and demonstrations', 1, N'{"Latitude":-98.583333,"Longitude":39.833333,"Altitude":0.0}	', 1, 1);

CREATE TABLE IF NOT EXISTS Users
(
	UserId INT AUTO_INCREMENT,
	Activated TINYINT NOT NULL,
	DateLastReviewedEULA datetime,
	Email VARCHAR(255),
	ReadOnly TINYINT,
	Username VARCHAR(255),
	Password VARCHAR(255),
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	NotifyAdminsOnLogin TINYINT,
	Administrator TINYINT,
	PRIMARY KEY(UserId)
);

INSERT INTO Users (UserId, Activated, DateLastReviewedEULA, Email, ReadOnly, Username, Password, FirstName, LastName, NotifyAdminsOnLogin, Administrator) 
	VALUES (1, 1, N'1970-01-01 00:00:00', N'user@domain.com', 0, N'username', N'P@ssw0rd', N'First', N'Last', 0, 1);

CREATE TABLE IF NOT EXISTS TraccarReports
(
	ReportId INT AUTO_INCREMENT,
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
);



CREATE TABLE IF NOT EXISTS Messages
(
	MessageId INT AUTO_INCREMENT,
	UserId INT,
	EventId INT,
	SentDateTime datetime,
	Message longtext,
	PRIMARY KEY(MessageId)
);

INSERT INTO Messages (MessageId, UserId, SentDateTime, Message, EventId) VALUES (1, 1, N'1970-01-01 00:00:00', N'Hi', 1);
INSERT INTO Messages (MessageId, UserId, SentDateTime, Message, EventId) VALUES (2, 1, N'2017-04-12 04:51:42', N'Hello', 1);
INSERT INTO Messages (MessageId, UserId, SentDateTime, Message, EventId) VALUES (3, 1, N'2017-04-12 04:55:51', N'Greetings', 1);
INSERT INTO Messages (MessageId, UserId, SentDateTime, Message, EventId) VALUES (4, 1, N'2017-04-12 05:02:11', N'Hey', 1);
INSERT INTO Messages (MessageId, UserId, SentDateTime, Message, EventId) VALUES (5, 1, N'2017-04-12 05:05:41', N'Howdy', 1);



CREATE TABLE IF NOT EXISTS LogEntries
(
	LogEntryId INT AUTO_INCREMENT,
	UserId INT,
	EventId INT,
	SentDateTime datetime,
	LogEntry longtext,
	PRIMARY KEY(LogEntryId)
);
