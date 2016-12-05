class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :get_stats
  
  private
  def get_stats
    valid_imports = VoterRecordImport.valid_file
    @count = valid_imports.count
    @record_count = valid_imports.sum(:record_count)
    unique_states = valid_imports.pluck(:state_abbr).uniq
    @unique_state_count = unique_states.size
    
  end
  
end
