class CentersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def index
    #visitor_latitude = request.location.latitude
    #visitor_longitude = request.location.longitude
    visitor_latitude = 55.7908659
    visitor_longitude = 12.0820051

    @centers = Center.all.near([visitor_latitude, visitor_longitude], 30)
    @massage_centers = Center.where(category_id: 4).near([visitor_latitude, visitor_longitude], 30)
    @yoga_centers = Center.where(category_id: 6).near([visitor_latitude, visitor_longitude], 30)
    @coaching_centers = Center.where(category_id: 2).near([visitor_latitude, visitor_longitude], 30)
    @categories = Category.all
    @countries = Country.all
    @tag = Tag.where name: params[:name]
  end

  def new
    @center = Center.new
    @categories = Category.all
    @countries = Country.all
  end

  def create
    @center = Center.new(center_params)

    if @center.save
      parse_center_attachment_params
      redirect_to @center
    else
      flash[:danger] = @center.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @center = Center.friendly.find(params[:id])
    @center_attachments = @center.center_attachments.all
    @reviews = Review.where(center_id: @center)
    @review = Review.new
    @category = Category.where name: params[:name]
    @country = Country.where name: params[:name]
    @tag = Tag.where name: params[:name]
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = 0 #@reviews.average(:rating).round(2)
    end
  end

  def search
    if params[:category].blank?
      @centers = Center.order("review_last_created_at desc")
    else
      @centers = Center.search(params).order("review_last_created_at desc")
    end
  end

  def edit
    @center = Center.friendly.find(params[:id])
    @tags = Tag.all
  end

  def update
    @center = Center.friendly.find(params[:id])
    if @center.update_attributes(center_params)
      parse_center_attachment_params
      redirect_to @center
    else
      render :edit
    end
  end

  def destroy
    @center = Center.friendly.find(params[:id])
    @center.destroy
    redirect_to root_path
  end

  def from_tag
      @selected = Center.where(:tag_id => params[:tag_id])
      respond_to do |format|
          format.js
      end
  end

  private

  def parse_center_attachment_params
    if params[:center].present? && params[:center][:center_attachment_ids].first.present?
      @center.center_attachments << CenterAttachment.where(id: params[:center][:center_attachment_ids].first.split(","))
    end
  end

  def center_params
    params.require(:center).permit(:name, :description, :address1, :address2, :category_id, :country_id,
                                   :city, :postnummer, :telefon, :email, :image, :title, center_attachments_attributes: [:id, :_destroy], tag_ids: [])
  end

  def is_admin?
    if !current_user.try(:admin?)
      flash[:danger] = "You are not authorized to edit or delete."
      redirect_to root_path
    end
  end

end