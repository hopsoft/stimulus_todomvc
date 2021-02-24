
class TodoSerializer < ActiveModel::Serializer
    attributes :id, :session_id, :title, :completed, :created_at, :updated_at
 end