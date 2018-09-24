Dado('que possuo o seguinte contato:') do |table|
  puts 'que possuo o seguinte contato:'
  @novo_contato = table.rows_hash
  puts @novo_contato
end

Dado("já existe um contato cadastrado com este celular") do
  puts "já existe um contato cadastrado com este celular"
  res = DAO.new.adiciona_contato(@novo_contato)
end

Quando('faço o cadastro deste novo contato') do
  puts 'faço o cadastro deste novo contato'
  
  @contato_page.visita
  @contato_page.salvar(@novo_contato)
 
end

Então('devo ver a mensagem de alerta {string}') do |mensagem|
  puts 'devo ver a mensagem de alerta {string}'
    expect(@contato_page.alert_box).to have_content mensagem
end

Então('este contato não deve ser inserido no banco de dados') do
  puts 'este contato não deve ser inserido no banco de dados'
  res = DAO.new.busca_por_celular(@novo_contato[:celular])
  expect(res).to be_nil
end

#### lista contato


Dado("que eu tenho os seguintes contatos cadastrados:") do |table|
  @lista_contato = table.hashes
  
  DAO.new.adiciona_lista_contato(@lista_contato)

end

Quando("acesso a minha agenda") do
 @contato_page.visita
 sleep 3
end

Então("devo ver estes registros na lista de contatos") do
  trs = @contato_page.retorna_trs
  puts trs
  @lista_contato.each_with_index do |v, i|
    expect(trs[i]).to have_content v[:nome]
    expect(trs[i]).to have_content v[:email]
    expect(trs[i]).to have_content v[:celular]
    expect(trs[i]).to have_content v[:tipo]
  end
end

Dado("que não possuo contatos cadastrados") do
  DAO.new.limpa_contatos
end

Então("devo ver a mensagem {string}") do |mensagem|
  expect(@contato_page.alert_info). to eql(mensagem)
end