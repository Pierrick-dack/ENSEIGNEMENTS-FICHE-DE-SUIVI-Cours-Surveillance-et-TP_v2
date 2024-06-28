import 'dart:ffi';

import 'package:firstapp/models/cours.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/models/fiche.dart';
import 'package:firstapp/models/niveau.dart';
import 'package:firstapp/vues/admin/delist.dart';
import 'package:firstapp/vues/admin/profilechef.dart';
import 'package:firstapp/vues/admin/uelist.dart';
import 'package:firstapp/vues/admin/userlist.dart';
import 'package:firstapp/vues/delegue/fiche_suivi.dart';
import 'package:firstapp/vues/delegue/fiches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firstapp/models/delegue.dart';
import 'package:firstapp/localdb.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() {
    return _DashboardAdmin();
  }
}

final TextEditingController nom = TextEditingController();
final TextEditingController matricule = TextEditingController();
final TextEditingController niveau = TextEditingController();
final TextEditingController text = TextEditingController();
final TextEditingController mdp = TextEditingController();

final TextEditingController nomP = TextEditingController();
final TextEditingController emailP = TextEditingController();
final TextEditingController mdpEns = TextEditingController();

String name = "";
String mat = "";
String mdpS = "";
String niv = "";

String nameP = "";
String mailP = "";
String mdpENS = "";
List<Niveau> niveaux = [];
List<String> list = ["L1", "L2", "L3", "M1", "M2"];
List<Widget> widgets = List.empty();

bool delegue = false;
bool prof = false;
var couleurIcon = Colors.transparent;
var couleurFond = Colors.transparent;

class _DashboardAdmin extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          title: const Text(
            "DASHBOARD",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.61,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Designwidget(
                                text: list[index],
                              ); // Ajoute le widget correspondant à l'élément de la liste
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          color: couleurIcon,
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.80,
                                              height: 250,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "CREATION D'UN COMPTE PROFESSEUR",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Form(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextFormField(
                                                              controller: nomP,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Nom du professeur: ",
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller:
                                                                  emailP,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Adresse email: ",
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller:
                                                                  mdpEns,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Mot de passe/code: ",
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green),
                                                ),
                                                onPressed: () async {
                                                  if (nomP.text.isEmpty ||
                                                      emailP.text.isEmpty ||
                                                      mdpEns.text.isEmpty) {
                                                    EasyLoading.showError(
                                                        'Vous avez une donnée qui vous manque',
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                  } else {
                                                    nameP = nomP.text;
                                                    mailP = emailP.text;
                                                    mdpENS = mdpEns.text;

                                                    Enseignant enseignant =
                                                        Enseignant(
                                                            nomEns: nameP,
                                                            emailEns: mailP,
                                                            mdpEns: mdpENS);
                                                    await LocalDataBase(context)
                                                        .addProfesseur(
                                                            enseignant,
                                                            context);

                                                    /*await LocalDataBase(context)
                                                        .sendToApi();*/
                                                    nomP.clear();
                                                    emailP.clear();
                                                    mdpEns.clear();
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                child: const Text(
                                                  "VALIDER",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.red),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    nomP.clear();
                                                    emailP.clear();
                                                    mdpEns.clear();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "ANNULER",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          style: ButtonStyle(
                            iconSize: const MaterialStatePropertyAll(40),
                            backgroundColor: MaterialStatePropertyAll(
                              couleurFond,
                            ),
                          ),
                          icon: const Icon(Icons.school),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          color: couleurIcon,
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "CREATION D'UN COMPTE DELEGUE",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Form(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextFormField(
                                                            controller: nom,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  "Nom du delegue: ",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                matricule,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  "Matricule",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: mdp,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  "Mot de passe",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: niveau,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  "Niveau",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green),
                                                ),
                                                onPressed: () async {
                                                  if (nom.text.isEmpty ||
                                                      matricule.text.isEmpty ||
                                                      niveau.text.isEmpty ||
                                                      mdp.text.isEmpty) {
                                                    EasyLoading.showError(
                                                        'Vous avez une donnée qui vous manque',
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                  } else {
                                                    bool matExist = false;
                                                    name = nom.text;
                                                    mat = matricule.text;
                                                    niv =
                                                        niveau.text.toString();
                                                    mdpS = mdp.text;
                                                    recupDele(
                                                        delegues, context);
                                                    print(delegues);
                                                    for (int i = 0;
                                                        i < delegues.length;
                                                        i++) {
                                                      if (delegues[i].matDel ==
                                                          mat) {
                                                        matExist = true;
                                                      }
                                                    }

                                                    if (matExist == false) {
                                                      Delegue delegue = Delegue(
                                                          nameDel: name,
                                                          mdpDel: mdpS,
                                                          nivDel: niv,
                                                          matDel: mat);
                                                      // ignore: use_build_context_synchronously
                                                      await LocalDataBase(
                                                              context)
                                                          .addDelegue(
                                                              delegue, context);

                                                      nom.clear();
                                                      niveau.clear();
                                                      matricule.clear();

                                                      // ignore: use_build_context_synchronously
                                                      Navigator.of(context)
                                                          .pop();

                                                      // ignore: use_build_context_synchronously
                                                      /*await LocalDataBase(context)
                                                        .sendToApi();*/
                                                    } else {
                                                      EasyLoading.showInfo(
                                                          "Vous avez deja un etudiant avec le meme matricule");
                                                    }
                                                  }
                                                },
                                                child: const Text(
                                                  "VALIDER",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.red),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    nom.clear();
                                                    niveau.clear();
                                                    matricule.clear();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "ANNULER",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          style: ButtonStyle(
                            iconSize: const MaterialStatePropertyAll(40),
                            backgroundColor: MaterialStatePropertyAll(
                              couleurFond,
                            ),
                          ),
                          icon: const Icon(Icons.person),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          style: const ButtonStyle(
                            iconSize: MaterialStatePropertyAll(40),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 171, 176, 250),
                            ),
                          ),
                          onPressed: () {
                            recupProf(enseignants, context);
                            setState(
                              () {
                                if (delegue == false) {
                                  delegue = true;
                                  couleurFond =
                                      const Color.fromARGB(255, 171, 176, 250);
                                  couleurIcon = Colors.black;
                                } else {
                                  delegue = false;
                                  couleurFond = Colors.transparent;
                                  couleurIcon = Colors.transparent;
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.11,
          decoration:
              const BoxDecoration(color: Color.fromARGB(127, 189, 187, 187)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    iconSize: 40,
                    color: const Color.fromARGB(255, 5, 48, 69),
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                  ),
                  const Text("Home")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    iconSize: 40,
                    color: const Color.fromARGB(255, 5, 48, 69),
                    onPressed: () async {
                      recupUe(ues, context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => UeList(
                            ue: ues,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.book),
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(30),
                      iconColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                  const Text("UE")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    iconSize: 40,
                    color: const Color.fromARGB(255, 5, 48, 69),
                    onPressed: () {
                      List<Enseignant> enseignants = [];
                      List<Delegue> delegues = [];
                      recupProf(enseignants, context);
                      recupDele(delegues, context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => UserList(
                              enseignants: enseignants, delegues: delegues),
                        ),
                      );
                    },
                    icon: const Icon(Icons.school),
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(30),
                      iconColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                  const Text("Utilisateurs")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    iconSize: 40,
                    color: const Color.fromARGB(255, 5, 48, 69),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ProfileChef(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person),
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(30),
                      iconColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                  const Text("Profil")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class Classe extends StatelessWidget {
  const Classe({super.key, required this.classe});

  final String classe;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 85, 122),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Text("ici"),
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.98,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const UserList(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 178, 200, 237),
                  ),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                child: Text(
                  classe,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}*/

class Designwidget extends StatefulWidget {
  const Designwidget({
    Key? key,
    required this.text,
  });

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _DesignState();
  }
}

List<Fiche> fiches = [];

class _DesignState extends State<Designwidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.90,
          height: constraints.maxHeight * 0.80,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 170, 203, 255),
            border: Border.all(
                width: 3.0, color: const Color.fromARGB(255, 37, 85, 122)),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.text,
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                  onPressed: () {
                    recupfichesNiveau(fiches, widget.text, context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Fiches(fiches: fiches),
                      ),
                    );
                  },
                  icon: const Icon(Icons.library_books))
            ],
          ),
        );
      }),
    );
  }
}

