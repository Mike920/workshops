class Product < ActiveRecord::Base
  validates :description, :price, :title, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  belongs_to :category
  belongs_to :user
  has_many :reviews

  def average_rating
    avg=0.0
    self.reviews.each do |review|
      avg+=review.rating
    end
    avg/=reviews.count
  end
end
