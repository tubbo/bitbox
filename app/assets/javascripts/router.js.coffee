Bitbox.Router.map ->
  @route 'folders', path: '/'

# Use pushState to describe routing changes in the URL.
Bitbox.Router.reopen location: 'history'
