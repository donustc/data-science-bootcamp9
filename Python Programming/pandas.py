# Learn pandas with penguin dataset

penguins = pd.read_csv('penguins.csv')

# infomation of dataframe
penguins.info()

# select columns
penguins.species 
penguins['species'] 
penguins.species.head(10) 
penguins[['species', 'island', 'sex']].tail(20) 

# integer location based indexing (iloc)
penguins.iloc[ [0, 1, 2] ] 
penguins.iloc[0:3]
penguins.iloc[0:5,[1,2]] 

# filter
penguins[penguins['island'] == 'Torgersen']
penguins[(penguins['island'] == 'Torgersen') & (penguins['bill_length_mm'] < 35)]

# filter with .query()
penguins.query('island == "Torgersen" | bill_length_mm < 35')

# check missing in each column
penguins.isna().sum()

# mean imputation
avg_value = top5_penguins['bill_length_mm'].mean() # 38.9
top5_penguins['bill_length_mm'].fillna(value=avg_value)

# summarise dataframe
penguins.describe(include='all')

# group by aggregation
penguins.groupby('species')['bill_length_mm'].agg(['min', 'mean', 'median', 'std', 'max'])
