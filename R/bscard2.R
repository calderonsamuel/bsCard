#' Second iteration of bscard
#'
#' @param elementId id 
#'
#' @return shiny.tag
#' @export
bscard2 <- function(elementId = NULL) {
    bscard_dep <- htmltools::htmlDependency(
        name = "bscard", 
        version = "0.0.0.9000",
        src = system.file(package = "bsCard"), 
        script = "bscard.min.js"
        
    )
    
    shiny::tagList(
        bscard_template(elementId = elementId),
        bscard_dep
    )
}
