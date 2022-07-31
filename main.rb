require './mech'

# genmech is able to take a list of urls and create a new ua for any <new>instance
# nikemecha = Gen_mech.new(["https://www.nike.com/ca/w/new-3n82y"],1, cookies: false)
# nikeprice = nikemecha.parse_for_class("div", "product-price")
# nikepriceandname = nikemecha.parse_for_class("div", "product-card")
# puts nikepriceandname

# craftedlondonmecha = Gen_mech.new(ARGV,2, false)
# craftedlondonitems = craftedlondonmecha.parse_for_class("a","full-unstyled-link" )
# craftedlondonprice = craftedlondonmecha.parse_for_class("div","price__container" )
# puts craftedlondonitems

superbuy = Gen_mech.new(ARGV, 1, cookies = true)
puts "wipe our previous logs #{File.open('mech.log', 'w') { |file| file.truncate(0) }}"
puts superbuy.parse_for_links