List<Delegue> delegues = [];
List<Enseignant> enseignants = [];
List<Cours> ues = [];

void recupDele(List<Delegue> delegue, context) async {
  Future<List<Delegue>> delegues = LocalDataBase(context).getDelegues();
  List<Delegue> del = await delegues;
  if (delegue.isNotEmpty) {
    delegue.clear();
  }
  delegue.addAll(del);
}

void recupProf(List<Enseignant> enseignant, context) async {
  Future<List<Enseignant>> enseignants =
      LocalDataBase(context).getEnseignants();
  List<Enseignant> enseigne = await enseignants;
  if (enseignant.isNotEmpty) {
    enseignant.clear();
  }
  enseignant.addAll(enseigne);
}

void recupfichesNiveau(List<Fiche> fiches, String niveau, context) async {
  Future<List<Fiche>> fiche = LocalDataBase(context).getFicheNiveau(niveau);
  List<Fiche> fichess = await fiche;
  if (fiches.isNotEmpty) {
    fiches.clear();
  }
  fiches.addAll(fichess);
}

void recupAllsuivi(List<Fiche> fiche, context) async {
  Future<List<Fiche>> fiches = LocalDataBase(context).getFiche();
  List<Fiche> fichess = await fiches;
  if (fiche.isNotEmpty) {
    fiche.clear();
  }
  fiche.addAll(fichess);
}

void recupFichesNiveau(List<Fiche> fiche, String niveau, context) async {
  Future<List<Fiche>> fiches = LocalDataBase(context).getFicheNiveau(niveau);
  List<Fiche> fichess = await fiches;
  if (fiche.isNotEmpty) {
    fiche.clear();
  }
  fiche.addAll(fichess);
}

void recupUe(List<Cours> ue, context) async {
  Future<List<Cours>> cour = LocalDataBase(context).getCours();
  List<Cours> enseigne = await cour;
  if (ue.isNotEmpty) {
    ue.clear();
  }
  if (enseigne.isEmpty) {
    print("liste vide ue");
  } else {
    print("liste retiréé $ue");
  }
  ue.addAll(enseigne);
}
