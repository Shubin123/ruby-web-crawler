require './mech'
# require './water'

def run
  # assume that on startup main will be ran once to wipe previous logs
  unless ARGV[0]
    puts "this is our input field >>> #{ARGV}"
    puts "wipe our previous logs #{File.open('mech.log', 'w') { |file| file.truncate(0) }}"
    puts 'try the following command:'
    puts 'bundle exec ruby main.rb scrape https://www.coolmathgames.com/'
  end

  if ARGV[0] == 'links'
    parselinks = Gen_mech.new(ARGV[1..], 1, cookies = true)
    puts parselinks.parse_for_links
  end

  if ARGV[0] == 'scrape'
    parseprices = Gen_mech.new([ARGV[1]], 1, cookies = true)
    # check if class is a string input

    if ARGV[3]
      if ARGV[3] == '-class'
        puts parseprices.hard_parse_for_class('', ARGV[2], true)
      else
        puts parseprices.hard_parse_for_class(ARGV[2], ARGV[3], false)
      end
    else
      # puts 'no extra args or arg is tag'
      puts parseprices.hard_parse_for_class(ARGV[2], '', false)
    end

  end

  if ARGV[0] == 'water'
    waterbot = Gen_watir.new(ARGV[1..])
    resolve_water = waterbot.base_test

  end
end

run
