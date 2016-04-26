class UsgroupsController < ApplicationController
  before_action :set_usgroup, only: [:show, :edit, :update, :destroy]

  # GET /usgroups
  # GET /usgroups.json
  def index
    @usgroups = Usgroup.all
  end

  # GET /usgroups/1
  # GET /usgroups/1.json
  def show
  end

  # GET /usgroups/new
  def new
    @usgroup = Usgroup.new
  end

  # GET /usgroups/1/edit
  def edit
  end

  # POST /usgroups
  # POST /usgroups.json
  def create
    @usgroup = Usgroup.new(usgroup_params)

    respond_to do |format|
      if @usgroup.save
        format.html { redirect_to controller: 'groups', notice: 'Usgroup was successfully created.' }
       # format.json { render :show, status: :created, location: @usgroup }
      else
        format.html { render :new }
        format.json { render json: @usgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usgroups/1
  # PATCH/PUT /usgroups/1.json
  def update
    respond_to do |format|
      if @usgroup.update(usgroup_params)
        format.html { redirect_to @usgroup, notice: 'Usgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @usgroup }
      else
        format.html { render :edit }
        format.json { render json: @usgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usgroups/1
  # DELETE /usgroups/1.json
  def destroy
    @usgroup.destroy
    respond_to do |format|
      format.html { redirect_to usgroups_url, notice: 'Usgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usgroup
      @usgroup = Usgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usgroup_params
      params.require(:usgroup).permit(:user_id, :group_id)
    end
end
