#' Task card with custom elements
#'
#' @inheritParams task_card_template
#' @return shiny.tag
#' @export
task_card <- function(elementId = NULL,
                      task_description = NULL,
                      assignee = NULL,
                      reviewer = NULL,
                      date_due = NULL,
                      process = NULL,
                      bg = "white"
                      ) {
    
    task_card_deps <- htmltools::htmlDependency(
        name = "taskCard", 
        version = "0.1.0", 
        src = system.file(package = "bsCard"), 
        script = "taskCard.js",
        stylesheet = "taskCard.css"
    )
    
    task_card <- task_card_template(
        elementId = elementId,
        task_description = task_description,
        assignee = assignee,
        reviewer = reviewer,
        date_due = date_due,
        process = process,
        bg = sample(get_task_card_colors(), 1)
    )
    
    tag <- htmltools::tagList(
        task_card,
        task_card_deps
    )
    
    htmltools::browsable(tag)
}

#' Background colors for task cards
#'
#' @return named chr vector
#' @export
get_task_card_colors <- function() {
    c(
        white = "#FFFFFF",
        cyan = "#8DD3C7",
        pale = "#FFFFB3",
        lilac = "#BEBADA",
        red = "#FB8072",
        blue = "#80B1D3",
        orange = "#FDB462",
        green = "#B3DE69",
        pink = "#FCCDE5",
        grey = "#D9D9D9",
        purple = "#BC80BD",
        palegreen = "#CCEBC5",
        yellow = "#FFED6F"
    ) |> 
        names()
}
