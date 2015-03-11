class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}

  belongs_to :cat

  def overlapping_requests
    # byebug
    CatRentalRequest.find_by_sql([<<-SQL, {cat_id: cat_id, start_date: start_date, end_date: end_date, id: id}])
    SELECT
      *
    FROM
      cat_rental_requests
    WHERE
      id != :id AND cat_id = :cat_id AND (start_date BETWEEN :start_date AND :end_date
      OR end_date BETWEEN :start_date AND :end_date)
    SQL
  end

  def overlapping_approved_requests
    overlapping_requests.select do |request|
      request.status == 'APPROVED'
    end
  end
end
