import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/cours.dart';
import 'package:firstapp/models/filiere.dart';
import 'package:firstapp/models/niveau.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UeList extends StatefulWidget {
  const UeList({super.key});

  @override
  State<UeList> createState() {
    return _UeList();
  }
}

void recupUe(List<Cours> ue, context) async {
  Future<List<Cours>> cour = LocalDataBase(context).getCours();
  List<Cours> enseigne = await cour;
  if (ue.isNotEmpty) {
    ue.clear();
  }
  ue.addAll(enseigne);
}

void recupFil(List<Filiere> filiere, context) async {
  Future<List<Filiere>> fil = LocalDataBase(context).getFiliere();
  List<Filiere> filier = await fil;
  if (filiere.isNotEmpty) {
    filiere.clear();
  }
  filiere.addAll(filier);
}

void recupNiv(List<Niveau> niveau, context) async {
  Future<List<Niveau>> niv = LocalDataBase(context).getNiveau();
  List<Niveau> nivo = await niv;
  if (niveau.isNotEmpty) {
    niveau.clear();
  }
  niveau.addAll(nivo);
}

List<Cours> cours = [];
List<Filiere> filieres = [];
List<Niveau> niveaux = [];

bool visible = false;
Icon iconeBouton = const Icon(Icons.add);
var couleuricon = const MaterialStatePropertyAll(Colors.transparent);
var couleurfond = const MaterialStatePropertyAll(Colors.transparent);

TextEditingController nomfiliere = TextEditingController();
TextEditingController numeroNiveau = TextEditingController();
TextEditingController codeUe = TextEditingController();
TextEditingController intituleUe = TextEditingController();
TextEditingController codefiliere = TextEditingController();
TextEditingController filiere = TextEditingController();

