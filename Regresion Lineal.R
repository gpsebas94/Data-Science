library(readr)
Dia9 <- read_delim("SEBASTIAN/U/Data Science/100 dias de Data Science - Python/Dia9.csv",";", escape_double = FALSE, trim_ws = TRUE)

Edad=Dia9$Edad
Salario=Dia9$Salario
# Creamos dos dataframe nuevos con los NaN eliminados
dataEdad=Dia9[!is.na(Dia9$Edad),]
dataSalario=Dia9[!is.na(Dia9$Salario),]

# Reemplazamos los NaN del dataframe original con la media de los datos dataframe nuevos (porque no contienen el NaN) 
Dia9$Edad[is.na(Dia9$Edad)] = mean(dataEdad$Edad)
Dia9$Salario[is.na(Dia9$Salario)] = mean(dataSalario$Salario)

# Modelar el salario por la variable edad
lm_Sal_Ed = lm(Salario~Edad,data=Dia9)
lm_Sal_Ed

# Visualizamos los valores y la curva del modelo de regresión lineal
plot(Edad,Salario)
abline(lm_Sal_Ed, col = "red")

# Creamos un marco de datos invisible, que será el valor que vamos a predecir
valor_predecir <- data.frame(Edad = c(33,60,25))

# Predecirmos el valor creado con base en el modelo de regresión
predict(lm_Sal_Ed, newdata = valor_predecir)