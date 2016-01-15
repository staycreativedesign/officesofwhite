class FirstStepsController < ApplicationController
  before_action :authenticate_user!
  def new
    @step_one = current_user.first_steps.new
  end

  def create
  end

  private

  def step_one_params
    params.require(:first_step).permit!
  end
end
