Dado("que {string} é meu novo contato") do |nome| 
  @nome = nome
end                                                                            
                                                                                 
Dado("este contato possui os seguintes dados:") do |table|                     
 @contato = table.rows_hash
 
end

Quando("faço o cadastro deste novo contato") do                                
  visit 'http://127.0.0.1:8080/form-novo.html'  
  find('input[placeholder="Nome Completo"]').set(@nome)
  find('input[placeholder="Email"]').set(@contato[:email])
  find('input[placeholder="Celular"]').set(@contato[:celular])
  #find('select[]')
  
  
  tipo_contato = find('#tipo')
  tipo_contato.find('option', text: @contato[:tipo]).select_option
  click_on 'Cadastrar'
 
end                                                                            
                                                                                 
Então("devo ver a seguinte mensagem de sucesso {string}") do |mensagem|          
 expect(page).to have_content mensagem
end                                                                            