module Wrappers
  def wrap_with_loop(html_node, resource_name)
    start_loop = "{% for #{resource_name} in #{resource_name.pluralize} %}"
    end_loop = "{% endfor %}"
    wrap_transport_tag " #{start_loop} #{wrap_iterator(html_node)} #{end_loop} "
  end

  def wrap_variables(text)
    text.gsub(/>\s*\{\S+\}\s*</) do |pattern|
      pattern.gsub!(/\{/, "{{").gsub!(/\}/, "}}")
    end
  end

  private

  def wrap_transport_tag(text)
    "<transport-tag> #{text} </transport-tag>"
  end

  def unwrap_transport_tag(text)
    text.gsub("<transport-tag>", "").gsub("</transport-tag>", "")
  end

  def wrap_iterator(text)
    text.gsub(/>\s*\{\{\S+\}\}\s*</) do |pattern|
      pattern.sub!("_", ".")
    end
  end
end