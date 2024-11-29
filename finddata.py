import pandas as pd

#replace this with the filepath on ur machine
path = "C:/Users/Brandon/Repositories/BME-130/subject-info.csv"

df = pd.read_csv(path)

filtered_ids = df[df['Age_group'] == 15]['ID']

filtered_list = filtered_ids.tolist()
print(filtered_list)
