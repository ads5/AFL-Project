library(rvest)

epl_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	epl_data <- rbind(epl_data, c(i+2008, NA, NA, NA, NA))
}
names(epl_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")

for (i in 1:4){
	# Loading website
	url <- paste0('https://en.as.com/resultados/futbol/inglaterra/', 2007+i, '_', 2008+i,'/clasificacion/')
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'.puntos')
	points_data <- html_text(points_data_html)
	points_data <- as.numeric(points_data[c(4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61)])
	epl_data$Points[i] = mean(points_data)
	epl_data$SDPoints[i] = sd(points_data)
}

for (i in 5:11){
	url <- paste0('https://en.as.com/resultados/futbol/inglaterra/', 2007+i, '_', 2008+i,'/clasificacion/')
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'.destacado')
	points_data <- html_text(points_data_html)
	points_data <- as.numeric(points_data[c(4:23)])
	epl_data$Points[i] = mean(points_data)
	epl_data$SDPoints[i] = sd(points_data)
}

epl_data$Attendance = c(35592, 34151, 35723, 34601, 35921, 36631, 36176, 36452, 35822, 38297, 38168)

epl_data$Odds = c(2.63608, 2.80529, 2.56139, 2.65445, 2.54953, 2.74447, 2.66084, 2.55992, 2.90208, 3.05245, 3.17029)

bun_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	bun_data <- rbind(bun_data, c(i+2008, NA, NA, NA, NA))
}
names(bun_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")

for (i in 1:1){
	url <- paste0('https://www.kicker.de/1-bundesliga/spieltag/', 2007+i, '-0', 8+i,'/34/0')
	url
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'.kick__respt-m-o-5')
	points_data <- html_text(points_data_html)
	points_data <- as.numeric(points_data[c(2:19)])
	bun_data$Points[i] = mean(points_data)
	bun_data$SDPoints[i] = sd(points_data)
	points_data
}

for (i in 2:11){
	url <- paste0('https://www.kicker.de/1-bundesliga/spieltag/', 2007+i, '-', 08+i,'/34/0')
	url
	webpage <- read_html(url)
	points_data_html <- html_nodes(webpage,'.kick__respt-m-o-5')
	points_data <- html_text(points_data_html)
	points_data <- as.numeric(points_data[c(2:19)])
	bun_data$Points[i] = mean(points_data)
	bun_data$SDPoints[i] = sd(points_data)
}

bun_data$Attendance = c(42521, 42490, 42663, 45116, 42622, 43500, 43539, 43300,41511,44646,43358)

bun_data$Odds = c(2.36817, 2.43696, 2.40529, 2.505, 2.57458, 2.7484, 2.78157, 2.90196, 2.81621, 2.61768, 2.76951)

ser_data <- data.frame(Season = character(), Attendance = numeric(), Points = numeric(), SDPoints = numeric(), Odds = character())
for (i in 1:11){
	ser_data <- rbind(ser_data, c(i+2008, NA, NA, NA, NA))
}
names(ser_data) <- c("Season", "Attendance", "Points", "SDPoints", "Odds")

for(i in 1:11){
	url <- paste0('https://www.espn.co.uk/football/table/_/season/', 2007+i, '/league/ita.1')
	webpage <- read_html(url)
	points_data_2009_html <- html_nodes(webpage,'.stat-cell')
	points_data_2009 <- html_text(points_data_2009_html)
	points_data_2009 <- as.numeric(points_data_2009[c(8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160)])
	ser_data$Points[i] = mean(points_data_2009)
	ser_data$SDPoints[i] = sd(points_data_2009)
}

ser_data$Attendance = c(25371, 25282, 24136, 22493, 23268, 23385, 22213, 22644, 22164, 24767, 25237)

ser_data$Odds = c(2.38406, 2.40024, 2.41895, 2.46608, 2.48134, 2.54416, 2.58911, 2.64374, 2.86021, 3.01905, 2.89013)

epl_data
bun_data
ser_data

