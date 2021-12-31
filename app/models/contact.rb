class Contact < ApplicationRecord
    validates :title, :description, :address, :phone, :email, :websit, presence: true
end
