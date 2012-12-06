class ProposalViewerController < ApplicationController
  def show
    client = Client.find(params[:id])
    template = TemplateView.new(request).show
    data = ProposalViewerPresenter.new(client).as_template_data
    render :inline => Liquid::Template.parse(template).render(data), :nothing => true
  end
end