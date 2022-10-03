HTMLWidgets.widget({

  name: 'bscard',

  type: 'output',

  factory: function(el, width, height) {
      
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

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerHTML = x.message;
        el.addEventListener('click', () => toggleCardBody(el.id))

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
