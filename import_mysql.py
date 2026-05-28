import pandas as pd
from sqlalchemy import create_engine

# read csv
df = pd.read_csv("cleaned_train.csv")  

# take only 1000 rows
df = df.head(1000)
 
# mysql connection
engine = create_engine(
    "mysql+pymysql://root:DB_Password@localhost/retail_dashboard" 
)

# import to mysql
df.to_sql(
    name="cleaned_train",
    con=engine,
    if_exists="replace",
    index=False
)

print("Imported Successfully")
