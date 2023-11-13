# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#################
# separation line
#################
sep <- function(line) {
  print("===================================")
  print(line)
  print("===================================")
}
# # apply sep function to 'TEST'
# sep("TEST")


#################################
# my_theme() for ggplot2 plotting
#################################
library(ggplot2)
# define my theme
my_theme <- function() {
  theme_bw() +
    theme(
      panel.grid = element_blank(),
      # panel.grid.major = element_line(color = "#d8d8d8d9",
      #                                size = 0.12),
      # panel.grid.minor = element_line(color = "#d8d8d8d9",
      #                                size = 0.12),
      legend.position = "right",
      # legend.position = "none",
      legend.text = element_text(size = 28),
      legend.title = element_text(size = 30,
                                  face = "bold"),
      legend.key.size = unit(3.5, "lines"),  # Increase legend shape size
      axis.text = element_text(size = 24,
                              face = "bold",
                              colour = "grey20",
                              hjust = .5,
                              vjust = .5),
      axis.title = element_text(size = 26,
                                face = "bold",
                                colour = "grey20",
                                angle = 0,
                                hjust = .5,
                                vjust = 0),
      axis.line = element_line(size = 1, color = "black"),
      axis.ticks = element_line(size = 2),
      plot.title = element_text(size = 30,
                                hjust = 0.5,
                                face = "bold"),
      strip.text = element_text(size = 34,
                                face = "bold",
                                margin = margin(15, 0, 15, 0)),
      strip.background = element_rect(fill = "#d8d8d8d9",
                                      color = "black",
                                      linetype = 'solid',
                                      linewidth = 1))
}
# # apply my theme to the plot
# ggplot() +
#     my_theme() 


#####################################
# Function to copy data to the clipboard
#####################################
copy_to_clipboard <- function(data) {
    if (is.character(data)) {
    text <- data
    } else if (is.data.frame(data)) {
    text <- capture.output(write.table(data, sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE))
    } else {
    stop("Unsupported data type. Supported types: character, data.frame")
    }

    system2("pbcopy", input = text)
}

# Test with a character variable
my_character <- "Hello, world!"
copy_to_clipboard(my_character)

# Test with a data frame
my_dataframe <- data.frame(
    Name = c("Alice", "Bob", "Charlie"),
    Age = c(25, 30, 28)
)
copy_to_clipboard(my_dataframe)
