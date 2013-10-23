function bindFormEvent() {
  $('#project_markdown').on('keypress',htmlConvert)

}

function raorao() {
  console.log("this is working")
}

function htmlConvert(event) {
  var markdown = $( event.target ).val()
  $.ajax( {
    url: '/convert',
    type: 'POST',
    data: {markdown: markdown},
    complete: bindHTML
  })
}

function bindHTML(response) {
  var htmlOutput = response.responseText
  $("#html-output").html(htmlOutput)

}

$(bindFormEvent)

