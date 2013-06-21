class Bitbox.FoldersController extends Ember.ArrayController
  itemController: 'folder'
  needs: ['modal_dialog']
  reveal: (content) ->
    @content = content
    @showModal = true
