---
title: "fdo_tutorial"
author: "David Sheehan"
date: "25 September 2016"
output: html_document
---

How to use the football-data.org API
=======

This page will describe how to use the `footballR` package to perform calls to the [football-data.org API](http://api.football-data.org/index). The data obtainable from these functions includes past/previous fixtures, league tables, team information for Europe's top leagues and major international competitions.

## Before We start

The [football-data.org API](http://api.football-data.org/index) is free to use and (as of September 2016) appears to be regularly updated. An app key is not necessary, but it's recommeneded, as it's free and allows the API owner to manage and control API usage. It's a simple process; just enter your name and email address [here](http://api.football-data.org/register).

The API is extensively documented, so please refer to the online [documentation](http://api.football-data.org/docs/v1/index.html) if you require any further information.

## Code

Let's load the package (assuming you've already installed it).


```r
# load package
require("footballR")
```

Let's start off by checking all the competitions that can be accessed via this API. Note: An app key is not necessary (though recommended), this tutorial will perform API calls without an app key. An app key can be incorporated quite easily, by appending the `token` argument to the function.


```r
# without app key
fdo_listComps()
```

```
##                                         _links.href
## 1  http://api.football-data.org/v1/competitions/424
## 2  http://api.football-data.org/v1/competitions/426
## 3  http://api.football-data.org/v1/competitions/427
## 4  http://api.football-data.org/v1/competitions/428
## 5  http://api.football-data.org/v1/competitions/430
## 6  http://api.football-data.org/v1/competitions/431
## 7  http://api.football-data.org/v1/competitions/432
## 8  http://api.football-data.org/v1/competitions/433
## 9  http://api.football-data.org/v1/competitions/434
## 10 http://api.football-data.org/v1/competitions/435
## 11 http://api.football-data.org/v1/competitions/436
## 12 http://api.football-data.org/v1/competitions/437
## 13 http://api.football-data.org/v1/competitions/438
## 14 http://api.football-data.org/v1/competitions/439
## 15 http://api.football-data.org/v1/competitions/440
##                                               _links.href
## 1  http://api.football-data.org/v1/competitions/424/teams
## 2  http://api.football-data.org/v1/competitions/426/teams
## 3  http://api.football-data.org/v1/competitions/427/teams
## 4  http://api.football-data.org/v1/competitions/428/teams
## 5  http://api.football-data.org/v1/competitions/430/teams
## 6  http://api.football-data.org/v1/competitions/431/teams
## 7  http://api.football-data.org/v1/competitions/432/teams
## 8  http://api.football-data.org/v1/competitions/433/teams
## 9  http://api.football-data.org/v1/competitions/434/teams
## 10 http://api.football-data.org/v1/competitions/435/teams
## 11 http://api.football-data.org/v1/competitions/436/teams
## 12 http://api.football-data.org/v1/competitions/437/teams
## 13 http://api.football-data.org/v1/competitions/438/teams
## 14 http://api.football-data.org/v1/competitions/439/teams
## 15 http://api.football-data.org/v1/competitions/440/teams
##                                                  _links.href
## 1  http://api.football-data.org/v1/competitions/424/fixtures
## 2  http://api.football-data.org/v1/competitions/426/fixtures
## 3  http://api.football-data.org/v1/competitions/427/fixtures
## 4  http://api.football-data.org/v1/competitions/428/fixtures
## 5  http://api.football-data.org/v1/competitions/430/fixtures
## 6  http://api.football-data.org/v1/competitions/431/fixtures
## 7  http://api.football-data.org/v1/competitions/432/fixtures
## 8  http://api.football-data.org/v1/competitions/433/fixtures
## 9  http://api.football-data.org/v1/competitions/434/fixtures
## 10 http://api.football-data.org/v1/competitions/435/fixtures
## 11 http://api.football-data.org/v1/competitions/436/fixtures
## 12 http://api.football-data.org/v1/competitions/437/fixtures
## 13 http://api.football-data.org/v1/competitions/438/fixtures
## 14 http://api.football-data.org/v1/competitions/439/fixtures
## 15 http://api.football-data.org/v1/competitions/440/fixtures
##                                                     _links.href  id
## 1  http://api.football-data.org/v1/competitions/424/leagueTable 424
## 2  http://api.football-data.org/v1/competitions/426/leagueTable 426
## 3  http://api.football-data.org/v1/competitions/427/leagueTable 427
## 4  http://api.football-data.org/v1/competitions/428/leagueTable 428
## 5  http://api.football-data.org/v1/competitions/430/leagueTable 430
## 6  http://api.football-data.org/v1/competitions/431/leagueTable 431
## 7  http://api.football-data.org/v1/competitions/432/leagueTable 432
## 8  http://api.football-data.org/v1/competitions/433/leagueTable 433
## 9  http://api.football-data.org/v1/competitions/434/leagueTable 434
## 10 http://api.football-data.org/v1/competitions/435/leagueTable 435
## 11 http://api.football-data.org/v1/competitions/436/leagueTable 436
## 12 http://api.football-data.org/v1/competitions/437/leagueTable 437
## 13 http://api.football-data.org/v1/competitions/438/leagueTable 438
## 14 http://api.football-data.org/v1/competitions/439/leagueTable 439
## 15 http://api.football-data.org/v1/competitions/440/leagueTable 440
##                               caption league year currentMatchday
## 1  European Championships France 2016     EC 2016               7
## 2              Premier League 2016/17     PL 2016               6
## 3                Championship 2016/17    ELC 2016               9
## 4                  League One 2016/17    EL1 2016               9
## 5               1. Bundesliga 2016/17    BL1 2016               5
## 6               2. Bundesliga 2016/17    BL2 2016               7
## 7                   DFB-Pokal 2016/17    DFB 2016               2
## 8                  Eredivisie 2016/17    DED 2016               7
## 9                     Ligue 1 2016/17    FL1 2016               7
## 10                    Ligue 2 2016/17    FL2 2016               9
## 11           Primera Division 2016/17     PD 2016               6
## 12              Liga Adelante 2016/17     SD 2016               7
## 13                    Serie A 2016/17     SA 2016               6
## 14              Primeira Liga 2016/17    PPL 2016               6
## 15           Champions League 2016/17     CL 2016               2
##    numberOfMatchdays numberOfTeams numberOfGames          lastUpdated
## 1                  7            24            51 2016-07-10T21:32:20Z
## 2                 38            20           380 2016-09-25T09:59:54Z
## 3                 46            24           552 2016-09-25T10:05:15Z
## 4                 46            24           552 2016-09-25T10:05:41Z
## 5                 34            18           306 2016-09-25T00:02:13Z
## 6                 34            18           306 2016-09-25T00:02:43Z
## 7                  5            64            48 2016-08-28T07:00:07Z
## 8                 34            18           306 2016-09-25T10:00:23Z
## 9                 38            20           380 2016-09-25T10:00:44Z
## 10                38            20           380 2016-09-25T10:01:07Z
## 11                38            20           380 2016-09-25T10:01:41Z
## 12                42            22           462 2016-09-25T10:07:55Z
## 13                38            20           380 2016-09-25T10:08:20Z
## 14                34            18           306 2016-09-25T10:08:33Z
## 15                10            32            96 2016-09-17T10:00:15Z
```

```r
# with app key
# appkey = "myappkey"
# fdo_listComps(token=appkey)
```

There's quite a bit of information in there, some of which we may not be interested in. We can streamline the output by including an appropriate `response` argument.


```r
# default is reponse = "full"
fdo_listComps(response = "minified")
```

```
##     id                            caption league year currentMatchday
## 1  424 European Championships France 2016     EC 2016               7
## 2  426             Premier League 2016/17     PL 2016               6
## 3  427               Championship 2016/17    ELC 2016               9
## 4  428                 League One 2016/17    EL1 2016               9
## 5  430              1. Bundesliga 2016/17    BL1 2016               5
## 6  431              2. Bundesliga 2016/17    BL2 2016               7
## 7  432                  DFB-Pokal 2016/17    DFB 2016               2
## 8  433                 Eredivisie 2016/17    DED 2016               7
## 9  434                    Ligue 1 2016/17    FL1 2016               7
## 10 435                    Ligue 2 2016/17    FL2 2016               9
## 11 436           Primera Division 2016/17     PD 2016               6
## 12 437              Liga Adelante 2016/17     SD 2016               7
## 13 438                    Serie A 2016/17     SA 2016               6
## 14 439              Primeira Liga 2016/17    PPL 2016               6
## 15 440           Champions League 2016/17     CL 2016               2
##    numberOfMatchdays numberOfTeams numberOfGames          lastUpdated
## 1                  7            24            51 2016-07-10T21:32:20Z
## 2                 38            20           380 2016-09-25T09:59:54Z
## 3                 46            24           552 2016-09-25T10:05:15Z
## 4                 46            24           552 2016-09-25T10:05:41Z
## 5                 34            18           306 2016-09-25T00:02:13Z
## 6                 34            18           306 2016-09-25T00:02:43Z
## 7                  5            64            48 2016-08-28T07:00:07Z
## 8                 34            18           306 2016-09-25T10:00:23Z
## 9                 38            20           380 2016-09-25T10:00:44Z
## 10                38            20           380 2016-09-25T10:01:07Z
## 11                38            20           380 2016-09-25T10:01:41Z
## 12                42            22           462 2016-09-25T10:07:55Z
## 13                38            20           380 2016-09-25T10:08:20Z
## 14                34            18           306 2016-09-25T10:08:33Z
## 15                10            32            96 2016-09-17T10:00:15Z
```

And we can change the season that we're interested in (the package generally defaults to the current season).


```r
fdo_listComps(season = "2015",response = "minified")
```

```
##     id                  caption league year currentMatchday
## 1  394    1. Bundesliga 2015/16    BL1 2015              34
## 2  395    2. Bundesliga 2015/16    BL2 2015              34
## 3  396          Ligue 1 2015/16    FL1 2015              38
## 4  397          Ligue 2 2015/16    FL2 2015              38
## 5  398   Premier League 2015/16     PL 2015              38
## 6  399 Primera Division 2015/16     PD 2015              38
## 7  400 Segunda Division 2015/16     SD 2015              42
## 8  401          Serie A 2015/16     SA 2015              38
## 9  402    Primeira Liga 2015/16    PPL 2015              34
## 10 403    3. Bundesliga 2015/16    BL3 2015              38
## 11 404       Eredivisie 2015/16    DED 2015              34
## 12 405 Champions League 2015/16     CL 2015              10
## 13 425       League One 2015/16    EL1 2015              16
##    numberOfMatchdays numberOfTeams numberOfGames          lastUpdated
## 1                 34            18           306 2016-06-15T08:09:51Z
## 2                 34            18           306 2016-05-15T16:00:18Z
## 3                 38            20           380 2016-05-13T07:00:02Z
## 4                 38            20           380 2016-05-14T05:57:07Z
## 5                 38            20           380 2016-05-19T15:12:55Z
## 6                 38            20           380 2016-05-16T07:16:11Z
## 7                 42            22           462 2016-07-04T21:35:12Z
## 8                 38            20           380 2016-05-16T07:15:29Z
## 9                 34            18           306 2016-05-15T19:23:33Z
## 10                38            20           380 2016-05-14T14:15:13Z
## 11                34            18           306 2016-05-08T18:39:50Z
## 12                10            32           125 2016-06-06T10:11:53Z
## 13                46            24           552 2016-05-19T19:00:12Z
```

If you require more information on a function, then run the function with a question mark e.g. `?fdo_listComps`.

You'll notice from the above data frame that the league id for the 2016/17 season of the Premier League is 426. Let's have a look at all the teams in the that EPL season.


```r
fdo_listCompTeams(id = "426",response = "minified")
```

```
## $count
## [1] 20
## 
## $teams
##      id                    name     shortName squadMarketValue
## 1   322            Hull City FC          Hull    122,250,000 <U+0080>
## 2   338       Leicester City FC         Foxes    210,500,000 <U+0080>
## 3   340          Southampton FC   Southampton    199,000,000 <U+0080>
## 4   346              Watford FC       Watford    128,500,000 <U+0080>
## 5   343        Middlesbrough FC Middlesbrough    104,750,000 <U+0080>
## 6    70           Stoke City FC         Stoke    172,250,000 <U+0080>
## 7    62              Everton FC       Everton    239,250,000 <U+0080>
## 8    73    Tottenham Hotspur FC         Spurs    365,500,000 <U+0080>
## 9   354       Crystal Palace FC       Crystal    157,750,000 <U+0080>
## 10   74 West Bromwich Albion FC West Bromwich    107,600,000 <U+0080>
## 11  328              Burnley FC       Burnley     66,500,000 <U+0080>
## 12   72         Swansea City FC         Swans    106,100,000 <U+0080>
## 13   65      Manchester City FC       ManCity    518,000,000 <U+0080>
## 14   71          Sunderland AFC    Sunderland     92,500,000 <U+0080>
## 15 1044         AFC Bournemouth   Bournemouth    121,750,000 <U+0080>
## 16   66    Manchester United FC          ManU    534,250,000 <U+0080>
## 17   57              Arsenal FC       Arsenal    468,500,000 <U+0080>
## 18   64            Liverpool FC     Liverpool    387,200,000 <U+0080>
## 19   61              Chelsea FC       Chelsea    514,800,000 <U+0080>
## 20  563      West Ham United FC      West Ham    241,500,000 <U+0080>
##                                                                             crestUrl
## 1                    http://upload.wikimedia.org/wikipedia/de/a/a9/Hull_City_AFC.svg
## 2                      http://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png
## 3                   http://upload.wikimedia.org/wikipedia/de/c/c9/FC_Southampton.svg
## 4                         https://upload.wikimedia.org/wikipedia/en/e/e2/Watford.svg
## 5          https://upload.wikimedia.org/wikipedia/en/2/2c/Middlesbrough_FC_crest.svg
## 6                       http://upload.wikimedia.org/wikipedia/de/a/a3/Stoke_City.svg
## 7                       http://upload.wikimedia.org/wikipedia/de/f/f9/Everton_FC.svg
## 8                http://upload.wikimedia.org/wikipedia/de/b/b4/Tottenham_Hotspur.svg
## 9  http://upload.wikimedia.org/wikipedia/de/b/bf/Crystal_Palace_F.C._logo_(2013).png
## 10            http://upload.wikimedia.org/wikipedia/de/8/8b/West_Bromwich_Albion.svg
## 11               https://upload.wikimedia.org/wikipedia/en/0/02/Burnley_FC_badge.png
## 12               http://upload.wikimedia.org/wikipedia/de/a/ab/Swansea_City_Logo.svg
## 13       https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg
## 14                  http://upload.wikimedia.org/wikipedia/de/6/60/AFC_Sunderland.svg
## 15                https://upload.wikimedia.org/wikipedia/de/4/41/Afc_bournemouth.svg
## 16            http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg
## 17                      http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg
## 18                    http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Liverpool.svg
## 19                   http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg
## 20              http://upload.wikimedia.org/wikipedia/de/e/e0/West_Ham_United_FC.svg
```

We can see the current league table for this competition.


```r
fdo_leagueTable(id = "426",response = "minified")
```

```
## $leagueCaption
## [1] "Premier League 2016/17"
## 
## $matchday
## [1] 6
## 
## $standing
##    rank          team teamId playedGames
## 1     1       ManCity     65           6
## 2     2         Spurs     73           6
## 3     3       Arsenal     57           6
## 4     4     Liverpool     64           6
## 5     5       Everton     62           6
## 6     6          ManU     66           6
## 7     7       Crystal    354           6
## 8     8       Chelsea     61           6
## 9     9 West Bromwich     74           6
## 10   10       Watford    346           5
## 11   11         Foxes    338           6
## 12   12          Hull    322           6
## 13   13   Bournemouth   1044           6
## 14   14   Southampton    340           5
## 15   15 Middlesbrough    343           6
## 16   16         Swans     72           6
## 17   17       Burnley    328           5
## 18   18      West Ham    563           5
## 19   19         Stoke     70           6
## 20   20    Sunderland     71           6
##                                                                                 crestURI
## 1            https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg
## 2                    http://upload.wikimedia.org/wikipedia/de/b/b4/Tottenham_Hotspur.svg
## 3                           http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg
## 4                         http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Liverpool.svg
## 5                           http://upload.wikimedia.org/wikipedia/de/f/f9/Everton_FC.svg
## 6                 http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg
## 7  http://upload.wikimedia.org/wikipedia/de/b/bf/Crystal_Palace_F.C._logo_%282013%29.png
## 8                        http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg
## 9                 http://upload.wikimedia.org/wikipedia/de/8/8b/West_Bromwich_Albion.svg
## 10                            https://upload.wikimedia.org/wikipedia/en/e/e2/Watford.svg
## 11                         http://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png
## 12                       http://upload.wikimedia.org/wikipedia/de/a/a9/Hull_City_AFC.svg
## 13                    https://upload.wikimedia.org/wikipedia/de/4/41/Afc_bournemouth.svg
## 14                      http://upload.wikimedia.org/wikipedia/de/c/c9/FC_Southampton.svg
## 15             https://upload.wikimedia.org/wikipedia/en/2/2c/Middlesbrough_FC_crest.svg
## 16                   http://upload.wikimedia.org/wikipedia/de/a/ab/Swansea_City_Logo.svg
## 17                   https://upload.wikimedia.org/wikipedia/en/0/02/Burnley_FC_badge.png
## 18                  http://upload.wikimedia.org/wikipedia/de/e/e0/West_Ham_United_FC.svg
## 19                          http://upload.wikimedia.org/wikipedia/de/a/a3/Stoke_City.svg
## 20                      http://upload.wikimedia.org/wikipedia/de/6/60/AFC_Sunderland.svg
##    points goals goalsAgainst goalDifference
## 1      18    18            5             13
## 2      14    10            3              7
## 3      13    15            7              8
## 4      13    16            9              7
## 5      13    10            4              6
## 6      12    12            7              5
## 7      10    10            7              3
## 8      10    10            9              1
## 9       8     7            6              1
## 10      7    10            9              1
## 11      7     8           11             -3
## 12      7     7           12             -5
## 13      7     4            9             -5
## 14      5     4            6             -2
## 15      5     6            9             -3
## 16      4     5           10             -5
## 17      4     3            8             -5
## 18      3     7           13             -6
## 19      2     4           15            -11
## 20      1     5           12             -7
```

By default, it returns the current league table. Through the `matchDay` argument, we can also look at past league tables.


```r
fdo_leagueTable(id = "426", matchDay = 3, response = "minified")
```

```
## $leagueCaption
## [1] "Premier League 2016/17"
## 
## $matchday
## [1] 3
## 
## $standing
##    rank          team teamId playedGames
## 1     1       ManCity     65           3
## 2     2       Chelsea     61           3
## 3     3          ManU     66           3
## 4     4       Everton     62           3
## 5     5          Hull    322           3
## 6     6 Middlesbrough    343           3
## 7     6         Spurs     73           3
## 8     8       Arsenal     57           3
## 9     9         Foxes    338           3
## 10   10 West Bromwich     74           3
## 11   11     Liverpool     64           3
## 12   12      West Ham    563           3
## 13   13       Burnley    328           3
## 14   13         Swans     72           3
## 15   15   Southampton    340           3
## 16   16    Sunderland     71           3
## 17   17       Crystal    354           3
## 18   18       Watford    346           3
## 19   19   Bournemouth   1044           3
## 20   20         Stoke     70           3
##                                                                                 crestURI
## 1            https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg
## 2                        http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg
## 3                 http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg
## 4                           http://upload.wikimedia.org/wikipedia/de/f/f9/Everton_FC.svg
## 5                        http://upload.wikimedia.org/wikipedia/de/a/a9/Hull_City_AFC.svg
## 6              https://upload.wikimedia.org/wikipedia/en/2/2c/Middlesbrough_FC_crest.svg
## 7                    http://upload.wikimedia.org/wikipedia/de/b/b4/Tottenham_Hotspur.svg
## 8                           http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg
## 9                          http://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png
## 10                http://upload.wikimedia.org/wikipedia/de/8/8b/West_Bromwich_Albion.svg
## 11                        http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Liverpool.svg
## 12                  http://upload.wikimedia.org/wikipedia/de/e/e0/West_Ham_United_FC.svg
## 13                   https://upload.wikimedia.org/wikipedia/en/0/02/Burnley_FC_badge.png
## 14                   http://upload.wikimedia.org/wikipedia/de/a/ab/Swansea_City_Logo.svg
## 15                      http://upload.wikimedia.org/wikipedia/de/c/c9/FC_Southampton.svg
## 16                      http://upload.wikimedia.org/wikipedia/de/6/60/AFC_Sunderland.svg
## 17 http://upload.wikimedia.org/wikipedia/de/b/bf/Crystal_Palace_F.C._logo_%282013%29.png
## 18                            https://upload.wikimedia.org/wikipedia/en/e/e2/Watford.svg
## 19                    https://upload.wikimedia.org/wikipedia/de/4/41/Afc_bournemouth.svg
## 20                          http://upload.wikimedia.org/wikipedia/de/a/a3/Stoke_City.svg
##    points goals goalsAgainst goalDifference
## 1       9     9            3              6
## 2       9     7            2              5
## 3       9     6            1              5
## 4       7     4            2              2
## 5       6     4            2              2
## 6       5     3            2              1
## 7       5     3            2              1
## 8       4     6            5              1
## 9       4     3            3              0
## 10      4     2            2              0
## 11      4     5            6             -1
## 12      3     3            5             -2
## 13      3     2            4             -2
## 14      3     2            4             -2
## 15      2     2            4             -2
## 16      1     3            5             -2
## 17      1     1            3             -2
## 18      1     3            6             -3
## 19      1     2            5             -3
## 20      1     2            6             -4
```

And we can find out the upcoming/previous fixtures for this competition. By default, it returns all (380 in this case) fixtures for this competition. Like before, we can filter it by match day.


```r
fdo_listCompFixtures(id = "426", matchDay = 3, response = "minified")
```

```
## $count
## [1] 10
## 
## $fixtures
##        id competitionId                 date   status matchday
## 1  150822           426 2016-08-27T11:30:00Z FINISHED        3
## 2  150823           426 2016-08-27T14:00:00Z FINISHED        3
## 3  150815           426 2016-08-27T14:00:00Z FINISHED        3
## 4  150821           426 2016-08-27T14:00:00Z FINISHED        3
## 5  150819           426 2016-08-27T14:00:00Z FINISHED        3
## 6  150817           426 2016-08-27T14:00:00Z FINISHED        3
## 7  150816           426 2016-08-27T14:00:00Z FINISHED        3
## 8  150818           426 2016-08-27T16:30:00Z FINISHED        3
## 9  150824           426 2016-08-28T12:30:00Z FINISHED        3
## 10 150820           426 2016-08-28T15:00:00Z FINISHED        3
##               homeTeamName homeTeamId         awayTeamName awayTeamId
## 1     Tottenham Hotspur FC         73         Liverpool FC         64
## 2               Watford FC        346           Arsenal FC         57
## 3               Chelsea FC         61           Burnley FC        328
## 4           Southampton FC        340       Sunderland AFC         71
## 5        Leicester City FC        338      Swansea City FC         72
## 6               Everton FC         62        Stoke City FC         70
## 7        Crystal Palace FC        354      AFC Bournemouth       1044
## 8             Hull City FC        322 Manchester United FC         66
## 9  West Bromwich Albion FC         74     Middlesbrough FC        343
## 10      Manchester City FC         65   West Ham United FC        563
##    result.goalsHomeTeam result.goalsAwayTeam odds.homeWin odds.draw
## 1                     1                    1         2.37      3.25
## 2                     1                    3         4.80      3.70
## 3                     3                    0         1.25      5.50
## 4                     1                    1         1.60      3.90
## 5                     2                    1         1.72      3.70
## 6                     1                    0         1.72      3.50
## 7                     1                    1         2.20      3.20
## 8                     0                    1         7.50      4.00
## 9                     0                    0         2.50      3.00
## 10                    3                    1         1.28      5.50
##    odds.awayWin
## 1          3.00
## 2          1.72
## 3         15.00
## 4          5.80
## 5          4.75
## 6          5.50
## 7          3.40
## 8          1.50
## 9          3.00
## 10        11.00
```

Or if you're interested in what fixtures are taking place in the next 10 days


```r
fdo_listCompFixtures(id = "426", timeFrame = "n10", response = "minified")
```

```
## $count
## [1] 12
## 
## $fixtures
##        id competitionId                 date status matchday
## 1  150794           426 2016-09-25T15:00:00Z  TIMED        6
## 2  150787           426 2016-09-26T19:00:00Z  TIMED        6
## 3  150776           426 2016-09-30T19:00:00Z  TIMED        7
## 4  150781           426 2016-10-01T11:30:00Z  TIMED        7
## 5  150780           426 2016-10-01T14:00:00Z  TIMED        7
## 6  150783           426 2016-10-01T14:00:00Z  TIMED        7
## 7  150784           426 2016-10-01T14:00:00Z  TIMED        7
## 8  150777           426 2016-10-01T14:00:00Z  TIMED        7
## 9  150779           426 2016-10-02T11:00:00Z  TIMED        7
## 10 150778           426 2016-10-02T13:15:00Z  TIMED        7
## 11 150782           426 2016-10-02T13:15:00Z  TIMED        7
## 12 150775           426 2016-10-02T15:30:00Z  TIMED        7
##            homeTeamName homeTeamId            awayTeamName awayTeamId
## 1    West Ham United FC        563          Southampton FC        340
## 2            Burnley FC        328              Watford FC        346
## 3            Everton FC         62       Crystal Palace FC        354
## 4       Swansea City FC         72            Liverpool FC         64
## 5        Sunderland AFC         71 West Bromwich Albion FC         74
## 6            Watford FC        346         AFC Bournemouth       1044
## 7    West Ham United FC        563        Middlesbrough FC        343
## 8          Hull City FC        322              Chelsea FC         61
## 9  Manchester United FC         66           Stoke City FC         70
## 10    Leicester City FC        338          Southampton FC        340
## 11 Tottenham Hotspur FC         73      Manchester City FC         65
## 12           Burnley FC        328              Arsenal FC         57
##    result.goalsHomeTeam result.goalsAwayTeam odds.homeWin odds.draw
## 1                    NA                   NA         3.00      3.25
## 2                    NA                   NA         3.00      3.20
## 3                    NA                   NA         1.72      4.00
## 4                    NA                   NA         5.80      4.40
## 5                    NA                   NA         2.45      3.25
## 6                    NA                   NA         2.20      3.50
## 7                    NA                   NA         2.10      3.40
## 8                    NA                   NA         6.50      4.40
## 9                    NA                   NA         1.30      5.00
## 10                   NA                   NA         2.00      3.60
## 11                   NA                   NA         3.60      3.50
## 12                   NA                   NA         7.00      4.50
##    odds.awayWin
## 1          2.40
## 2          2.45
## 3          4.33
## 4          1.50
## 5          2.90
## 6          3.10
## 7          3.40
## 8          1.50
## 9         12.00
## 10         3.60
## 11         2.00
## 12         1.44
```

Apologies to Liverpool fans (well, pretty much all non Man Utd fans), we're going to focus on Man Utd. You'll notice that their team id is 66. Let's use that id to get some team information.


```r
# returns all Man Utd away fixtures in the previous 14 days
fdo_listTeamFixtures("66", timeFrame = "p14", venue="away", response = "minified")
```

```
## $timeFrameStart
## [1] "2016-09-11"
## 
## $timeFrameEnd
## [1] "2016-09-25"
## 
## $count
## [1] 1
## 
## $fixtures
##       id competitionId                 date   status matchday homeTeamName
## 1 150803           426 2016-09-18T11:00:00Z FINISHED        5   Watford FC
##   homeTeamId         awayTeamName awayTeamId result.goalsHomeTeam
## 1        346 Manchester United FC         66                    3
##   result.goalsAwayTeam odds.homeWin odds.draw odds.awayWin
## 1                    1          6.5         4          1.5
```



```r
# general information on Man Utd
fdo_team("66")
```

```
## $`_links`
## $`_links`$self
## $`_links`$self$href
## [1] "http://api.football-data.org/v1/teams/66"
## 
## 
## $`_links`$fixtures
## $`_links`$fixtures$href
## [1] "http://api.football-data.org/v1/teams/66/fixtures"
## 
## 
## $`_links`$players
## $`_links`$players$href
## [1] "http://api.football-data.org/v1/teams/66/players"
## 
## 
## 
## $name
## [1] "Manchester United FC"
## 
## $code
## [1] "MUFC"
## 
## $shortName
## [1] "ManU"
## 
## $squadMarketValue
## [1] "534,250,000 <U+0080>"
## 
## $crestUrl
## [1] "http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg"
```

Finally, we can find all the players currently playing with Man Utd. The data includes nationality and market value (not sure where those figures came from but Pogba's _only_ worth €70m)


```r
fdo_teamPlayers("66",response="minified")
```

```
## $count
## [1] 27
## 
## $players
##      id                   name           position jerseyNumber dateOfBirth
## 1   487             Paul Pogba   Central Midfield            6  1993-03-15
## 2  2593     Zlatan Ibrahimovic     Centre Forward            9  1981-10-03
## 3  3664            Eric Bailly        Centre Back            3  1994-04-12
## 4  4795     Henrikh Mkhitaryan Attacking Midfield           22  1989-01-21
## 5  6693           David de Gea             Keeper            1  1990-11-07
## 6  6694          Sergio Romero             Keeper           20  1987-02-22
## 7  6695          Sam Johnstone             Keeper           32  1993-03-25
## 8  6696            Daley Blind        Centre Back           17  1990-03-09
## 9  6697         Chris Smalling        Centre Back           12  1989-11-22
## 10 6698            Marcos Rojo        Centre Back            5  1990-03-20
## 11 6699             Phil Jones        Centre Back            4  1992-02-21
## 12 6700              Luke Shaw          Left-Back           23  1995-07-12
## 13 6702         Matteo Darmian         Right-Back           36  1989-12-02
## 14 6703       Antonio Valencia         Right-Back           25  1985-08-04
## 15 6704    Morgan Schneiderlin Defensive Midfield           28  1989-11-08
## 16 6705        Michael Carrick Defensive Midfield           16  1981-07-28
## 17 6706    Timothy Fosu-Mensah Defensive Midfield           24  1998-01-02
## 18 6707          Ander Herrera   Central Midfield           21  1989-08-14
## 19 6708      Marouane Fellaini   Central Midfield           27  1987-11-22
## 20 6709 Bastian Schweinsteiger   Central Midfield           31  1984-08-01
## 21 6710              Juan Mata Attacking Midfield            8  1988-04-28
## 22 6712          Memphis Depay          Left Wing            7  1994-02-13
## 23 6713           Ashley Young          Left Wing           18  1985-07-09
## 24 6714          Jesse Lingard          Left Wing           14  1992-12-15
## 25 6715           Wayne Rooney  Secondary Striker           10  1985-10-24
## 26 6716        Anthony Martial     Centre Forward           11  1995-12-05
## 27 6717        Marcus Rashford     Centre Forward           19  1997-10-31
##      nationality contractUntil  marketValue
## 1         France    2021-06-30 70,000,000 <U+0080>
## 2         Sweden    2017-06-30 12,000,000 <U+0080>
## 3  Cote d'Ivoire    2020-06-30 20,000,000 <U+0080>
## 4        Armenia    2020-06-30 37,000,000 <U+0080>
## 5          Spain    2019-06-30 40,000,000 <U+0080>
## 6      Argentina    2018-06-30  5,000,000 <U+0080>
## 7        England    2017-06-30    250,000 <U+0080>
## 8    Netherlands    2018-06-30 22,000,000 <U+0080>
## 9        England    2019-06-30 20,000,000 <U+0080>
## 10     Argentina    2019-06-30 19,000,000 <U+0080>
## 11       England    2019-06-30 14,000,000 <U+0080>
## 12       England    2018-06-30 21,000,000 <U+0080>
## 13         Italy    2019-06-30 15,000,000 <U+0080>
## 14       Ecuador    2017-06-30  8,000,000 <U+0080>
## 15        France    2019-06-30 28,000,000 <U+0080>
## 16       England    2017-06-30  3,000,000 <U+0080>
## 17   Netherlands    2017-06-30  1,000,000 <U+0080>
## 18         Spain    2018-06-30 28,000,000 <U+0080>
## 19       Belgium    2018-06-30 15,000,000 <U+0080>
## 20       Germany    2018-06-30 10,000,000 <U+0080>
## 21         Spain    2018-06-30 31,000,000 <U+0080>
## 22   Netherlands    2019-06-30 25,000,000 <U+0080>
## 23       England    2018-06-30 10,000,000 <U+0080>
## 24       England    2018-06-30  6,000,000 <U+0080>
## 25       England    2019-06-30 35,000,000 <U+0080>
## 26        France    2019-06-30 32,000,000 <U+0080>
## 27       England    2020-06-30  7,000,000 <U+0080>
```

So, let's have a look at Man Utd's next league fixture and their past 5 meetings with those opponents.


```r
next_fixture_id <- fdo_listTeamFixtures("66", timeFrame = "n100", response = "minified")$fixtures$id[1]
fdo_getFixture(next_fixture_id,past=5,response="compressed")
```

```
## $fixture
## $fixture$id
## [1] 150779
## 
## $fixture$cId
## [1] 426
## 
## $fixture$date
## [1] "2016-10-02T11:00:00Z"
## 
## $fixture$stat
## [1] "TIMED"
## 
## $fixture$mday
## [1] 7
## 
## $fixture$htId
## [1] 66
## 
## $fixture$atId
## [1] 70
## 
## $fixture$res
## $fixture$res$ght
## NULL
## 
## $fixture$res$gat
## NULL
## 
## 
## 
## $head2head
## $head2head$count
## [1] 5
## 
## $head2head$timeFrameStart
## [1] "2014-02-01"
## 
## $head2head$timeFrameEnd
## [1] "2016-02-02"
## 
## $head2head$homeTeamWins
## [1] 2
## 
## $head2head$awayTeamWins
## [1] 2
## 
## $head2head$draws
## [1] 1
## 
## $head2head$lastHomeWinHomeTeam
## $head2head$lastHomeWinHomeTeam$id
## [1] 146865
## 
## $head2head$lastHomeWinHomeTeam$cId
## [1] 398
## 
## $head2head$lastHomeWinHomeTeam$date
## [1] "2016-02-02T20:00:00Z"
## 
## $head2head$lastHomeWinHomeTeam$stat
## [1] "FINISHED"
## 
## $head2head$lastHomeWinHomeTeam$mday
## [1] 24
## 
## $head2head$lastHomeWinHomeTeam$htId
## [1] 66
## 
## $head2head$lastHomeWinHomeTeam$atId
## [1] 70
## 
## $head2head$lastHomeWinHomeTeam$res
## $head2head$lastHomeWinHomeTeam$res$ght
## [1] 3
## 
## $head2head$lastHomeWinHomeTeam$res$gat
## [1] 0
## 
## 
## 
## $head2head$lastWinHomeTeam
## $head2head$lastWinHomeTeam$id
## [1] 146865
## 
## $head2head$lastWinHomeTeam$cId
## [1] 398
## 
## $head2head$lastWinHomeTeam$date
## [1] "2016-02-02T20:00:00Z"
## 
## $head2head$lastWinHomeTeam$stat
## [1] "FINISHED"
## 
## $head2head$lastWinHomeTeam$mday
## [1] 24
## 
## $head2head$lastWinHomeTeam$htId
## [1] 66
## 
## $head2head$lastWinHomeTeam$atId
## [1] 70
## 
## $head2head$lastWinHomeTeam$res
## $head2head$lastWinHomeTeam$res$ght
## [1] 3
## 
## $head2head$lastWinHomeTeam$res$gat
## [1] 0
## 
## 
## 
## $head2head$lastAwayWinAwayTeam
## NULL
## 
## $head2head$lastWinAwayTeam
## $head2head$lastWinAwayTeam$id
## [1] 146924
## 
## $head2head$lastWinAwayTeam$cId
## [1] 398
## 
## $head2head$lastWinAwayTeam$date
## [1] "2015-12-26T12:45:00Z"
## 
## $head2head$lastWinAwayTeam$stat
## [1] "FINISHED"
## 
## $head2head$lastWinAwayTeam$mday
## [1] 18
## 
## $head2head$lastWinAwayTeam$htId
## [1] 70
## 
## $head2head$lastWinAwayTeam$atId
## [1] 66
## 
## $head2head$lastWinAwayTeam$res
## $head2head$lastWinAwayTeam$res$ght
## [1] 2
## 
## $head2head$lastWinAwayTeam$res$gat
## [1] 0
## 
## $head2head$lastWinAwayTeam$res$HT
## $head2head$lastWinAwayTeam$res$HT$ght
## [1] 2
## 
## $head2head$lastWinAwayTeam$res$HT$gat
## [1] 0
## 
## 
## 
## 
## $head2head$fixtures
##       id cId                 date     stat mday htId atId res.ght res.gat
## 1 146865 398 2016-02-02T20:00:00Z FINISHED   24   66   70       3       0
## 2 146924 398 2015-12-26T12:45:00Z FINISHED   18   70   66       2       0
## 3 136858 354 2015-01-01T12:45:00Z FINISHED   20   70   66       1       1
## 4 136913 354 2014-12-02T19:45:00Z FINISHED   14   66   70       2       1
## 5 131988 341 2014-02-01T15:00:00Z     <NA>   24   70   66       2       1
##   res.HT.ght res.HT.gat
## 1         NA         NA
## 2          2          0
## 3         NA         NA
## 4         NA         NA
## 5         NA         NA
```

## Summary

As you can see, there's lots of useful information that can be retrieved from the football-data.org API with just a few lines of R code.

As always, if any parts were unclear or if you have any difficulties, please do get in touch [here](https://github.com/dashee87/footballR/issues).
