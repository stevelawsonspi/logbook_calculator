class LogbookPageDeriver

  def initialize(current_page)
    @current_page = current_page
  end

  [ :day_hours,       :day_minutes,       :night_hours,       :night_minutes, 
    :total_day_hours, :total_day_minutes, :total_night_hours, :total_night_minutes,
    :total_hours,     :total_minutes  ].each do |method|
    define_method method do
      set_time_values
      instance_variable_get("@#{method}")
    end
  end

  private

    def set_time_values
      return if @time_values_set

      day_total_minutes, night_total_minutes = 0,0
      LogbookPage.pages_up_to(@current_page.logbook_id, @current_page.page_number).latest_page_first.each do |page|
        page.logbook_entries.each do |entry|
          day_total_minutes   += entry.day_minutes   + (entry.day_hours   * 60)
          night_total_minutes += entry.night_minutes + (entry.night_hours * 60)
        end
        if page.page_number == @current_page.page_number # should be the first page read, so totals are just for this page
          set_current_page_totals(day_total_minutes, night_total_minutes)
        end
      end
      day_total_minutes   += (@current_page.logbook.start_day_hours   * 60) + @current_page.logbook.start_day_minutes
      night_total_minutes += (@current_page.logbook.start_night_hours * 60) + @current_page.logbook.start_night_minutes
      set_running_totals(day_total_minutes, night_total_minutes)

      @time_values_set = true
    end

    def set_current_page_totals(day_total_minutes, night_total_minutes)
      result = minutes_to_hours_and_minutes(day_total_minutes, night_total_minutes)
      @day_hours     = result[:day_hours]
      @day_minutes   = result[:day_minutes]
      @night_hours   = result[:night_hours]
      @night_minutes = result[:night_minutes]
    end

    def set_running_totals(day_total_minutes, night_total_minutes)
      result = minutes_to_hours_and_minutes(day_total_minutes, night_total_minutes)
      @total_day_hours     = result[:day_hours]
      @total_day_minutes   = result[:day_minutes]
      @total_night_hours   = result[:night_hours]
      @total_night_minutes = result[:night_minutes]
      @total_hours         = result[:total_hours]
      @total_minutes       = result[:total_minutes]
    end

    def minutes_to_hours_and_minutes(day_total_minutes, night_total_minutes)
      result = {}
      result[:day_hours]     = day_total_minutes / 60
      result[:day_minutes]   = day_total_minutes - (result[:day_hours] * 60)
      result[:night_hours]   = night_total_minutes / 60
      result[:night_minutes] = night_total_minutes - (result[:night_hours] * 60)
      result[:total_hours]   = (day_total_minutes + night_total_minutes) / 60
      result[:total_minutes] = (day_total_minutes + night_total_minutes) - (result[:total_hours] * 60)
      result
    end

end
