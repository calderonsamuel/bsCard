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
#' @param width css property
#' @param height css property
#' @inheritParams sortable::sortable_options 
#' @importFrom sortable sortable_options sortable_js_capture_input sortable_js
#' @importFrom bslib card_title
#'
#' @return A taglist with a container for sortable elements
#' @export
#'
card_container_sortable <- function(sortable_id = NULL, 
                                    ..., 
                                    group_name = "sortGroup1", 
                                    title = NULL, icon = NULL, pull = TRUE, 
                                    put = TRUE, sort = FALSE,
                                    width = NULL, height = NULL) {
    
    header <- card_container_header(title, icon)
    input_id <- paste0(sortable_id, "_elements")
    
    card_container <- card(
        height = height,
        class = "card-container-wrapper",
        header,
        card_body(
            id = sortable_id,
            class = "card-container-body",
            ...
        )
    )
    
    card_container_modified <- 
        tagQuery(card_container)$
        find(".card-container-body")$
        removeAttrs("style")$
        allTags()

    tagList(
        card_container_modified,
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

card_container_header <- function(title, icon) {
    if (!is.null(title) & !is.null(icon)) {
        card_header(
            class = "card-container-header",
            inline_description(icon, title)
        )
    } else if (!is.null(title)) {
        card_header(
            class = "card-container-header",
            card_title(title)
        )
    } else {
        NULL
    }
}
