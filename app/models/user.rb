class User < ApplicationRecord
    has_many :activities
    has_many :logs
    # has_many :activities, through: log #need to alias and input source
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
