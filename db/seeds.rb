puts 'criando animals>>>'
5.times do
  Animal.create(name: ['gato', 'cavalo', 'boi'].sample, size: 'tamanho especifico')
end
puts 'animals criados com sucesso'