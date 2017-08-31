if(!require(leaflet)){
  install.packages("leaflet")
}
library(leaflet)


dates <- sort(as.vector(unique(probs$date)))
dates <- dates[1:20] # show predictions of only the next 3 days 


ui = 
  navbarPage(
  title = "Ambulances",#div(img(src="dsx1.png"),"IBM"), 

  tabPanel(
    div(class="outer",

      tags$head(
      # Include our custom CSS
        includeCSS("styles.css"),
        includeScript("gomap.js")#,
      ),

      leafletOutput("map", width="100%", height="100%"),
      
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
        draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
        width = 330, height = "auto", 

        h2("Date & time and credentials"),
        selectInput("date","Date",dates),
        sliderInput("time","Time", min = 0, max = 23, value = 9),
        sliderInput("nb","Ambulances", min = 3, max = 12, value = 4),
        passwordInput("api_key", "CPLEX key", value = defaultApiKey),
        submitButton(text = "Apply Changes", icon = NULL, width = NULL)
      ),

      tags$div(id="cite",'Data Scientists: Jorge Castañón, Shahab Sheikh, Jihyoung Kim',fontsize=20)
      
    )
  )
)
