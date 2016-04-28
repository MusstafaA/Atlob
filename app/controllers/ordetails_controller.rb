class OrdetailsController < ApplicationController
  before_action :set_ordetail, only: [:show, :edit, :update, :destroy]

  # GET /ordetails
  # GET /ordetails.json
  def index
    @ordetails = Ordetail.all
  end

  # GET /ordetails/1
  # GET /ordetails/1.json
  def show
  end

  # GET /ordetails/new
  def new
    @ordetail = Ordetail.new(order_id: params[:order_id])
    @ordered_list = Ordetail.where(order_id: params[:order_id] , :user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /ordetails/1/edit
  def edit
  end

  # POST /ordetails
  # POST /ordetails.json
  def create
    @ordetail = Ordetail.new(ordetail_params)
    #@ordetail['order_id']= params[:order_id] 
    @ordetail['user_id']= current_user.id

    respond_to do |format|
      if @ordetail.save
          format.html { redirect_to action: "new", order_id: @ordetail['order_id'] }
        # format.html { redirect_to @ordetail, notice: 'Ordetail was successfully created.' }
        # format.json { render :show, status: :created, location: @ordetail }
      else
        format.html { render :new }
        format.json { render json: @ordetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordetails/1
  # PATCH/PUT /ordetails/1.json
  def update
    respond_to do |format|
      if @ordetail.update(ordetail_params)
        format.html { redirect_to action: "new", order_id: @ordetail['order_id'] }
        # format.html { redirect_to @ordetail, notice: 'Ordetail was successfully updated.' }
        # format.json { render :show, status: :ok, location: @ordetail }
      else
        format.html { render :edit }
        format.json { render json: @ordetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordetails/1
  # DELETE /ordetails/1.json
  def destroy
    @ordetail.destroy
    respond_to do |format|
      format.html { redirect_to action: "new", order_id: @ordetail['order_id'] }
      # format.html { redirect_to ordetails_url, notice: 'Ordetail was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end



  def join
    @actor=User.find_by id: params[:user_id]
    @orderCreator=User.find_by id: params[:creator_id]
    @order=Order.find_by id: params[:order_id]

    if Ordetail.where(user_id: params[:user_id] , order_id: params[:order_id]).blank?
    # no  record for this id
    Ordetail.create(user_id: params[:user_id] , order_id: params[:order_id])
      Notification.create(recipient: @orderCreator, actor: @actor, action: "joined", notifiable: @order )
    else
      # at least 1 record for this id
    end

    # respond_to do |format|
    #   format.html { redirect_to action: "new", order_id: params[:order_id] }
    # end
 
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordetail
      @ordetail = Ordetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordetail_params

      params.require(:ordetail).permit(:item, :price, :amount, :comment, :user_id, :order_id)

    end
end
