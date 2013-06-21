class Bitbox.FoldersRoute extends Ember.Route
  model: -> Bitbox.Folder.find()
  events:
    newFolder: (content, controller) ->
      controller.content = content
      controller.showModal = true
