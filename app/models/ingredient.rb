class Ingredient < ApplicationRecord
  belongs_to :post_image
  # 検索方法分岐
#   def self.looks(search, word)
#     if search == "perfect_match"
#       @ingredient = Ingredient.where("name LIKE?", "#{word}")
#     elsif search == "forward_match"
#       @ingredient = Ingredient.where("name LIKE?","#{word}%")
#     elsif search == "backward_match"
#       @ingredient = Ingredient.where("name LIKE?","%#{word}")
#     elsif search == "partial_match"
#       @ingredient = Ingredient.where("name LIKE?","%#{word}%")
#     else
#       @ingredient = Ingredient.all
#     end
#   end
end
