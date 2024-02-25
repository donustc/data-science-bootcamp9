from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.tree import DecisionTreeRegressor
import pandas as pd 

# read csv data from github: mtcars
url = 'https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv'

mtcars = pd.read_csv(url)

# ML workflow : split > train > score > evaluate

y = mtcars['mpg']
X = mtcars[['hp', 'wt', 'am']]

# 1. split data
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# 2. train model
model = LinearRegression() 
model.fit(X_train, y_train)

# 3. score
train_error = model.score(X_train, y_train)

# 4. evaluate
test_error = model.score(X_test, y_test) # R squared

print(train_error, test_error)
