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


######################################################################
# my_theme() for ggplot2 plotting; this is my theme for the CNS style.
######################################################################
library(ggplot2)
library(grid)  # 用于 unit()


# define my theme


# my_theme <- function(scale = 1) {
#   theme_bw() +
#     theme(
#       panel.grid = element_blank(),
#       legend.position = "right",
#       legend.text = element_text(size = 28 * scale),
#       legend.title = element_text(size = 30 * scale, face = "bold"),
#       legend.key.size = unit(3.5 * scale, "lines"),
#       axis.text = element_text(size = 24 * scale, face = "bold",
#                                colour = "grey20", hjust = .5, vjust = .5),
#       axis.title = element_text(size = 26 * scale, face = "bold",
#                                 colour = "grey20", angle = 0, hjust = .5, vjust = 0),
#       axis.line = element_line(size = 1 * scale, color = "black"),
#       axis.ticks = element_line(size = 2 * scale),
#       plot.title = element_text(size = 30 * scale, hjust = 0.5, face = "bold"),
#       strip.text = element_text(size = 34 * scale, face = "bold",
#                                 margin = margin(15 * scale, 0, 15 * scale, 0)),
#       strip.background = element_rect(fill = "#d8d8d8d9",
#                                       color = "black", linetype = 'solid',

#                                       linewidth = 1 * scale)
#     )
# }
# # # apply my theme to the plot
# # ggplot() +
# #     my_theme(scale = 0.8)  # 可调比例





my_theme <- function(base_size = 12, scale = 1, frame = c("panel", "axis", "outer")) {
  frame <- match.arg(frame)
  base <- theme_bw(base_size = base_size) +
    theme(
      ## Layout
      panel.grid       = element_blank(),
      panel.background = element_blank(),
      plot.background  = element_blank(),

      ## 每个facet分面图的上下和左右间距
      strip.placement = "outside",
      panel.spacing.y = unit(2 * scale, "pt"),
      panel.spacing.x = unit(2 * scale, "pt"),

      ## Title
      plot.title       = element_text(size = rel(1.3 * scale), face = "bold", hjust = 0.5, margin = margin(b = 8 * scale)),

      ## Axes
      axis.title       = element_text(size = rel(1.0 * scale), colour = "black"),   # , face = "bold"
      axis.text        = element_text(size = rel(0.85 * scale), colour = "black"),
      axis.line        = element_line(linewidth = 0.5 * scale, colour = "black"),
      axis.ticks       = element_line(linewidth = 0.5 * scale, colour = "black"),
      axis.ticks.length= unit(0.15 * scale, "lines"),

      ## Legend
      legend.position   = "right",
      legend.title      = element_text(size = rel(0.9 * scale)),   # , face = "bold"
      legend.text       = element_text(size = rel(0.85 * scale)),
      legend.key        = element_blank(),
      legend.background = element_blank(),
      legend.key.size   = unit(1 * scale, "lines"),

      ## Facet
      strip.text        = element_text(size = rel(1.1 * scale), face = "bold", margin = margin(t = 5 * scale, r = 0, b = 5 * scale, l = 0)),
      # strip.background  = element_rect(fill = "grey97", colour = "black", linetype = "solid", linewidth = 0.5 * scale),
      strip.background  = element_blank(),
      strip.switch.pad.grid = unit(5 * scale, "pt"),
      strip.switch.pad.wrap = unit(5 * scale, "pt")
    )

  # 根据 frame 参数切换
  extra <- switch(frame,
    "axis" = theme(
      panel.border = element_blank(),
      axis.line = element_blank(),
      axis.line.x.bottom = element_line(linewidth = 0.5 * scale, colour = "black"),
      axis.line.y.left   = element_line(linewidth = 0.5 * scale, colour = "black")
    ),
    "panel" = theme(
      panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.5 * scale),
      axis.line    = element_blank()
    ),
    "outer" = theme(
      panel.border    = element_blank(),
      axis.line       = element_blank(),
      plot.background = element_rect(fill = NA, colour = "black", linewidth = 0.5 * scale)
    )
  )

  base + extra
}
# # apply my theme to the plot
# ggplot() +
#     my_theme(frame = "panel/axis/outer", scale = 1, base_size = 12)

# # panel：每个 panel 的边框，为默认值
# # axis：坐标轴线
# # outer：整图外框
# # 注意本文件每行代码行尾不能留空格


        # +===============================+    ← outer（整图外框）
        # |                               |
        # |   Title                       |  
        # |                               |
        # |    ┌─────────────────────┐    |
        # |    │                     │    |
        # |    │     Panel区域       │    |  ← panel（每个panel的框）
        # |    │                     │    |
        # |    └─────────────────────┘    |
        # |      ↑                     ↑
        # |      │                     │
        # |   axes轴线：左、下             |
        # +===============================+




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
