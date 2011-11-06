module HomeHelper
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
end
