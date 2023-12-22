class FinesController < ApplicationController
  before_action :set_borrower, only: [:get_fine, :pay_fine]

  def get_fine
    fine_amount = @borrower.fines.sum(:amount)
    render json: { fine_amount: fine_amount }
  end

  def pay_fine
    fine_amount = @borrower.fines.sum(:amount)
    
    if fine_amount > 0
      @borrower.fines.destroy_all
      render json: { message: 'Fines paid successfully' }
    else
      render json: { message: 'No fines to pay' }, status: :unprocessable_entity
    end
  end

  private

  def set_borrower
    @borrower = Borrower.find(params[:borrower_id])
  end
end
