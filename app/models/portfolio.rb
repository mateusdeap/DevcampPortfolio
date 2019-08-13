class Portfolio < ApplicationRecord
  scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular_items, -> { where(subtitle: 'Angular') }

  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'https://via.placeholder.com/600x400'
    self.thumb_image ||= 'https://via.placeholder.com/350x200'
  end
end
