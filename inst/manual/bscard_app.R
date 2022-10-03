library(shiny)
library(bslib)
library(bsCard)

custom_card <- card(
    card_header("hi"),
    card_body("hi hi")
)

ui <- fluidPage(
    theme = bs_theme(version = 5, bootswatch = "minty"),
    fluidRow(
        column(6, bscard2(elementId = "a")),
        column(6, bscard2(elementId = "b"))
    )
)

server <- function(input, output, session) {
    
}

shinyApp(ui, server)
