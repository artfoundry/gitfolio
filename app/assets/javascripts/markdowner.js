function bindFormEvent() {
  $('.project_markdown').on('keydown',htmlConvert)
  $('.reveal-modal').on('open',clearHTML)
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
  $(".html-output").html(htmlOutput)
}

function clearHTML() {
  $(".html-output").empty()
}

$(bindFormEvent)