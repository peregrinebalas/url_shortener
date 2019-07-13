defmodule UrlShortenerWeb.RedirectControllerTest do
  use UrlShortenerWeb.ConnCase

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  @create_attrs %{
    short_url: "/url1",
    url: "https://www.example.com/some/long/url"
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show" do
    test "redirects to short url", %{conn: conn} do

      url = Urls.create_url(@create_attrs)

      conn = get(conn,
      Routes.redirect_path(conn,
      :show, "/url1"))

      assert redirected_to(conn) =~ "https://www.example.com/some/long/url"
    end
  end
end