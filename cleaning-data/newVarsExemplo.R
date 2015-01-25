newVarsExemplo = function() {
  
  if(!file.exists("./data")) {
      dir.create("./data")
  }
  
  if(!file.exists("./data/restaurants.csv")) {
    url = "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv??accessType=DOWNLOAD"
    download.file(url, destfile="./data/restaurants.csv",method="curl")
  }
  
  restdata = read.csv("./data/restaurants.csv")
}