class Reserf < ApplicationRecord
  belongs_to :room
  belongs_to :user


  validates :user, :room, presence: true

  validates_uniqueness_of :user_id, scope: :room_id
  validates_uniqueness_of :room_id, scope: :user_id

  def to_s
    user.to_s + " " + room.to_s
  end

end
