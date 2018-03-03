defmodule CatcastsWeb.NavigationTest do
  use CatcastsWeb.ConnCase

  test "Shows a signin with google link when not signed in", %{conn: conn} do
    conn = get conn, "/"

    assert html_response(conn, 200) =~ "Sign in with Google"
  end
end
