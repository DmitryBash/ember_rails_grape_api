class ListsEntity < Grape::Entity
  root 'lists', 'list'
  expose :id, :message, :status
end
