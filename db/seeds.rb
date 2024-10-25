require 'json'

file = File.read('db/produtos_trigao.json')
produtos = JSON.parse(file)

produtos.each do |produto_data|
  Produto.create!(
    codigo: produto_data['codigo'],
    nome: produto_data['produto'],
    secao: produto_data['secao'],
    preco: produto_data['preco'],
    unidade: produto_data['unidade'],
    quantidade: produto_data['quantidade']
  )
end
