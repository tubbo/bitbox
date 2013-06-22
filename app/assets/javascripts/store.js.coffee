Bitbox.Store = DS.Store.extend
  revision: 13
  adapter: DS.RESTAdapter.create()

DS.RESTAdapter.configure 'plurals', \
  folder: 'folders'
  entity: 'entities'
