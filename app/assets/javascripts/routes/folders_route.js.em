class Bitbox.FoldersRoute extends Ember.Route
  setupController: (controller,folder) ->
    controller.title = "All Folders"
  events:
    newFolder: (content, controller) ->
      controller.reveal content
