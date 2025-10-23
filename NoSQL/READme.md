Creation d'une base sur mongoDB (exemple base sur des voiiers)

- Création d'une base : use voilier

- Création du dossier dans la base : db.createCollection('voiliers')

-Mettre les différent voiliers :

Le premier voilier : 

    db.voiliers.insertOne({Marque: 'edel2', longueur: 10, prix: 8000, date_achat: ISODate('2020-10-05T08:00:00Z')})


Le deuxième voilier :

    db.voiliers.insertOne({Marque: 'first21', longueur: 12, prix: 30000, date_achat: ISODate('2020-05-20T12:00:00Z')})



Pour vérifier si les données ont été entrées : db.voiliers.find()


-On veut modifier le prix du 2ème voilier, de 30000 le prix passe à 20000 € :

    db.voiliers.updateOne({Marque: 'first21'}, {$set: {prix: 20000}})

Pareil pour voir si le prix a bien été modifier : db.voiliers.find()



Pour supprimer la longueur du 1er voilier : db.voiliers.updateOne({Marque: 'edel2'}, {$unset: {longueur: 1}})


Pour supprimer entièrement le 1er voilier : db.voiliers.remove({Marque: 'edel2'})

