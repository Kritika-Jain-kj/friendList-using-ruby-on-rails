class FrndsController < ApplicationController
  before_action :set_frnd, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /frnds or /frnds.json
  def index
    @frnds = Frnd.all
  end

  # GET /frnds/1 or /frnds/1.json
  def show
  end

  # GET /frnds/new
  def new
    @frnd = current_user.frnds.build
  end

  # GET /frnds/1/edit
  def edit
  end
  
  # POST /frnds or /frnds.json
  def create
    @frnd = current_user.frnds.build(frnds_param)

    respond_to do |format|
      if @frnd.save
        format.html { redirect_to frnd_url(@frnd), notice: "Frnd was successfully created." }
        format.json { render :show, status: :created, location: @frnd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @frnd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frnds/1 or /frnds/1.json
  def update
    respond_to do |format|
      if @frnd.update(frnd_params)
        format.html { redirect_to frnd_url(@frnd), notice: "Frnd was successfully updated." }
        format.json { render :show, status: :ok, location: @frnd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @frnd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frnds/1 or /frnds/1.json
  def destroy
    @frnd.destroy
    respond_to do |format|
      format.html { redirect_to frnd_url, notice: "Frnd was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @frnd = current_user.frnds.find_by(id: params[:id])
    redirect_to frnds_path, notice: "Not Authorized" if @frnd.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frnd
      @frnd = Frnd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def frnd_params
      params.require(:frnd).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
