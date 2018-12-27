## Design for Log Book Calculator

### Table: User
id
email
pwd

### Table: Log Book
id
name

rails g scaffold Logbook name:string 

### Table: Log Book Page
id
book_id
page_number

rails g model LogbookPage logbook:references page_number:integer

### Table: Log Book Entry
id
log_book_page_id
day_minutes
night_minutes

rails g model LogbookEntry logbook_page:references day_minutes:integer night_minutes:integer





