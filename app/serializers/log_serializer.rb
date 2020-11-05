class LogSerializer < ActiveModel::Serializer
  attributes :id, :timestamp
  has_one :user
  has_one :activity
end
