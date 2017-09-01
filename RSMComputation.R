# Import the RSM library
library("rsm")

#Data for the RSM (Currently with dummy data)
mockRsmCrudeYieldData.data <-
  data.frame(
    TempInCelsius = c(40, 40, 40, 40, 65, 65, 65, 65, 90, 90, 90, 90, 65, 65, 65),
    pH = c(1, 2, 2, 3, 1, 3, 1, 3, 1, 2, 3, 2, 2, 2, 2),
    TimeInMin = c(50, 10, 90, 50, 10, 90, 90, 10, 50, 10, 50, 90, 50, 50, 50),
    crudeYield = c(7, 2, 5, 2, 7, 3, 10, 2, 9, 6, 4, 8, 5, 5, 5)
  )


# Create the code values for each parameter
codedValues.val <- coded.data(mockRsmCrudeYieldData.data, 
           x1 ~ (TempInCelsius - 65)/25,
           x2 ~ (pH - 3),
           x3 ~ (TimeInMin - 50)/40)

# Define BBD function parameters
numFactors = 4
numCenterPts = 3

codedValues.rsm  <- rsm(crudeYield ~ SO(x1, x2, x3), data = codedValues.val)
print(summary(codedValues.rsm))
png(file = "testPlot3.png")

#plot(codedValues.val)
persp(codedValues.rsm,
      ~ x1 + x2 + x3,
      col = rainbow(50),
      at = summary(codedValues.rsm)$canonical$xs
)
dev.off()