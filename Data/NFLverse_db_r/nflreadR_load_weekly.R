### This is a starting example of using nflreadr to import roster data through
### the year 1920 at earliest. I will be using similar method in python with
### nfl_data_py to send a DF of all rosters to postgreSQL.

#----------------------------------------------------
# dependencies:
if (!require("nflfastR")) install.packages("nflfastR")
if (!require("nflreadr")) install.packages("nflreadr")

if (!require("DBI")) install.packages("DBI")
if (!require("RPostgres")) install.packages("RPostgres")
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("ggrepel")) install.packages("ggrepel")
if (!require("gsisdecoder")) install.packages("gsisdecoder")
if (!require("config")) install.packages("config")

# dependencies:
library(nflreadr)
library(tidyverse)
library(ggrepel)
library(nflreadr)
library(nflplotR)
library(nflfastR)
library(DBI)
library(RPostgres)
library(config)

# This prevents R from displaying numbers in scientific notation
options(scipen = 9999)

#----------------------------------------------------
# use config.yml for your DBMS connection:

drv = RPostgres::Postgres()
my_postgres <- dbConnect(
  drv,
  dbname = config::get("dbname"),
  host = config::get("host"),
  port = config::get("port"),
  password = config::get("password"),
  user = config::get("user"),
  service = NULL,
  bigint = c("integer64", "integer", "numeric", "character"),
  check_interrupts = FALSE,
  timezone = config::get("timezone"),
  timezone_out = NULL
)

calculate_player_stats(pbp, weekly = FALSE)


#now create the new play-by-play db:
#source: https://www.nflfastr.com/articles/nflfastR.html#example-8-using-the-built-in-database-function
# 
# update_db(
#   tblname = nflfastR_player_stats,
#   force_rebuild = FALSE,
#   db_connection = my_postgres
# )


nflfastR::load_pbp(2020) %>%
  dplyr::filter(season_type == "REG") %>%
  nflfastR::calculate_player_stats() %>%
  dplyr::arrange(-passing_yards) %>%
  dplyr::select(player_name, recent_team, completions, attempts, passing_yards, passing_tds, interceptions) %>%
  utils::head(10) %>%
  knitr::kable(digits = 0)

#return list of all tables in my NFLdb
DBI::dbListTables(my_postgres)

# Set table name as the postgres db table for future calls:
weekly_pbp_db <- dplyr::tbl(my_postgres, "nflfastR_player_stats")

#summary.table(nflfastR_player_stats)

# S4 method for PqConnection (close connection to NFLdb)
dbDisconnect(my_postgres)


#player_stats <- load_player_stats(2021, file_type = "csv")

