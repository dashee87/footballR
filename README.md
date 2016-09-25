footballR
=========

`footballR` is an R package that calls various free football (soccer) APIs.

There's quite a few good free resources for football data out there. Some detailed historical data taken is available from the [openfootball](https://github.com/openfootball) and the [jokecamp](https://github.com/jokecamp/FootballData) github pages. You can read a detailed review of all football data sources and API services [here](https://www.jokecamp.com/blog/guide-to-football-and-soccer-data-and-apis/).

Getting Started
---------------

### Install

Install from GitLab

``` r
# install.packages("devtools")
devtools::install_git("https://gitlab.com/dashee87/footballR.git")
library("footballR")
```

You can install from GitHub (identical mirror of GitLab)

``` r
# install.packages("devtools")
devtools::install_github("dashee87/footballR")
library("footballR")
```

Alternatively, you can copy the R files onto your computer and run them all locally (only if the other approaches fail for some reason).

### Required Packages

The package relies on [httr](https://cran.r-project.org/web/packages/httr/index.html) and [jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html). The former handles calls to the API, while the latter converts the call output from JSON to data frames. These should be installed automatically with the package.

### Tutorial

A short tutorial on how to use the [football-data.org API](http://api.football-data.org/index) is available here.

Status
------

This package is under active development and is subject to regular updates.

Currently, the package only supports calls to the [football-data.org API](http://api.football-data.org/index).

### Issues

Please let me know if something's not working.

[Submit issues here](https://github.com/dashee87/footballR/issues).

### Future

-   [Sports Open Data API](https://market.mashape.com/sportsop/soccer-sports-open-data)
-   Possibly web scraping (liveScores, soccerway, etc)
-   Shiny Apps

Links
-----

-   [Online football data resources](https://www.jokecamp.com/blog/guide-to-football-and-soccer-data-and-apis/)
-   More to come

Disclaimer
----------

The `footballR` package is provided with absolutely no warranty.
