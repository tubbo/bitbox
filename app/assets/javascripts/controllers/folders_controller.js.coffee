class Bitbox.FoldersController extends Ember.ArrayController
  newFolder: ->
    $('<div id="new_folder" class="reveal-modal"></div>')
      .foundation 'reveal', 'open'
