
$('.file-loader').on('ajax:success',loadfiles)

function loadfiles(event, repoData) {
  var self = this
  removeRows(self)
  console.log('started from the bottom')
  loadFiles(repoData)


}

function removeRows(self) {
  var $repoRows = $( self ).parent().parent().parent()
  $repoRows.remove()
}

function loadFiles(repoData) {
  var owner = repoData.owner
  var repo = repoData.repo_name
  var files = repoData.files

  var files_hash = createFileHashes(owner, repo, files)
  createFileElements(files_hash)

}

function createFileElements(files) {
  $.each(files, function(i,value) {
    element = $('<div/>').text("some text")
    console.log(element.text())
    element.appendTo('#secondary-container')
  })
}


function createFileHashes(owner, repo, files) {

  var files_hash = []

  $.each(files, function(key,value) {
    file_hash = {}
    file_hash["owner"] = owner
    file_hash["repo"] = repo
    file_hash["path"] = value
    file_hash["name"] = key
    files_hash.push(file_hash)
    })

  return files_hash
}

function getFileCode() {
  $.ajax({
    url: '/get_file_info',
    type: 'POST',
    data: { owner: "raorao", path: "Gemfile", repo: "ar-student-schema" },
    complete: raorao
  })
}

function raorao() {
 console.log("now my whole team fucking here")
}