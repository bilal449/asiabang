class PagesController < ApplicationController

  def about_us
  end

  def contact_us
  end

  def massage
    @massage_centers = Center.where(category_id: 4)
  end

  def yoga
    @yoga_centers = Center.where(category_id: 6)
  end

  def coaching
    @coaching_centers = Center.where(category_id: 2)
  end

  def tagsadmin
    @tags = Tag.all.order(:id)
  end

end
