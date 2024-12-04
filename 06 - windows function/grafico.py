import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

tb = pd.read_csv("seller_id,avg_diff_days.csv", sep=",")

plt.hist(tb['avg_diff_days'], bins=40, color='skyblue', edgecolor='black', alpha=0.7)

plt.title('Distribuição Dias sem vendas')
plt.xlabel('Dias')
plt.ylabel('Frequência')
plt.grid(axis='y', linestyle='--')

plt.show()