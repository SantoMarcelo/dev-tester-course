import { Template } from 'meteor/templating'
import { mongo } from 'meteor/mongo';

const Contato = new Mongo.Collection('contatos');

import './main.html'

Meteor.startup(function () {

    sAlert.config({
        effect: '',
        position: 'bottom',
        timeout: 5000
    })

})

Template.listaContato.helpers({

    'minhaLista': function () {
        // var contatos = [
        //     {nome: 'Marcelo', email: 'eu@eu.io', celular: '9999999999', tipo: 'SMS'},
        //     {nome: 'Badeco', email: 'eu@eu.io', celular: '8888888888', tipo: 'Whats'},
        //     {nome: 'Jose', email: 'eu@eu.io', celular: '77777777777', tipo: 'Telegram'},
        //     {nome: 'Maria', email: 'eu@eu.io', celular: '6666666666', tipo: 'SMS'}
        // ]]
        var contatos = Contato.find().fetch();

        return contatos
    },

    'retornaIcone': function (tipo) {
        switch (tipo) {
            case 'Whats':
                return 'fa-whatsapp';
            case 'Telegram':
                return 'fa-telegram';
            case 'SMS':
                return 'fa-comment';
            default:
                null;
        }

    }
}),



    Template.novoContato.events({
        'click #salvarContato'(event, instance) {
            event.preventDefault();

            var form = {
                nome: $('input[name=nome]').val(),
                email: $('input[name=email]').val(),
                celular: $('input[name=celular').val(),
                tipo: $('select[name=tipo').val()
            }

            if (form.nome == "") {
                // alert('Ops. O nome deve ser preenchido.');
                // error => vermelho
                // success => verde
                // info => azul
                // warning => amarelo
                sAlert.info('Ops. O nome deve ser preenchido.')
                return false;
            } else if (form.celular == "") {
                sAlert.info('Ops. O celular deve ser preenchido.');
                return false;
            } else if (form.tipo == null) {
                sAlert.info('Ops. Por favor selecione um tipo de contato.')
                return false;
            }

            Meteor.call('inserirContato', form, function (err, res) {
                if (err) {
                    sAlert.error(err.reason)
                    return false;
                } else {
                    sAlert.success('Contato cadastrado com sucesso.')
                    
                }
            })
            $('input[name=nome]').val('')
                    $('input[name=email]').val('')
                    $('input[name=celular').val('')
                    $('select[name=tipo').val('')
            
        },
        'click #deleteContato'(event, instance) {
            // Deletar um contato
        }
    });

