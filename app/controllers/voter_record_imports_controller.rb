class VoterRecordImportsController < ApplicationController
  
  def index
    get_stats
    @voter_record_import = VoterRecordImport.new
  end
  
  def create
    @voter_record_import = VoterRecordImport.new(import_params)
    if @voter_record_import.save && @voter_record_import.valid_file
      flash[:notice]= t('voter_record_import.success')
      redirect_to action: :index
    else
      if @voter_record_import.valid_file == false
        flash[:error]= t('voter_record_import.invalid_file')      
        @voter_record_import = VoterRecordImport.new
      else
        flash[:error]= t('voter_record_import.failure')      
      end
      get_stats
      render :index
    end
  end
  
  
  private
  
  def get_stats
    valid_imports = VoterRecordImport.valid_file
    @count = valid_imports.count
    @record_count = valid_imports.sum(:record_count)
    unique_states = valid_imports.pluck(:state_abbr).uniq
    @unique_state_count = unique_states.size
    
  end
  
  def import_params
    params.require(:voter_record_import).permit(:voter_record_csv, :state_abbr)
  end
  
  
end
