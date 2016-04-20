
repos <- jsonlite::fromJSON("https://api.github.com/users/nikolaypavlov/repos")

mostPopularRepoIndex <- which.max(repos$forks_count + repos$watchers_count)
mostPopularRepoName <- repos[mostPopularRepoIndex,"name"]

print(mostPopularRepoName)