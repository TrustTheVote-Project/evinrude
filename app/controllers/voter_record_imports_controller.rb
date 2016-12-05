class VoterRecordImportsController < ApplicationController
  
  def index
    @voter_record_import = VoterRecordImport.new
  end
  
  def create
    @voter_record_import = VoterRecordImport.new(import_params)
    # TODO file errors should change to mark the record as not-valid
    if !@voter_record_import.errors.any? && @voter_record_import.save && @voter_record_import.valid_file
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
  
  
  def import_params
    params.require(:voter_record_import).permit(:voter_record_csv, :state_abbr)
  end
  
  
end
