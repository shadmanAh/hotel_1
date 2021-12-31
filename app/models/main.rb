class Main < ApplicationRecord
    validates :first_title, :first_description, :second_title, :second_description, presence: true

    has_one_attached :avatar
end
