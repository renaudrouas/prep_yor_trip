require 'restcountry'

class Country
      attr_reader :name,
                :capital,
                :altSpellings,
                :translations,
                :population,
                :timezones,
                :callingCodes,
                :currencies,
                :languages,

  def initialize(attributes)
      @name = attributes['name']
      @capital = attributes['capital']
      @translations = attributes['translations']
      @population = attributes['population']
      @timezones = attributes['timezones']
      @callingCodes = attributes['callingCodes']
      @currencies = attributes['currencies']
      @languages = attributes['languages']
    end

    def self.find(name, fulltext = false)
      countries = get_response('name', name + "?fullText=#{fulltext}")
      new(countries.first) unless countries.empty?
    end

    def self.find_by_name(name, fulltext = false)
      find(name, fulltext)
    end

    def self.find_by_currency(currency)
      countries = get_response('currency', currency)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_region(region)
      countries = get_response('region', region)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_callingcode(callingcode)
      countries = get_response('callingcode', callingcode)
      countries.map { |attributes| new(attributes) }
    end

    def self.all
      countries = get_response('all')
      countries.map { |attributes| new(attributes) }
    end

    private

    private_class_method
    def self.get_response(api, action = nil)
      url = URI.parse(URI.encode("#{https://restcountries.eu/rest/v2/all}#{api ? '/' + api : ''}/#{action}"))
      response = Faraday.get(url)
      response.success? ? JSON.parse(response.body) : []
    end


end
