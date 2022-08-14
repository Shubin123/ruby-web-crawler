require 'mechanize'
require 'logger'
require 'nokogiri'
require 'set'

class Gen_mech
  def initialize(urls, agentid, cookies = false)
    # default cookie to false, user_agent_alias to Mac Safari

    @urls = urls
    @mech = Mechanize.new agentid
    @mech.user_agent_alias = 'Mac Safari'
    @mech.log = Logger.new 'mech.log' if cookies == true
  end

  def return_obj
    # returns an array of mechanized obj from urls
    mech_array = []
    @urls.each do |url|
      mech_array << @mech.get(url)
    end
    mech_array
  end

  def generate_html_body
    @urls.each do |url|
      puts @mech.get(url).body
    end
  end

  def parse_for_links
    # 2d dict for {ogurls => {linkname:href...}...}
    sitesfromurls = {}
    @urls.each do |url|
      urlspersite = {}
      @mech.get(url).links.each do |link|
        urlspersite[link.to_s] = link.href.to_s
      end
      sitesfromurls[url] = urlspersite
    end
    sitesfromurls
  end

  def hard_parse_for_class(tag, classname, classonly)
    # returns an array of element text values from a given tag and css classname
    # 2d dict for {ogurls => {itemname:price...}...}
    pricesfromurls = {}
    @urls.each do |url|
      unfiltered_array = []
      ele = @mech.get(url)

      elenew = if (classname != '') && (tag != '')

                 ele.search("#{tag}.#{classname}")
               elsif classonly == true

                 ele.search(".#{classname}")
               elsif tag.to_s == ''
                 ele.search('html')
               else
                 ele.search(tag.to_s)
               end

      # puts elenew
      # puts elenew
      elenew.each do |item|
        unfiltered_array << item.text
      end
      # puts unfiltered_array.inspect
      pricesfromurls[url] = unfiltered_array
    end
    pricesfromurls
  end
end
