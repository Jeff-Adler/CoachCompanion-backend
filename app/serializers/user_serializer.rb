class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :weekly_goal, :longest_run
end
