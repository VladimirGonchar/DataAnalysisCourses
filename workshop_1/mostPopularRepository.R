
getMostPopularRepoName = function(reposUrl){
  repos <- jsonlite::fromJSON(reposUrl)
  
  mostPopularRepoIndex <- which.max(repos$forks_count + repos$watchers_count)
  mostPopularRepoName <- repos[mostPopularRepoIndex,"name"]
  
  return(mostPopularRepoName)
}

print(getMostPopularRepoName("https://api.github.com/users/nikolaypavlov/repos"))
