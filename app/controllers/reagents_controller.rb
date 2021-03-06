class ReagentsController < ApplicationController
  before_action :set_reagent, only: [:show, :edit, :update, :destroy, :clone]
  before_action :set_lab, only: [:new, :create]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index  
    if params[:search].present?      
      if params[:user_id].present?
        @user = User.find(params[:user_id])
        authorize @user, :own_items?
        @reagents = @user.reagents
                         .text_search(params[:search])
                         .modified_recently
                         .page(params[:page])
                         .per(12)
      elsif params[:lab_id].present?
        @lab = Lab.find(params[:lab_id])
        authorize @lab, :own_items?
        @reagents = @lab.reagents
                        .text_search(params[:search])
                        .modified_recently
                        .page(params[:page])
                        .per(12)
      end
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      authorize @user, :own_items?
      @reagents = @user.reagents
                       .order(reagent_sort_column + ' ' + reagent_sort_direction)
                       .modified_recently
                       .page(params[:page])
                       .per(12)
    elsif params[:lab_id].present?
      @lab = Lab.find(params[:lab_id])
      authorize @lab, :own_items?
      @reagents = @lab.reagents
                      .order(reagent_sort_column + ' ' + reagent_sort_direction)
                      .modified_recently
                      .page(params[:page])
                      .per(12)
    end
  end

  def show
    authorize @reagent
    @activities = PublicActivity::Activity.includes(:trackable, :owner)
                                          .where(trackable_id: params[:id])
                                          .where(trackable_type: "Reagent")
                                          .group("activities.id")
                                          .page(params[:page])
                                          .per(7)
                                          .reverse_order
  end

  def new
    @reagent = Reagent.new
    authorize @lab, :own_items?
  end

  def edit
    @reagent = Reagent.find(params[:id])
    authorize @reagent
  end

  def create
    @reagent = @lab.reagents.new(reagent_params)
    authorize @lab, :own_item?
    respond_to do |format|
      if @reagent.save
        @reagent.create_activity :create, owner: current_user
        ItemBackgroundWorker.perform_async("reagent", @reagent.id, 'created', current_user.id)
        format.html { redirect_to @reagent }
        format.json { render action: 'show', status: :created, location: @reagent }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @reagent.errors, status: :unprocessable_entity }
      end
    end
  end

  def clone
    authorize @reagent
    @clone = @reagent.amoeba_dup
    respond_to do |format|
      if @clone.save
        @clone.create_activity :clone, owner: current_user
        ItemBackgroundWorker.perform_async("reagent", @reagent.id, 'cloned', current_user.id)
        format.html { redirect_to @clone, notice: "#{ @clone.fullname } was successfully cloned." }
        format.json { render action: 'show', status: :created, location: @clone }
      else
        format.html { render action: 'show', error: "There was a problem cloning this reagent" }
        format.json { render json: @clone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @reagent
    respond_to do |format|
      if @reagent.update(reagent_params)
        @reagent.create_activity :update, owner: current_user
        format.html { redirect_to @reagent }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reagent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @reagent
    send_destroy_comment(@reagent, 'removed')
    @lab = @reagent.lab
    @reagent.create_activity :delete, owner: current_user
    @reagent.destroy
    respond_to do |format|
      format.html { redirect_to lab_reagents_url(@lab) }
      format.json { head :no_content }
      format.js
    end
  end

  private
    def reagent_sort_column
      Reagent.column_names.include?(params[:sort]) ? params[:sort] : 'updated_at'
    end
    helper_method :reagent_sort_column
    
    def reagent_sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : 'desc'
    end
    helper_method :reagent_sort_direction

    def set_reagent
      @reagent = Reagent.find(params[:id])
    end

    def set_lab
      @lab = Lab.find(params[:lab_id])   
    end

    def reagent_params
      params.require(:reagent).permit(:lab_id, { :user_ids => [] }, :name, { :category_list => [] }, :location,
                                      :product_url, :purchasing_url, :serial, :price, :properties,
                                      :description, :expiration, :remaining, :tag_list,
                                      :quantity, :lot_number, :uid, :shared, :currency, :description, 
                                      :pdf, :delete_pdf, :pdf_remote_url,
                                      :icon, :delete_icon, :icon_remote_url)
    end
end
