# Cargar librerías necesarias
library(ggplot2)
library(dplyr)

# Crear datos ficticios
set.seed(123)  # Para reproducibilidad
datos_ejemplo <- data.frame(
  categoria = rep(c("Grupo A", "Grupo B", "Grupo C", "Grupo D"), each = 50),
  valor_x = rnorm(200, mean = 50, sd = 10),
  valor_y = rnorm(200, mean = 30, sd = 8),
  satisfaccion = sample(1:10, 200, replace = TRUE)
)

# Crear el gráfico
p <- ggplot(datos_ejemplo, aes(x = valor_x, y = valor_y, color = categoria)) +
  geom_point(aes(size = satisfaccion), alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relación entre variables X e Y por categoría",
    subtitle = "Datos ficticios para demostración",
    x = "Variable X",
    y = "Variable Y",
    color = "Categoría",
    size = "Satisfacción (1-10)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.position = "bottom"
  ) +
  scale_color_viridis_d(option = "plasma") +
  scale_size_continuous(range = c(1, 4))

# Mostrar el gráfico
print(p)

# Verificar estructura de los datos
cat("Estructura de los datos:\n")
str(datos_ejemplo)

cat("\nPrimeras filas:\n")
head(datos_ejemplo)