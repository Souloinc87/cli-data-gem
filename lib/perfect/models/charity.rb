class Charity

  attr_accessor :name, :url, :summary

  BASE_URL = 'https://www.charitynavigator.org/'

  def self.all
    html = open("#{BASE_URL}/index.cfm?bay=content.view&cpid=2203")
    doc = Nokogiri::HTML(html.read)
    links = doc.search("div.third-inline-block div.shadedtable a")

    charities = []
    links.each do |element|
      charity = Charity.new
      charity.name = element.text
      charity.url = element.attr("href")
      charities << charity
    end
    charities
  end

  def self.scrape(charity)
    html = Nokogiri::HTML(open(BASE_URL + charity.url))
    summary = html.css("div.accordion-item-bd").first.text.strip
    charity.summary = summary
  end
end
