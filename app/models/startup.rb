class Startup < ActiveRecord::Base
  attr_accessible :blog_feed_url, :blog_url, :category, :city, :country, :details_url, :email, :founding_date, :homepage_url, :linkedin_url, :name, :number_of_employees, :phone, :short_description, :state, :twitter_username
end
