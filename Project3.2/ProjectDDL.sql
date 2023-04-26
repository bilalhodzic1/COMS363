use Project3;
CREATE TABLE User(screen_name varchar(99), name varchar(99),
 sub_category varchar(99), category varchar(99), ofstate varchar(99),
 numFolloweres integer, numFollowing integer,
 PRIMARY KEY(screen_name));
 
CREATE TABLE Tweet(tid varchar(99),textbody varchar(280), retweet_count integer,
 retweeted boolean, posted datetime, posting_user varchar(99),
 PRIMARY KEY(tid),
 FOREIGN KEY(posting_user) REFERENCES User(screen_name));
 
 CREATE TABLE Mentioned(tid varchar(99), screen_name varchar(99),
 PRIMARY KEY(tid, screen_name),
 FOREIGN KEY(tid) REFERENCES Tweet(tid),
 FOREIGN KEY(screen_name) REFERENCES User(screen_name));
 
 CREATE TABLE UrlUsed(tid varchar(99), url varchar(750),
 PRIMARY KEY(url),
 FOREIGN KEY(tid) REFERENCES Tweet(tid));
 
 CREATE TABLE Tagged(tid varchar(99), hastagname varchar(99),
 PRIMARY KEY(hastagname),
 FOREIGN KEY(tid) REFERENCES Tweet(tid));