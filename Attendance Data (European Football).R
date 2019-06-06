library(rvest)
epl_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	epl_data <- rbind(epl_data, c(i+2008, NA, NA, NA, NA))
}
names(epl_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")
	epl_data

url <- 'https://en.as.com/resultados/futbol/inglaterra/2018_2019/clasificacion/'
webpage <- read_html(url)
points_data_2019_html <- html_nodes(webpage,'.destacado')
points_data_2019 <- html_text(points_data_2019_html)
points_data_2019 <- points_data_2019[c(4:23)]
points_data_2019
points_data_2019 <- as.numeric(points_data_2019)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2019){
		epl_data$Points[i] = mean(points_data_2019)
		epl_data$SDPoints[i] = sd(points_data_2019)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2017_2018/clasificacion/'
webpage <- read_html(url)
points_data_2018_html <- html_nodes(webpage,'.destacado')
points_data_2018 <- html_text(points_data_2018_html)
points_data_2018 <- points_data_2018[c(4:23)]
points_data_2018
points_data_2018 <- as.numeric(points_data_2018)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2018){
		epl_data$Points[i] = mean(points_data_2018)
		epl_data$SDPoints[i] = sd(points_data_2018)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2016_2017/clasificacion/'
webpage <- read_html(url)
points_data_2017_html <- html_nodes(webpage,'.destacado')
points_data_2017 <- html_text(points_data_2017_html)
points_data_2017 <- points_data_2017[c(4:23)]
points_data_2017
points_data_2017 <- as.numeric(points_data_2017)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2017){
		epl_data$Points[i] = mean(points_data_2017)
		epl_data$SDPoints[i] = sd(points_data_2017)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2015_2016/clasificacion/'
webpage <- read_html(url)
points_data_2016_html <- html_nodes(webpage,'.destacado')
points_data_2016 <- html_text(points_data_2016_html)
points_data_2016 <- points_data_2016[c(4:23)]
points_data_2016
points_data_2016 <- as.numeric(points_data_2016)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2016){
		epl_data$Points[i] = mean(points_data_2016)
		epl_data$SDPoints[i] = sd(points_data_2016)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2014_2015/clasificacion/'
webpage <- read_html(url)
points_data_2015_html <- html_nodes(webpage,'.destacado')
points_data_2015 <- html_text(points_data_2015_html)
points_data_2015 <- points_data_2015[c(4:23)]
points_data_2015 <- as.numeric(points_data_2015)
points_data_2015
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2015){
		epl_data$Points[i] = mean(points_data_2015)
		epl_data$SDPoints[i] = sd(points_data_2015)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2013_2014/clasificacion/'
webpage <- read_html(url)
points_data_2014_html <- html_nodes(webpage,'.destacado')
points_data_2014 <- html_text(points_data_2014_html)
points_data_2014 <- points_data_2014[c(4:23)]
points_data_2014
points_data_2014 <- as.numeric(points_data_2014)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2014){
		epl_data$Points[i] = mean(points_data_2014)
		epl_data$SDPoints[i] = sd(points_data_2014)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2012_2013/clasificacion/'
webpage <- read_html(url)
points_data_2013_html <- html_nodes(webpage,'.destacado')
points_data_2013 <- html_text(points_data_2013_html)
points_data_2013 <- points_data_2013[c(4:23)]
points_data_2013
points_data_2013 <- as.numeric(points_data_2013)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2013){
		epl_data$Points[i] = mean(points_data_2013)
		epl_data$SDPoints[i] = sd(points_data_2013)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2011_2012/clasificacion/'
webpage <- read_html(url)
points_data_2012_html <- html_nodes(webpage,'.puntos')
points_data_2012 <- html_text(points_data_2012_html)
points_data_2012 <- points_data_2012[c(4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61)]
points_data_2012
points_data_2012 <- as.numeric(points_data_2012)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2012){
		epl_data$Points[i] = mean(points_data_2012)
		epl_data$SDPoints[i] = sd(points_data_2012)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2010_2011/clasificacion/'
webpage <- read_html(url)
points_data_2011_html <- html_nodes(webpage,'.puntos')
points_data_2011 <- html_text(points_data_2011_html)
points_data_2011 <- points_data_2011[c(4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61)]
points_data_2011
points_data_2011 <- as.numeric(points_data_2011)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2011){
		epl_data$Points[i] = mean(points_data_2011)
		epl_data$SDPoints[i] = sd(points_data_2011)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2009_2010/clasificacion/'
webpage <- read_html(url)
points_data_2010_html <- html_nodes(webpage,'.puntos')
points_data_2010 <- html_text(points_data_2010_html)
points_data_2010 <- points_data_2010[c(4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61)]
points_data_2010
points_data_2010 <- as.numeric(points_data_2010)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2010){
		epl_data$Points[i] = mean(points_data_2010)
		epl_data$SDPoints[i] = sd(points_data_2010)
		}
}

