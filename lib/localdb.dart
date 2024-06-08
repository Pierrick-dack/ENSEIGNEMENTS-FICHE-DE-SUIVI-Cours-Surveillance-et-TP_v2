import 'dart:convert';
import 'dart:io';

import 'package:firstapp/api.dart';
import 'package:firstapp/models/admin.dart';
import 'package:firstapp/models/cours.dart';
import 'package:firstapp/models/delegue.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/models/fiche.dart';
import 'package:firstapp/models/filiere.dart';
import 'package:firstapp/models/niveau.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:firstapp/urls.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Database? _database;

class LocalDataBase {
  LocalDataBase(this.context);

  final BuildContext context;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();

    const dbName = 'projet';

    final path = join(dbpath, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(chefsTable);
    await db.execute(coursTable);
    await db.execute(deleguesTable);
    await db.execute(enseignantsTable);
    await db.execute(ficheTable);
    await db.execute(filieresTable);
    await db.execute(niveauxTable);
  }

  static const coursTable = '''

    CREATE TABLE cours(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codeUE VARCHAR(64) NOT NULL,
      intituleUE VARCHAR(255) NOT NULL
    );''';

  static const chefsTable = '''
    CREATE TABLE chefs(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nomCD VARCHAR(255) NOT NULL,
      emailCD VARCHAR(255) NOT NULL,
      mdpCD VARCHAR(255) NOT NULL
    );''';

  static const deleguesTable = '''
      CREATE TABLE delegues(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameDel VARCHAR(255) NOT NULL,
        matDel VARCHER(8) NOT NULL,
        mdpDel VARCHAR(255) NOT NULL
      );''';

  static const enseignantsTable = '''
      CREATE TABLE enseignants(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nomEns VARCHAR(255) NOT NULL, 
        emailEns VARCHAR(255) NOT NULL,
        numBurEns VARCHAR(64) NOT NULL,
        mdpEns VARCHAR(255) NOT NULL
      );''';

  static const ficheTable = '''
      CREATE TABLE fiches(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        semestre INTEGER NOT NULL,
        date DATE NOT NULL,
        codeCours VARCHAR(64) NOT NULL,
        enseignant VARCHAR(255) NOT NULL,
        heureDebut TIME NOT NULL, 
        heureFin TIME NOT NULL, 
        totalHeures VARCHAR(255) NOT NULL,
        salle VARCHAR(64) NOT NULL,
        typeSeance VARCHAR(32) NOT NULL,
        titreSeance VARCHAR(255) NOT NULL, 
        niveaux TEXT(64) NOT NULL,
        contenu TEXT NOT NULL,
        signatureDelegue TEXT(256),
        signatureProf TEXT(256),
        confidentialite TINYINT NOT NULL
      );''';

  static const filieresTable = '''
      CREATE TABLE filieres(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codeFil VARCHAR(16) NOT NULL,
        intFil VARCHAR(64) NOT NULL
      );''';

  static const niveauxTable = '''
      CREATE TABLE niveaux(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numero INTEGER NOT NULL
      );''';

  Future<void> addProfesseur(
      Enseignant enseignant, BuildContext context) async {
    EasyLoading.init();
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;

      await db.insert('enseignants', enseignant.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      //print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout du Compte Professeur');
    }
  }

  Future<void> addDelegue(Delegue delegue, BuildContext context) async {
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );

    try {
      final db = await database;
      await db.insert('delegues', delegue.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout du délégué');
    }
  }

  Future<void> addAdmin(Admin admin, BuildContext context) async {
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;
      await db.insert('chefs', admin.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      //print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de l\'utilisateur');
    }
  }

  Future<void> addCours(Cours cours, BuildContext context) async {
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;
      await db.insert('cours', cours.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      //print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout du cours');
    }
  }

  Future<void> addFiche(Fiche fiche, BuildContext context) async {
    
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;
      await db.insert('fiches', fiche.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de la fiche de suivi');
    }
  }

  Future<void> addFiliere(Filiere filiere, BuildContext context) async {
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;
      await db.insert('filiere', filiere.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      //print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de la filiere');
    }
  }

  Future<void> addNiveaux(Niveau niveau, BuildContext context) async {
    EasyLoading.show(
      status: 'Chargement en cours',
      dismissOnTap: false,
    );
    try {
      final db = await database;
      await db.insert('niveaux', niveau.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      EasyLoading.showSuccess('Enregistrement Effectué');
    } catch (e) {
      //print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout du niveau');
    }
  }

  Future<List<Admin>> getAdmin() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query('chefs', orderBy: 'id');
    return List.generate(
      items.length,
      (index) => Admin(
          id: items[index]['id'],
          nomCD: items[index]['nomCD'],
          emailCD: items[index]['emailCD'],
          mdpCD: items[index]['mdpCD']
          //classeDel: items[index]['classeDel']
          ),
    );
  }

