require 'json'
require 'open-uri'


class Gouv
  attr_reader :results

  def initialize(country)
    @url= "https://www.diplomatie.gouv.fr/fr/conseils-aux-voyageurs/conseils-par-pays/#{country}/#sante"
    @results = {}
  end

  def call
    doc = Nokogiri::HTML(open(@url), nil, 'utf-8')
    doc.search('p:contains("Vaccinations")').each do |node|
    vaccination = node.text.split("\n").drop(1)
    @results[:vaccination] = vaccination
    end
    @results

    # doc.search('strong:contains("Risques Sanitaires")').each do |node|
    #   risque = node.text.split
    #   @results[:risque] = risque
    # end

      # title = node.search("vaccinationsx").text.strip
      # description = node.search("").text.strip
      # prep_time = node.search(".m_prep_time").first.parent.text.strip
      # difficulty = node.search(".m_detail_recette").text.strip.split(" - ")[2]

  end

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('')

end
