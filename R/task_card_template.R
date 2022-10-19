#' Template for task card
#'
#' @param elementId HTML id of the card
#' @param task_description Description of the task
#' @param assignee Person. Task assignee
#' @param reviewer Person. Task reviewer. Typically a boss.
#' @param date_due The maximum date for task completion
#' @param process The process the task is an item of.
#' @param bg Background color of the HTML card. For a complete list see  `get_task_card_colors()`
#' @importFrom bslib card card_header card_body
#' @importFrom bsicons bs_icon
#' @import htmltools
#' @return shiny.tag
#'
task_card_template <- function(elementId = NULL,
                               task_description = NULL,
                               assignee = NULL,
                               reviewer = NULL,
                               date_due = NULL,
                               process = NULL,
                               bg = "white") {
    
    
    card_id <- if (is.null(elementId)) ids::random_id() else elementId
    task_description <- check_task_description(task_description)
    assignee <- check_task_person(assignee, "assignee")
    reviewer <- check_task_person(reviewer, "reviewer")
    date_due <- check_task_date(date_due)
    process <- check_process(process)
    
    card(
        id = card_id,
        `data-rank-id` = card_id,
        class = paste0("task-bg-", bg),
        card_header(
            class = "task-card-header",
            tags$a(
                class = "btn card-header-toggle",
                id = paste0(card_id, "-header"),
                tags$div(
                    class = "task-card-header-text",
                    tags$div(tags$p(task_description, class = "task-card-header-description")),
                    tags$div(tags$p(bs_icon("chevron-expand"), class = "task-card-header-icon"))
                ),
            )
        ),
        card_body(
            class = "task-card-body py-2",
            inline_description("person", assignee),
            inline_description("stoplights", reviewer),
            inline_description("calendar4-event", date_due),
            inline_description("diagram-2", process),
            tags$button(task_id = card_id, "Eliminar", class = "btn btn-danger btn-sm mt-2 task-card-btn-delete")
        ),
    )
}


inline_description <- function(icon_name, label) {
    tags$div(
        class = "task-card-body-inline",
        tags$div(tags$p(bs_icon(icon_name, size = "1.1rem"), class = "task-card-body-inline-icon")),
        tags$div(tags$p(label, class = "task-card-body-inline-label"))
    )
}

