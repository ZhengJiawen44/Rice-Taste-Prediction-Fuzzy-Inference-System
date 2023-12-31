Fuzzy Logic System for Rice Taste Prediction
This MATLAB code implements a fuzzy logic system to predict the taste of rice based on a given dataset. The dataset consists of various input variables such as stickiness, and the goal is to model the taste as the output.

## directory overview ##
    app.mlapp: GUI for the FIS
    objectiveFunc.m: helper function to calculate RMSE for evaluating the FIS 
    readme.txt: a documentation file (this)
    riceTaste.m: scripts to generate an FIS and Tune it.
    riceTasteFIS.fis: latest saved FIS file with the best score to load and use anywhere without tuning the entire FIS again. 

## Dataset ##
    The rice taste dataset includes the following input variables:
    Feature 1
    Feature 2
    Feature 3
    Feature 4
    And the output variable: Taste score


## FIS Data Preprocessing ##
    The code reads the rice taste dataset and separates input and output variables.
    
    Baseline FIS:
    A baseline fuzzy inference system (FIS) is generated using the genfis function with Fuzzy C-Means clustering and Mamdani type rules.
    
    Rulebase Evaluation:
    The FIS is evaluated, and its output is plotted using centroid defuzzification.
    
    Tuning FIS:
    The FIS is further tuned in two steps:
    Learning rules from scratch using a Genetic Algorithm (GA).
    Tuning membership functions using a Particle Swarm Optimization (PSO) algorithm.


## Evaluation and Comparison ##
    The costs of different FIS configurations are calculated based on the root mean square error (RMSE) using an objective function.

    Results:
    The costs of the baseline FIS, FIS with learned rules, and FIS with tuned membership functions are displayed.
    
    Rulebases:
    The rulebases of the baseline FIS and the FIS with learned rules are shown.
    
    Objective Function:
    The objective function calculates the RMSE between actual and predicted values.


Feel free to reach out for any questions or improvements!
zhengjiawen44@gmail.com