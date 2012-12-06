class ProposalViewerPresenter
  def initialize(client)
    @client = client
    @proposal = @client.proposals.last
    @proposal_sections = @proposal.proposal_sections
  end

  def as_template_data
    {
      "client_name" => @client.name,
      "proposal_name" => @proposal.name,
      "proposal_send_date" => @proposal.send_date,
      "proposal_user_name" => @proposal.user_name,
      "client_company" => @client.company,
      "client_website" => @client.website,
      "sections" => collect_proposal_sections
    }
  end

  private

  def collect_proposal_sections
    @proposal_sections.map do |proposal|
      {
        "header" => proposal.name,
        "content" => proposal.description
      }
    end
  end
end