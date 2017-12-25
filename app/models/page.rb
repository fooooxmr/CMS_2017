class Page < ApplicationRecord
  #param change
  def to_param
   slug
  end

  #set validates
  validates :title, presence: true,
      length: {maximum: 20 }
  validates :description, presence:true,
      length: {maximum: 200}
  validates :slug, presence:true,
      length: {maximum: 20},
      uniqueness: { case_sensitive: false },
            exclusion: { in: %w(new edit delete),
                         message: "%{value} is reserved." }
  validates :menu_label, presence: true,
      length: {maximum: 20},
      uniqueness: true
  validates :h1, presence: true,
      length: {maximum: 100}
  validates :content, presence: true
  validates :priority, presence: true,
      numericality: true
end
