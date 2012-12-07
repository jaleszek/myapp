# place for managing templates
# in the future, templates could be stored in other than File store
# look at "Crafting Rails Applications.., Jose Vailm, Chapter 3"

class TemplateResolver
  def initialize(request, template_file_path = "/public/proposal-template/index.html")
    @host = request.host_with_port
    @template = File.open("#{Rails.root}#{template_file_path}").read
  end

  def show
    liquid = Converters::Liquid::SyntaxConverter.new(@template)
    liquid.repeat_fragment("proposal_section", "section")
    TemplateUtilities::TemplateFixer.new(liquid.html, @host).as_unrelative
  end
end