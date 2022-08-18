# frozen_string_literal: true

# Classe com o mapeamento e acoes dos elementos da pagina inicial

class HomePage < SitePrism::Page
  set_url '/'
  element     :btn_carrinho,           'button[class="sc-1h98xa9-0 gFkyvN"]'
  elements    :sizes,                  'span[class="checkmark"]'
  elements    :adicionar_ao_carrinho,  'button[class="sc-124al1g-0 jCsgpZ"]', wait: 20
  element     :fechar_modal_carrinho,  'button[class="sc-1h98xa9-0 gFkyvN"]'
  elements    :btn_add_camiseta,       'button[class="sc-11uohgb-6 cgtUCJ"]'
  elements    :quantidade_camiseta,    'p[class="sc-11uohgb-3 gKtloF"]'
  element     :qtd_itens_carrinho,     'div[class="sc-1h98xa9-3 VLMSP"]'
  elements    :vl_camiseta,            'div[class="sc-11uohgb-4 bnZqjD"]'
  element     :valor_total,            'p[class="sc-1h98xa9-9 jzywDV"]'
  element     :checkout,               'button[class="sc-1h98xa9-11 gnXVNU"]'

  include Capybara::DSL

  def ordem_decrescente
    sizes[5].click
    sizes[4].click
    sizes[3].click
    sizes[2].click
    sizes[1].click
    sizes[0].click
  end

  def add_camiseta
    qtd_camiseta = 1
    count = 4
    while qtd_camiseta < count
      btn_add_camiseta[1].click
      qtd_camiseta += 1
    end
  end

  def valor_total_pagamento
    valor_total.text.gsub(/[R$  ]/, '').to_f.round(2)
  end

  def valor_camiseta
    vl_camiseta[0].text.gsub(/[R$  ]/, '').to_f.round(2) * qtd_camiseta
  end

  def valor_camiseta_dois
    vl_camiseta[1].text.gsub(/[R$  ]/, '').to_f.round(2)
  end

  def qtd_camiseta
    quantidade_camiseta[0].text.gsub(/[ |]/, '').gsub(/[ :]/, '').gsub(/[a-z]/, '').gsub(/[A-Z]/, '').to_i
  end

  def qtd_camiseta_dois
    quantidade_camiseta[1].text.gsub(/[ |]/, '').gsub(/[ :]/, '').gsub(/[a-z]/, '').gsub(/[A-Z]/, '').to_i
  end

  def itens_carrinho
    qtd_itens_carrinho.text.gsub(/ /, '').to_i
  end
end
