class Activity < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  def index 
  end
end
