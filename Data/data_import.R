if (!require("nflverse")) install.packages("nflverse")

years <- c(2002:2004)
data <- load_player_stats(seasons = years, stat_type = "offense", file_type = "csv")
data_df <- as.data.frame(data)
