require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
holiday_hash.each do |season, event|
  if season ==:winter
    event.each do |event, things|
      things<<supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    if season== :spring
      holiday.each do |day,thing|
        if day==:memorial_day
          thing << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
holiday_hash.each do |quarter, holiday|
  if quarter==season
    holiday_hash[season][holiday_name]=supply_array
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
arr=[]
holiday_hash.each do |season, holiday|
  if season==:winter
    holiday.each do |event, supply|
      arr << supply
    end
    end
  end
  arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
holiday_hash.each do |season, holiday|
  puts "#{season.to_s.capitalize}:"
  holiday.each do |event, supply|
     if event.to_s.include?("_")
        event=event.to_s.gsub("_", " ").split.map {|word| word.capitalize}.join(" ")
      else
        event=event.to_s.capitalize
      end
      puts "  #{event}: #{supply.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
holiday_hash.collect do |season, holiday|
  holiday.collect do |event, things|
  if things.include?("BBQ")
    event
      end
    end
  end.flatten.compact
end
