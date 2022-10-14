library(shiny)
library(bslib)
library(bsCard)
library(sortable)

ui <- page_fluid(
    card(
        class = "panel panel-heading",
        fluidRow(
            class = "panel-body",
            column(
                width = 3,
                card(
                    tags$div(
                        id = "sort1",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                ) 
            ), 
            column(
                width = 3,
                card(
                    tags$div(
                        id = "sort2",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
                    )
                ) 
            ), 
            column(
                width = 3,
                card(
                    tags$div(
                        id = "sort3",
                        task_card(),
                        task_card(),
                        task_card(),
                        task_card()
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
    ),
    sortable_js(
        "sort1",
        options = sortable_options(
            group = list(
                name = "sortGroup1",
                put = TRUE
            ),
            sort = FALSE,
            onSort = sortable_js_capture_input("sort_vars"),
            onLoad = sortable_js_capture_input("sort_vars")
        )
    ),
    sortable_js(
        "sort2",
        options = sortable_options(
            group = list(
                group = "sortGroup1",
                # put = htmlwidgets::JS("function (to) { return to.el.children.length < 1; }"),
                put = TRUE,
                pull = TRUE
            ),
            onSort = sortable_js_capture_input("sort_x"),
            onLoad = sortable_js_capture_input("sort_x")
        )
    ),
    sortable_js(
        "sort3",
        options = sortable_options(
            group = list(
                group = "sortGroup1",
                # put = htmlwidgets::JS("function (to) { return to.el.children.length < 2; }"),
                put = TRUE,
                pull = TRUE
            ),
            onSort = sortable_js_capture_input("sort_y"),
            onLoad = sortable_js_capture_input("sort_y")
        )
    )
)

server <- function(input, output) {
    
    x <- reactive({
        x <- input$sort_x
        if (is.character(x)) x %>% trimws()
    })
    
    y <- reactive({
        input$sort_y %>% trimws()
    })
    
    output$debug <- renderPrint(list(
        sort_vars = input$sort_vars,
        x = input$sort_x,
        y = input$sort_y
    ))
    
}
shinyApp(ui, server)
