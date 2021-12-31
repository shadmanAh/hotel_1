class Recommend < ApplicationRecord
    validates :title, :description, presence: true

    has_one_attached :avatar
end
