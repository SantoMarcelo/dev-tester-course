# Before / After ????

Before() do
  @contato_page = ContatoPage.new
end

# After do
#   puts 'tudo aqui termina após cada cenário'
# end

After('@insert_contato') do
  res = DAO.new.busca_por_celular(@novo_contato[:celular])

  expect(res[:nome]).to eql @novo_contato[:nome]
  expect(res[:email]).to eql @novo_contato[:email]
  expect(res[:celular]).to eql @novo_contato[:celular]
  expect(res[:tipo]).to eql @novo_contato[:tipo]
end
