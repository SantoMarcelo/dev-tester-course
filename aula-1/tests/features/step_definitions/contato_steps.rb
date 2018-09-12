Dado("que {string} é meu novo contato") do |nome| 
  @nome = nome
end                                                                            
                                                                                 
Dado("este contato possui os seguintes dados:") do |table|                     
 @contato = table.rows_hash
 
end

Quando("faço o cadastro deste novo contato") do                                
  visit 'http://127.0.0.1:3000'  
  find('input[placeholder="Nome completo"]').set(@nome)
  find('input[placeholder="Email"]').set(@contato[:email])
  find('input[placeholder="Celular"]').set(@contato[:celular])
  #find('select[]')
  
  if @contato[:tipo] != ""
    tipo_contato = find('#tipo')
    tipo_contato.find('option', text: @contato[:tipo]).select_option
  end
  click_on 'Cadastrar'
 
end                                                                            
                                                                                 
Então("devo ver a seguinte mensagem de sucesso {string}") do |mensagem|  
  sleep 2        
 msg = page.driver.browser.switch_to.alert.text
 expect(msg).to eql mensagem
end                                                                            