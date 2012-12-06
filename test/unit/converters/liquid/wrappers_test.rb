require 'test_helper'

class WrappersTest < ActiveSupport::TestCase
  def setup
    @object = Object.new
    @object.extend(Converters::Liquid::Wrappers)
  end

  def test_wrap_with_loop
    correct_response = "<transport-tag>  {% for section in sections %} <div id='test'><h1> {section_header}</h1></div> {% endfor %}  </transport-tag>"
    input_html = "<div id='test'><h1> {section_header}</h1></div>"
    assert_equal correct_response, @object.wrap_with_loop(input_html, "section")
  end

  def test_wrap_variables
    correct_response = "<div>{{class_name}}</div><div>{{class_id}}</div>"
    assert_equal correct_response, @object.wrap_variables("<div>{class_name}</div><div>{{class_id}}</div>")
  end

  def test_unwrap_transport_tag
    input = "<transport-tag>  {% for section in sections %} <div id='test'><h1> {section_header}</h1></div> {% endfor %}  </transport-tag>"
    correct_response = "  {% for section in sections %} <div id='test'><h1> {section_header}</h1></div> {% endfor %}  "
    assert_equal correct_response, @object.unwrap_transport_tag(input)
  end
end