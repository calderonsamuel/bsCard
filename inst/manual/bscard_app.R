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
        column(3, bscard2(elementId = "a")),
        column(3, bscard2(elementId = "b")),
        column(3, bscard2(elementId = "c")),
        column(3, bscard2(elementId = "d"))
    )
)

server <- function(input, output, session) {
    
}

shinyApp(ui, server)
