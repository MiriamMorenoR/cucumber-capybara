#language: pt
#encoding: UTF-8

@fechamento_pedido
Funcionalidade: Fechamento de pedido
Como consumidor
Quero realizar uma compra
Para que eu possa adquirir um produto


    Contexto: Página inicial
        Dado um usuario que acessa a pagina inicial 

        @comprar_produto
        Cenário: Compra de produto na plataforma
            Dado um usuario que seleciona o tamanho do produto
            Quando ordena por ordem descrescente
            E seleciona um modelo de camiseta
            E seleciona outro modelo de camiseta Black
            E adiciona mais tres produtos que ja esteja no carrinho
            E o número de produtos no carrinho é igual ao número de produtos selecionados
            Então o preço total do pedido exibido é igual ao valor de todos os produtos selecionados
