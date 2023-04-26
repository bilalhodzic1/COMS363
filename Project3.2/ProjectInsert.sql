use Project3;
LOAD DATA LOCAL
INFILE '/Users/bilalhodzic/Documents/SophmoreYearSecondSem/COMS363/Project3.2/dataCSV/user.csv'
INTO TABLE User
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL
INFILE '/Users/bilalhodzic/Documents/SophmoreYearSecondSem/COMS363/Project3.2/dataCSV/tweets.csv'
INTO TABLE Tweet
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL
INFILE '/Users/bilalhodzic/Documents/SophmoreYearSecondSem/COMS363/Project3.2/dataCSV/mentioned.csv'
INTO TABLE Mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL
INFILE '/Users/bilalhodzic/Documents/SophmoreYearSecondSem/COMS363/Project3.2/dataCSV/urlused.csv'
INTO TABLE UrlUsed
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL
INFILE '/Users/bilalhodzic/Documents/SophmoreYearSecondSem/COMS363/Project3.2/dataCSV/tagged.csv'
INTO TABLE Tagged
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




