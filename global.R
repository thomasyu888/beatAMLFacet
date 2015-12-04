library(dplyr)
library(tidyr)
library(stringr)

library(synapseClient)

synapseLogin()
projectId <- "syn1773109"

# Which columns to consider
colsToUse <- c('id', 'dataType', 'fileType', 'fileSubType', 'UID', 'biologicalSampleName', 
               'C4_Cell_Line_ID', 'Originating_Lab_ID', 'Originating_Lab', 'Cell_Line_Type',
               'Cell_Type_of_Origin', 'Tissue_of_Origin', 'Reprogramming_Vector_Type',
               'Reprogramming_Gene_Combination', 'pass_qc', 'exclude')

# query the table with specific columns
colsToUseStr <- paste(colsToUse, collapse=",")
queryTemplate <- "select %s from file where projectId=='%s'"
  
allData <- synQuery(sprintf(queryTemplate, colsToUseStr, projectId), 
                    blockSize=300)$collectAll()
colnames(allData) <- gsub(".*\\.", "", colnames(allData))
allData <- allData[, colsToUse]

# Filter
allData <- allData %>% filter(dataType != "", !is.na(dataType))

# Turn IDs into urls that open in new tab/window
allData$id <- paste('<a href="https://www.synapse.org/#!Synapse:', allData$id, 
                    '" target="_blank">', allData$id, '</a>', sep="")

# # Filtering for specific data types and making the data for specific tabs
# # Just an example how to use tidyr and dplyr to reformat.
# mrna <- allData %>% 
#   filter(dataType=='mRNA') %>%
#   filter(!is.na(UID),
#            !is.na(biologicalSampleName),
#            !(fileType %in% c('matrix', 'genomicMatrix'))) %>% 
#     unite(file, fileType, fileSubType, sep="_") %>% 
#     mutate(file=str_replace(file, "_NA", "")) %>% 
#     select(UID, biologicalSampleName, Originating_Lab_ID, Originating_Lab, pass_qc, exclude, file, id) %>%
#     spread(file, id)
  
