# Predicting NFL Player Position
Project 4: In-progress

Graded __/100


## Project Description:
This project is to use supervised machine learning's predictive modeling ability to analyze NFL player data for predicting player position.
Visual comparison of data clustering was applied to contrast grouping per position using Unsupervised ML.

The data used in this project was generated from the sources listed below and is intended for educational purposes only.


## Tools and Methods Used:

- Python:
	modules: sklearn, matplotlib, seaborn, pandas, numpy, nfl-data-py
	
	methods: train_test_split, Logistic Regression, data imputation, hyperparameter tuning, predictive model optimization, Unsupervised KMeans clustering, data visualization

- Git collaboration

---

## Instructions:
### Data Import and Clean:
	- Project data is saved in folder "CSV DATA" or otherwise imported using the nfl-data-py module.
	- No additional ETL is needed; data is imported and cleaned within pertinent Jupyter notebooks.
	

## First model: Supervised Logistic Regression
	- Open and run "1st_model.ipynb"
	- This initial model applies Random forest logistic regression in an attempt to predict NFL player position given two years of player stats.
	- Balanced accuracy score greater than 85% for random_state = 1


## Optimized model: Random Forest Classification
	- Open and run "exploratory.ipynb"
	- This model applies Random Forest algorithm to predict NFL player position given ten years of player stats.
	- This model also visualizes the importance of each data feature in producing a successful prediction.
	- Hyperparameter tuning was applied to further optimize the classification model.
	- Balanced accuracy score of 99% for random_state = 40


### Visualization:
	- Open and run "Football_Visual.ipynb"
		- Radar charts show high-level mean data for Offensive stats for three NFL player positions.
		- Bar charts provide comparison of yearly Fantasy Points outputs by player position.

	- exploratory.ipynb visualizes: Feature importance, Unsupervized K Means clustering

---
## Project Conclusions:
- Predictive model accuracy was improved by increasing the quantity of input data and by applying Random Forest Classification.
- Significant features affected model performance were isolated and visualized.
- Initial Logistic Regression modeling was least accurate for the Tight End position.

---

## Collaborators:
Kyle M.

Timothy S.

Travis, S.

Evan S.



## Data sources:
1) nflverse github:
	https://github.com/nflverse

2) nfl-data-py module:
	https://github.com/cooperdff/nfl_data_py

4)  fantasy-csv-data github:
	https://github.com/bendominguez0111/fantasy-csv-data/tree/master/weekly/2021
