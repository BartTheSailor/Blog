class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  before_validation :strip_html_tags if: :text
  before_save :boldmarkdown 

  validates :title, :text, :author, presence: true

  private

  def strip_html_tags
    self.text.gsub!(/<[^>]*>/,'') 
  end

  def bold_markdown
    text.gsub!(/\*(.+?)\*/, '<b>\1/</b>')
  end

end
