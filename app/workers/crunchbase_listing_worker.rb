require 'rubygems'
require 'mechanize'

class CrunchbaseListingWorker
    include Sidekiq::Worker
    sidekiq_options :queue => :crunchbase

    def perform()
        agent = Mechanize.new

        startups_string = agent.get("http://api.crunchbase.com/v/1/companies.js?api_key=#{APP_CONFIG['crunchbase_key']}")
        startups = JSON.parse(startups_string.body)

        (1..100).each do |i|
            puts startups[i]["name"]
        end
    end

end