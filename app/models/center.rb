class Center < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged 
  # attr_accessor :slug
  has_many :reviews
  belongs_to :category
  belongs_to :country
  has_many :taggings
  has_many :tags, through: :taggings
  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :city
  validates_presence_of :postnummer
  validates_presence_of :address1
  validates_presence_of :tags
  has_many :center_attachments
  accepts_nested_attributes_for :center_attachments, reject_if: :all_blank, allow_destroy: true
  ratyrate_rateable "service", "price", "attractiveness"

  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def rating_for(dimension, user)
    self.rates(dimension).find_by(rater_id: user, review_id: nil)
  end

  def service_avg
    self.average('service').try(:avg)
  end

  def price_avg
    self.average('price').try(:avg)
  end

  def attractiveness_avg
    self.average('attractiveness').try(:avg)
  end

  def overall_avg
    ((service_avg || 0) + (price_avg || 0) + (attractiveness_avg || 0))/3.0
  end

  def review_exists?(user)
    reviews.where(user_id: user).present?
  end

  def full_address
    [address1, address2, city, postnummer].join(', ')
  end

  def self.search(params)
    centers = Center.where(category_id: params[:category].to_i)
    centers = centers.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    centers = centers.near(params[:location], 20) if params[:location].present?
    centers
  end

end