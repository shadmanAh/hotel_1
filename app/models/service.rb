class Service < ApplicationRecord
    validates :title, :description, :icon, presence: true
end
