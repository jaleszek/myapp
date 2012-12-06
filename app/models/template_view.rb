class TemplateView
  def initialize(request, template_file_path = "/public/proposal-template/index.html")
    @host = request.host_with_port
    @template = File.open("#{Rails.root}#{template_file_path}").read
  end

  def show
    liquid = LiquidSyntaxConverter.new(@template)
    liquid.repeat_fragment("proposal_section", "section")
    TemplateFixer.new(liquid.html, @host).html
  end
end