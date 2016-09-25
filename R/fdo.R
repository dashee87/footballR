##' Call football-data.org API
##'
##' Calls the football data.org API
##' @param request (string) url fragment that completes the address of the
##'   intended API call (required)
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return The output is converted from its JSON format to a data frame
##' @export

fdo_call_API <- function(request, token="", response = "full"){
  url <- paste0("http://api.football-data.org/",request)
  output <- httr::GET(url,httr::add_headers(`X-Auth-Token` = token, `X-Response-Control` = response))
  return(jsonlite::fromJSON(httr::content(output, as = "text", encoding = "UTF-8")))
}

##' List of competitions from the football-data.org API
##'
##' Returns list of competitions from the football-data.org API
##' @param season (sting) The season (e.g. "2015") to which the competitions
##'   relate. Note that the convention is to take the starting year to indicate
##'   the season. For example, "2015/2016" is represented by "2015". Defaults to
##'   the current season.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # defaults to current season
##' fdo_listComps()
##' # get list of 2015 competitions without metadata
##' fdo_listComps("2015",response = "minified")
##' }
##' @export

fdo_listComps <- function(season="", token="", response = "full"){
  url <- paste0("v1/competitions/",ifelse(season=="","",paste0("?season=",season)))
  fdo_call_API(url, token, response)
}

#' List of teams in competitions from the football-data.org API
#'
#' Returns list of teams in a competition from the football-data.org API
#' @param id (sting) The id (e.g. "436") of the league in which the teams
#'   compete. Requried. No default.
#' @param token (string) football data.org API token. Optional but it's
#'   recommended that you acquire an API token. It allows the owner to document
#'   API activity. See \url{http://api.football-data.org/register} for more
#'   details.
#' @param response (string). Determine the structure of the response. Default is
#'   "full" and "minified" will remove some meta inforation and thus return a
#'   smaller data frame. Finally, "compressed" is only supported by the fixture
#'   resource.
#' @return A data frame converted from the JSON format is returned.
#' @examples
#' \dontrun{
#' # get list of teams (without metadata) competing in the Spanish Primera Division (La Liga)
#' fdo_listCompTeams("436",response = "minified")
#' }
#' @export

fdo_listCompTeams <- function(id, token="", response = "full"){
  url <- paste0("v1/competitions/",id,"/teams")
  fdo_call_API(url, token, response)
}

#' Competition league table from the football-data.org API
#'
#' Returns a competition league table from the football-data.org API
#' @param id (sting) The id (e.g. "436") of the league in which the teams
#'   compete. Requried. No default.
#' @param matchDay (string) The matchday to which the league table applies
#'   (e.g. "3"). Optional. Default is the current match day.
#' @param token (string) football data.org API token. Optional but it's
#'   recommended that you acquire an API token. It allows the owner to document
#'   API activity. See \url{http://api.football-data.org/register} for more
#'   details.
#' @param response (string). Determine the structure of the response. Default
#'   is "full" and "minified" will remove some meta inforation and thus return
#'   a smaller data frame. Finally, "compressed" is only supported by the
#'   fixture resource.
#' @return A data frame converted from the JSON format is returned.
#' @examples
#' \dontrun{
#' # get current Spanish Primera Division (La Liga) standings (without metadata)
#' fdo_leagueTable("436",response = "minified")
#' # Primera Division league table afer match day 2
#' fdo_leagueTable("436",response = "minified",matchDay = "2")
#' }
#' @export


fdo_leagueTable <- function(id, matchDay = "", token="", response = "full"){
  url <- paste0("v1/competitions/",id,"/leagueTable",
                ifelse(matchDay=="","",paste0("?matchday=",matchDay)))
  fdo_call_API(url, token, response)
}

##' Show one team
##'
##' Returns data for one team from the football-data.org API
##' @param id (sting) The id (e.g. "77") of the team. Requried. No default.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # get current Spanish Primera Division (La Liga) standings (without metadata)
##' fdo_leagueTable("436",response = "minified")
##' # We can see from the league table that team id for Athletic Bilbao is 77
##' # Return information on Athletic Bilbao
##' fdo_team("77")
##' }
##' @export


