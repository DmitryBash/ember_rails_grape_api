`import Ember from 'ember'`

ListsIndexRoute = Ember.Route.extend
  model: -> @store.findAll('list')

`export default ListsIndexRoute`
