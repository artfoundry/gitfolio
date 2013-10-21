
$('.file-loader').on('ajax:success',loadfiles)

function loadfiles() {
  var $container = $( '.github-container' )
  $container.remove()
  console.log('started from the bottom now we here')
}