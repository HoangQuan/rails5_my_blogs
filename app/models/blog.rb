class Blog < ApplicationRecord
  UPDATEABLE_ATTRS = [:user_id, :content, :title]

  before_save :make_slug

  validates :title, presence: true

  def make_slug
    slug = title.split(' ').join('-')
  end
end