class Bitbox.NewFolderView extends Ember.View
  templateName: 'folders/new'
  click: ->
    folder_name = prompt("Folder name?")
    folder = Bitbox.Folder.createRecord name: folder_name
    debugger
