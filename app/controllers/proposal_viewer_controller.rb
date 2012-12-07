class ProposalViewerController < ApplicationController
  def show
    client = Client.find(params[:id])
    render :inline => resource_template.render(resource_presenter(client).as_template_data), :nothing => true
  end

  private

  def resource_presenter(client)
    @resource_presenter ||= ProposalViewerPresenter.new(client)
  end

  def resource_template
    @resource_template ||= Liquid::Template.parse(TemplateView.new(request).show)
  end
end