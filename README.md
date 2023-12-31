# Rice Taste Prediction with Fuzzy Logic System

This MATLAB project implements a Fuzzy Logic System (FIS) to predict the taste of rice based on a given dataset. The FIS is designed to model the taste as the output, utilizing various input variables, such as stickiness.

## Directory Overview

- **app.mlapp:** Graphical User Interface (GUI) for the FIS.
- **objectiveFunc.m:** Helper function to calculate Root Mean Square Error (RMSE) for FIS evaluation.
- **riceTaste.m:** Scripts for FIS generation and tuning.
- **riceTasteFIS.fis:** Latest saved FIS file for quick loading and usage.
- **readme.md:** Documentation file (you are here).

## Dataset

The rice taste dataset includes the following input variables:
- Feature 1
- Feature 2
- Feature 3
- Feature 4

And the output variable: Taste score

## FIS Data Preprocessing

The code reads the rice taste dataset and separates input and output variables.

### Baseline FIS

A baseline fuzzy inference system (FIS) is generated using the `genfis` function with Fuzzy C-Means clustering and Mamdani type rules.

### Rulebase Evaluation

The FIS is evaluated, and its output is plotted using centroid defuzzification.

### Tuning FIS

The FIS is further tuned in two steps:
1. Learning rules from scratch using a Genetic Algorithm (GA).
2. Tuning membership functions using a Particle Swarm Optimization (PSO) algorithm.

## Evaluation and Comparison

The costs of different FIS configurations are calculated based on the root mean square error (RMSE) using the `objectiveFunc` function.

### Results

The costs of the baseline FIS, FIS with learned rules, and FIS with tuned membership functions are displayed.

### Rulebases

The rulebases of the baseline FIS and the FIS with learned rules are shown.

### Objective Function

The objective function calculates the RMSE between actual and predicted values.

Feel free to reach out for any questions or improvements!

Contact: zhengjiawen44@gmail.com

