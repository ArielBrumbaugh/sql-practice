# This R script is to show how to query a database and work in R and github
# Ariel R. Brumbaugh
# 2015-01-06

# Install and load a new package
install.packages("RSQLite", dependencies=T) #dependencies will install all the additional packages that SQLite needs! fancy!
library(RSQLite)

driver <- dbDriver("SQLite")
con<- dbConnect(driver, dbname="portal_mammals.sqlite")

# running a query
results<- dbGetQuery(con, "SELECT species, wgt, year FROM surveys")


#If we are done working on the database, we can disconnect
dbDisconnect(con)

#We can now plot the results
plot(results$year, results$wgt)