fdo_team <- function(id, token="", response = "full"){
  url <- paste0("v1/teams/",id)
  fdo_call_API(url, token, response)
}

##' Show all players for one team
##'
##' Returns player data for a specific team from the football-data.org API
##' @param id (sting) The id (e.g. "77") of the team. Requried. No default.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # the team id for Athletic Bilbao is 77
##' # return data for all Athletic Bilbao players
##' fdo_teamPlayers("77")
##' }
##' @export

fdo_teamPlayers <- function(id, token="", response = "full"){
  url <- paste0("v1/teams/",id,"/players")
  fdo_call_API(url, token, response)
}

##' List all fixtures for a certain competition.
##'
##' Returns all fixtures for a specific competition from the football-data.org
##' API
##' @param id (sting) The id (e.g. "436") of the competition. Requried. No
##'   default.
##' @param timeFrame (string) The value of the timeFrame argument must start
##'   with either p(ast) or n(ext), representing a timeframe either in the past
##'   or future. It is followed by a number in the range 1-99. For example, p6
##'   would return all fixtures in the last 6 days, whereas n23 would result in
##'   returning all fixtures in the next 23 days. Optional. Default is the empty
##'   string, which returns all fixtures, irrespective of date.
##' @param matchDay (string) The matchday to which the fixtures relate (e.g.
##'   "3"). Optional. Default is "", which returns all matchDays. Note that a
##'   non-empty string matchDay value will override the timeFrame value.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # league id for Ligue 1 2015/16 is 434
##' # all fixtures in the Ligue 1 2015/16 season
##' fdo_listCompFixtures("434")
##' # Ligue 1 fixtures in the next 10 days
##' fdo_listCompFixtures("434",timeFrame="n10")
##' # Ligue 1 fixtures from the previous 10 days
##' fdo_listCompFixtures("434",timeFrame="p10")
##' # Ligue 1 fixtures for match day 10
##' fdo_listCompFixtures("434",matchDay="10")
##' }
##' @export

fdo_listCompFixtures <- function(id, timeFrame = "", matchDay = "",
                                 token="", response = "full"){
  url <- paste0("v1/competitions/",id,"/fixtures?",
                ifelse(timeFrame=="","",paste0("&timeFrame=",timeFrame)),
                ifelse(matchDay=="","",paste0("&matchday=",matchDay)))
  fdo_call_API(url, token, response)
}

##' List all fixtures for a certain team.
##'
##' Returns all fixtures for a specific team from the football-data.org API
##' @param id (sting) The id (e.g. "77") of the team Requried. No default.
##' @param season (sting) The season (e.g. "2015") to which the competitions
##'   relate. Note that the convention is to take the starting year to indicate
##'   the season. For example, "2015/2016" is represented by "2015". Optional.
##'   Defaults to the current season.
##' @param timeFrame (string) The value of the timeFrame argument must start
##'   with either p(ast) or n(ext), representing a timeframe either in the past
##'   or future. It is followed by a number in the range 1-99. For example, p6
##'   would return all fixtures in the last 6 days, whereas n23 would result in
##'   returning all fixtures in the next 23 days. Optional. Default is the empty
##'   string, which returns all fixtures for the current season.
##' @param venue (sting) Determines whether home, away or all fixtures are
##'   returned. Possible values are "home", "away" and "". Optional. Default is
##'   "", which means all fixtures are returned.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # team id for Athletic Bilbao is 77
##' # all Athletic Bilbao fixtures in the current (2016/17) season
##' fdo_listTeamFixtures("77")
##' # all Athletic Bilbao fixtures in 2015/16 season
##' fdo_listTeamFixtures("77",season = "2015")
##' # all Athletic Bilbao fixtures in the next 10 days
##' fdo_listTeamFixtures("77",timeFrame="n10")
##' # all Athletic Bilbao home fixtures in the next 10 days
##' fdo_listTeamFixtures("77",timeFrame = "n10", venue = "home")
##' }
##' @export

