class ReportsController < ApplicationController
  
  def index
    flash[:notice]="Matching Completed, Reports Available"
  end
  
end
