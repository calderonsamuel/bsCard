let toggleCardBody = (elementId) => {
    
    let cardHeader = document.getElementById(elementId)
    
    let cardBody = cardHeader
        .parentElement
        .parentElement
        .getElementsByClassName("d-flex")[0]
        
    const currentDisplay = cardBody.style.display
    
    if (currentDisplay === 'none') {
        cardBody.style.setProperty('display', '', 'important')
    } else {
        cardBody.style.setProperty('display', 'none', 'important')
    }
    
    return cardBody.style.display
}

function listenForCardBodyToggle(el) {
    el.addEventListener('click', () => toggleCardBody(el.id))
}


function cardBodyGlobalListener() {
    const cardHeaderToggles = document.getElementsByClassName('card-header-toggle')
    // console.log(cardHeaderToggles)
    
    for (const child of cardHeaderToggles) {
        listenForCardBodyToggle(child)
    }
}

document.addEventListener('shiny:connected', function(event) {
    cardBodyGlobalListener()
})

window.addEventListener('load', function(event) {
    cardBodyGlobalListener()
})

