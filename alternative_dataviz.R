p1 <- ggplot(mpg) +
    aes(displ, hwy) +
    geom_point() +
    labs(title="Plot 1")

p2 <- ggplot(mpg) +
    aes(as.character(year), fill=drv) +
    geom_bar(position="dodge") + 
    labs(title="Plot 2", x="year")

p3 <- ggplot(mpg) +
    aes(hwy, fill=drv) +
    geom_density(color=NA) + 
    facet_grid(drv~.) +
    labs(title="Plot 3")

p4 <- ggplot(mpg) +
    aes(drv, hwy) +
    stat_summary(aes(fill=drv), geom="col", fun.data=mean_se) +
    stat_summary(geom="errorbar", fun.data=mean_se, width=0.5) +
    labs(title="Plot 4")

layout <- c(
    area(1, 1, 1, 2),
    area(1, 1, 1, 1),
    area(1, 1, 3, 1),
    area(1, 1, 1, 1)
)
p1 + p2 + p3 + p4 +
    plot_layout(design=layout)
