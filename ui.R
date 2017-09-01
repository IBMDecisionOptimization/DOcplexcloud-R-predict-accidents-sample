if(!require(leaflet)){
  install.packages("leaflet")
}
library(leaflet)


dates <- sort(as.vector(unique(probs$date)))

minDate = min(dates)
maxDate = max(dates)

ui = 
  navbarPage(
  title = "Ambulances",#div(img(src="dsx1.png"),"IBM"), 

  tabPanel(
    div(class="outer",

      tags$head(
      # Include our custom♫ CSS
        includeCSS("styles.css"),
        includeScript("gomap.js")#,
      ),

      leafletOutput("map", width="100%", height="100%"),
      
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
        draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
        width = 330, height = "auto", 

        h2("Date & time and credentials"),
        dateInput("date","Date", value=minDate, min=minDate, max=maxDate),
        sliderInput("time","Time", min = 0, max = 23, value = 9),
        sliderInput("nb","Ambulances", min = 3, max = 12, value = 4),
        passwordInput("api_key", "CPLEX key", value = defaultApiKey),
        actionButton("submit", label = "Apply Changes", icon = NULL, width = NULL)
      ),

      tags$div(id="cite",'Optimization specialists: Vincent Beraudier, Viu-Long Kong. ',
               'Data Scientists: Jorge Castañón, Shahab Sheikh, Jihyoung Kim',fontsize=14)

    )
  )
)
