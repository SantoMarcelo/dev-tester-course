#language: pt

Funcionalidade: Lista contatos
Sendo um usuário que possui contatos cadastrados
Posso acessar a minha agenda
Para que eu possa ver a minha lista de contatos
@listaContatos
Cenario: Listar contatos

    Dado que eu tenho os seguintes contatos cadastrados:
        |nome        |email          |celular   |tipo     |
        |José Silva  |jose@marvel.com|1188881001|Whats    |
        |Macos       |macos@stark.com|1188881002|Telegram |
        
    Quando acesso a minha agenda
    Então devo ver estes registros na lista de contatos

@temp
Cenario: Nenhum contato cadastrado
    Dado que não possuo contatos cadastrados
    Quando acesso a minha agenda
    Então devo ver a mensagem "voce ainda nao possui contatos cadastrados."
