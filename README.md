# Ruby MECH CRAWL
## TECHNICAL INFO
this project is templated from a ruby 3.0.2 skeleton on replit thankfully all gems were easily ported. 
feel free to fork this project to easily build a web scraper with an api (Rails) and maybe even attach a db to it. A service like this costs way too much though so maybe just use this with command line and learn a bit of ruby =) !

PS: Seems like replit is chill with webcrawlers
[T](https://replit.com/talk/learn/How-to-make-a-web-crawler-In-Python/45781)


## Help related to running this crawler 

run in cli

command 1 links
> """> bundle exec ruby main.rb links <url1> <url2> ..."""
> 
> """> bundle exec ruby main.rb links https://foo.com/ """
 
command 2 scrape + scrape2

> """> bundle exec ruby main.rb scrape2 <url> <tag> <classname> """
> 
> """> bundle exec ruby main.rb scrape2 https://foo.com/ span cards """

classname does not have to be provided scrape2 is a no text version of response with nokogiri element types

ACCESS mech constructor through mech.rb using mechnizer scripts.

TODOS:
update main
add optional turn on logs: 
  - add optional add new logfile with ARGV
  - add optional wipe logs each time