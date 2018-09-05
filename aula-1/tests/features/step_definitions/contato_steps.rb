Dado("que {string} é meu novo contato") do |nome|                            
  @nome = nome
  find_element(text: '').set(nome)
end                                                                            
                                                                                 
Dado("este contato possui os seguintes dados:") do |table|                     
  # table is a Cucumber::MultilineArgument::DataTable                          
  pending # Write code here that turns the phrase above into concrete actions  
end                                                                            
                                                                                 
Quando("faço o cadastro deste novo contato") do                                
  pending # Write code here that turns the phrase above into concrete actions  
end                                                                            
                                                                                 
Então("devo ver a seguinte mensagem de sucesso {string}") do |mensagem|          
  pending # Write code here that turns the phrase above into concrete actions  
end                                                                            