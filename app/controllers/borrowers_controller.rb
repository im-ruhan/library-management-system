class BorrowersController < ApplicationController
    def create
      borrower = Borrower.find_or_initialize_by(borrower_params)
      borrower.library_id = params[:library_id]

      if @borrower.save
        render json: BorrowerSerializer.new(borrower), status: :created
      else
        render json: borrower.errors, status: :unprocessable_entity
      end
    end
    
    private
    
    def borrower_params
      params.require(:borrower).permit(:name, :credit_card)
    end
end
