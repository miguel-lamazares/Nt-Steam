require 'net/http'
require 'fileutils'

def download(url, outdir)
  
  if Dir.exist?(outdir)
    FileUtils.rm_rf(outdir)
  end
  FileUtils.mkdir_p(outdir)
  
  filename = "img.png"
  filepath = File.join(outdir, filename)
  
  headers = {
    "User-Agent" => "Mozilla/5.0 (TerminalLib GIF Downloader)"
  }
  
  begin
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    http.read_timeout = 15
    
    request = Net::HTTP::Get.new(uri.request_uri, headers)
    
    http.request(request) do |response|
      # Verifica se a requisição foi bem-sucedida
      unless response.is_a?(Net::HTTPSuccess)
        raise "HTTP error: #{response.code} #{response.message}"
      end
      
      # Escreve o arquivo em chunks
      File.open(filepath, 'wb') do |file|
        response.read_body do |chunk|
          file.write(chunk)
        end
      end
    end
    
    return filepath
    
  rescue => e
    puts "#{url} can't be installed: #{e}"
    return nil
  end
end