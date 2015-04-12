#@author : Mayur k
#@email : mayurkadu9@gmail.com


rankhospital <- function(state, outcome, num){
    # read csv file
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    hospState <- data[,7]
    
    list_outcomes <- c("heart attack", "heart failure", "pneumonia")
    #check input for valid state 
    if(!state %in% hospState){
        stop(print("Invalid state"))  
    }
    
    #check input for valid "outcome" input value
    if(!outcome %in% list_outcomes){
        stop(print("Invalid outcome"))
    }
    
    # Assing appropriate column value
    if(outcome == "heart attack") {
        outcome_column <- 11
    }else if(outcome == "heart failure") {
        outcome_column <- 17
    }else {
        outcome_column <- 23
    }
    
    if (is.numeric(num) == TRUE) {
        if (length(data[,2]) < num) {
            return(NA)
        }
    }
        
    refined_data <- subset(data, hospState == state)
    # remove NA values from desired column
    required_columns <- as.numeric(refined_data[,outcome_column])
    desired_data <- refined_data[!is.na(required_columns), ]

    
}