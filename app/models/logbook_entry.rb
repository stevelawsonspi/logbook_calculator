class LogbookEntry < ApplicationRecord
  #TODO - Probalem saving from logbook_page with this... belongs_to :logbook_page
  
  before_validation :zero_nil_times
  
  def zero_nil_times
    self.day_hours     = 0 unless day_hours
    self.day_minutes   = 0 unless day_minutes
    self.night_hours   = 0 unless night_hours
    self.night_minutes = 0 unless night_minutes
  end
end
