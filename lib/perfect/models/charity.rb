class Charity

  attr_accessor :name, :url

  def self.all
    html = open('https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=2203')
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

  def self.scrape(page_url)
    html = Nokogiri::HTML(open(page_url))
    html.css("div.accordion-item-bd").first.text.strip
  end
end
