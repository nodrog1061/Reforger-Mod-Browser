defmodule WorkshopBrowserWeb.ModController do
  use WorkshopBrowserWeb , :controller
  alias WorkshopBrowser.GetWorkshopList

  def index(conn, _params) do

    render(conn, "index.html", getData(conn))
  end

  defp getData(conn) do
    quantity = 50
    %{data: GetWorkshopList.get_by_popularity(1, "desc", quantity)}
  end

end
