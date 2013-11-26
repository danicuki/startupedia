require 'rubygems'
require 'mechanize'

class StartupbaseSearchPageWorker
    include Sidekiq::Worker
    sidekiq_options :queue => :Startupbase

    def perform(page_num)
        agent = Mechanize.new

        page = agent.get("http://www.startupbase.net/startup?button.x=27&button.y=11&button=Submit&page=#{page_num}")

        page.search("//div[@class='search-box4']").each do |item|
            startup = Hash.new
            startup["name"] = item.search("h2").text
            startup["short_description"] = item.search("h3").text.split("-")[0]
            startup["details_url"] = item.search("h2").search("a")[0].attributes["href"].value

            item.search("div[@class='social-media']").each do |social_media|
                type = social_media.search("img")[0].attributes["src"].value
                ["site", "blog", "facebook", "twitter", "linkedin"].each do |sm|
                    startup[sm] = social_media.search("a")[0].attributes["href"].value if type =~ /#{sm}/
                end
            end
            puts startup
        end
    end

end