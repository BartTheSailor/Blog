class Article < ApplicationRecord
  has_many :comments

  validates :title, :text, presence: true
end
