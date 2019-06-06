library(rvest)

# Create data frame for all the data we will use in the end
afl_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())

# Enter the seasons which will be included in the data
for (i in 1:29){
	afl_data <- rbind(afl_data, c(2019-i, NA, NA, NA, NA))
}

# Name the columns of the data frame
names(afl_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")

# Check data frame
afl_data

# Scraping attendance information
# Load website
url <- 'https://afltables.com/afl/crowds/summary.html'
webpage <- read_html(url)
attendance_data_html <- html_nodes(webpage,'td')
attendance_data_1 <- html_text(attendance_data_html)
for (i in 1:29){
	attendance_data <- as.numeric(attendance_data_1[c(25+13*(i))]) # Choosing cells we want (and converting to numbers)
	# Enter data into master dataset
	if (afl_data$Season[i] == 2019-i){
		afl_data$Attendance[i] = attendance_data
	}
}
# Check dataset
afl_data

# Create dataframes to store the points information for each year (copied over during for loops)
# Creating many dataframes of different sizes so years with smaller league don't include data from other years
data0 <- data.frame(a = numeric())
for (i in 1:14){
	data0 <- rbind(data0, c(NA))
}
names(data0) <- c("a")

data1 <- data.frame(a = numeric())
for (i in 1:15){
	data1 <- rbind(data1, c(NA))
}
names(data1) <- c("a")

data2 <- data.frame(a = numeric())
for (i in 1:16){
	data2 <- rbind(data2, c(NA))
}
names(data2) <- c("a")

data3 <- data.frame(a = numeric())
for (i in 1:17){
	data3 <- rbind(data3, c(NA))
}
names(data3) <- c("a")

# Created multiple of size 18 because of discrepancies in the website I scraped (easier to check individual years this way)
data4 <- data.frame(a = numeric())
for (i in 1:18){
	data4 <- rbind(data4, c(NA))
}
names(data4) <- c("a")

data5 <- data.frame(a = numeric())
for (i in 1:18){
	data5 <- rbind(data5, c(NA))
}
data5
names(data5) <- c("a")

data6 <- data.frame(a = numeric())
for (i in 1:18){
	data6 <- rbind(data6, c(NA))
}
names(data6) <- c("a")

# Running a for loop to scrape the data automatically
for (i in 1:29){
	# Loading website
	url <- paste0('https://en.wikipedia.org/wiki/Template:AFL_Ladder/', 2019-i) # URL automatically runs through every year since 1990
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'td')
	points_data <- html_text(points_data_html)
	# The "if" statements are where the dataframes created earlier will come into play
	# Each "if" statement saves the mean and standard deviation of points accumulated by teams that year
	# This one is for 1990, the only year with 14 teams
	if (2019-i == 1990){
		for (j in 1:14){
			data0$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data0$a)
				afl_data$SDPoints[i] = sd(data0$a)
			}
		}
	}
	# This one is for 1991-1994, with 15 teams
	if (2019-i > 1990 && 2019-i < 1995){
		for (j in 1:15){
			data1$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data1$a)
				afl_data$SDPoints[i] = sd(data1$a)
			}
		}
	}
	# This one is for 1995-2010, with 16 teams
	if (2019-i > 1994 && 2019-i < 2011){
		for (j in 1:16){
			data2$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data2$a)
				afl_data$SDPoints[i] = sd(data2$a)
			}
		}
	}
	# This one is for 2011, with 17 teams
	if (2019-i == 2011){
		for (j in 1:17){
			data3$a[j] <- as.numeric(points_data[c(4+10*j)])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data3$a)
				afl_data$SDPoints[i] = sd(data3$a)
			}
		}	
	}
	# This one is for 2012 & 2014, with 18 teams
	if (2019-i == 2012 || 2019-i == 2014){
		for (j in 1:18){
			data4$a[j] <- as.numeric(points_data[c(4+10*j)])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data4$a)
				afl_data$SDPoints[i] = sd(data4$a)
			}
		}	
	}
	# This one is for 2013, 18 teams but an issue with formatting for the ninth data point (footnote on website)
	if (2019-i == 2013){
		for (j in 1:18){
			data4$a[j] <- as.numeric(points_data[c(4+10*j)])
			data4$a[9] <- 56
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data4$a)
				afl_data$SDPoints[i] = sd(data4$a)
			}
		}
	}
	# This one is for 2015, 18 teams but also has issues with the seventh and tenth data points
	if (2019-i == 2015){
		for (j in 1:18){
			data6$a[j] <- as.numeric(points_data[c(4+10*j)])
			data6$a[7] <- 54
			data6$a[10] <- 48
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data6$a)
				afl_data$SDPoints[i] = sd(data6$a)
			}
		}	
	}
	# This one is for 2016-2018, website changed format after 2015
	if (2019-i > 2015 && 2019-i < 2019){
		for (j in 1:2){
			data5$a[j] <- as.numeric(points_data[c(-1+10*j)])
		}
		for (j in 3:9){
			data5$a[j] <- as.numeric(points_data[c(1+9*j)])
		}
		for (j in 10:18){
			data5$a[j] <- as.numeric(points_data[c(2+9*j)])
		}
		if (afl_data$Season[i] == 2019-i){
			afl_data$Points[i] = mean(data5$a)
			afl_data$SDPoints[i] = sd(data5$a)
		}	
	}
}

# The odds were pulled manually from the spreadsheet (mean of home odds by year)
# The first number is for 2018 and proceeds until 2009
# 2009 only has data from June-September, so less data points; considered removing but it is consistent with trends
afl_data$Odds = c(2.19053, 2.01072, 2.55420, 2.36029, 2.40043, 2.92676, 2.99179, 2.48219, 2.05516, 2.16957, rep(NA, 19))

# Full dataset
afl_data

# Attendance vs. variation in points between 1990 and 2018
plot(afl_data$Attendance, afl_data$SDPoints)

# Correlation coefficient of -0.06 (slight negative correlation, basically no correlation)
cor(afl_data$Attendance, afl_data$SDPoints)

# Attendance vs. variation in points between 2009 and 2018
plot(afl_data$Attendance[1:10], afl_data$SDPoints[1:10])

# Correlation coefficient of -0.33 (moderate negative correlation)
cor(afl_data$Attendance[1:10], afl_data$SDPoints[1:10])

# Attendance vs. odds of home team winning
plot(afl_data$Attendance, afl_data$Odds)

# Correlation coefficient of -0.71 (strong negative correlation)
cor(afl_data$Attendance[1:10], afl_data$Odds[1:10])

# Correlation coefficient of -0.69 if 2009 is removed (still a strong negative correlation)
cor(afl_data$Attendance[1:9], afl_data$Odds[1:9])
