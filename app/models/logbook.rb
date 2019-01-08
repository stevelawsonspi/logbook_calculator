class Logbook < ApplicationRecord
  has_many :logbook_pages

  before_validation :zero_nil_times

  def zero_nil_times
    self.start_day_hours     = 0 unless start_day_hours
    self.start_day_minutes   = 0 unless start_day_minutes
    self.start_night_hours   = 0 unless start_night_hours
    self.start_night_minutes = 0 unless start_night_minutes
  end
end
