require 'nokogiri'
require 'open-uri'

doc = Nokogiri::XML(open('hig-20101231.xml'))
