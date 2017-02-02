class ReviewsController < ApplicationController
  before_action :set_center
  before_action :authenticate_user!

  def new
    @review = Review.new(center: @center)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.center = @center
    @review.save
    set_ratings
    redirect_to @center
  end


  private

    def set_ratings
      if params[:review][:rater].present?
        params[:review][:rater].each do |k, v|
          @center.rate(v[:score], current_user, v[:dimension])
          rate = @center.rating_for(k, current_user)
          rate.update_attributes(review_id: @review.id)
        end
      end
    end

    def set_center
      @center = Center.friendly.find(params[:center_id])      
    end

    def review_params
      params.require(:review).permit(:comment, :rating)
    end

end