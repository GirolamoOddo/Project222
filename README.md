# Project222
## Traffic Data Analysis for Modelling and Prediction of Traffic Scenario - Girolamo Oddo 

#### Work carried out in relation to the "Mathworks Innovation Excellence" initiative

[Project-specific Mathworks repository](https://github.com/mathworks/MathWorks-Excellence-in-Innovation/tree/main/projects/Traffic%20Data%20Analysis%20for%20Modelling%20and%20Prediction%20of%20Traffic%20Scenarios)

[Global site](https://it.mathworks.com/academia/matlab-engineering-project-ideas.html)

#### MathWorks courses useful for understanding the work:

["MATLAB for Data Processing and Visualization"](https://matlabacademy.mathworks.com/details/matlab-for-data-processing-and-visualization/mlvi)

["Machine Learning with MATLAB"](https://matlabacademy.mathworks.com/details/machine-learning-with-matlab/mlml)

["Deep Learning with MATLAB"](https://matlabacademy.mathworks.com/details/deep-learning-with-matlab/mldl)
______________________________________________________________________
### WHAT WAS DONE?
In this work, following a systematic approach, a Nonlinear-Autoregressive (NARX) type model was developed in order to predict the behaviour of a vehicle in traffic, with the following performance in Test:
*R^2 0.90*
*MSE 9.47 e-3*.

A method for the application of the obtained model has also been proposed in the report. 

______________________________________________________________________
### WHAT'S IN THE REPOSITORY?

• "Traffic Data Analysis for Modelling and Prediction of Traffic Scenario.pdf"

This is an extended description of the work performed and the results obtained.

• "Code_NARXnet.m" This is the MATLAB file where it is possible to inspect what has been done. 

• "Live_Code_NARXnet.mlx" This is the MATLAB Live Script file where it is possible to run a new training session. 

• "Live_NN.mlx" This is the MATLAB Live Script file where it is possible to use the pre-trained network "NARXnet_TRAINED.mat". 

• "NARXnet_TRAINED.mat" This is the TRAINED NET.

• "NN-IN.xlsx" This is the Inputs set used to train and test the net.

• "NN-TARG.csv" This is the Target set used to train and test the net.

• "X-Input.xlsx" This is the Inputs set used in "NN-Live.mlx".

• "Y-FeedBack.csv" This is the FeedBack set used in "NN-Live.mlx".

• The file "Untitled.slx" and "MyNeuralNetworkFunction.m" are the Simulink block and MATLAB code of the NARX network respectively.
______________________________________________________________________
### HOW TO USE IT?

*If you want to use the pre-trained network*
1. Download the files:
"X-Input.xlsx", "Y-FeedBack.csv", "NARXnet_TRAINED.mat", "Live_NN.mlx".
2. Save the files in the same folder.
3. Open "Live_NN.mlx" with MATLAB ( with the " Deep Learning Toolbox" installed ).
4. Run and get the predictions!


*If you want to train your NARX network with the datasets used in this work* 
1. Download the files:
"NN-IN.xlsx", "NN-TARG.csv", "Code_NARXnet.mlx".
2. Save the files in the same folder.
3. Open "Live_Code_NARXnet.mlx" with MATLAB ( with the " Deep Learning Toolbox" installed ).
4. Run and train the network!


