## Design (and notes) for Log Book Calculator

### Table: User
id
email
pwd

### Table: Logbook
id
name
start_day_hours
start_day_minutes
start_night_hours
start_night_minutes

rails g scaffold Logbook name:string 
rails generate migration AddStartHoursToLogbooks


### Table: Logbook Page
id
book_id
page_number

rails g scaffold LogbookPage logbook:references page_number:integer

### Table: Logbook Entry
id
logbook_page_id
day_hours
day_minutes
night_hours
night_minutes

rails g scaffold LogbookEntry logbook_page:references day_minutes:integer night_minutes:integer
generate migration AddHoursToLogbookEntries




