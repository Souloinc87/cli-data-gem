

class CLI

  attr_accessor :charity

    def start

      puts " "
      puts "Welcome to Perfect Charity"
      puts " "
      puts "Type 'list' to see the best charities today."
      puts " "
      input = gets.strip
      puts " "
      if input == "list"
        counter = 1
        Charity.all.collect do |charity|
          puts " "
          puts  "#{counter}." + charity.name
          counter += 1
          break if counter == 6

          end
        end
      end


    def user_input

      puts " "
      puts " "
      puts "Type the number of the charity you would like to know more about."
      puts "  (Type 6 to get back to charity list or Type 7 to exit gem)     "
      puts " "
      puts " "
      input = gets.strip

        if input.to_i == 1
            puts " "
            puts Charity.scrape('https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=12551')
            puts " "
            puts "Donate here:  https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=12551"
            user_input

        elsif input.to_i == 2
            puts " "
            puts Charity.scrape('https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=8609')
            puts " "
            puts "Donate here:  https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=8609"
            user_input
        elsif input.to_i == 3
            puts " "
            puts Charity.scrape('https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=13885')
            puts " "
            puts "Donate here:   https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=13885"
            user_input
        elsif input.to_i == 4
            puts " "
            puts Charity.scrape('https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=14793')
            puts " "
            puts "Donate here:   https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=14793"
            user_input
        elsif input.to_i == 5
            puts " "
            puts Charity.scrape('https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=12756')
            puts " "
            puts "Donate here:   https://www.charitynavigator.org/index.cfm?bay=search.summary&orgid=12756"
            user_input
        elsif input.to_i == 6
            start
            user_input
        elsif input.to_i == " " || input.to_i >= 8
            puts " "
            puts "invalid entry given."
            start
            user_input
        elsif input.to_i == 7
            puts " "
            puts "Thank you. Goodbye!"
            puts " "
            puts " "

        end
      end

 end
