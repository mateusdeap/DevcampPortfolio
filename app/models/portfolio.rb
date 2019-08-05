class Portfolio < ApplicationRecord
  validates_presnece_of :title, :body, :main_image, :thumb_image
end
