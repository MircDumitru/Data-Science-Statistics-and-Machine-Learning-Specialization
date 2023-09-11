library(ISLR)
data(Wage)
library(ggplot2)
library(caret)

# Remove the logwage 
Wage <- subset(Wage, select = -c(logwage))

# Create a building data sset and validation set
inBuild <- createDataPartition(y = Wage$wage, p = 0.7, list = FALSE)

# Create the validation set
validation <- Wage[-inBuild, ]

build <- Wage[inBuild, ]
inTrain <- createDataPartition(y = build$wage, p = 0.7, list = FALSE)

# Create the testing set
test <- build[-inTrain, ]
# Create the training set
train <- build[inTrain, ]

# The validation, testing and training sets and their dimensions
head(validation); dim(validation)
head(train); dim(train)
head(test); dim(test)

# Train two models using the training set.

# GLM model
fitGLM <- train(wage ~., method = 'glm', data = train)
predGLM <- predict(fitGLM, test)
errGLM <- predGLM - test$wage
sqrt(sum(errGLM^2))
length(predGLM)
qplot(test$wage, predGLM)
plot(errGLM, type = "l", pch = 17, col = 'blue', xlab = 'testing', ylab = 'error')

# RF model
fitRF <- train(wage ~., method = 'rf', data = train,
                trControl = trainControl(method = 'cv'), number = 3)
predRF <- predict(fitRF, test)
errRF <- predRF - test$wage
sqrt(sum(errRF^2))
length(predRF)
qplot(test$wage, predRF)
plot(errRF, type = "l", pch = 17, col = 'cyan', xlab = 'testing', ylab = 'error')

# Create the data frame of the two predictions and the wages (from the testing set)
predDF <- data.frame(predGLM, predRF, wage = test$wage)
head(predDF); dim(predDF)

# Combined model (trained using the testing set)
fitCOMB <- train(wage ~., method = 'gam', data = predDF)
predCOMB <- predict(fitCOMB, predDF)
errCOMB <- predCOMB - test$wage
sqrt(sum(errCOMB^2))
length(predCOMB)
qplot(test$wage, predCOMB)
plot(errCOMB, type = "l", pch = 17, col = 'pink', xlab = 'testing', ylab = 'error')

# Plot comparing the errors corresponding to the three models (GLM,RF,COMB)
plot(errGLM, type = 'l', pch = 17, col = 'blue', xlab = "testing", ylab = "error")
lines(errRF, type = 'l', pch = 17, col = 'cyan')
lines(errCOMB, type = 'l', pch = 17, col = 'pink')
legend('topright', 
       legend=c('err1', 'err2', 'err3'),
       col=c('blue', 'cyan', 'pink'), 
       lty = 1, cex=0.8)


# Prediction over the validation set using the GLM (trained over training)
predGLMVal <- predict(fitGLM, validation)
errGLMVal <- predGLMVal - validation$wage
sqrt(sum(errGLMVal^2))
length(predGLMVal)
qplot(validation$wage, predGLMVal)
plot(errGLMVal, type = "l", pch = 17, col = 'blue', xlab = 'validation', ylab = 'error')

# Prediction over the validation set using the RF (trained over training)
predRFVal <- predict(fitRF, validation)
errRFVal <- predRFVal - validation$wage
sqrt(sum(errRFVal^2))
length(predRFVal)
qplot(validation$wage, predRFVal)
plot(errRFVal, type = "l", pch = 17, col = 'cyan', xlab = 'validation', ylab = 'error')

# Create the data frame of the two predictions corresponding to the two models.
predDFVal <- data.frame(predGLM = predGLMVal, 
                        predRF = predRFVal)
head(predDFVal, 10); dim(predDFVal)

# Prediction over the validation set using the RF (training over training)
predCOMBVal <- predict(fitCOMB, predDFVal)
errCOMBVal <- predCOMBVal - validation$wage
sqrt(sum(errCOMBVal^2))
length(predCOMBVal)
qplot(validation$wage, predCOMBVal)
plot(errCOMBVal, type = "l", pch = 17, col = 'pink', xlab = 'validation', ylab = 'error')
# 
# 
# 
# 
plot(errGLMVal, type = 'l', pch = 17, col = 'blue', xlab = "validation", ylab = "error")
lines(errRFVal, type = 'l', pch = 17, col = 'cyan')
lines(errCOMBVal, type = 'l', pch = 17, col = 'pink')
legend('topright',
       legend=c('err1', 'err2', 'err3'),
       col=c('blue', 'cyan', 'pink'),
       lty = 1, cex=0.8)