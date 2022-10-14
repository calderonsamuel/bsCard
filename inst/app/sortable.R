library(shiny)
library(bslib)
library(bsCard)

ui <- page_fluid(
    fluidRow(
        class = "panel-body",
        column(
            width = 3,
            card_container_sortable(
              sortable_id = "pendiente",
              title = "Pendiente",
              sort = FALSE,
              task_card(),
              task_card(),
              task_card(),
              task_card()
            )
        ), 
        column(
            width = 3,
            card_container_sortable(
              sortable_id = "en_proceso",
              title = "En proceso",
              sort = FALSE,
              task_card(),
              task_card(),
              task_card(),
              task_card()
            )
        ), 
        column(
            width = 3,
            card_container_sortable(
              sortable_id = "pausado",
              title = "Pausado",
              sort = FALSE,
              task_card(),
              task_card(),
              task_card(),
              task_card()
            )
        ), 
        column(
            width = 3,
            card(
                id = "sort4",
                verbatimTextOutput("debug")
            )
        )
    )
)

server <- function(input, output) {
    
    output$debug <- renderPrint(list(
        pendientes = input$pendiente_elements,
        en_proceso = input$en_proceso_elements,
        pausado = input$pausado_elements
    ))
    
}
shinyApp(ui, server)
