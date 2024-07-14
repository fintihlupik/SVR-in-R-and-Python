# SVR

# Regression Template

# Polynomial Regression

# Data Preprocessing

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# #Splitting the data into the Training and Test set
# #install.packages('caTools')
# library('caTools')
# set.seed(123)
# #primer parametro es y, la variable dependiente,
# #segundo el tamaño del training set. devuelve true si va a training set y false si va a test set
# split = sample.split(dataset$Purchased, SplitRatio=0.8) 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)


# Fitting the SVR to the dataset
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,  #ver f1 con svm, está puesto allí el tipo
                data = dataset,
                type = 'eps-regression')




# Predicting a new result with Regression
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the SVR results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line (aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
             colour = 'blue') +
  ggtitle('Regression Model') +
  xlab('Level')+
  ylab('Salary')


# Visualising the SVR results (for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line (aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
             colour = 'blue') +
  ggtitle('Regression Model') +
  xlab('Level')+
  ylab('Salary')