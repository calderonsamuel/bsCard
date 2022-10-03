#' Bootstrap Card
#'
#' Card compatible with BS version 5. Imitates the behavior of the Bs4Dash::box.
#'
#' @import htmlwidgets
#' @importFrom htmltools tags
#' @importFrom bslib card card_header card_body
#'
#' @export
bscard <-function(width = NULL, height = NULL, elementId = NULL) {
    
    message <- bslib::card(
        card_header(
            tags$a(
                class = "btn card-header-toggle",
                style = "width:100%; padding: 0;",
                id = elementId,
                tags$div(
                    style = "display: grid; grid-template-columns: auto auto; gap: 5px;",
                    tags$div(tags$p("Descripción de tarea", style = "margin-bottom: 0rem; text-align: left;")),
                    tags$div(tags$p(icon("bars"), style = "margin-bottom: 0rem; text-align: right;"))
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
    
    # message <- tags$div(tags$p("hi", style = "color: red"))
    
    
    # forward options using x
    x = list(message = as.character(message))

    # create widget
    htmlwidgets::createWidget(
        name = 'bscard',
        x,
        width = width,
        height = height,
        package = 'bsCard',
        elementId = elementId
        # preRenderHook = bsCardHook
    )
}

#' Shiny bindings for bscard
#'
#' Output and render functions for using bscard within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bscard
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bscard-shiny
#'
#' @export
bscardOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'bscard', width, height, package = 'bsCard')
}

#' @rdname bscard-shiny
#' @export
renderBscard <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, bscardOutput, env, quoted = TRUE)
}

bsCardHook <- function(instance) {
    theme <- bslib::bs_current_theme()
    if (!bslib::is_bs_theme(theme)) {
        return(instance)
    }
    instance$x$theme <- modifyList(
        instance$x$theme, as.list(
            bslib::bs_get_variables(theme, c("bg", "fg"))
        )
    )
    instance
}

inline_description <- function(icon_name, label) {
    tags$div(
        style = "display: grid; grid-template-columns: 20px auto; gap: 5px; width: 100%;",
        tags$div(tags$p(shiny::icon(icon_name), style = "margin-bottom: 0rem; text-align: left;")),
        tags$div(tags$p(label, style = "margin-bottom: 0rem; text-align: left;"))
    )|> suppressMessages()
}
