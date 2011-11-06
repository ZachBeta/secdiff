require 'nokogiri'
require 'open-uri'

doc = Nokogiri::XML(open('hig-20101231.xml'))
parsed = doc.xpath("//us-gaap:SegmentReportingDisclosureTextBlock")
f = File.new("./out1.xml", "r+")
f.write(parsed)
f.close

doc = Nokogiri::XML(open('hig-20110331.xml'))
doc = Nokogiri::HTML("http://www.sec.gov/Archives/edgar/data/1486800/000148680011000035/form10q.htm")
parsed = doc.xpath("//a[@name='PartIItem2']")

f = File.new("./out1.xml", "r+")
f.write(parsed)
f.close

"http://www.sec.gov/Archives/edgar/data/1486800/000119312510186766/d10q.htm"
"http://www.sec.gov/Archives/edgar/data/1486800/000119312510255373/d10q.htm"
"http://www.sec.gov/Archives/edgar/data/1486800/000119312511044012/d10k.htm"
"http://www.sec.gov/Archives/edgar/data/1486800/000119312511126280/d10q.htm"
"http://www.sec.gov/Archives/edgar/data/1486800/000148680011000012/form10q.htm"
