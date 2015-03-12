class CatRentalRequestsController < ApplicationController
  
  def new
    @request = CatRentalRequest.new
    @available_cats = Cat.all
    render :new
  end

  def index
    @all_requests = CatRentalRequest.all
    render :index
  end
  def create
    @request = CatRentalRequest.new(request_params)
    @request.renter_id = current_user.id
    @request.approve!
    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      flash.now[:errors] = @request.errors.full_messages
      render :new
    end
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:status, :start_date, :end_date, :cat_id)
  end
end
