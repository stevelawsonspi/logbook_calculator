class LogbookPage < ApplicationRecord
  belongs_to :logbook
  has_many   :logbook_entries, dependent: :destroy
  accepts_nested_attributes_for :logbook_entries
  
  after_find :set_deriver
  
  scope :latest_page_first, -> { order(page_number: :desc) }
  scope :for_logbook,       -> (logbook_id) { where(logbook_id: logbook_id) }
  scope :pages_up_to,       -> (logbook_id, page_number) { where("logbook_id = ? AND page_number <= ?", logbook_id, page_number) }
  
  def self.default_new_page_number
    latest_page = latest_page_first.first
    latest_page ? latest_page.page_number + 2 : 43
  end
  
  def set_deriver
    @logbook_page_deriver ||= LogbookPageDeriver.new(self)
  end
  
  delegate :day_hours,       :day_minutes,       :night_hours,       :night_minutes, 
           :total_day_hours, :total_day_minutes, :total_night_hours, :total_night_minutes,
           :total_hours,     :total_minutes, 
           to: :@logbook_page_deriver
  
end
