library(httr)
oauth_endpoints("github")
myApp <- oauth_app("github", "cb6720157c8b52efe5c4","ba2e7572296120809951e080973dafd5b595ccd0")
# Get OAuth credential
githubToken <- oauth2.0_token(oauth_endpoints("github"), myApp)

req <- GET("https://api.github.com/rate_limit", config(token = githubToken ))
stop_for_status(req)
content(req)
#Read json data to find the created_at date
data <- GET("https://api.github.com/users/jtleek/repos", config(token = githubToken))
jsonData <- content(data)

jsonData
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))