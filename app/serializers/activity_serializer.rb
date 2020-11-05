class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :point_value, :category, :audible, :type
  has_one :user
end
