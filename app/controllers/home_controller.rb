class HomeController < ApplicationController
  def index
    url = URI.parse("http://www.sec.gov/Archives/edgar/data/1486800/000148680011000035/form10q.htm")
    full_path = (url.query.blank?) ? url.path : "#{url.path}?#{url.query}"
    the_request = Net::HTTP::Get.new(full_path)
  
    the_response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(the_request)
    }
    
    render :text => the_response.body, :layout => false 
    #respond_to do |format|
    #  format.html { render html: @the_response }
    #end
  end
end
