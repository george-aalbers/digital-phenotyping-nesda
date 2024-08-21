# Smartphone-tracked behavioural markers of depression and anxiety
## Digital phenotyping in the Netherlands Study of Depression and Anxiety (NESDA)

This Github repository contains all Python and R code and outputs required to execute a full machine learning pipeline on the NESDA digital phenotyping substudy that used the smartphone-based Behapp platform to capture location and smartphone app use in individuals with and without depression/anxiety symptoms (symptomatic vs asymptomatic). The project presented here identifies potentially informative digital phenotyping features and evaluates to what extent trained machine learning models can use these features for depression/anxiety symptom recognition. This README file explains the purpose of all files in this repository.

The following files are required to execute the pipeline from start to finish:
- _pipeline.ipynb_: this iPython notebook contains all code to run the analysis from start to finish (with the exception of feature extraction from the raw data which is done by proprietary scripts), calling several files that are also in this repository:
  - _config.py_ contains functions to generate lists with constants like directory paths and dictionaries that allow us to rename a lot of columns.
  - _ridgelines-data-visualisation.R_ contains ggplot2 code to generate the ridgelines plot in the paper. For convenience, we use rpy2 to call this R script from inside the iPython notebook.
  - _boruta.py_ contains the Python implementation of Boruta, modified slightly to work with the latest versions of the other libraries in the notebook.
 
Running these files results in several outputs, some of which can be shared openly and are described here (if relevant for the paper or applying the pipeline on new data); other files can be made available upon reasonable request. Here we have the following output files:
- _model-hyperparameters.csv_ contains the tuned hyperparameters of the models that were trained and evaluated in the paper.
- folder _descriptives_ contains .csv files with descriptives reported in the paper plus descriptives left out for brevity.
- folder _models_ contains .pkl files of all trained models that can be unpickled to be evaluated in a separate dataset with the same features.
- folder _figures_ contains all data visualisations as well as SHAP beeswarm plots.
- folder _performance_ contains model performance metrics reported in the article. 