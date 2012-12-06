require 'test_helper'

class TemplateFixerTest < ActiveSupport::TestCase
  def setup
    @obj = TemplateUtilities::TemplateFixer.new("<link href=\"style\/style.css\" rel=\"stylesheet\" type=\"text\/css\" media=\"all\" />", "localhost:3000")
  end

  def test_as_unrelative
    correct_response = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><head><link href=\"http://localhost:3000/proposal-template/style/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\"></head></html>\n"
    assert_equal correct_response, @obj.as_unrelative
  end
end