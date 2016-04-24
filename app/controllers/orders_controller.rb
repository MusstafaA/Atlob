class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /orders
  # GET /orders.json

 
  def index
      
     @orders = Order.where(:user_id => current_user.id).paginate(:page => params[:page],  :per_page => 3)
     

  end

  # GET /orders/1
  # GET /orders/1.json
   def show
       
   end

  # GET /orders/new
  
  def new
  
 
   
     @groups =Group.where(:user_id => current_user.id).as_json
     @order = Order.new
     @friends= current_user.friendships  
     @t=[]
     @i=0
     @friends.each  do |friend|
     
         @t[@i]=User.where(:id => friend.friend_id)
         @i=@i+1
  

    end
  
   
 end

  # GET /orders/1/edit
  
 def edit

     @order = Order.find(params[:id])

     @order['status']='finished'
     
     if @order.save 

         redirect_to orders_url
     else
         redirect_to orders_url
               
      end
  end

  # POST /orders
  # POST /orders.json

  def create
    
    @groups =Group.where(:user_id => current_user.id).as_json
    @friends= current_user.friendships  
    @t=[]
    @i=0
    @friends.each  do |friend|
     
         @t[@i]=User.where(:id => friend.friend_id)
         @i=@i+1
  

    end
    
    @order = Order.new(order_params)
    @order['status']='waiting'
     @order['res_name']= @order['res_name'].strip 
    @inf=@order['infriends']
    @ing=@order['ingroups']
     
      
       

    respond_to do |format|
      
       if @order.save
            
             
               if params.has_key?(:infriends)
          
            params.require(:infriends).each  do |f|
            
                 @invited=Invited.new(:order_id => @order['id'],:user_id => f)
          
                 @invited.save
             
                end
           
           end
            
           if params.has_key?(:ingroups)

            params.require(:ingroups).each  do |g|
                 
                 @g=Group.find(g)

                 @invitedgroupfriends =@g.usgroups

                 @invitedgroupfriends.each do |friend|
                          
                     #@testinvited=Invited.where(:order_id => @order['id']).where(:user_id => friend.user_id).present?                     
                      
                           if Invited.where(:order_id => @order['id']).where(:user_id => friend.user_id).blank?    
             
                                 @invited=Invited.new(:order_id => @order['id'],:user_id => friend.user_id)
                       
                                 @invited.save
                                   
                           end

                 end
            end 

            end

               
          @inviteds=Invited.find_by order_id:@order['id']

          @inviteds.each do |invited| 
          @inviteduser=User.find_by id: invited.user_id
          Notification.create(recipient: @inviteduser, actor: current_user, action: "invited", notifiable: @order )
        end     
      
          format.html { redirect_to orders_url , notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      
       else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
     
    @order.destroy

    respond_to do |format|
 
      format.html { redirect_to '/orders', notice: 'Order was successfully destroyed.' }

      format.json { head :no_content }
 
   end
  
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:for, :res_name, :avatar, :user_id ,:ingroups ,:infriends ,:page)
    end
end