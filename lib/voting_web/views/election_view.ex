defmodule VotingWeb.ElectionView do
  use VotingWeb, :view

  def render("election.json", %{election: election}) do
    %{
      status: "ok",
      data: %{
        id: election.id,
        name: election.name,
        cover: election.cover,
        notice: election.notice,
        starts_at: election.starts_at,
        end_at: election.end_at
      }
    }
  end
end
