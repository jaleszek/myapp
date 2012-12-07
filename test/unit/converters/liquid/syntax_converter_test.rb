require 'test_helper'

class SyntaxConverterTest < ActiveSupport::TestCase
  def setup
    input = "<div id='proposal-content'><div id='proposal_section'><h1> {section_header}</h1><div>{section_content}</div></div></div>"
    @syntax_obj = Converters::Liquid::SyntaxConverter.new(input)
  end

  test "repeat_fragment should return proper html structure with repeating" do
    correct_response = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><body><div id=\"proposal-content\">  {% for section in sections %} <div>\n<h1> {{section.header}}</h1>\n<div>{{section.content}}</div>\n</div> {% endfor %}  </div></body></html>\n"

    @syntax_obj.repeat_fragment("proposal_section", "section")
    assert_equal correct_response, @syntax_obj.html
  end
end