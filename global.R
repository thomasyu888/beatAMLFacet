library(dplyr)
library(tidyr)
library(stringr)

library(synapseClient)

synapseLogin()

#projectId <- "syn2942337"

# Which columns to consider
#colsToUse <- c('id','labId','diagnosis','diagnosisClass',
#               'sampleGroup','algorithm',
#               'flowCell','fileSize','modifiedDate','fileType',
 #              'coreSampleId')

# query the table with specific columns
#colsToUseStr <- paste(colsToUse, collapse=",")
#queryTemplate <- "select %s from file where benefactorId=='%s'"
  
#allData <- synQuery(sprintf(queryTemplate, colsToUseStr, projectId), 
#                    blockSize=300)$collectAll()

#colnames(allData) <- gsub(".*\\.", "", colnames(allData))
#allData <- allData[, colsToUse]

# Filter
#allData <- allData %>% filter(labId != "", !is.na(labId))

# Turn IDs into urls that open in new tab/window
#allData$id <- paste('<a href="https://www.synapse.org/#!Synapse:', allData$id, 
#                    '" target="_blank">', allData$id, '</a>', sep="")
queryResults <- synGet("syn5561877")
load(queryResults@filePath)
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
  
