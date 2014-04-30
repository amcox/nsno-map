# Setup
To install R, check out the [R Homepage][1]. Many people find [R-Studio][2] to be helpful.

[1]: http://www.r-project.org
[2]: http://www.rstudio.com

The library also contains python code which has been tested to run through the python console in [anaconda][3].

[3]: https://store.continuum.io/cshop/anaconda/

# Running Code
R code should be run from the `R` directory. Before using any functions in the `Functions` directory, the following code must be run from the `R` directory:

    update_functions <- function() {
    	old.wd <- getwd()
    	setwd("functions")
    	sapply(list.files(), source)
    	setwd(old.wd)
    }
    update_functions()
    
After running that block once (to define the function), only `update_functions()` needs to be run again to pick up any changes made in the `Functions` directory.

# Cleaning and Processing Data
The function `load_all_map_from_raw` loops through the 'Data/Raw' directory, pulling data from all .csv files in the directory and returning a data frame  with the data from all files combined and cleaned up. The function expects the csvs to be in the format of the NWEA "combined" export file, with no modifications to the column titles. Filenames are ignored, all of the information needed is contained in the files.

Running the whole file `extract all raw data and save.r` will load, clean, and combine any data in the `Data/Raw` directory, and then save it as a .csv to the `Output` directory.

# Saving
The function `save_df_as_csv` will save a data frame as a .csv into the `Output` directory.

The function `save_plot_as_pdf` will save a plot as a .pdf into the `Output` directory.