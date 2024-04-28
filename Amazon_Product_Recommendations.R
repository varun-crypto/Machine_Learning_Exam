library(arules)
library(RColorBrewer)
library(dplyr)

# Load the transactions dataset from your uploaded file
transactions <- read.transactions("D:\\CSCI-5622-872 Machine Learning\\Amazon Product Recommendations.csv",
                                  rm.duplicates = FALSE, 
                                  format = "basket",
                                  sep=",",
                                  cols=NULL)
# Perform association rule mining with specified support and confidence levels
rules <- apriori(transactions, parameter = list(support=0.10, confidence=0.2, minlen=2))
inspect(rules)
# Plot the most frequent items
itemFrequencyPlot(transactions, topN = 20,
                  col = brewer.pal(8, 'Pastel2'),
                  main = 'Relative Item Frequency Plot',
                  type = "relative",
                  ylab = "Item Frequency (Relative)")


# scatter plot
library(arulesViz)
library(ggplot2)

# Convert rules to a data frame for ggplot
rules_df <- as(rules, "data.frame")

# Network Graph of Rules

plot(rules, method="graph", control=list(type="items"))

plot(rules, method = "graph", engine = "htmlwidget")


