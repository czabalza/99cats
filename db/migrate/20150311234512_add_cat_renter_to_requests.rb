class AddCatRenterToRequests < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :renter_id, :integer, default: 0, null: false, index: true
  end
end
