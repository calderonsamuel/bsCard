check_task_person <- function(person, type = NULL) {
    if (is.null(person)) return(ids::adjective_animal(style = "title"))
        
    type <- match.arg(type, c("assignee", "reviewer"))
    
    if (!is.character(person)) {
        cli::cli_abort("{.code {type}} is not a person")
    }
}

check_task_date <- function(date) {
    if (is.null(date)) return(Sys.Date())
    date <- as.Date(date)
    # TODO: completar
}

check_process <- function(process) {
    if(is.null(process)) return(ids::proquint())
}

check_task_description <- function(description) {
    if (is.null(description)) return(ids::adjective_animal(n_adjectives = 2, style = "sentence"))
}
