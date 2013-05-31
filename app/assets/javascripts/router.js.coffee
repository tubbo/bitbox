Bitbox.Router.map ->
  @resources 'folders', ->
    @resources 'entities'

# Use pushState to describe routing changes in the URL.
Bitbox.Router.reopen location: 'history'
