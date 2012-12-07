class ProposalViewerController < ApplicationController
  def show
    @client = Client.find(params[:id])
    render :inline => resource_template.render(resource_presenter.as_template_data)
  end

  private

  def resource_presenter
    @resource_presenter ||= ProposalViewerPresenter.new(@client)
  end

  def resource_template
    @resource_template ||= Liquid::Template.parse(TemplateView.new(request).show)
  end
end