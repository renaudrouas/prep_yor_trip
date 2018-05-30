# require 'json'
# require 'open-uri'

# class Flag

#   def initialize(country)
#     @url = "http://www.drapeauxdespays.fr/#{country}"
#     results ={}
#   end

#   def call
#     doc = Nokogiri::HTML(open(@url), nil, 'utf-8')
#     doc.search('p:contains("flag-detail")').each do |node|
#       flag = node.image
#       @results[:flag] = flag
#     end
#       @results
#   end
# end
