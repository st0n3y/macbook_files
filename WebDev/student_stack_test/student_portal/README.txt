===============
To set up React
===============

Template: week10 -> day1 -> react_intro -> react_counter_end_point
------------------------------------------------------------------
Insert in gemfile (and run bundle): 

gem 'rack-cors', :require => 'rack/cors'
--------------------------------------------------------------------------
Run npm install at top level and client level.

===========================
To set up Rails (with PSQL)
===========================

rails new <DB name> --database=postgresql
-----------------------------------------
Insert into Application class in application.rb:

config.active_record.raise_in_transactional_callbacks = true
config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins 'http://localhost:3000'
    resource '*', :headers => :any, :methods => [:get, :post, :options, :delete]
  end
end
---
Modify app -> controllers -> application_controller.rb:

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
    skip_before_filter :verify_authenticity_token
end