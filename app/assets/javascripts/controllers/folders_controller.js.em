class Bitbox.FoldersController extends Ember.ArrayController
  itemController: 'folder'
  needs: ['modal_dialog']
  newFolder: ->
    $('#dialog').foundation 'reveal', 'open'
  saveFolder: ->
    folder = Bitbox.Folder.createRecord(name: @name, secret: @secret)
    folder.save()
    folder.on 'didCreate', ->
      $('#dialog').foundation 'reveal', 'close'
    folder.on 'becameError', -> debugger
    folder.on 'becameInvalid', -> alert "Invalid"
