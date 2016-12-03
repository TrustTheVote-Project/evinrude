require 'csv'
class VoterRecordImport < ApplicationRecord
  
  scope :valid_file, -> { where(valid_file: true) }
  
  attr_accessor :voter_record_csv
  
  validates_presence_of :voter_record_csv, :state_abbr
  
  def voter_record_csv=(file)
    @voter_record_csv = file
    self.filename = file.original_filename
    @voter_registrations = []
    rows = CSV.parse(file.read, headers: true)
    self.record_count = rows.size
    # Ensure valid headers
    if valid_headers?(rows.first)
      self.valid_file = true
      # @voter_registrations = []
      # rows.each_with_index do |r, i|
      #   v = VoterRegistration.new
      #   v.first_name = r["FirstName"]
      #   v.last_name = r["LastName"]
      #   v.ssn = r["ssn"]
      #   v.date_of_birth = r["DateofBirth"]
      #   v.phone = r["Phone"]
      #   v.race = r["Race"]
      #   v.sex = r["Sex"]
      #   v.party = r["Party"]
      #   v.voter_id_type = r["VoterIDtype"]
      #   v.voter_id_value = r["VoterIDvalue"]
      #   v.registration_address = r["RegistrationAddress"]
      #   v.precinct_id = @precinct_hash[r["Precinct"]]
      #   @voter_registrations << v
      # end
      # save_voter_regs
    else
      self.valid_file = false
    end
  rescue Exception=>e
    errors.add(:voter_record_csv, "File can not be read. Please upload a valid CSV file.")
  end
  
  def valid_headers?(row)
    !row["FirstName"].nil? && !row["LastName"].nil? && !row["RegistrationAddress"].nil?
  end
  
  # TODO: don't actual save any voter records in the demo system
  # def save_voter_regs
  #   i = 0
  #   total = @voter_registrations.size
  #   @voter_registrations.in_groups_of(grp_size, false) do |group|
  #     Rails.logger.info "Importing VR #{i * grp_size} - #{(i+1)*grp_size} of #{total}"
  #     VoterRegistration.import(group)
  #     i+=1
  #   end
  # end
  
end
