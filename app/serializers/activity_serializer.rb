class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :point_value, :category, :audible, :energy_type
  has_one :user
end
