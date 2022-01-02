class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[ show edit update destroy ]
  before_action :set_room, only: [:new, :create]

  def index
    # @reserves = Reserf.all
    @pagy, @reserves = pagy(Reserf.all)
  end

  def show
  end

  def new
    @reserf = Reserf.new
  end

  def edit
  end

  def create
    
    @reserve = current_user.book_room(@room)
    redirect_to room_path(@room), notice: "You Booked!"
  end

  def update
    respond_to do |format|
      if @reserf.update(reserf_params)
        format.html { redirect_to reserf_url(@reserf), notice: "Reserf was successfully updated." }
        format.json { render :show, status: :ok, location: @reserf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reserf.destroy

    respond_to do |format|
      format.html { redirect_to reserves_url, notice: "Reserf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_room
      @room = Room.friendly.find(params[:room_id])
    end

    def set_reserf
      @reserf = Reserf.find(params[:id])
    end

    def reserf_params
      params.require(:reserf).permit(:first_name, :last_name, :check_in, :check_out, :adults, :children, :phone_num)
    end
end
