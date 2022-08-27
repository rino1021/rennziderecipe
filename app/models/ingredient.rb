class Ingredient < ApplicationRecord
  belongs_to :post_image
  attr_accessor :name
end
