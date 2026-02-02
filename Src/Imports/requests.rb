require 'net/http'
require 'fileutils'
require 'uri'

def download(url, outdir)
  # Cria o diretório se não existir
  FileUtils.mkdir_p(outdir)
  
  # Extrai o nome do arquivo da URL ou usa um padrão
  filename = File.basename(url)
  filename = "image.png" if filename.empty? || !filename.include?('.')
  filepath = File.join(outdir, filename)
  
  headers = {
    "User-Agent" => "Mozilla/5.0 (Image Downloader)"
  }
  
  begin
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    http.read_timeout = 15
    
    request = Net::HTTP::Get.new(uri.request_uri, headers)
    
    puts "Baixando imagem de: #{url}"
    
    http.request(request) do |response|
      unless response.is_a?(Net::HTTPSuccess)
        raise "HTTP error: #{response.code} #{response.message}"
      end
      
      # Escreve o arquivo em chunks
      File.open(filepath, 'wb') do |file|
        response.read_body do |chunk|
          file.write(chunk)
        end
      end
      
      puts "Imagem salva em: #{filepath}"
    end
    
    return filepath
    
  rescue => e
    puts "Erro ao baixar #{url}: #{e}"
    return nil
  end
end

def clear_screen
  # Limpa a tela de forma cross-platform
  system('clear') || system('cls')
end

# Programa principal
clear_screen
puts "=" * 50
puts "DOWNLOADER DE IMAGENS"
puts "=" * 50

puts "\nDigite o endereço da imagem (URL ou caminho local):"
print "> "
image_path = gets.chomp.strip

if image_path.start_with?("https://") || image_path.start_with?("http://")
  # Se for uma URL, faz o download
  folder = 'Src/IMG'
  local_path = download(image_path, folder)
  
  if local_path
    puts "\n✓ Download concluído!"
    puts "Arquivo salvo em: #{local_path}"
    image_path = local_path  # Atualiza para usar o caminho local
  else
    puts "\n✗ Falha no download. Usando URL original."
  end
else
  puts "\n✓ Usando arquivo local: #{image_path}"
end

puts "\n" + "=" * 50
puts "Caminho final da imagem: #{image_path}"
puts "=" * 50

# Aqui você pode continuar com o processamento da imagem
# Exemplo de como usar:
if File.exist?(image_path)
  puts "\nA imagem está pronta para uso!"
  # Coloque aqui o código para processar a imagem
  # Por exemplo:
  #   process_image(image_path)
else
  puts "\nAtenção: A imagem não foi encontrada no caminho especificado."
end