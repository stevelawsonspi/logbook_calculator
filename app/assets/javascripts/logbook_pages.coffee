$ ->
  setupTimeCalcButtons = ->
    $('button.calc_day_button').click (event) ->
      start_time = $(event.target).closest('tr').find('.day_start_time').val()
      end_time   = $(event.target).closest('tr').find('.day_end_time'  ).val()
      hours_minutes = calc_hours_minutes(start_time, end_time)
      $(event.target).closest('tr').find('.day_hours'  ).val(hours_minutes.hours)
      $(event.target).closest('tr').find('.day_minutes').val(hours_minutes.minutes)
      return

    $('button.calc_night_button').click (event) ->
      start_time = $(event.target).closest('tr').find('.night_start_time').val()
      end_time   = $(event.target).closest('tr').find('.night_end_time'  ).val()
      hours_minutes = calc_hours_minutes(start_time, end_time)
      $(event.target).closest('tr').find('.night_hours'  ).val(hours_minutes.hours)
      $(event.target).closest('tr').find('.night_minutes').val(hours_minutes.minutes)
      return

  calc_hours_minutes = (start_time, end_time) ->
    dateTimeStart = new Date("01/01/2007 " + start_time)
    dateTimeEnd   = new Date("01/01/2007 " + end_time)
    # Assume it went into the next day if end time is less than start time
    if dateTimeEnd < dateTimeStart
      dateTimeEnd.setDate(dateTimeEnd.getDate() + 1)
    totalMinutes = (dateTimeEnd - dateTimeStart) / 60 / 1000
    hours   = Math.floor(totalMinutes / 60)
    minutes = totalMinutes - (hours * 60)
    return { hours: hours, minutes: minutes }
  
  $(window).on('turbolinks:load', setupTimeCalcButtons)
  return