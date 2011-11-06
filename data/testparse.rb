require 'nokogiri'
require 'open-uri'

#doc = Nokogiri::XML(open('hig-20101231.xml'))
#parsed = doc.xpath("//us-gaap:SegmentReportingDisclosureTextBlock")
#f = File.new("./out1.xml", "r+")
#f.write(parsed)
#f.close

#doc = Nokogiri::XML(open('hig-20110331.xml'))
doc = Nokogiri::HTML(open("http://www.sec.gov/cgi-bin/browse-edgar?company=&match=&CIK=rpxc&filenum=&State=&Country=&SIC=&owner=exclude&Find=Find+Companies&action=getcompany"))
#parsed = doc.xpath("//table[@summary='Results']/tr[td='10-Q']/a[@href='documentsbutton']")
parsed = doc.xpath("//table[@summary='Results']/tr[td='10-Q']/*/a[@id='documentsbutton']")

#/Archives/edgar/data/1486800/000148680011000035/0001486800-11-000035-index.htm
#/Archives/edgar/data/1486800/000148680011000035/0001486800-11-000035-index.htm
form1_url = parsed[0]['href']

form1_doc = Nokogiri::HTML(open("http://sec.gov"+form1_url))

form1_p = form1_doc.xpath("//table[@summary='Document Format Files']/tr[td='10-Q']/*/a")

url1 = "http://sec.gov" + form1_p.first['href']

#parsed.each {|r|
#  puts r['href']
#  #r['href'] =~ /(\/[A-Za-z0-9\/]+)/
#}



#{}"/form10q.htm"

#f = File.new("./out1.xml", "r+")
#f.write(parsed)
#f.close

#http://www.sec.gov/Archives/edgar/data/1486800/000148680011000035/form10q.htm
#"http://www.sec.gov/Archives/edgar/data/1486800/000119312510186766/d10q.htm"
#"http://www.sec.gov/Archives/edgar/data/1486800/000119312510255373/d10q.htm"
#"http://www.sec.gov/Archives/edgar/data/1486800/000119312511044012/d10k.htm"
#"http://www.sec.gov/Archives/edgar/data/1486800/000119312511126280/d10q.htm"
#"http://www.sec.gov/Archives/edgar/data/1486800/000148680011000012/form10q.htm"


#//table[@summary='Results']
#http://www.sec.gov/cgi-bin/browse-edgar?company=&match=&CIK=one&filenum=&State=&Country=&SIC=&owner=exclude&Find=Find+Companies&action=getcompany
