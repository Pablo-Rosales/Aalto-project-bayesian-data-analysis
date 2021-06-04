# Bayesian Data Analysis: Project

This repository contains the project for the course CS-E5710 - Bayesian Data Analysis at Aalto University, Finland.
The file `report.pdf` contains the project report which presents the problem and the data analysis results whereas `report.Rmd` contains the code of the project made in R.

## Introduction
Breast cancer most commonly presents as a lump that feels different from the rest of the breast tissue. More
than 80% of cases are discovered when a person detects such a lump with the fingertips and there are various
methods of assessing if the detected lump is a cyst, and if so, either benign or malignant.
One such method of detecting the dangerousness of the mass is Fine-needle Aspiration (FNA). This diagnostic
procedure consists of a very safe and minor procedure, where a thin hollow needle is inserted into the mass for
obtaining cell samples and analyzing them under a microscope. A major surgical biopsy can be avoided by
performing FNA, which is safer and far less traumatic, and possibly eliminating the need for hospitalization
and other complications.
The problem presented in this report deals with finding out which features of a FNA are more relevant
in diagnosing a patient’s mammary lump as benign or malignant. The data used is the Breast Cancer
Wisconsin (Diagnostic) Data Set, a data set whose features are computed from digitized images of FNAs of
breast mass.

## Main Modeling Idea

As a summary, our modeling idea has been to do the following analysis’ with different types of models:
1. **Linear Model**, with each of the remaining 18 features, to see which individual variable might have
more influence in predicting correct diagnosis.
2. **Multivariate Models**, done with 3 blocks of 6 variables from mean, se and worst, to see which
variable block might have more influence in predicting correct diagnosis.
3. **Multivariate Model**, done with all 18 features in order to obtain proper posterior checking, and see
the minimum optimal amount of variables needed, and which ones, for equal or better prediction as
this model with all 18 features.
4. **Multivariate Model**, done with the best minimum optimal amount of variables, to check if the
predictions obtained are equal or better than the model with all variables.
5. **Multivariate Model**, done with Regularized Horseshoe Prior with the best minimum optimal amount
of variables, in order to check if the predictions obtained are equal or better than the model with all
variables.
6. **Gaussian Model**, done with the four best variables obtained from applying the Multivariate model
in order to compare the results of applying it to the dataset and check if it performs better with the
selected variables than the considered alternatives.


## Members of the project

Tudor Nicolae Mateiu, Pablo Rosales and Alicia Núñez Alcover.
