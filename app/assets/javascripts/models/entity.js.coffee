class Bitbox.Entity extends DS.Model
  name: DS.attr 'string'
  folder: DS.belongsTo 'folder'
