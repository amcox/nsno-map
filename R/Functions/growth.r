fall_winter_rit_growth <- function(r){
  return(as.numeric(r["winter.rit"])-as.numeric(r["fall.rit"]))
}

winter_spring_rit_growth <- function(r){
  return(as.numeric(r["spring.rit"])-as.numeric(r["winter.rit"]))
}

fall_spring_rit_growth <- function(r){
  return(as.numeric(r["spring.rit"])-as.numeric(r["fall.rit"]))
}

fall_winter_rit_growth_dif <- function(r){
  as.numeric(r[['fall.winter.rit.growth']]) - as.numeric(r[['goal.fall.winter']])
}

fall_winter_percentile_growth <- function(r){
  as.numeric(r[['winter.percentile']]) - as.numeric(r[['fall.percentile']])
}

cut_growth_status_on_se <- function(r, growth.col.to.cut, goal.col, se.col){
  se <- as.numeric(r[[se.col]])
  cut.val <- as.numeric(r[[growth.col.to.cut]])
  goal.val <- as.numeric(r[[goal.col]])
  if(cut.val < (goal.val - se)){
    return("opened")
  }else if(cut.val <= (goal.val + se)){
    return("none")
  }else{
    return("closed")
  }
}