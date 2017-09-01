# Import the RSM library
library("rsm")

#Create dummy data in a frame
mockRsmCrudeYieldData.data <- 
  data.frame(
    TempInCelsius = c(40, 40, 40, 40, 65, 65, 65, 65, 90, 90, 90, 90, 65, 65, 65),
    pH = c(1, 2, 2, 3, 1, 3, 1, 3, 1, 2, 3, 2, 2, 2, 2), 
    TimeInMin = c(50, 10, 90, 50, 10, 90, 90, 10, 50, 10, 50, 90, 50, 50, 50),
    crudeYield = c(7, 2, 5, 2, 7, 3, 10, 2, 9, 6, 4, 8, 5, 5, 5)
  )

png(file = "testPlot.png")

# Extract vectors from the data frame
temps = mockRsmCrudeYieldData.data$TempInCelsius
yield = mockRsmCrudeYieldData.data$crudeYield


plot(x = temps, y = yield)
dev.off()