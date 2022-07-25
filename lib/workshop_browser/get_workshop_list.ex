defmodule WorkshopBrowser.GetWorkshopItem do

  def get_item(item) do

    case HTTPoison.get(System.get_env("API_URL")<> item) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode!(body)
      _ ->
        :error
    end
  end

end
