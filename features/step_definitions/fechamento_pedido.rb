# frozen_string_literal: true

# HOME

Dado('um usuario que seleciona o tamanho do produto') do
  @home_page.sizes[6].click
  sleep 1
end

Quando('ordena por ordem descrescente') do
  @home_page.ordem_decrescente
  sleep 6
end

Quando('seleciona um modelo de camiseta') do
  @home_page.adicionar_ao_carrinho[9].click
  @home_page.fechar_modal_carrinho.click
end

Quando('seleciona outro modelo de camiseta Black') do
  @home_page.adicionar_ao_carrinho[7].click
end

Quando("adiciona mais tres produtos que ja esteja no carrinho") do
  @home_page.add_camiseta
  sleep 5
end

Quando("o número de produtos no carrinho é igual ao número de produtos selecionados") do
  @qtd_camiseta = @home_page.qtd_camiseta
  @qtd_camiseta_dois = @home_page.qtd_camiseta_dois
  @itens_carrinho = @home_page.itens_carrinho 
  qtd_total_camisetas = (@qtd_camiseta + @qtd_camiseta_dois)
  expect(@itens_carrinho).to eql qtd_total_camisetas
end

Então("o preço total do pedido exibido é igual ao valor de todos os produtos selecionados") do
  @valor_total_pagamento = @home_page.valor_total_pagamento
  @valor_camiseta = @home_page.valor_camiseta
  @valor_camiseta_dois = @home_page.valor_camiseta_dois
  valor_total_camisetas = (@valor_camiseta + @valor_camiseta_dois).round(2)
  expect(@valor_total_pagamento).to eql valor_total_camisetas
  @home_page.checkout.click
end
