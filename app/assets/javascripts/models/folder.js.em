class Bitbox.Folder extends DS.Model
  name: DS.attr('string')
  secret: DS.attr('string')
  entities: DS.hasMany('Bitbox.Entity')
