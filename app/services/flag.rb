require 'json'
require 'open-uri'


class Flag
  attr_reader :results

  def initialize(country)
    @url = "http://www.drapeauxdespays.fr/#{country}"
    @results ={}
  end

  def call
    doc = Nokogiri::HTML(open(@url), nil, 'utf-8')
    doc.search('.list.clearfix').first.each do |node|
      # flag = node.text
      # @results[:flag] = flag
    end
      @results
  end
end
