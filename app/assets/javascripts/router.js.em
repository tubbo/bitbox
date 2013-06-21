Bitbox.Router.map ->
  @route 'folders', path: '/'
  @resource 'folders', ->
    @route 'new'

# Use pushState to describe routing changes in the URL.
Bitbox.Router.reopen location: 'history'

class Bitbox.Router.FoldersRoute extends Ember.Route
  model: -> Bitbox.Folder.find()
