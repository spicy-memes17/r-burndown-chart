library(ggplot2); library(scales); library(RColorBrewer);

# fte_theme taken from http://minimaxir.com/2015/02/ggplot-tutorial/
fte_theme <- function() {

    # Generate the colors for the chart procedurally with RColorBrewer
    palette <- brewer.pal("Greys", n=9)
    color.background = palette[2]
    color.grid.major = palette[3]
    color.axis.text = palette[6]
    color.axis.title = palette[7]
    color.title = palette[9]

    # Begin construction of chart
    theme_bw(base_size=9) +

        # Set the entire chart region to a light gray color
        theme(panel.background=element_rect(fill=color.background, color=color.background)) +
        theme(plot.background=element_rect(fill=color.background, color=color.background)) +
        theme(panel.border=element_rect(color=color.background)) +

        # Format the grid
        theme(panel.grid.major=element_line(color=color.grid.major,size=.25)) +
        theme(panel.grid.minor=element_blank()) +
        theme(axis.ticks=element_blank()) +

        # Format the legend, but hide by default
        theme(legend.position="none") +
        theme(legend.background = element_rect(fill=color.background)) +
        theme(legend.text = element_text(size=7,color=color.axis.title)) +

        # Set title and axis labels, and format these and tick marks
        theme(plot.title=element_text(color=color.title, size=10, vjust=1.25)) +
        theme(axis.text.x=element_text(size=7,color=color.axis.text)) +
        theme(axis.text.y=element_text(size=7,color=color.axis.text)) +
        theme(axis.title.x=element_text(size=8,color=color.axis.title, vjust=0)) +
        theme(axis.title.y=element_text(size=8,color=color.axis.title, vjust=1.25)) +

        # Plot margins
        theme(plot.margin = unit(c(0.35, 0.2, 0.3, 0.35), "cm"))
}

pdf("plots.pdf")
data_2 <- read.csv("data_2.csv")
max_issue <- max(data_2[[1]])
max_day <- max(data_2[[2]])

plot <- ggplot(data_2, aes(Day, Issues)) +
    geom_segment(aes(x=0, y=max_issue, xend=max_day, yend=0), color="#919191") +
    geom_line(aes(color=data_2[[1]]==-1)) +
    scale_color_manual(values=c(c("black", rgb(0,0,0,0)), c(TRUE, FALSE))) +
    geom_hline(aes(yintercept=0)) +
    geom_vline(aes(xintercept=0)) +
    scale_x_continuous(limits=c(0,max_issue), breaks=seq(0, max_day, by=1)) +
    scale_y_continuous(limits=c(0,max_day), breaks=seq(0, max_issue, by=1)) +
    fte_theme()
plot
dev.off()
