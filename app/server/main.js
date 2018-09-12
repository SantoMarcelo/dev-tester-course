import { Meteor } from "meteor/meteor";
import { onPageLoad } from "meteor/server-render";
import { Mongo } from 'meteor/mongo';

Meteor.startup(() => {
  // Code to run on server startup.

  const Contato = new Mongo.Collection('contatos');

  Meteor.methods({
    'inserirContato'(contato) {
      Contato.insert(contato);
    }
  });

});

onPageLoad(sink => {
  // Code to run on every request.
  sink.renderIntoElementById(
    "server-render-target",
    `Server time: ${new Date}`
  );
});
