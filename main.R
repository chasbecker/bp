# Oct 2021 by c.l.becker@outlook.com ===================================
# A pre-processor for OMRON format data files, for use
# with the process_data() function of the 'bp' package.

# install first if necessary
library(tidyverse)
library(bp)

rm(list=ls())  # clean up

# interactively select a CSV format file:
bp_data_file <- file.choose()

# or hard code a file name for batch processing, etc:
# bp_data_file <- (".\Data\10_13_2021.csv")

bpx <- read_csv(bp_data_file) %>% rename( OrigDate = Date )
bpx$Date <- as.Date(bpx$OrigDate, format='%B %d, %Y')
View(bpx)

bpz <- process_data( bpx,
                     sbp = 'Systolic',
                     dbp = 'Diastolic',
                     bp_type = "HBPM",
                     )

View(bpz)

