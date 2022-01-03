module RoomsHelper

    def review_button(room)
        user_room = room.enrollments.where(user: current_user)
        if current_user
            if user_room.any?
                if user_room.pending_review.any?
                    link_to 'Add a review', edit_enrollment_path(user_room.first)
                else 
                    link_to 'Review', enrollment_path(user_room.first)
                end
            end
        end
    end


    def reserve_button(room)
        user_room = room.reserves.where(user: current_user)
        if current_user
            if room.reserves.where(user: current_user).any?
                
                link_to "For more convenience Complete your information.", edit_reserf_path(user_room.first), class: "btn btn-md btn-danger"
            else
                link_to "Book #{number_to_currency(room.price)} Per night ", new_room_reserf_path(room), class: "btn btn-md btn-success"
            end
        end
    end

end
