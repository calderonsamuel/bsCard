#' Second iteration of bscard
#'
#' @param elementId id 
#'
#' @return shiny.tag
#' @export
task_card <- function(elementId = NULL) {
    task_card_dep <- htmltools::htmlDependency(
        name = "taskCard", 
        version = "0.0.0.9000", 
        src = system.file(package = "bsCard"), 
        script = "taskCard.js"
        
    )
    
    tag <- htmltools::tagList(
        task_card_template(elementId = elementId),
        task_card_dep
    )
    
    htmltools::browsable(tag)
}
