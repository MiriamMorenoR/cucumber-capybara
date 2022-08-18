# frozen_string_literal: true

# HOME

Dado('um usuario que acessa a pagina inicial') do
  @home_page = HomePage.new
  @home_page.load
  sleep 2
end
