class Cat < ActiveRecord::Base
  validates :name, :birth_date, :color, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(gray orange black white calico turtoise_shell brown) }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests, dependent: :destroy
end
