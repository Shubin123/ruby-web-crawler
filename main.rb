require './mech'

def run
  # assume that on startup main will be ran once to wipe previous logs
  unless ARGV[0]
    puts "this is our input field >>> #{ARGV}"
    puts "wipe our previous logs #{File.open('mech.log', 'w') { |file| file.truncate(0) }}"
    puts 'try the following command:'
    puts 'bundle exec ruby main.rb links https://google.com'
  end

  if ARGV[0] == 'links'
    parselinks = Gen_mech.new(ARGV[1..], 1, cookies = true)
    puts parselinks.parse_for_links
  end

  if ARGV[0] == 'scrape'
    parseprices = Gen_mech.new([ARGV[1]], 1, cookies = true)
    # check if class is a string input
    if ARGV[3]
      puts parseprices.hard_parse_for_class(ARGV[2], ARGV[3])
    else
      puts parseprices.hard_parse_for_class(ARGV[2], '')
    end

  end

  if ARGV[0] == 'scrape2'
    parseprices = Gen_mech.new([ARGV[1]], 1, cookies = true)
    # check if class is a string input
    if ARGV[3]
      puts parseprices.parse_for_class(ARGV[2], ARGV[3])
    else
      puts parseprices.parse_for_class(ARGV[2], '')
    end

  end
end

run
