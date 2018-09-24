class ContatoPage
    include Capybara::DSL
    def visita
        visit 'http://localhost:3000'
    end

    def salvar(contato)
        find('input[placeholder="Nome completo"]').set contato[:nome]
        find('input[id*=txtEmail]').set contato[:email]
        find('input[data-test=celular]').set contato[:celular]
        if contato[:tipo] != ''
          tipo_contato = find('#tipo')
          tipo_contato.find('option', text: contato[:tipo]).select_option
        end
        click_on 'Cadastrar'
    end

    def alert_box
        find('.s-alert-box')
    end
    
    def retorna_trs
      all('.table tr')
    end

    def alert_info
        find('.alert-info').text
    end
end