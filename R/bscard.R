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
    task_card_dep <- htmltools::htmlDependency(
        name = "taskCard", 
        version = "0.0.0.9000", 
        src = system.file(package = "bsCard"), 
        script = "taskCard.js"
        
    )
    
    task_card <- task_card_template(
        elementId = elementId,
        task_description = task_description,
        assignee = assignee,
        reviewer = reviewer,
        date_due = date_due,
        process = process,
        bg = sample(c("#ffb3b3", "#a0a0ff", "#4ccd4c", "#ffce30"), 1)
    )
    
    tag <- htmltools::tagList(
        task_card,
        task_card_dep
    )
    
    htmltools::browsable(tag)
}
