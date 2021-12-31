class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @blogs = Blog.all.limit(3)
    @rooms = Room.all.limit(3)
    @hotel_intros = HotelIntro.all.limit(3)
    @services = Service.all
    @main = Main.find(1)
    @recommend = Recommend.find(1)
  end

  def activity
    @activities = PublicActivity::Activity.all
  end
end
