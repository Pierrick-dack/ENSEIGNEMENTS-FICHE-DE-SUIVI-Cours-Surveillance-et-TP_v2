import 'dart:convert';
import 'package:firstapp/api.dart';
import 'package:firstapp/models/admin.dart';
import 'package:firstapp/models/cours.dart';
import 'package:firstapp/models/delegue.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/models/fiche.dart';
import 'package:firstapp/models/fichesurveillance.dart';
import 'package:firstapp/models/fichetravaux.dart';
import 'package:firstapp/models/niveau.dart';
import 'package:firstapp/models/semestre.dart';
import 'package:firstapp/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
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
    await db.execute(classeTable);
    await db.execute(semestreTable);
    await db.execute(filiereTable);
    await db.execute(niveauEtudeTable);
    await db.execute(ficheSurveillanceTable);
    await db.execute(ficheTravauxTable);
  }

  static const coursTable = '''

    CREATE TABLE cours(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
      codeUE TEXT NOT NULL,
      intituleUE TEXT NOT NULL,
      niveau_id INTEGER,
      semestre_id INTEGER,
      FOREIGN KEY (niveau_id) REFERENCES niveaux(id),
      FOREIGN KEY (semestre_id) REFERENCES semestre(id)
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
        mdpDel VARCHAR(255) NOT NULL,
        nivDel VARCHAR(255) NOT NULL
      );''';

  static const enseignantsTable = '''
      CREATE TABLE enseignants(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nomEns VARCHAR(255) NOT NULL, 
        emailEns VARCHAR(255) NOT NULL,
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

  static const classeTable = '''
      CREATE TABLE classes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        className VARCHAR(32) NOT NULL,
        classDescription VARCHAR(255) NOT NULL
      );''';

  static const ficheSurveillanceTable = '''
      CREATE TABLE fiche_surveillance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        chefDeSalle VARCHAR(64) NOT NULL,
        salle VARCHAR(64) NOT NULL,
        date DATE NOT NULL,
        session VARCHER(64) NOT NULL,
        codeCours VARCHAR(64) NOT NULL,
        intituleUE VARCHAR(64) NOT NULL,
        confirmation TINYINT NOT NULL
      )''';

  static const ficheTravauxTable = '''
      CREATE TABLE fiche_travaux_pratiques(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titreSeanceTP VARCHAR(64) NOT NULL,
        enseignant VARCHAR(64) NOT NULL,
        codeCours VARCHAR(64) NOT NULL,
        heureDebut TIME NOT NULL,
        heureFin TIME NOT NULL,
        objectifsTP VARCHAR(256) NOT NULL,
        materielNecessaire VARCHAR(256) NOT NULL,
        procedure VARCHAR(256) NOT NULL,
        observation VARCHAR(256) NOT NULL,
        resultatsAttendus VARCHAR(256) NOT NULL
      )''';

  static const niveauEtudeTable = '''
      CREATE TABLE niveaux_etude(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codeNiveau VARCHAR(32) NOT NULL,
        intituleNiveau VARCHAR(256) NOT NULL
      )
      ''';

  static const semestreTable = '''
      CREATE TABLE semestres(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numSemestre VARCHAR(64) NOT NULL
      )''';

  static const filiereTable = '''
      CREATE TABLE filieres(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codeFil VARCHAR(64) NOT NULL,
        intFil VARCHAR(256) NOT NULL
      )''';

  Future<void> addProfesseur(
      Enseignant enseignant, BuildContext context) async {
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
      print("erreur $e");
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout du Compte Professeur');
    }
  }

  Future<void> updateNomProfessseur(
      Enseignant enseignant, BuildContext context) async {
    EasyLoading.show(status: "Chargement en cours", dismissOnTap: false);
    try {
      final db = await database;
      await db.update(
          'enseignants',
          {
            'nomEns': enseignant.nomEns,
            'emailEns': enseignant.emailEns,
            'mdpEns': enseignant.mdpEns
          },
          where: 'id==?',
          whereArgs: [enseignant.id]);

      EasyLoading.showSuccess("Information mise de jour avec succès",
          duration: const Duration(milliseconds: 2500));
    } catch (e) {
      print(e);
      EasyLoading.showError("Erreur lors de la mise à jour de l'information",
          duration: const Duration(milliseconds: 2500));
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
      print(e);
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

  Future<void> updateChef(Admin admin, BuildContext context) async {
    final db = await database;
    try {
      await db.update(
          'chefs',
          {
            'nomCD': admin.nomCD,
            'emailCD': admin.emailCD,
            'mdpCD': admin.mdpCD
          },
          where: 'id==?',
          whereArgs: [admin.id]);
      EasyLoading.showSuccess("Information mise de jour avec succès",
          duration: const Duration(milliseconds: 2500));
    } catch (e) {
      print(e);
      EasyLoading.showError("Erreur lors de la mise à jour de l'information",
          duration: const Duration(milliseconds: 2500));
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
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de la fiche de suivi');
    }
  }

  Future<void> addFicheTravaux(
      FicheTravaux ficheTravaux, BuildContext context) async {
    EasyLoading.show(status: 'Chargement en cours', dismissOnTap: false);
    try {
      final db = await database;
      await db.insert('fiche_travaux_pratiques', ficheTravaux.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      EasyLoading.showSuccess('Enregistrement effectué');
    } catch (e) {
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de la fiche de travaux pratique');
    }
  }

  Future<void> addFicheSurveillance(
      FicheSurveillance ficheSurveillance, BuildContext context) async {
    EasyLoading.show(status: 'Chargement en cours', dismissOnTap: false);
    try {
      final db = await database;
      await db.insert('fiche_surveillance', ficheSurveillance.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      EasyLoading.showSuccess('Enregistrement effectué');
    } catch (e) {
      EasyLoading.showError(
          duration: const Duration(milliseconds: 2500),
          'Erreur lors de l\'ajout de la fiche de surveillance');
    }
  }

  /*Future<void> addSemestre(Semestre semestre, BuildContext context) async {
    EasyLoading.show(status: "Chargement en cours", dismissOnTap: false);
    try {
      final db = await database;
      await db.insert('semestres', semestre.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      EasyLoading.showSuccess("Enregistrement effectué");
    } catch (e) {
      EasyLoading.showError("Erreur lors de l'ajout du niveau",
          duration: const Duration(milliseconds: 2500));
    }
  }*/

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
        matDel: items[index]['matDel'],
        nivDel: items[index]['nivDel'],
      ),
    );
  }

  Future<List<Niveau>> getNiveaux() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query('niveaux_etude');
    return List.generate(
        items.length,
        (index) => Niveau(
            codeNiveau: items[index]['codeNiveau'],
            intituleNiveau: items[index]['intituleNiveau']));
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
        mdpEns: items[index]['mdpEns'],
      ),
    );
  }

  Future<Enseignant> getOneEnseignant(Enseignant enseignant) async {
    final db = await database;

    final result = await db
        .query('enseignants', where: 'id == ?', whereArgs: [enseignant.id]);

    // ignore: unnecessary_cast
    final item = result.first as Map<String, dynamic>;

    return Enseignant(
        id: item['id'],
        nomEns: item['nomEns'],
        emailEns: item['emailEns'],
        mdpEns: item['mdpEns']);
  }

  Future<List<Cours>> getCours() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('cours', orderBy: 'codeUE');
    return List.generate(
      items.length,
      (index) => Cours(
          codeUE: items[index]['codeUe'],
          intituleUE: items[index]['codeUE'],
          niveau_id: items[index]['niveau_id'],
          semestre_id: items[index]['semestre_id']),
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
        date: DateTime.parse(items[index]['date']),
        codeCours: items[index]['codeCours'],
        enseignant: items[index]['enseignant'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        totalHeures: stringToTimeOfDay(items[index]['totalHeures']),
        salle: items[index]['salle'],
        typeSeance: items[index]['typeSeance'],
        titreSeance: items[index]['titreSeance'],
        niveaux: items[index]['niveaux'],
        contenu: items[index]['contenu'],
        signatureDelegue: items[index]['signatureDelegue'],
        signatureProf: items[index]['signatureProf'],
        confidentialite: items[index]['confidentialite'],
      ),
    );
  }

  Future<List<Fiche>> getFicheCours(Cours cours) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db
        .query('fiches', where: "codeCours == ?", whereArgs: [cours.codeUE]);
    return List.generate(
      items.length,
      (index) => Fiche(
        id: items[index]['id'],
        semestre: items[index]['semestre'],
        date: DateTime.parse(items[index]['date']),
        codeCours: items[index]['codeCours'],
        enseignant: items[index]['enseignant'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        totalHeures: stringToTimeOfDay(items[index]['totalHeures']),
        salle: items[index]['salle'],
        typeSeance: items[index]['typeSeance'],
        titreSeance: items[index]['titreSeance'],
        niveaux: items[index]['niveaux'],
        contenu: items[index]['contenu'],
        signatureDelegue: items[index]['signatureDelegue'],
        signatureProf: items[index]['signatureProf'],
        confidentialite: items[index]['confidentialite'],
      ),
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
        date: DateTime.parse(items[index]['date']),
        codeCours: items[index]['codeCours'],
        enseignant: items[index]['enseignant'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        totalHeures: stringToTimeOfDay(items[index]['totalHeures']),
        salle: items[index]['salle'],
        typeSeance: items[index]['typeSeance'],
        titreSeance: items[index]['titreSeance'],
        niveaux: items[index]['niveaux'],
        contenu: items[index]['contenu'],
        signatureDelegue: items[index]['signatureDelegue'],
        signatureProf: items[index]['signatureProf'],
        confidentialite: items[index]['confidentialite'],
      ),
    );
  }

  Future<List<Fiche>> getFicheNiveau(String niveau) async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query('fiches',
        orderBy: 'date', where: 'niveaux==?', whereArgs: [niveau]);
    return List.generate(
      items.length,
      (index) => Fiche(
        id: items[index]['id'],
        semestre: items[index]['semestre'],
        date: DateTime.parse(items[index]['date']),
        codeCours: items[index]['codeCours'],
        enseignant: items[index]['enseignant'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        totalHeures: stringToTimeOfDay(items[index]['totalHeures']),
        salle: items[index]['salle'],
        typeSeance: items[index]['typeSeance'],
        titreSeance: items[index]['titreSeance'],
        niveaux: items[index]['niveaux'],
        contenu: items[index]['contenu'],
        signatureDelegue: items[index]['signatureDelegue'],
        signatureProf: items[index]['signatureProf'],
        confidentialite: items[index]['confidentialite'],
      ),
    );
  }

  Future<List<FicheTravaux>> getFicheTravaux() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('fiche_travaux_pratiques');
    return List.generate(
      items.length,
      (index) => FicheTravaux(
        id: items[index]['id'],
        titreSeanceTP: items[index]['titreSeanceTP'],
        enseignant: items[index]['enseignant'],
        codeCours: items[index]['codeCours'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        objectifsTP: items[index]['objectifsTP'],
        materielNecessaire: items[index]['materielNecessaire'],
        procedureTP: items[index]['procedureTP'],
        observation: items[index]['observation'],
        resultatsAttendus: items[index]['resultatsAttendus'],
      ),
    );
  }

  Future<List<FicheTravaux>> getFicheTravauxProf(Enseignant enseignant) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiche_travaux_pratiques',
        where: "enseignant == ?", whereArgs: [enseignant.nomEns]);
    return List.generate(
      items.length,
      (index) => FicheTravaux(
        id: items[index]['id'],
        titreSeanceTP: items[index]['titreSeanceTP'],
        enseignant: items[index]['enseignant'],
        codeCours: items[index]['codeCours'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        objectifsTP: items[index]['objectifsTP'],
        materielNecessaire: items[index]['materielNecessaire'],
        procedureTP: items[index]['procedureTP'],
        observation: items[index]['observation'],
        resultatsAttendus: items[index]['resultatsAttendus'],
      ),
    );
  }

  Future<List<FicheTravaux>> getFicheTravauxCours(Cours cours) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiche_travaux_pratiques',
        where: "CodeCours == ?", whereArgs: [cours.codeUE]);
    return List.generate(
      items.length,
      (index) => FicheTravaux(
        id: items[index]['id'],
        titreSeanceTP: items[index]['titreSeanceTP'],
        enseignant: items[index]['enseignant'],
        codeCours: items[index]['codeCours'],
        heureDebut: stringToTimeOfDay(items[index]['heureDebut']),
        heureFin: stringToTimeOfDay(items[index]['heureFin']),
        objectifsTP: items[index]['objectifsTP'],
        materielNecessaire: items[index]['materielNecessaire'],
        procedureTP: items[index]['procedureTP'],
        observation: items[index]['observation'],
        resultatsAttendus: items[index]['resultatsAttendus'],
      ),
    );
  }

  Future<List<FicheSurveillance>> getFicheSurveillance() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiche_surveillance');
    return List.generate(
      items.length,
      (index) => FicheSurveillance(
        id: items[index]['id'],
        chefDeSalle: items[index]['chefDeSalle'],
        salle: items[index]['salle'],
        date: DateTime.parse(items[index]['date']),
        session: items[index]['session'],
        codeCours: items[index]['codeCours'],
        intituleUE: items[index]['intituleUE'],
        confirmation: items[index]['confirmation'],
      ),
    );
  }

  Future<List<FicheSurveillance>> getFicheSurveillanceProf(
      Enseignant enseignant) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiche_surveillance',
        where: "chefDeSalle == ?", whereArgs: [enseignant.nomEns]);
    return List.generate(
      items.length,
      (index) => FicheSurveillance(
        id: items[index]['id'],
        chefDeSalle: items[index]['chefDeSalle'].toString(),
        salle: items[index]['salle'].toString(),
        date: DateTime.parse(items[index]['date']),
        session: items[index]['session'].toString(),
        codeCours: items[index]['codeCours'].toString(),
        intituleUE: items[index]['intituleUE'].toString(),
        confirmation: items[index]['confirmation'],
      ),
    );
  }

  Future<List<FicheSurveillance>> getFicheSurveillanceCours(Cours cours) async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('fiche_surveillance',
        where: "CodeCours == ?", whereArgs: [cours.codeUE]);
    return List.generate(
      items.length,
      (index) => FicheSurveillance(
        chefDeSalle: items[index]['chefDeSalle'],
        salle: items[index]['salle'],
        date: DateTime.parse(items[index]['date']),
        session: items[index]['session'],
        codeCours: items[index]['codeCours'],
        intituleUE: items[index]['intituleUE'],
        confirmation: items[index]['confirmation'],
      ),
    );
  }

  Future<List<Semestre>> getSemestre() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('semestres', orderBy: 'id');

    return List.generate(
        items.length,
        (index) => Semestre(
              id: items[index]['id'],
              numSemestre: items[index]['numSemestre'],
            ));
  }

  void suppressionDelegue(Delegue delegue) async {
    final db = await database;

    await db.delete('delegues', where: 'id==?', whereArgs: [delegue.id]);
  }

  Future<Semestre> getOneSemestre(String semestre) async {
    final db = await database;
    final items = await db.query('semestres',
        where: 'numSemestre==?', whereArgs: [semestre.toString()]);

    // ignore: unnecessary_cast
    final item = items.first as Map<String, dynamic>;
    return Semestre(
      id: item['id'],
      numSemestre: item['numSemestre'],
    );
  }

  Future<void> sendToApi() async {
    EasyLoading.show(status: "Chargement... ", dismissOnTap: true);
    final db = await database;
    try {
      final prof = Uri.parse(Urls.enregistrerProf);
      final jsonData = await getAllDataFromDataBase();
      var api = API();

      api.postRequest(route: prof.toString(), data: jsonData['enseignants']);
    } on http.ClientException catch (e) {
      print("Erreur de connexion : $e");
      EasyLoading.showError(
        "Erreur de connexion",
        duration: const Duration(milliseconds: 2500),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("l'erreur ${e.toString()}");
      }
      EasyLoading.showError(
        "veuillez réessayer",
        duration: const Duration(milliseconds: 2500),
      );
    }
  }

  Future<Map<String, String>> getAllDataFromDataBase() async {
    final db = await database;

    final List<Map<String, dynamic>> chefs = await db.query('chefs');
    final List<Map<String, dynamic>> cours = await db.query('cours');
    final List<Map<String, dynamic>> delegues = await db.query('delegues');
    final List<Map<String, dynamic>> enseignant = await db.query('enseignants');
    final List<Map<String, dynamic>> fiche = await db.query('fiches');
    final List<Map<String, dynamic>> niveaux = await db.query('niveaux');
    final List<Map<String, dynamic>> semestres = await db.query('semestres');
    //final List<Map<String, dynamic>> ficheSurveillance =
    //await db.query('fiche_surveillance');

    final chefsJson = json.encode(chefs);
    final coursJson = json.encode(cours);
    final deleguesJson = json.encode(delegues);
    final enseignantsJson = jsonEncode(enseignant);
    final ficheJson = json.encode(fiche);
    final semestreJson = jsonEncode(semestres);
    final niveauxJson = json.encode(niveaux);
    //final ficheSurveillanceJson = json.encode(ficheSurveillance);

    return {
      'chefs': chefsJson,
      'cours': coursJson,
      'delegues': deleguesJson,
      'enseignants': enseignantsJson,
      'fiches': ficheJson,
      'niveaux': niveauxJson,
      'semestres': semestreJson,
      //'fiche_surveillance': ficheSurveillanceJson
    };
  }

  void updateBd() async {
    final db = await database;
    await db.delete('enseignants', where: 'nomEns==onana');
  }
}

TimeOfDay stringToTimeOfDay(String tod) {
  // Vérifiez si la chaîne est déjà au format TimeOfDay(hh:mm)
  if (tod.startsWith('TimeOfDay')) {
    final format = RegExp(r'TimeOfDay\((\d{2}):(\d{2})\)');
    final match = format.firstMatch(tod);
    if (match != null) {
      final hours = int.parse(match.group(1)!);
      final minutes = int.parse(match.group(2)!);
      return TimeOfDay(hour: hours, minute: minutes);
    }
  } else {
    // Sinon, essayez le format HH:MM:SS
    final format = RegExp(r'(\d{2}):(\d{2}):(\d{2})');
    final match = format.firstMatch(tod);
    if (match != null) {
      final hours = int.parse(match.group(1)!);
      final minutes = int.parse(match.group(2)!);
      return TimeOfDay(hour: hours, minute: minutes);
    }
  }
  throw FormatException('Invalid TimeOfDay format: $tod');
}
