#' Sortable container for task cards
#' 
#' This container is meant to be used inside a shiny app. 
#' The inner elements can be accesed via '{sortable_id}_elements'.
#'
#' @param sortable_id CSS id for the container. It also functions as the css_id for sortable_js
#' @param group_name Name of the group for linking with other containers. Use NULL to disable
#' @param ... Inner HTML tags
#' @param title Title of the container
#' @param icon Icon for the container header
#' @param pull sortable group option. ability to move from the list.
#' @param put sortable group option. whether elements can be added from other lists
#' @importFrom sortable sortable_options sortable_js_capture_input sortable_js
#' @inheritParams sortable::sortable_options 
#'
#' @return A taglist with a container for sortable elements
#' @export
#'
card_container_sortable <- function(sortable_id = NULL, 
                                    ..., 
                                    group_name = "sortGroup1", 
                                    title = NULL, icon = NULL, pull = TRUE, 
                                    put = TRUE, sort = TRUE) {
    header <- if (!is.null(title) & !is.null(icon)) {
        card_header(
            inline_description(icon, title)
        )
    } else if (!is.null(title)) {
        card_header(
            card_title(title)
        )
    } else {
        NULL
    }
    
    input_id <- paste0(sortable_id, "_elements")
    tagList(
        card(
            header,
            tags$div(
                id = sortable_id,
                ...
            )
        ),
        sortable_js(
            css_id = sortable_id,
            options = sortable_options(
                group = list(
                    name = group_name,
                    pull = pull,
                    put = put
                ),
                sort = sort,
                onSort = sortable_js_capture_input(input_id),
                onLoad = sortable_js_capture_input(input_id)
            )
        )
    )
}
