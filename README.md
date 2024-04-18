# yelptask

This Flutter project contains list of business and business details

## Getting Started

This project we used the Yelp Business API based on location NYC.

The root project folder contains 3 folders as model, view, viewmodel. This represent the architecture of MVVM pattern. 

1. Model 

  The Model folder contains API key and url with the API call functions
  The Model folder also has the model class for business 
  Convert the actual Object to respective model classes

2. View

  The View folder contains the UI part of the project,
  Login screen, Splash Screen, Homepage widget are placed in view folder
  
3. ViewModel

  The viewmodel folder contains the business model to call the API and get the business details.
  The Business details stored in the list in viewmodel file.
  The Business list shared to UI to show the details.
