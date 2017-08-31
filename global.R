#
# The global environnment for the R session.
#

# if an environment variable DOCPLEXCLOUD_URL is set, use that as the base url,
# otherwise use the default public docplexcloud URL.
baseUrl <- Sys.getenv("DOCPLEXCLOUD_URL", 
                      unset="https://api-oaas.docloud.ibmcloud.com/job_manager/rest/v1/")


# The default api key
# This is the api key to use when submitting jobs to DOcplexcloud
# This uses your env variable DOCPLEXCLOUD_KEY if it has been set, otherwise
# it uses the key in the unset part.
# If left blank, user will have to input their key in the UI
defaultApiKey = Sys.getenv("DOCPLEXCLOUD_KEY",
                           unset = "")

# The predictede accidents data
probs <- read.csv("data/predicted-accidents-full.csv")