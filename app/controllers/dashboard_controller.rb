class DashboardController < ApplicationController

  before_filter :validate_authenticated

  def index

    respond_to do |format|
      format.html #index.html.erb
    end

  end

end
