# customer_churn_eda.py

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load data
df = pd.read_csv('/content/Ecommerce Churn Data.csv')

# Basic info
print("Dataset shape:", df.shape)
print("\nMissing values:\n", df.isnull().sum())
print("\nSummary statistics:\n", df.describe(include='all'))

# Churn distribution
plt.figure(figsize=(6, 4))
sns.countplot(x='Churn', data=df)
plt.title('Churn Distribution')
plt.xticks([0, 1], ['No Churn', 'Churn'])
plt.show()

# Churn rate by gender
plt.figure(figsize=(6, 4))
sns.barplot(x='Gender', y='Churn', data=df)
plt.title('Churn Rate by Gender')
plt.show()

# Boxplot of tenure by churn
plt.figure(figsize=(6, 4))
sns.boxplot(x='Churn', y='Tenure', data=df)
plt.title('Tenure by Churn')
plt.show()

# Satisfaction score distribution by churn
plt.figure(figsize=(8, 4))
sns.histplot(data=df, x='SatisfactionScore', hue='Churn', multiple='stack', bins=5)
plt.title('Satisfaction Score Distribution by Churn')
plt.show()

# Average warehouse distance by churn
plt.figure(figsize=(6, 4))
sns.barplot(x='Churn', y='WarehouseToHome', data=df)
plt.title('Average Distance from Warehouse by Churn')
plt.show()

# Average days since last order by churn
plt.figure(figsize=(6, 4))
sns.barplot(x='Churn', y='DaySinceLastOrder', data=df)
plt.title('Days Since Last Order by Churn')
plt.show()

# Churn by complaint status
plt.figure(figsize=(6, 4))
sns.barplot(x='Complain', y='Churn', data=df)
plt.title('Churn Rate by Complaint Status')
plt.show()

# Correlation heatmap (numerical features only)
plt.figure(figsize=(10, 8))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()

# Save summary churn rate by category (optional)
summary = df.groupby('SatisfactionScore')['Churn'].agg(['count', 'sum', 'mean']).reset_index()
summary.columns = ['SatisfactionScore', 'CustomerCount', 'ChurnCount', 'ChurnRate']
print("\nChurn rate by Satisfaction Score:\n", summary)

# Done
print("\nEDA completed.")