fdo_listTeamFixtures <- function(id, season = "", timeFrame = "", venue = "",
                                 token = "", response = "full"){
  url <- paste0("v1/teams/",id,"/fixtures?",
                ifelse(season=="","",paste0("season=",season)),
                ifelse(timeFrame=="","",paste0("&timeFrame=",timeFrame)),
                ifelse(venue=="","",paste0("&venue=",venue)))
  fdo_call_API(url, token, response)
}

##' Show one fixture (including past meetings).
##'
##' Returns information for a fixture (including past meetings) from the
##' football-data.org API
##' @param id (sting) The id (e.g. "149461") of the fixture. Requried. No
##'   default.
##' @param past (sting)Define the the number of former games to be analyzed in
##'   the head2head node. Optional. Defaults to 10.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A list of two data frames (one list for the specified fixtures,
##'   another for the past meetings) converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # fixture id for Athletic Bilbao v Sevilla  is 153986
##' # get fixture and past meetings information
##' fdo_getFixture("153986")
##' # just fixture information
##' fdo_getFixture("153986", past = 0)
##' }
##' @export

fdo_getFixture <- function(id, past = "",token = "", response = "full"){
  url <- paste0("v1/fixtures/",id,"/",
                ifelse(past == "","",paste0("?head2head=",past)))
  fdo_call_API(url, token, response)
}

##' List all fixtures for a certain competition.
##'
##' Returns all fixtures for a specific competition from the football-data.org
##' API
##' @param timeFrame (string) The value of the timeFrame argument must start
##'   with either p(ast) or n(ext), representing a timeframe either in the past
##'   or future. It is followed by a number in the range 1-99. For example, p6
##'   would return all fixtures in the last 6 days, whereas n23 would result in
##'   returning all fixtures in the next 23 days. Optional. Default is "n7".
##' @param league (string <vector>) A vector of the league codes. Not to be
##'   confused with league ids, leagues codes can be found the
##'   \code{\link{fdo_leagueCodes}} data frame. Optional. Default is "", meaning
##'   all league codes are returned.
##' @param token (string) football data.org API token. Optional but it's
##'   recommended that you acquire an API token. It allows the owner to document
##'   API activity. See \url{http://api.football-data.org/register} for more
##'   details.
##' @param response (string). Determine the structure of the response. Default
##'   is "full" and "minified" will remove some meta inforation and thus return
##'   a smaller data frame. Finally, "compressed" is only supported by the
##'   fixture resource.
##' @return A data frame converted from the JSON format is returned.
##' @examples
##' \dontrun{
##' # league code for La Liga is "PD"
##' # all La Liga fixtures in the coming 7 days
##' fdo_listFixtures("PD")
##' # league code for Ligue 1 is "FL1"
##' # all La Liga and Ligue 1 fixtures in the next 14 days.
##' fdo_listFixtures(league=c("PD","FL1"),timeFrame="n14")
##' }
##' @export

fdo_listFixtures <- function(league = "", timeFrame = "",
                             token="", response = "full"){
  if(length(league)>1)
    league <- paste0(league, collapse = ",")
  url <- paste0("v1/fixtures/?",
                ifelse(timeFrame == "","",paste0("timeFrame=",timeFrame)),
                ifelse(league == "","",paste0("&league=",league)))
  fdo_call_API(url, token, response)
}

#' fdo_leagueCodes
#'
#' Table of leagueCodes to be used with \code{\link{fdo_listFixtures}}
#'
#' @format A data frame with 3 variables: \describe{
#'   \item{\code{leagueCode}}{The League Code as a string e.g. "PL" represents
#'   Premier League} \item{\code{country}}{The country in which that league
#'   takes place e.g. "England"} \item{\code{league}}{The name of the league
#'   e.g. "Premier League", "1.Bundesliga"} }
#'
#'   For further details, see
#'   \url{http://api.football-data.org/docs/v1/index.html#league_codes}
#'
"fdo_leagueCodes"
