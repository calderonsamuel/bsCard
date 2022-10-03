#' Template for bscard
#'
#' @return shiny.tag
#' @export
#'
bscard_template <- function(width = NULL, height = NULL, elementId = NULL) {
    bslib::card(
        card_header(
            tags$a(
                class = "btn card-header-toggle",
                style = "width:100%; padding: 0;",
                id = elementId,
                tags$div(
                    style = "display: grid; grid-template-columns: auto auto; gap: 5px;",
                    tags$div(tags$p("Descripción de tarea", style = "margin-bottom: 0rem; text-align: left;")),
                    tags$div(tags$p(shiny::icon("bars"), style = "margin-bottom: 0rem; text-align: right;"))
                ),
            )
        ),
        bslib::card_body(
            gap = 0,
            class = "card-bodyid",
            style = "display: none !important;",
            inline_description("user", "Nombre de encargado"),
            inline_description("book-reader", "Nombre de responsable"),
            inline_description("calendar-day", "31/12/2022"),
            inline_description("project-diagram", "Proceso al que pertenece")
        ),
    )
}


inline_description <- function(icon_name, label) {
    tags$div(
        style = "display: grid; grid-template-columns: 20px auto; gap: 5px; width: 100%;",
        tags$div(tags$p(shiny::icon(icon_name), style = "margin-bottom: 0rem; text-align: left;")),
        tags$div(tags$p(label, style = "margin-bottom: 0rem; text-align: left;"))
    )|> suppressMessages()
}

