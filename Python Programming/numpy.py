# learn numpy 
import numpy as np

# where
score = pd.Series([80, 55, 62, 95, 20])
np.where(score >= 80, 'passed', 'failed')

# merge
left = {
    'key': [1, 2, 3,4],
    'name': ['a', 'b', 'c', 'd'],
    'age': [25, 28, 30, 32]
}

right = {
    'key': [1, 2, 3, 4],
    'city': ['Bangkok', 'London', 'Seoul', 'Tokyo']
}

df_left = pd.DataFrame(left)
df_right = pd.DataFrame(right)

pd.merge(df_left, df_right, on='key')
