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
    if cookies == true
      @mech.log = Logger.new "mech.log"
    end
  end

  def return_obj()
    #returns an array of mechanized obj from urls
    mech_array = []
    @urls.each do |url|
      mech_array << @mech.get(url)
    end
    return mech_array
  end

  def generate_html_body()
    @urls.each do |url|
      puts @mech.get(url).body
    end
  end

  def parse_for_links()
    # 2d dict for {ogurls => {linkname:href...}...}
    sitesfromurls = {}
    @urls.each do |url|
      urlspersite = {}
      @mech.get(url).links.each do |link|
        urlspersite[link.to_s] = link.href.to_s
      end
      sitesfromurls[url] = urlspersite
    end
    return sitesfromurls
  end

  def parse_for_class(tag, classname)
    # returns an array of element text values from a given tag and css classname
    # 2d dict for {ogurls => {itemname:price...}...}
    pricesfromurls = {}
    @urls.each do |url|


      if classname != ""
        ele = @mech.get(url).css("#{tag}.#{classname}")
      else
        ele = @mech.get(url).css("#{tag}")
      end


      unfiltered_array = []
  
      puts ele, @mech.get(url)
      ele.each do |item|

        unfiltered_array << item.text.to_s
      end
      # puts unfiltered_array.inspect
      pricesfromurls[url] = unfiltered_array
    end
    # return pricesfromurls
  end
end


