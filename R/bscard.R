#' Task card with custom elements
#'
#' @param elementId id 
#'
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
        name = "taskCardJS", 
        version = "0.0.0.9000", 
        src = system.file(package = "bsCard"), 
        script = "taskCard.js",
        stylesheet = "taskCard.css"
    )
    
    bg_color <- c("white", "cyan", "pale", "lilac", "red", "blue", "orange")
    
    task_card <- task_card_template(
        elementId = elementId,
        task_description = task_description,
        assignee = assignee,
        reviewer = reviewer,
        date_due = date_due,
        process = process,
        bg = sample(bg_color, 1)
    )
    
    tag <- htmltools::tagList(
        task_card,
        task_card_deps
    )
    
    htmltools::browsable(tag)
}
