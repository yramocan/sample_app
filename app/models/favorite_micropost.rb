class FavoriteMicropost < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
end
