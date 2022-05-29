defmodule WorkshopBrowserWeb.PageControllerTest do
  use WorkshopBrowserWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
