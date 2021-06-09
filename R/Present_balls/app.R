
library(shiny)
library(reticulate)

# Load model ####
use_python("~/anaconda3/envs/Fastai/bin/python")
torch <- import_from_path("torchvision",path="~/anaconda3/envs/Fastai/lib/python3.8/site-packages/")
l<-import_from_path("fastai.learner","/home/camilo/anaconda3/envs/Fastai/lib/python3.8/site-packages/")
model <- l$load_learner("data_output/balls.pkl")
# UI #####
ui <- fluidPage(

    # Application title
    titlePanel("The tennis and basketball ball identifier"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            fileInput("image", "Upload an image", accept = c('image/png', 'image/jpeg'))
        ),
    mainPanel = mainPanel(
        imageOutput("uploaded_image"),
        verbatimTextOutput("prediction", placeholder = FALSE)
    )
))

# Define server logic required to draw a histogram
server <- function(input, output) {

observeEvent(input$image,
             { inFile <- input$image
                 if(!is.null(inFile)){
                     out<-model$predict(inFile$datapath)[[1]]
                     output$prediction <- renderText({ as.character(out) })

                     output$uploaded_image <- renderImage({
                         outfile<- inFile$datapath
                         # Return a list containing the filename
                         list(src = outfile,
                              contentType = 'image/jpg',
                              width = 400,
                              height = 300,
                              alt = "Image_uploaded")
                     }, deleteFile = TRUE)


                 }
             })
}

# Run the application
shinyApp(ui = ui, server = server)