class _UeList extends State<UeList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "UNITES D'ENSEIGNEMENTS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              WidgetCours(
                  filiere: "ICT ",
                  niveau: 3,
                  professeur: "Dr NZEKON",
                  ue: "ICT 301")
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "CREATION D'UNE UNITE D'ENSEIGNEMENT",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller: codeUe,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Code de l'unité d'enseignement :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: intituleUe,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Intitulé de l'unité d'enseignement :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (codeUe.text.isEmpty ||
                                                          intituleUe
                                                              .text.isEmpty 
                                                          ) {
                                                        EasyLoading.showError(
                                                            "Vous avez une donnée manquante");
                                                      } else {
                                                        bool isExistedcode =
                                                            false;
                                                        bool isExistedinti =
                                                            false;
                                                        recupUe(cours, context);
                                                        for (int i = 0;
                                                            i < cours.length;
                                                            i++) {
                                                          if (cours[i].codeUE ==
                                                              codeUe.text) {
                                                            isExistedcode =
                                                                true;
                                                          } else if (cours[i]
                                                                  .intituleUE ==
                                                              intituleUe.text) {
                                                            isExistedinti =
                                                                true;
                                                          }
                                                        }
                                                        if (isExistedcode ==
                                                            true) {
                                                          EasyLoading.showInfo(
                                                              "Vous avez déjà une unite d'enseignement qui porte ce code. Vous ne pouvez pas en enregistrer une deuxieme au meme code");
                                                        } else if (isExistedinti ==
                                                            true) {
                                                          EasyLoading.showInfo(
                                                              "Vous avez déjà une unite d'enseignement qui porte ce intitulé. Vous ne pouvez pas en enregistrer une deuxieme au meme intitulé");
                                                        } else {
                                                          Cours cour = Cours(
                                                              id: cours.length +
                                                                  1,
                                                              codeUE:
                                                                  codeUe.text,
                                                              intituleUE:
                                                                  intituleUe
                                                                      .text);
                                                          await LocalDataBase(
                                                                  context)
                                                              .addCours(cour,
                                                                  context);
                                                        }
                                                      }
                                                    },
                                                    style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.green),
                                                    ),
                                                    child: const Text(
                                                      "VALIDER",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.red)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.book),
                style: ButtonStyle(
                    iconColor: couleuricon,
                    iconSize: const MaterialStatePropertyAll(40),
                    backgroundColor: couleurfond),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "CREATION D'UNE FILIERE",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller: nomfiliere,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Nom de la filière :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: codefiliere,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Code de la filière :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      bool
                                                          isExistedFilIntitule =
                                                          false;
                                                      bool isExistedFilCode =
                                                          false;
                                                      if (nomfiliere
                                                              .text.isEmpty ||
                                                          codefiliere
                                                              .text.isEmpty) {
                                                        EasyLoading.showError(
                                                            "Il vous manque une information",
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        2500));
                                                      } else {
                                                        recupFil(
                                                            filieres, context);
                                                        for (int i = 0;
                                                            i < filieres.length;
                                                            i++) {
                                                          if (filieres[i]
                                                                  .intFil ==
                                                              nomfiliere.text) {
                                                            isExistedFilIntitule =
                                                                true;
                                                          } else if (filieres[i]
                                                                  .codeFil ==
                                                              codefiliere
                                                                  .text) {
                                                            isExistedFilCode =
                                                                true;
                                                          }
                                                        }
                                                        if (isExistedFilCode ==
                                                            true) {
                                                          EasyLoading.showInfo(
                                                              "Vous avez déjà une filière qui porte ce code. Vous ne pouvez en enregistrer un autre au meme code.");
                                                        } else if (isExistedFilIntitule ==
                                                            true) {
                                                          EasyLoading.showInfo(
                                                              "Vous avez deja une filiere qui porte cet intitulé. Vous ne pouvez pas en enregistrer une autre au meme intitulé.");
                                                        } else {
                                                          Filiere filiere = Filiere(
                                                              id: filieres
                                                                      .length +
                                                                  1,
                                                              codeFil:
                                                                  codefiliere
                                                                      .text,
                                                              intFil: nomfiliere
                                                                  .text);
                                                          LocalDataBase(context)
                                                              .addFiliere(
                                                                  filiere,
                                                                  context);
                                                        }
                                                      }
                                                    },
                                                    style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.green),
                                                    ),
                                                    child: const Text(
                                                      "VALIDER",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.red)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.engineering),
                style: ButtonStyle(
                    iconColor: couleuricon,
                    iconSize: const MaterialStatePropertyAll(40),
                    backgroundColor: couleurfond),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "CREATION D'UN NIVEAU",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller: filiere,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Nom de la filière associée :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: numeroNiveau,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Numéro du niveau :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      
                                                    },
                                                    style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.green),
                                                    ),
                                                    child: const Text(
                                                      "VALIDER",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.red)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add_chart_sharp),
                style: ButtonStyle(
                    iconColor: couleuricon,
                    iconSize: const MaterialStatePropertyAll(40),
                    backgroundColor: couleurfond),
              ),
              const Spacer(),
              IconButton(
                icon: iconeBouton,
                style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.black),
                  iconSize: MaterialStatePropertyAll(40),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 171, 176, 250),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (visible == false) {
                      visible = true;
                      iconeBouton = const Icon(Icons.close);
                      couleurfond = const MaterialStatePropertyAll(
                          Color.fromARGB(255, 171, 176, 250));
                      couleuricon =
                          const MaterialStatePropertyAll(Colors.black);
                    } else {
                      visible = false;
                      iconeBouton = const Icon(Icons.add);
                      couleurfond =
                          const MaterialStatePropertyAll(Colors.transparent);
                      couleuricon =
                          const MaterialStatePropertyAll(Colors.transparent);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCours extends StatelessWidget {
  const WidgetCours(
      {Key? key,
      required this.filiere,
      required this.niveau,
      required this.professeur,
      required this.ue});

  final String filiere;
  final int niveau;
  final String professeur;
  final String ue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 5,
      height: 200,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white, width: 2),
          gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 227, 225, 225), Colors.white]),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  filiere,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  niveau.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  professeur,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  ue,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  "Avancement du programme",
                  softWrap: true,
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  minHeight: 15,
                  value: 0.5,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.purple,
                )
              ],
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  "Avancement du nombre d'heure de cours",
                  softWrap: true,
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 15,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
