class NotificationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@notifications = Notification.where(recipient: current_user).unread 

		@all_notfications= Notification.where(recipient: current_user)
	end

	def mark_as_read
		@notifications = Notification.where(recipient: current_user).unread 
		@notifications.update_all(read_at: Time.zone.now) 
		render json: {success: true}
	end

	def join
	    @actor=User.find_by id: params[:user_id]
	    @orderCreator=User.find_by id: params[:creator_id]
	    @order=Order.find_by id: params[:order_id]

	    Ordetail.create(user_id: params[:user_id] , order_id: params[:order_id])

	    Notification.create(recipient: @orderCreator, actor: @actor, action: "joined", notifiable: @order )
	    render json: {success: true}
    end

end	