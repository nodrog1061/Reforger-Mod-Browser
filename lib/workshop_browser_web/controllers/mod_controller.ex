defmodule WorkshopBrowserWeb.ModController do
  use WorkshopBrowserWeb , :controller
  alias WorkshopBrowser.GetWorkshopList
  alias WorkshopBrowser.GetWorkshopItem

  def index(conn, _params) do

    render(conn, "index.html", getListData(conn))
  end

  def show(conn, _params) do
    render(conn, "item.html", getItemData(conn))
  end

  defp getListData(conn) do
    quantity =
      if conn.query_params["count"] == nil do
        20
      else
        case Integer.parse(conn.query_params["count"]) do
          {x,_} when x > 50 -> 50
          {x,_} -> x
          _ -> 20
        end
      end

    page =
      if conn.query_params["page"] == nil do
        1
      else
        case Integer.parse(conn.query_params["page"]) do
          {x,_} -> x
          _ -> 1
        end
      end

    %{data: GetWorkshopList.get_by_popularity(page, "desc", quantity), page: page, quantity: quantity}
  end

  defp getItemData(conn) do

    %{data: GetWorkshopItem.get_item(conn.params["id"])}
  end

end
