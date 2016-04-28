class NotificationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@notifications = Notification.where(recipient: current_user).unread 

		@all_notfications= Notification.where(recipient: current_user).paginate(:page => params[:page], :per_page => 5)
	
	end

	def mark_as_read
		@notifications = Notification.where(recipient: current_user).unread 
		@notifications.update_all(read_at: Time.zone.now) 
		render json: {success: true}
	end



end	