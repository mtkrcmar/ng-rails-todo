class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :due, :completed
end