# Basic pandas
import pandas as pd

# create dataframe from scratch
raw_data  = {
    "name": ["Donut", "Joe", "Mary", "John", "Anna"],
    "age": [23, 25, 20, 22, 31],
    "gender": ["M", "M", "F", "M", "F"]
}

df = pd.DataFrame(raw_data

# add a new column
df['city'] = ['London', 'London', 'London', 'Manchester', 'Liverpool' ]

# drop column 
df = df.drop('city', axis = 1)

# rename columns
df.columns = ['nickname', 'age', 'sex']
