class Portfolio < ApplicationRecord
  scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular_items, -> { where(subtitle: 'Angular') }

  validates_presence_of :title, :body, :main_image, :thumb_image
end
