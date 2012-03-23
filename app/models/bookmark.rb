class Bookmark < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, presence: true
end
