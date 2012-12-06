module TemplateUtilities
  class TemplateFixer
    def initialize(html, host_with_port)
      @html = Nokogiri::HTML.parse(html)
      @host = host_with_port
    end

    def as_unrelative
      fix_relative("link", "href")
      fix_relative("img", "src")
      @html.to_html
    end

    private

    def fix_relative(tag, attribute)
      @html.search(tag).each do |node|
        node[attribute] = "http://#{@host}/proposal-template/#{node[attribute]}"
      end
    end
  end
end