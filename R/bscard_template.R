#' Template for task card
#'
#' @return shiny.tag
#' @importFrom bslib card card_header card_body
#' @importFrom bsicons bs_icon
#' @import htmltools
#' @export
#'
task_card_template <- function(elementId = NULL, 
                               task_description = NULL,
                            assignee = NULL,
                            reviewer = NULL,
                            date_due = NULL,
                            process = NULL
                            ) {
    
    card_id <- if (is.null(elementId)) ids::random_id() else elementId
    task_description <- check_task_description(task_description)
    assignee <- check_task_person(assignee, "assignee")
    reviewer <- check_task_person(reviewer, "reviewer")
    date_due <- check_task_date(date_due)
    process <- check_process(process)
    
    card(
        id = card_id,
        `data-rank-id` = card_id,
        card_header(
            tags$a(
                class = "btn card-header-toggle",
                style = "width:100%; padding: 0;",
                id = paste0(card_id, "-header"),
                tags$div(
                    style = "display: grid; grid-template-columns: auto auto; gap: 5px;",
                    tags$div(tags$p(task_description, style = "margin-bottom: 0rem; text-align: left;")),
                    tags$div(tags$p(bs_icon("chevron-expand"), style = "margin-bottom: 0rem; text-align: right;"))
                ),
            )
        ),
        card_body(
            class = "card-body-for-toggle",
            style = "display: none !important;",
            inline_description("person", assignee),
            inline_description("stoplights", reviewer),
            inline_description("calendar4-event", date_due),
            inline_description("diagram-2", process)
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

