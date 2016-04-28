class WelcomeController < ApplicationController
  
 before_action :authenticate_user!

def index 
 
   @orders = Order.where(:user_id => current_user.id).limit(5).order(id: :desc)
   @friends  = current_user.friendships

end 



 

end
