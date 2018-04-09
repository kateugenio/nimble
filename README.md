# README

## Overview

A powerful yet easy-to-use Agile Lifecycle Management web app, specifically for Scrum development.

## Setup

### Environment Requirements
* Ruby 2.4.1
* Rails 5.1.5
* PostgreSQL 10.3
```
git clone https://github.com/kateugenio/nimble
cd nimble
bundle install
rails db:setup
```


## Development

### Run Tests
```
bundle exec rake test
```

### Mailer Account

Set your mailer username and password as environment variables to enable registration and forgot password emails
"MAILER_USERNAME" & "MAILER_PASSWORD"

### Local Server

To start the local server:
```
bundle exec rails server -b 0.0.0.0 -p 3000
````
From your browser, head to locahost:3000