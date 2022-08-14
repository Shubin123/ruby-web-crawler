require 'watir'
require 'selenium-webdriver'
require 'chromedriver'
Webdrivers.install_dir = '.'
class Gen_watir
  def initialize(urls)
    @urls = urls
    @browser = Watir::Browser.new :chrome
  end

  def base_test
    @browser.goto 'watir.com'
    @browser.link(text: 'Guides').click
    puts @urls
    puts @rowser.title

    # => 'Guides – Watir Project'
    # @browser.close
  end
end
