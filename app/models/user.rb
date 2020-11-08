class User < ApplicationRecord
    has_many :activities, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :logged_activities, through: :logs, source: :activity
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