  Future<List<Delegue>> getDelegues() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('delegues', orderBy: 'id');
    return List.generate(
      items.length,
      (index) => Delegue(
          id: items[index]['id'],
          nameDel: items[index]['nameDel'],
          mdpDel: items[index]['mdpDel'],
          matDel: items[index]['matDel']),
    );
  }

  Future<List<Enseignant>> getEnseignants() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('enseignants', orderBy: 'id');
    return List.generate(
      items.length,
      (index) => Enseignant(
          id: items[index]['id'],
          nomEns: items[index]['nomEns'],
          emailEns: items[index]['emailEns'],
          numBurEns: items[index]['numBurEns'],
          mdpEns: items[index]['mdpEns']),
    );
  }

  Future<List<Cours>> getCours() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('cours', orderBy: 'codeUE');
    return List.generate(
      items.length,
      (index) => Cours(
          codeUE: items[index]['codeUe'], intituleUE: items[index]['codeUE']),
    );
  }

  Future<List<Fiche>> getFicheProf(Enseignant enseignant) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiches',
        where: "enseignant == ?", whereArgs: [enseignant.nomEns]);
    return List.generate(
      items.length,
      (index) => Fiche(
          id: items[index]['id'],
          semestre: items[index]['semestre'],
          date: items[index]['date'],
          codeCours: items[index]['codeCours'],
          enseignant: items[index]['enseignant'],
          heureDebut: items[index]['heureDebut'],
          heureFin: items[index]['heureFin'],
          totalHeures: items[index]['totalHeures'],
          salle: items[index]['salle'],
          typeSeance: items[index]['typeSeance'],
          titreSeance: items[index]['titreSeance'],
          niveaux: items[index]['niveaux'],
          contenu: items[index]['contenu'], 
          confidentialite: items[index]['confidentialite']),
    );
  }

  Future<List<Fiche>> getFiche() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('fiches', orderBy: 'date');
    return List.generate(
      items.length,
      (index) => Fiche(
          id: items[index]['id'],
          semestre: items[index]['semestre'],
          date: items[index]['date'],
          codeCours: items[index]['codeCours'],
          enseignant: items[index]['enseignant'],
          heureDebut: items[index]['heureDebut'],
          heureFin: items[index]['heureFin'],
          totalHeures: items[index]['totalHeures'],
          salle: items[index]['salle'],
          typeSeance: items[index]['typeSeance'],
          titreSeance: items[index]['titreSeance'],
          niveaux: items[index]['niveaux'],
          contenu: items[index]['contenu'], 
          confidentialite: items[index]['confidentialite']),
    );
  }

  Future<List<Filiere>> getFiliere() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query('filiere', orderBy: 'id');
    return List.generate(
        items.length,
        (index) => Filiere(
            id: items[index]['id'],
            codeFil: items[index]['codeFil'],
            intFil: items[index]['intFil']));
  }

  Future<List<Niveau>> getNiveau() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query('filiere', orderBy: 'id');
    return List.generate(
      items.length,
      (index) => Niveau(id: items[index]['id'], numero: items[index]['numero']),
    );
  }

  /*Future<void> sendToApi() async {
    EasyLoading.show(status: "Chargement... ", dismissOnTap: true);

    try {
      final delegue = Uri.parse(Urls.enregistrerDelegue);

      final jsonData = await getAllDataFromDataBase();

      var api = API();
      print(delegue.toString());
      print("envoie de la requete");
      /*api.postRequest(route: delegue.toString(), data: jsonData['delegues']);
      var response = await api.postRequest(
          route: delegue.toString(), data: jsonData['delegues']);*/

      final response = await http.post(delegue,
          headers: {
            'Accept': 'application/json',
          },
          body: jsonData['delegues']);
      print("envoie effectué");
      /*final response = await http.post(delegue,
          headers: {
            'Accept': 'application/json',
          },
          body: jsonData['delegues']);*/

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("enregistrement reussi",
            duration: const Duration(milliseconds: 2000));
      } else {
        print("l'enregistrement n'a pas reussi");
        print(
            'Envoie non effectué des donnees. Status code: ${response.statusCode}');
      }
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
        print("l'erreur $e");
      }
      EasyLoading.showError(
        "veuillez réessayer",
        duration: const Duration(milliseconds: 2500),
      );
    }
  }*/

  Future<Map<String, String>> getAllDataFromDataBase() async {
    final db = await database;

    final List<Map<String, dynamic>> chefs = await db.query('chefs');
    final List<Map<String, dynamic>> cours = await db.query('cours');
    final List<Map<String, dynamic>> delegues = await db.query('delegues');
    final List<Map<String, dynamic>> enseignant = await db.query('enseignants');
    final List<Map<String, dynamic>> fiche = await db.query('fiches');
    final List<Map<String, dynamic>> filiere = await db.query('filieres');
    final List<Map<String, dynamic>> niveaux = await db.query('niveaux');

    final chefsJson = json.encode({'chefs': chefs});
    final coursJson = json.encode({'cours': cours});
    final deleguesJson = json.encode({'delegues': delegues});
    final enseignantsJson = json.encode({'enseignants': enseignant});
    final ficheJson = json.encode({'fiches': fiche});
    final filiereJson = json.encode({'filieres': filiere});
    final niveauxJson = json.encode({'niveaux': niveaux});

    return {
      'chefs': chefsJson,
      'cours': coursJson,
      'delegues': deleguesJson,
      'enseignants': enseignantsJson,
      'fiches': ficheJson,
      'filieres': filiereJson,
      'niveaux': niveauxJson
    };
  }
}
