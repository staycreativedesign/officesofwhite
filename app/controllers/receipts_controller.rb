class ReceiptsController < ApplicationController

  def index
    @receipts = current_user.receipts
  end
end
