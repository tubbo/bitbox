Bitbox.Router.map ->
  @route 'folders', path: '/'
  @resource 'folders'

# Use pushState to describe routing changes in the URL.
Bitbox.Router.reopen location: 'history'
