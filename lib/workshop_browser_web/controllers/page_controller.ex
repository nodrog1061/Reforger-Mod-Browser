defmodule WorkshopBrowserWeb.PageController do
  use WorkshopBrowserWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.html")
    redirect(conn, to: "/modlist")
  end
end
