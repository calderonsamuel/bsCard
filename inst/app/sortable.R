library(shiny)
library(bslib)
library(bsCard)

ui <- page_navbar(
    title = "Test page",
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),

    fluidRow(
        class = "panel-body",
        column(
            width = 3,
            card_container_sortable(
              sortable_id = "pendiente",
              title = "Pendiente",
              height = "89vh",
              task_card(),
              task_card(),
              task_card(),
              task_card()
            )
        ), 
        column(
            width = 3,
            fluidRow(
                column(
                    width = 12,
                    card_container_sortable(
                        sortable_id = "en_proceso",
                        title = "En proceso",
                        height = "44vh",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                ),
                column(
                    width = 12,
                    card_container_sortable(
                        sortable_id = "pausado",
                        title = "Pausado",
                        height = "44vh",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                )
            )
        ), 
        column(
            width = 3,
            fluidRow(
                column(
                    width = 12,
                    card_container_sortable(
                        sortable_id = "en_revision",
                        title = "En revisión",
                        height = "44vh",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                ),
                column(
                    width = 12,
                    card_container_sortable(
                        sortable_id = "observado",
                        title = "Observado",
                        height = "44vh",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                )
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
        pausado = input$pausado_elements,
        en_revision = input$en_revision_elements,
        observado = input$observado_elements
    ))
    
}
shinyApp(ui, server)
