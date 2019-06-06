library(rvest)
afl_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:29){
	afl_data <- rbind(afl_data, c(2019-i, NA, NA, NA, NA))
}
names(afl_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")
afl_data

url <- 'https://afltables.com/afl/crowds/summary.html'
webpage <- read_html(url)
attendance_data_html <- html_nodes(webpage,'td')
attendance_data_1 <- html_text(attendance_data_html)
for (i in 1:29){
	attendance_data <- attendance_data_1[c(25+13*(i))]
	attendance_data
	attendance_data <- as.numeric(attendance_data)
	n=nrow(afl_data)
	if (afl_data$Season[i] == 2019-i){
		afl_data$Attendance[i] = attendance_data
	}
}
afl_data

data0 <- data.frame(a = numeric())
for (i in 1:14){
	data0 <- rbind(data0, c(NA))
}
data0
names(data0) <- c("a")

data1 <- data.frame(a = numeric())
for (i in 1:15){
	data1 <- rbind(data1, c(NA))
}
data1
names(data1) <- c("a")

data2 <- data.frame(a = numeric())
for (i in 1:16){
	data2 <- rbind(data2, c(NA))
}
data2
names(data2) <- c("a")

data3 <- data.frame(a = numeric())
for (i in 1:17){
	data3 <- rbind(data3, c(NA))
}
data3
names(data3) <- c("a")

data4 <- data.frame(a = numeric())
for (i in 1:18){
	data4 <- rbind(data4, c(NA))
}
data4
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
data6
names(data6) <- c("a")

for (i in 1:29){
	url <- paste0('https://en.wikipedia.org/wiki/Template:AFL_Ladder/', 2019-i)
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'td')
	points_data <- html_text(points_data_html)
	if (2019-i == 1990){
		for (j in 1:14){
			data0$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data0$a)
				afl_data$SDPoints[i] = sd(data0$a)
			}
		}
	}
	if (2019-i > 1990 && 2019-i < 1995){
		for (j in 1:15){
			data1$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data1$a)
				afl_data$SDPoints[i] = sd(data1$a)
			}
		}
	}
	if (2019-i > 1994 && 2019-i < 2011){
		for (j in 1:16){
			data2$a[j] <- as.numeric(points_data[c(4+(10*j))])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data2$a)
				afl_data$SDPoints[i] = sd(data2$a)
			}
		}
	}	
	if (2019-i == 2011){
		for (j in 1:17){
			data3$a[j] <- as.numeric(points_data[c(4+10*j)])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data3$a)
				afl_data$SDPoints[i] = sd(data3$a)
			}
		}	
	}
	if (2019-i == 2012 || 2019-i == 2014){
		for (j in 1:18){
			data4$a[j] <- as.numeric(points_data[c(4+10*j)])
			if (afl_data$Season[i] == 2019-i){
				afl_data$Points[i] = mean(data4$a)
				afl_data$SDPoints[i] = sd(data4$a)
			}
		}	
	}
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
data6
afl_data

afl_data$Odds = c(2.63608, 2.80529, 2.56139, 2.65445, 2.54953, 2.74447, 2.66084, 2.55992, 2.90208, 3.05245, 3.17029)

plot(afl_data$Attendance, afl_data$SDPoints)
cor(afl_data$Attendance, afl_data$SDPoints)

plot(afl_data$Attendance, afl_data$Odds)
cor(afl_data$Attendance, afl_data$Odds)