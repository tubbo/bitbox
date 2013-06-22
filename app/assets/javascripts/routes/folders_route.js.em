class Bitbox.FoldersRoute extends Ember.Route
  model: -> Bitbox.Folder.find()
