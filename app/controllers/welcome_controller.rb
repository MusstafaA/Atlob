class WelcomeController < ApplicationController

def index 
 
    if current_user == nil
    
       redirect_to '/users/sign_in'
    else
    	@all_notfications= Notification.where(recipient: current_user)
    end 

    

end 


end
