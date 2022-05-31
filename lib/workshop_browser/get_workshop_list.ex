defmodule WorkshopBrowser.GetWorkshopList do

  def get_by_popularity(page, orderDirection \\ "desc", limit \\ 50) do

    body =
      Jason.encode!(%{
        "orderBy" => "popularity",
        "orderDirection" => orderDirection,
        "reported" => false,
        "limit" => limit,
        "offset" => (page - 1) * limit
      })

    case HTTPoison.post("https://api-ar-workshop.bistudio.com/workshop-api/api/v3.0/assets/list", body, [{"Content-Type", "application/json"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode!(body)
      _ ->
        :error

    end
  end

end
