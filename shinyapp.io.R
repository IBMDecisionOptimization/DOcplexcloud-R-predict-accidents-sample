#
# Example code for deployment on shinyapp.io
# see http://docs.rstudio.com/shinyapps.io/getting-started.html#deploying-applications
#
if(!require(leaflet)){
install.packages("rsconnect")
}
library(rsconnect)

rsconnect::setAccountInfo(name='docplex',
                          token='49C8A4C3C481B266EDF2D86125950D55',
                          secret='FcJRBP98Luw8vVB7IOzz2kWTYPbaawDCEwQ/URCS')
rsconnect::deployApp('blabla/predict-accidents')


