  best <- function(state, outcome){
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
  
  
  refined_data <- subset(data, hospState == state)
  # remove NA values from desired column
  required_columns <- as.numeric(refined_data[,outcome_column])
  desired_data <- refined_data[!is.na(required_columns), ]
  
  #find all hospitals first
  rating_column <- as.numeric(desired_data[, outcome_column])
  desired_data2 <- desired_data[which(rating_column == min(rating_column)), ]
  hosp_name <- desired_data2[,2]
  
  #if there are multiple entries for hospital names,then sort and choose first hospital
  if(length(hosp_name) > 1){
    hosp_names_sorted <- sort(hosp_name)
    hosp_names_sorted[1]
  }else {
    hosp_name
  }

}