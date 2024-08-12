# Load the required packages
library(ggplot2)
library(scales)

# Create a data frame
data <- data.frame(
  Workflow_type = c("Galaxy", "Nextflow", "CWL", "COMPSs", "Snakemake", "Python", "Jupyter", "Docker", "Shell", "WDL", "KNIME"),
  n = c(261, 126, 70, 55, 40, 33, 28, 15, 13, 8, 6)
)

# Create the bar plot
ggplot(data, aes(x = reorder(Workflow_type, n), y = n)) +
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
