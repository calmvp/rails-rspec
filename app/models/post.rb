class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title # :slugelize_title

  validates_presence_of :title, :content

  private
  # def slugelize_title
  #   string = title.downcase.gsub(/ /, '-')
  #   self.slug = string.(/[?.!]/, '')
  # end

  def titleize_title
    self.title = title.titleize
  end
end
