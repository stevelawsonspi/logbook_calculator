class LogbookEntry < ApplicationRecord
  #TODO - Prob lem saving from logbook_page with this... belongs_to :logbook_page
  
  after_initialize :init
  before_validation :zero_nil_times


  def init
    puts "SLSLSL in LogbookEntry#init, new_record?=#{new_record?}, logbook_page_id=#{logbook_page_id}"
  end

  def zero_nil_times
    self.day_hours     = 0 unless day_hours
    self.day_minutes   = 0 unless day_minutes
    self.night_hours   = 0 unless night_hours
    self.night_minutes = 0 unless night_minutes
  end
end
