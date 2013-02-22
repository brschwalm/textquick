class DashboardController < ApplicationController

  before_filter :validate_authenticated

  def index

    respond_to do |format|
      format.html #index.html.erb
    end

  end

  def not_authorized

    respond_to do |format|
      format.html #not_authorized.html.erb
    end
  end

end
