class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: [:return_books]

  def lend_books
    borrowing_params[:book_ids].each do |book_id|
      @borrowing = Borrowing.new(borrower_id: borrowing_params[:borrower_id], book_id: book_id)
      @borrowing.save
    end

    render json: { message: 'Books lent successfully' }, status: :created
  end

  def return_books
    @borrowing.update(return_date: Time.now)
    render json: { message: 'Books returned successfully' }
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find(params[:borrowing_id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:borrower_id, book_ids: [])
  end
end
