require 'uri'
require 'colorize'

while true do
	line = gets
	decoded_line =  URI.decode(line)
	match = decoded_line.match(/\[([^:]*):(.*) \+.*\].+GET \/solr(.*)&wt=javabin/)

	if match	
		core, query = match[3].split('?')
		
		puts "--------"
		puts ""
		puts "\/solr#{core}?#{query}&wt=json&indent=true\n".colorize(:yellow)
			
		puts "  TIME: ".colorize(:green) + "#{match[1]} - #{match[2]}" 
		puts ""	 
		puts "  CORE: ".colorize(:green) + core  
		 
      		parameters = query.gsub(/\+/, " ").split('&')
		
		parameters.each do |param|
			key, value = param.split('=')
			puts "      " + key +" = ".colorize(:yellow) + value
		end

		puts ""
	end
end

