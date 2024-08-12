# Load the required packages
library(ggplot2)
library(scales)

# Create a data frame
data_wms <- data.frame(
  Workflow_type = c("Galaxy", "Nextflow", "CWL", "COMPSs", "Snakemake", "Python", "Jupyter", "Docker", "Shell", "WDL", "KNIME"),
  n = c(261, 126, 70, 55, 40, 33, 28, 15, 13, 8, 6)
)

# Create the bar plot
ggplot(data_wms, aes(x = reorder(Workflow_type, n), y = n)) +
  geom_bar(stat = "identity", fill = "#4682B4") +
  geom_text(aes(label = n), vjust = 1.25, size = 2) +
  labs(x = "Workflow type", y = "Count") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.y = element_line(color = "gray90", linetype = "dashed"),
    panel.background = element_rect(fill = "gray98")
  ) +
  scale_y_continuous(breaks = seq(0, 300, 50))


# Create items data frame
data1 <- data.frame(
  Item = c("Users", "Organisations", "Teams", "Spaces"),
  n = c(766, 221, 249, 36)
)

data2 <- data.frame(
  Item = c("Collections", "SOPs", "Documents", "Publications"),
  n = c(23, 10, 20, 30)
)

# Create the vertical bar plot - only doing it for finalised items to start with
ggplot(data1, aes(x = reorder(Item, n), y = n)) +
  geom_bar(stat = "identity", fill = "#4682B4") +
  geom_text(aes(label = n), vjust = 1.25, size = 2) +
  labs(x = "Item", y = "Count") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.y = element_line(color = "gray90", linetype = "dashed"),
    panel.background = element_rect(fill = "gray98")
  ) +
  scale_y_continuous(breaks = seq(0, 800, 200))

