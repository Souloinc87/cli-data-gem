

class CLI

  attr_accessor :charity

    def start
      puts " "
      puts "Welcome to Perfect Charity"
      puts " "
      puts "Type 'list' to see the best charities today."
      puts " "
      input = gets.strip
      if input == "list"
        #counter = 1
        Charity.all.each.with_index(1) do |charity, index|
          puts " "
          puts  "#{index}." + charity.name
          #break if counter == 6

        end
      end
      user_input
      puts " "
    end


    def user_input
      user_prompt
      input = gets.strip
      while input != "exit" do
        if input.to_i.between?(1, Charity.all.size)
          charity = Charity.all[input.to_i - 1]
          Charity.scrape(charity)
          puts charity.summary
          puts "Donate here:  https://www.charitynavigator.org/#{charity.url}"
        else
          puts "Invalid entry"
        end
        user_prompt
        input = gets.strip 
      end

    end

    def user_prompt

      puts " "
      puts " "
      puts "Type the number of the charity you would like to know more about."
      puts "  (Type 6 to get back to charity list or Type 7 to exit gem)     "
      puts " "
      puts " "

    end
 end
