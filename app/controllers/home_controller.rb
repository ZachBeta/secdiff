class HomeController < ApplicationController
  def get_html_content(requested_url)
    url = URI.parse(requested_url)
    full_path = (url.query.blank?) ? url.path : "#{url.path}?#{url.query}"
    the_request = Net::HTTP::Get.new(full_path)
  
    the_response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(the_request)
    }
  
    raise "Response was not 200, response was #{the_response.code}" if the_response.code != "200"
    coder = HTMLEntities.new
    return coder.decode(coder.decode(the_response.body))
  end
  
  def parse_10q(path)

    doc = Nokogiri::HTML(get_html_content("http://sec.gov"+path))

    p = doc.xpath("//table[@summary='Document Format Files']/tr[td='10-Q']/*/a")

    return "http://sec.gov" + p.first['href']
  end
  
  def index
    respond_to do |format|
      format.html
    end
  end
  
  def results
    
    doc = Nokogiri::HTML(get_html_content("http://www.sec.gov/cgi-bin/browse-edgar?company=&match=&CIK=#{params[:symbol]}&filenum=&State=&Country=&SIC=&owner=exclude&Find=Find+Companies&action=getcompany"))

    parsed = doc.xpath("//table[@summary='Results']/tr[td='10-Q']/*/a[@id='documentsbutton']")

    url1 = parse_10q(parsed[1]['href'])
    url2 = parse_10q(parsed[0]['href'])

    @response1 = get_html_content(url1)
    @response2 = get_html_content(url2)
    respond_to do |format|
      format.html
    end
  end
end
