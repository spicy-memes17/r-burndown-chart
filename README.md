# r-burndown-chart
Code for an R plot, that can be used to render a burndown chart.

## Usage
The burndown.R script can be run in an R environment that has the ggplot2, scales and RColorBrewer libraries installed. The theme for ggplot2 was taken from: http://minimaxir.com/2015/02/ggplot-tutorial/

To change the data used for this plot, simply edit `data.csv`. To save the plot as a pdf, start R in the Terminal, use `setwd("working-directory")` to set your working directory to the folder containing `burndown.R`. Then run
```source("burndown.R")
plot
ggsave("plot.pdf")
```
to save the plot as `plot.pdf`.
