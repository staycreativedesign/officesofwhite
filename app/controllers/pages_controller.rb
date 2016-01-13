class PagesController < ApplicationController
  def index
    @header = "bg-index"
  end
  def waiting_for_approval
    @header = "bg-waiting-for-approval"
  end
end
