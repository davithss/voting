defmodule VotingWeb.Guardian do
  @moduledoc """
  JWT Auth
  """
  use Guardian, otp_app: :voting

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Voting.AdminRepo.get_admin!(id)
    {:ok, resource}
  end
end
