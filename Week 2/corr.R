corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    # get the complete table
 
    #ids of satisfying data
    complete <- complete("specdata", 1:332)
    nobs <- complete$nobs
    ids <- complete$id[nobs > threshold]
    
    #combine satisfying data
    corr_vector <- c()
    j <- 1
    for(i in ids){
        i_use = sprintf("%03d", i)
        directory_use <- paste("./", directory, "/", i_use, ".csv", sep = "")
        mydata = read.csv(directory_use, header = T)
        corr_vector[j] <- cor(mydata$sulfate, mydata$nitrate, use="complete.obs")
        j <- j+1
    }
    #return
    corr_vector
}