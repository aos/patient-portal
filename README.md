# Patient Portal Mockup 

A simple mockup of a patient portal.

## Stack
**Front-end**: Vanilla HTML/JS with Bootstrap

**Back-end**: Ruby on Rails, SQLite3

## Local testing
To test locally (assuming a working Rails dev environment):
1. Clone repository locally, and `cd` into it using terminal
2. Install dependencies: `bundle install` 
3. Migrate database: `rails db:migrate`
4. Seed database: `rails db:seed`
5. Start server: `rails server`
6. Navigate browser to: `localhost:3000`

## API
The `appointments` API is assigned per `patient`. Thus, it is necessary to first hit `/api/patients`, grab desired patient `id`, then grab all appointments via: `/api/:patient_id/appointments`