url <- 'https://en.as.com/resultados/futbol/inglaterra/2008_2009/clasificacion/'
webpage <- read_html(url)
points_data_2009_html <- html_nodes(webpage,'.puntos')
points_data_2009 <- html_text(points_data_2009_html)
points_data_2009 <- points_data_2009[c(4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61)]
points_data_2009
points_data_2009 <- as.numeric(points_data_2009)
n=nrow(epl_data)
for (i in 1:n){
	if (epl_data$Season[i] == 2009){
		epl_data$Points[i] = mean(points_data_2009)
		epl_data$SDPoints[i] = sd(points_data_2009)
		}
}

epl_data$Attendance = c(35592, 34151, 35723, 34601, 35921, 36631, 36176, 36452, 35822, 38297, 38168)

epl_data$Odds = c(2.63608, 2.80529, 2.56139, 2.65445, 2.54953, 2.74447, 2.66084, 2.55992, 2.90208, 3.05245, 3.17029)


bun_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	bun_data <- rbind(bun_data, c(i+2008, NA, NA, NA, NA))
}
names(bun_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2008-09/34/0'
webpage <- read_html(url)
points_data_2009_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2009 <- html_text(points_data_2009_html)
points_data_2009 <- points_data_2009[c(2:19)]
points_data_2009
points_data_2009 <- as.numeric(points_data_2009)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2009){
		bun_data$Points[i] = mean(points_data_2009)
		bun_data$SDPoints[i] = sd(points_data_2009)
		}
}

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2009-10/34/0'
webpage <- read_html(url)
points_data_2010_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2010 <- html_text(points_data_2010_html)
points_data_2010 <- points_data_2010[c(2:19)]
points_data_2010
points_data_2010 <- as.numeric(points_data_2010)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2010){
		bun_data$Points[i] = mean(points_data_2010)
		bun_data$SDPoints[i] = sd(points_data_2010)
		}
}

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2010-11/34/0'
webpage <- read_html(url)
points_data_2011_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2011 <- html_text(points_data_2011_html)
points_data_2011 <- points_data_2011[c(2:19)]
points_data_2011
points_data_2011 <- as.numeric(points_data_2011)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2011){
		bun_data$Points[i] = mean(points_data_2011)
		bun_data$SDPoints[i] = sd(points_data_2011)
		}
}

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2011-12/34/0'
webpage <- read_html(url)
points_data_2012_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2012 <- html_text(points_data_2012_html)
points_data_2012 <- points_data_2012[c(2:19)]
points_data_2012
points_data_2012 <- as.numeric(points_data_2012)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2012){
		bun_data$Points[i] = mean(points_data_2012)
		bun_data$SDPoints[i] = sd(points_data_2012)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2012-13/34/0'
webpage <- read_html(url)
points_data_2013_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2013 <- html_text(points_data_2013_html)
points_data_2013 <- points_data_2013[c(2:19)]
points_data_2013
points_data_2013 <- as.numeric(points_data_2013)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2013){
		bun_data$Points[i] = mean(points_data_2013)
		bun_data$SDPoints[i] = sd(points_data_2013)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2013-14/34/0'
webpage <- read_html(url)
points_data_2014_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2014 <- html_text(points_data_2014_html)
points_data_2014 <- points_data_2014[c(2:19)]
points_data_2014
points_data_2014 <- as.numeric(points_data_2014)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2014){
		bun_data$Points[i] = mean(points_data_2014)
		bun_data$SDPoints[i] = sd(points_data_2014)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2014-15/34/0'
webpage <- read_html(url)
points_data_2015_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2015 <- html_text(points_data_2015_html)
points_data_2015 <- points_data_2015[c(2:19)]
points_data_2015
points_data_2015 <- as.numeric(points_data_2015)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2015){
		bun_data$Points[i] = mean(points_data_2015)
		bun_data$SDPoints[i] = sd(points_data_2015)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2015-16/34/0'
webpage <- read_html(url)
points_data_2016_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2016 <- html_text(points_data_2016_html)
points_data_2016 <- points_data_2016[c(2:19)]
points_data_2016
points_data_2016 <- as.numeric(points_data_2016)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2016){
		bun_data$Points[i] = mean(points_data_2016)
		bun_data$SDPoints[i] = sd(points_data_2016)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2016-17/34/0'
webpage <- read_html(url)
points_data_2017_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2017 <- html_text(points_data_2017_html)
points_data_2017 <- points_data_2017[c(2:19)]
points_data_2017
points_data_2017 <- as.numeric(points_data_2017)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2017){
		bun_data$Points[i] = mean(points_data_2017)
		bun_data$SDPoints[i] = sd(points_data_2017)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2017-18/34/0'
webpage <- read_html(url)
points_data_2018_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2018 <- html_text(points_data_2018_html)
points_data_2018 <- points_data_2018[c(2:19)]
points_data_2018
points_data_2018 <- as.numeric(points_data_2018)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2018){
		bun_data$Points[i] = mean(points_data_2018)
		bun_data$SDPoints[i] = sd(points_data_2018)
		}
}
bun_data

