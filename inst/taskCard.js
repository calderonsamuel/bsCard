/* Functions for toggle of the tas-card-body */
let toggleCardBody = (el) => {
    
    let cardHeader = el
    
    let cardBody = cardHeader
        .parentElement
        .parentElement
        .getElementsByClassName("task-card-body")[0]
        
    const currentDisplay = cardBody.style.display
    
    if (currentDisplay === 'none' || currentDisplay === '') {
        cardBody.style.setProperty('display', 'block', 'important')
    } else {
        cardBody.style.setProperty('display', 'none', 'important')
    }
    
    return cardBody.style.display
}

function listenForCardBodyToggle(el) {
    el.addEventListener('click', () => toggleCardBody(el))
}


function cardBodyGlobalListener() {
    const cardHeaderToggles = document.getElementsByClassName('card-header-toggle')
    
    for (const child of cardHeaderToggles) {
        listenForCardBodyToggle(child)
    }
}



/* Functions for setting an input value for task deleting */

function setTaskForDeleting() {
    let btns = document.getElementsByClassName('task-card-btn-delete')
    
    for (const btn of btns) {
        btn.addEventListener('click', (event) => {
            Shiny.setInputValue("task_card_to_delete", btn.attributes.task_id.value, {priority: "event"});
        })
    }
}





/* Setting all event listeners */

document.addEventListener('shiny:connected', function(event) {
    cardBodyGlobalListener()
    setTaskForDeleting()
})

window.addEventListener('load', function(event) {
    cardBodyGlobalListener()
    setTaskForDeleting()
})
