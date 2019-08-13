class Portfolio < ApplicationRecord
  include Placeholder

  scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular_items, -> { where(subtitle: 'Angular') }

  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
  end
end