url <- 'https://www.kicker.de/1-bundesliga/spieltag/2018-19/34/0'
webpage <- read_html(url)
points_data_2019_html <- html_nodes(webpage,'.kick__respt-m-o-5')
points_data_2019 <- html_text(points_data_2019_html)
points_data_2019 <- points_data_2019[c(2:19)]
points_data_2019
points_data_2019 <- as.numeric(points_data_2019)
n=nrow(bun_data)
for (i in 1:n){
	if (bun_data$Season[i] == 2019){
		bun_data$Points[i] = mean(points_data_2019)
		bun_data$SDPoints[i] = sd(points_data_2019)
		}
}
bun_data

bun_data$Attendance = c(42521, 42490, 42663, 45116, 42622, 43500, 43539, 43300,41511,44646,43358)

bun_data$Odds = c(2.36817, 2.43696, 2.40529, 2.505, 2.57458, 2.7484, 2.78157, 2.90196, 2.81621, 2.61768, 2.76951)


ser_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	ser_data <- rbind(ser_data, c(i+2008, NA, NA, NA, NA))
}
names(ser_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2008/league/ita.1'
webpage <- read_html(url)
points_data_2009_html <- html_nodes(webpage,'.stat-cell')
points_data_2009 <- html_text(points_data_2009_html)
points_data_2009 <- points_data_2009[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2009
points_data_2009 <- as.numeric(points_data_2009)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2009){
		ser_data$Points[i] = mean(points_data_2009)
		ser_data$SDPoints[i] = sd(points_data_2009)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2009/league/ita.1'
webpage <- read_html(url)
points_data_2010_html <- html_nodes(webpage,'.stat-cell')
points_data_2010 <- html_text(points_data_2010_html)
points_data_2010 <- points_data_2010[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2010
points_data_2010 <- as.numeric(points_data_2010)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2010){
		ser_data$Points[i] = mean(points_data_2010)
		ser_data$SDPoints[i] = sd(points_data_2010)
		}
}

url <- 'https://www.espn.co.uk/football/table/_/season/2010/league/ita.1'
webpage <- read_html(url)
points_data_2011_html <- html_nodes(webpage,'.stat-cell')
points_data_2011 <- html_text(points_data_2011_html)
points_data_2011 <- points_data_2011[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2011
points_data_2011 <- as.numeric(points_data_2011)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2011){
		ser_data$Points[i] = mean(points_data_2011)
		ser_data$SDPoints[i] = sd(points_data_2011)
		}
}

