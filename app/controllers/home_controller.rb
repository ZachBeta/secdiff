class HomeController < ApplicationController
  def get_html_content(requested_url)
    url = URI.parse(requested_url)
    full_path = (url.query.blank?) ? url.path : "#{url.path}?#{url.query}"
    the_request = Net::HTTP::Get.new(full_path)
  
    the_response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(the_request)
    }
  
    raise "Response was not 200, response was #{the_response.code}" if the_response.code != "200"
    return the_response.body       
  end
  
  def index
    respond_to do |format|
      format.html
    end
  end
  
  def results
    url1 = params[:url1]
    url2 = params[:url2]
    @response1 = get_html_content("http://www.sec.gov/Archives/edgar/data/1486800/000148680011000035/form10q.htm")
    @response2 = get_html_content("http://www.sec.gov/Archives/edgar/data/1486800/000119312510255373/d10q.htm")
    respond_to do |format|
      format.html
    end
  end
end
