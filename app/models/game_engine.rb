class GameEngine < ApplicationRecord
    has_and_belongs_to_many :games
end