url <- 'https://www.espn.co.uk/football/table/_/season/2011/league/ita.1'
webpage <- read_html(url)
points_data_2012_html <- html_nodes(webpage,'.stat-cell')
points_data_2012 <- html_text(points_data_2012_html)
points_data_2012 <- points_data_2012[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2012
points_data_2012 <- as.numeric(points_data_2012)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2012){
		ser_data$Points[i] = mean(points_data_2012)
		ser_data$SDPoints[i] = sd(points_data_2012)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2012/league/ita.1'
webpage <- read_html(url)
points_data_2013_html <- html_nodes(webpage,'.stat-cell')
points_data_2013 <- html_text(points_data_2013_html)
points_data_2013 <- points_data_2013[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2013
points_data_2013 <- as.numeric(points_data_2013)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2013){
		ser_data$Points[i] = mean(points_data_2013)
		ser_data$SDPoints[i] = sd(points_data_2013)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2013/league/ita.1'
webpage <- read_html(url)
points_data_2014_html <- html_nodes(webpage,'.stat-cell')
points_data_2014 <- html_text(points_data_2014_html)
points_data_2014 <- points_data_2014[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2014
points_data_2014 <- as.numeric(points_data_2014)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2014){
		ser_data$Points[i] = mean(points_data_2014)
		ser_data$SDPoints[i] = sd(points_data_2014)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2014/league/ita.1'
webpage <- read_html(url)
points_data_2015_html <- html_nodes(webpage,'.stat-cell')
points_data_2015 <- html_text(points_data_2015_html)
points_data_2015 <- points_data_2015[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2015
points_data_2015 <- as.numeric(points_data_2015)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2015){
		ser_data$Points[i] = mean(points_data_2015)
		ser_data$SDPoints[i] = sd(points_data_2015)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2015/league/ita.1'
webpage <- read_html(url)
points_data_2016_html <- html_nodes(webpage,'.stat-cell')
points_data_2016 <- html_text(points_data_2016_html)
points_data_2016 <- points_data_2016[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2016
points_data_2016 <- as.numeric(points_data_2016)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2016){
		ser_data$Points[i] = mean(points_data_2016)
		ser_data$SDPoints[i] = sd(points_data_2016)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2016/league/ita.1'
webpage <- read_html(url)
points_data_2017_html <- html_nodes(webpage,'.stat-cell')
points_data_2017 <- html_text(points_data_2017_html)
points_data_2017 <- points_data_2017[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2017
points_data_2017 <- as.numeric(points_data_2017)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2017){
		ser_data$Points[i] = mean(points_data_2017)
		ser_data$SDPoints[i] = sd(points_data_2017)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2017/league/ita.1'
webpage <- read_html(url)
points_data_2018_html <- html_nodes(webpage,'.stat-cell')
points_data_2018 <- html_text(points_data_2018_html)
points_data_2018 <- points_data_2018[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2018
points_data_2018 <- as.numeric(points_data_2018)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2018){
		ser_data$Points[i] = mean(points_data_2018)
		ser_data$SDPoints[i] = sd(points_data_2018)
		}
}
ser_data

url <- 'https://www.espn.co.uk/football/table/_/season/2018/league/ita.1'
webpage <- read_html(url)
points_data_2019_html <- html_nodes(webpage,'.stat-cell')
points_data_2019 <- html_text(points_data_2019_html)
points_data_2019 <- points_data_2019[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)]
points_data_2019
points_data_2019 <- as.numeric(points_data_2019)
n=nrow(ser_data)
for (i in 1:n){
	if (ser_data$Season[i] == 2019){
		ser_data$Points[i] = mean(points_data_2019)
		ser_data$SDPoints[i] = sd(points_data_2019)
		}
}
ser_data

ser_data$Attendance = c(25371, 25282, 24136, 22493, 23268, 23385, 22213, 22644, 22164, 24767, 25237)

ser_data$Odds = c(2.38406, 2.40024, 2.41895, 2.46608, 2.48134, 2.54416, 2.58911, 2.64374, 2.86021, 3.01905, 2.89013)


epl_data
bun_data
ser_data

plot(epl_data$Attendance, epl_data$SDPoints)
cor(epl_data$Attendance, epl_data$SDPoints)

plot(bun_data$Attendance, bun_data$SDPoints)
cor(bun_data$Attendance, bun_data$SDPoints)

plot(ser_data$Attendance, ser_data$SDPoints)
cor(ser_data$Attendance, ser_data$SDPoints)


plot(epl_data$Attendance, epl_data$Odds)
cor(epl_data$Attendance, epl_data$Odds)

plot(bun_data$Attendance, bun_data$Odds)
cor(bun_data$Attendance, bun_data$Odds)

plot(ser_data$Attendance, ser_data$Odds)
cor(ser_data$Attendance, ser_data$Odds)






