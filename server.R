if(!require(leaflet)) {
  install.packages("leaflet")
}
library(leaflet)

# install the docplexcloud-R-client
if (!require('docplexcloud')){
  if(!require(devtools)){
    install.packages("devtools")
  }
  library(devtools)
  install_github("IBMDecisionOptimization/DOcplexcloud-R-client")
}

require('docplexcloud')

#################################################

minDate = min(probs$date)


#################################################

server = 
  function(input, output, session) {
  ## Interactive Map ###########################################
  
  # Create the map
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$OpenStreetMap.HOT) %>%
      setView(lng = -73.81,
              lat = 40.71,
              zoom = 11)
  })
  
  observe({
    dateIn <- input$date
    timeIn <- input$time
    if (!is.null(timeIn) & !is.null(dateIn)){
      timeIn = 9
      dateIn = minDate
    }
    filt_probs <-
      probs[(probs$hour == timeIn) &
              (probs$date == dateIn) & (probs$accident_prob > 0.35), ]
    
    write.csv(filt_probs, "predicted-accidents.csv")
    
    colorData <- filt_probs[["accident_prob"]]
    pal <- colorBin("Reds", colorData, 9, pretty = TRUE)
    
    
    leafletProxy("map", data = filt_probs) %>%
      clearShapes() %>%
      addCircles(
        ~ LONGITUDE,
        ~ LATITUDE,
        radius = 400,
        stroke = FALSE,
        fillOpacity = 0.9,
        fillColor = pal(colorData)
      ) %>%
      addLegend(
        "bottomright",
        pal = pal,
        values = colorData,
        title = "Probability of Accidents",
        layerId = "colorLegend"
      )
  })
  
  observeEvent(input$submit, {
    dateIn <- input$date
    timeIn <- input$time
    nb <- input$nb
    apiKey = defaultApiKey
    if (apiKey == "") {
      apiKey = input$api_key
    }
    cplexModel <- paste(readLines("ambulances.py"), collapse = '\n')

    params <- paste("nb", toString(nb), sep = '\n')
    write(params, "params.csv")
    
    accidents <-
      paste(readLines("predicted-accidents.csv"), collapse = '\n')

    filename = paste(paste(paste(paste("results/ambulances", dateIn, sep = '.'),timeIn, sep = '.'), nb, sep="."), "csv", sep = '.')
    if (!file.exists(filename)) {
        client <- DOcplexcloudClient$new(url=baseUrl, key=apiKey, verbose=TRUE)
        
        job <- client$submitJob(addAttachment(name="ambulance.py",
                                              data=charToRaw(cplexModel)),
                                addAttachment(name="params.csv",
                                              data=charToRaw(params)),
                                addAttachment(name="predicted-accidents.csv",
                                              data=charToRaw(accidents)))
        
        ambulances = rawToChar(client$getAttachment(job, "ambulances.csv"))
        
        client$deleteJob(job)
        # create the results/ dir if needed
        dir.create(dirname(filename), showWarnings = FALSE)
        write(ambulances, filename)
    }
    print(paste(Sys.time(), paste(" Getting the results from ", filename, sep=""), sep=""))
    my_ambulances <- read.csv(filename)
    
    icon <-
      makeIcon(iconUrl = "http://www.iconsdb.com/icons/preview/red/ambulance-xxl.png",
               iconWidth = 25,
               iconHeight = 50,)
    
    leafletProxy("map", data = my_ambulances) %>% 
      clearMarkers() %>%
      addMarkers(~LONGITUDE, ~LATITUDE)#, icon = icon)#, popup=paste(~LONGITUDE, ~LATITUDE, sep="\n"))
      
  })
  
}
