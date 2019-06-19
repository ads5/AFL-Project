library(rvest)
library(stringr)

player_movement_data <- data.frame(Season = character(), Team = character(), Player = character(), Direction = character(), Method = character())
names(player_movement_data) <- c("Season", "Team", "Player", "Direction", "Method")

for (i in 6:7){
	season_data <- read_html(paste0('http://www.aflplayers.com.au/article/player-movement-in-201', i, '/'))
	team <- season_data %>%
		html_nodes('h2') %>%
		html_text()
	team <- as.matrix(team)
	team <- as.matrix(team[!startsWith(team, "Ins") &&  !startsWith(team, "Outs") & team != " " & team!="AFL" & team!= "#title", ])
	n=nrow(team)
	
	season <- season_data %>%
		html_nodes('h1') %>%
		html_text()
	season <- gsub("[A-z]", "", season)
	season <- trimws(season)
	
	data <- season_data %>%
		html_nodes('p') %>%
		html_text()
	data <- as.matrix(data)
	
	ins <- matrix(data[startsWith(data, "Ins"), ])
	ins <- gsub('Ins –', "", ins)
	ins <- gsub('Ins –', "", ins)
	ins <- gsub('Ins – ', "", ins)
	ins <- gsub('Ins –', "", ins)
	ins <- strsplit(ins, ",")
	
	outs <- matrix(data[startsWith(data, "Outs"), ])
	outs <- gsub('Outs — ', "", outs)
	outs <- gsub('Outs — ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- strsplit(outs, ",")	
	j=6
	for (j in 1:18){
		ins_j <- ins[j]
		ins_j <- matrix(unlist(ins_j))
		ins_j <- trimws(ins_j)
		n = nrow(ins_j)
		if (n == 0){
			next
		}
		method <- ins_j
		ins_j <- gsub("\\s*\\([^0\\)]+\\)", "", ins_j)
		method <- gsub("^.*\\s", "", method)
		method <- gsub("[\\(+\\)]", "", method)
		newrow = data.frame(Season=season, Team=team[j], Player=ins_j, Direction="Ins", Method=method)
		player_movement_data <- rbind(player_movement_data, newrow)
		rm(ins_j)
	}
	
	for (k in 1:18){
		
		outs_k <- outs[k]
		outs_k <- matrix(unlist(outs_k))
		outs_k <- trimws(outs_k)
		n = nrow(outs_k)
		if (n == 0){
			next
		}
		method <- outs_k
		outs_k <- gsub("\\s*\\([^0\\)]+\\)", "", outs_k)
		method <- gsub("^.*\\s", "", method)
		method <- gsub("[\\(+\\)]", "", method)
		newrow = data.frame(Season=season, Team=team[k], Player=outs_k, Direction="Outs", Method=method)
		player_movement_data <- rbind(player_movement_data, newrow)
		
		rm(outs_k)
	}
}

	season_data <- read_html('http://www.aflplayers.com.au/article/player-movement-in-2018')
	team <- season_data %>%
		html_nodes('p') %>%
		html_text()
	team <- as.matrix(team)
	team <- as.matrix(team[!startsWith(team, "Ins") & !startsWith(team, "Outs") & team != " " & team!="AFL" & team!= "#title", ])
	n=nrow(team)
	
	season <- season_data %>%
		html_nodes('h1') %>%
		html_text()
	season <- gsub("[A-z]", "", season)
	season <- trimws(season)
	
	data <- season_data %>%
		html_nodes('p') %>%
		html_text()
	data <- as.matrix(data)
	
	ins <- matrix(data[startsWith(data, "Ins"), ])
	ins <- gsub('Ins –', "", ins)
	ins <- gsub('Ins –', "", ins)
	ins <- gsub('Ins – ', "", ins)
	ins <- gsub('Ins –', "", ins)
	ins <- gsub('Ins — ', "", ins)
	ins <- strsplit(ins, ",")
	
	outs <- matrix(data[startsWith(data, "Outs"), ])
	outs <- gsub('Outs — ', "", outs)
	outs <- gsub('Outs — ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- gsub('Outs – ', "", outs)
	outs <- strsplit(outs, ",")	
	
	for (j in 1:18){
		ins_j <- ins[j]
		ins_j <- matrix(unlist(ins_j))
		ins_j <- trimws(ins_j)
		n = nrow(ins_j)
		if (n == 0){
			next
		}
		method <- ins_j
		ins_j <- gsub("\\s*\\([^0\\)]+\\)", "", ins_j)
		method <- gsub("^.*\\s", "", method)
		method <- gsub("[\\(+\\)]", "", method)
		newrow = data.frame(Season=season, Team=team[j], Player=ins_j, Direction="Ins", Method=method)
		player_movement_data <- rbind(player_movement_data, newrow)
		rm(ins_j)
	}
	
	for (k in 1:18){
		
		outs_k <- outs[k]
		outs_k <- matrix(unlist(outs_k))
		outs_k <- trimws(outs_k)
		n = nrow(outs_k)
		if (n == 0){
			next
		}
		method <- outs_k
		outs_k <- gsub("\\s*\\([^0\\)]+\\)", "", outs_k)
		method <- gsub("^.*\\s", "", method)
		method <- gsub("[\\(+\\)]", "", method)
		newrow = data.frame(Season=season, Team=team[k], Player=outs_k, Direction="Outs", Method=method)
		player_movement_data <- rbind(player_movement_data, newrow)
		
		rm(outs_k)
	}
	
player_movement_data

write.csv(player_movement_data, "player_movement_2016-2018.csv")