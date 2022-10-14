#' Template for task card
#'
#' @return shiny.tag
#' @importFrom bslib card card_header card_body
#' @importFrom bsicons bs_icon
#' @import htmltools
#' @export
#'
task_card_template <- function(elementId = NULL, 
                            assignee = NULL,
                            reviewer = NULL,
                            date_due = NULL,
                            process = NULL
                            ) {
    card_id <- if (is.null(elementId)) ids::random_id() else elementId
    card(
        id = card_id,
        card_header(
            tags$a(
                class = "btn card-header-toggle",
                style = "width:100%; padding: 0;",
                id = paste0(card_id, "-header"),
                tags$div(
                    style = "display: grid; grid-template-columns: auto auto; gap: 5px;",
                    tags$div(tags$p("Descripción de tarea", style = "margin-bottom: 0rem; text-align: left;")),
                    tags$div(tags$p(bs_icon("chevron-expand"), style = "margin-bottom: 0rem; text-align: right;"))
                ),
            )
        ),
        card_body(
            gap = 0,
            class = "card-body-for-toggle",
            style = "display: none !important;",
            inline_description("person", "Nombre de encargado"),
            inline_description("stoplights", "Nombre de responsable"),
            inline_description("calendar4-event", "31/12/2022"),
            inline_description("diagram-2", "Proceso al que pertenece")
        ),
    )
}


inline_description <- function(icon_name, label) {
    tags$div(
        style = "display: grid; grid-template-columns: 20px auto; gap: 5px; width: 100%;",
        tags$div(tags$p(bs_icon(icon_name, size = "1.1rem"), style = "margin-bottom: 0rem; text-align: left;")),
        tags$div(tags$p(label, style = "margin-bottom: 0rem; text-align: left;"))
    )
}

