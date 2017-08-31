# Shiny apps in the IBM data science experience with Optimization.

This app extends the capabilities of the [original app](https://github.com/IBMDataScience/dsx-shiny-apps) by enabling you to select a number of ambulances that will then be optimally positioned to be able to handle the accidents in New York.

It is an example of how to mix Optimization written in Python with an R application.
The Python script will be run on CPLEX Service, thanks to the R DOcplexcloud connector.

The optimization model is an adaptation of an official CPLEX for Python example: [best shop locations](https://github.com/IBMDecisionOptimization/docplex-examples/blob/master/examples/mp/jupyter/chicago_coffee_shops.ipynb)

## Predictions of car accident in NYC based on weather data:

This Shiny app shows how the IBM Data Science Experience was leveraged to show the results of a car accident predictive model in New York City. The model was trained using historical data of car accidents and IBM weather data. The weather conditions per zip code were used as features to train a logistic regression model that predicts the probability of a car accident at the zip code level. 

###### Running the Shiny App
- Download the predict-accidents [zip file](https://github.com/IBMDecisionOptimization/DOcplexcloud-R-predict-accidents-sample/archive/master.zip) to your laptop (no need to unzip!)
- Open RStudio in [Data Science Experience](http://datascience.ibm.com/) from the left navigation bar, or a local studio
- On the bottom right panel of RStudio, under "Files", click on the "Upload" option
- Click "Choose File" and browse for the "predict-accidents.zip" on your laptop (dowloaded on the first step)
- Open the "predict-accidents" directory
- Click the `server.R` file to open it in RStudio
- On the upper left panel, click "Run App" to open the Shiny app.

You obtain an interactive map that shows the probabilities of car accidents per zip code. On the right panel of the app you can interact with the app by choosing the desired date and time of interest. 

- Register for a free trial of [CPLEX service](https://dropsolve-oaas.docloud.ibmcloud.com/software/analytics/docloud) and get your URL and API key.
- Click the circles to get the zip code and the probability.
- Enter you url and api key where needed. Or add your key to `global.R` if you want to embed your key in the demo
- Select a date
- Select the number of ambulances to optimally position.

The app will then be updated with the ambulance positions.


