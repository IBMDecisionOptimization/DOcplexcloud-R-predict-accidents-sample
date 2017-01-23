# Shiny apps in the IBM data science experience

Shiny Apps for datascience.ibm.com

## Predictions of car accident in NYC based on weather data:

This shiny app shows how the IBM Data Science Experience was leveraged to show the results of a car accident predictive model in New York City. The model was trained using historical data of car accidents and IBM weather's data. The weather conditions per zip code were used as features to train a logistic regression model that predicts the probability of a car accident at the zip code level. 

###### Running the Shiny App
- Download the predict-accidents [zip file](https://github.com/IBMDataScience/dsx-shiny-apps/blob/master/predict-accidents.zip) to your laptop (no need to unzip!)
- Open RStudio in [Data Science Experience](http://datascience.ibm.com/) from the left navigation bar 
- On the bottom right panel of RStudio, under "Files", click on the "Upload" option
- Click on "Choose File" and browse for the "predict-accidents.zip" on your laptop (dowloaded on the first step)
- Click on the "predict-accidents" directory
- Open the server.R file by clicking on it in RStudio
- On the top left panel, open the shiny app by clicking on the "Run App" button

You should get a really cool map that shows the probabilities of car accidents per zip code. On the right panel of the app you can interact with the app by choosing the desired date and time of interest. Click on the circles to get the zip code and the probability.

Optionnaly, you can set environment variables DOCPLEXCLOUD_URL and DOCPLEXCLOUD_KEY. The application will automatically use
these values for service URL and API key.
