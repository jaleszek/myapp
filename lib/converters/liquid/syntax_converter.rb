module Converters::Liquid
  class SyntaxConverter
    include Converters::Liquid::Wrappers

    attr_reader :html

    def initialize(text)
      @text = wrap_variables(text)
      @html = Nokogiri::HTML.parse(@text)
    end

    def repeat_fragment(div_id, resource_name)
      @html.search("##{div_id}").each do |node|
        node.remove_attribute("id")
        node.replace(Nokogiri.make(wrap_with_loop(node.to_html, resource_name)))
      end
      @html = unwrap_transport_tag(@html.to_html)
    end
  end
end