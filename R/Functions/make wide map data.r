make_wide_map_data <- function(df) {
  # Take a long MAP data file, as produced by load_all_map_from_raw and turn
  # it into wide data with one row per student-subject-year

  # Pull out the goal columns and reduce to just one set of goal values per
  # student-subject-year
  goal.cols <- c("goal.fall.fall", "goal.spring.spring", "goal.fall.spring",
    "goal.fall.winter"
  )
  df.goals <- df[, c("id", "subject", "year", goal.cols)]
  dfgm <- melt(df.goals, id.vars=c("id", "subject", "year"), value.name="value",
    variable.name="goal"
  )
  dfgm <- subset(dfgm, !is.na(value))
  df.goals <- dcast(dfgm, ... ~ goal, mean, na.rm=T)

  # Melt the three score types down
  df.m <- melt(df[, !names(df) %in% goal.cols],
    measure.vars=c("rit", "se", "percentile"),
    variable.name="score.type", value.name="score.value"
  )

  # Create a new name (which will be column names) for score and term
  df.m$score.type <- paste(df.m$term, df.m$score.type, sep=".")
  df.m <- df.m[, !names(df.m) %in% c("term")]

  df.sum <- dcast(df.m, ... ~ score.type)
  
  # Add the goals back in
  d <- merge(df.sum, df.goals, all.x=T)
  
  return(d)
}
