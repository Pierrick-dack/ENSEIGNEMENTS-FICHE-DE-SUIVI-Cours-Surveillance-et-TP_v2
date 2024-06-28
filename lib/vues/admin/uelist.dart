import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/cours.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/models/niveau.dart';
import 'package:firstapp/models/semestre.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UeList extends StatefulWidget {
  const UeList({
    super.key,
    required this.ue,
  });

  final List<Cours> ue;
  @override
  State<UeList> createState() {
    return _UeList();
  }
}

List<String> niveaulist = [];

bool visible = false;
Icon iconeBouton = const Icon(Icons.add);
var couleuricon = const MaterialStatePropertyAll(Colors.transparent);
var couleurfond = const MaterialStatePropertyAll(Colors.transparent);

String prof = "";
String niv = "";
String sem = "";

TextEditingController numeroNiveau = TextEditingController();
TextEditingController codeUe = TextEditingController();
TextEditingController intituleUe = TextEditingController();

TextEditingController codeNiveau = TextEditingController();
TextEditingController intituleNiveau = TextEditingController();

class _UeList extends State<UeList> {
  @override
  Widget build(BuildContext context) {
    //print("affichage dans la page");
    
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
              WidgetCours(niveau: 3, professeur: "Dr NZEKON", ue: "ICT 301")
            ],
          ),
        ),
        /*bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  niv = niveaulist[0];
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
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
                                              WidgetDrop(
                                                  objet: "Classe",
                                                  listObject: niveaulist,
                                                  valueEnreg: niv),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              /*WidgetDrop(
                                                  listObject: semestresList,
                                                  valueEnreg: sem),*/
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.28,
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        Semestre semestre1 =
                                                            Semestre(
                                                                numSemestre:
                                                                    "1");
                                                        Semestre semestre2 =
                                                            Semestre(
                                                                numSemestre:
                                                                    "2");
                                                        await LocalDataBase(
                                                                context)
                                                            .addSemestre(
                                                                semestre1,
                                                                context);
                                                        // ignore: use_build_context_synchronously
                                                        await LocalDataBase(
                                                                context)
                                                            .addSemestre(
                                                                semestre2,
                                                                context);
                                                        if (codeUe
                                                                .text.isEmpty ||
                                                            intituleUe
                                                                .text.isEmpty) {
                                                          EasyLoading.showError(
                                                              "Vous avez une donnée manquante");
                                                        } else {
                                                          bool isExistedcode =
                                                              false;
                                                          bool isExistedinti =
                                                              false;

                                                          for (int i = 0;
                                                              i <
                                                                  widget.ue
                                                                      .length;
                                                              i++) {
                                                            if (widget.ue[i]
                                                                    .codeUE ==
                                                                codeUe.text) {
                                                              isExistedcode =
                                                                  true;
                                                            } else if (widget
                                                                    .ue[i]
                                                                    .intituleUE ==
                                                                intituleUe
                                                                    .text) {
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
                                                            Classe classeItem =
                                                                // ignore: use_build_context_synchronously
                                                                await LocalDataBase(
                                                                        context)
                                                                    .getOneNiveau(
                                                                        niv);
                                                            Semestre semestre =
                                                                // ignore: use_build_context_synchronously
                                                                await LocalDataBase(
                                                                        context)
                                                                    .getOneSemestre(
                                                                        sem);
                                                            Cours cour = Cours(
                                                                id: widget.ue
                                                                        .length +
                                                                    1,
                                                                codeUE:
                                                                    codeUe.text,
                                                                intituleUE:
                                                                    intituleUe
                                                                        .text,
                                                                niveau_id:
                                                                    classeItem
                                                                        .id!,
                                                                semestre_id:
                                                                    semestre
                                                                        .id!);
                                                            // ignore: use_build_context_synchronously
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
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.29,
                                                    child: ElevatedButton(
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
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
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
                                    MediaQuery.of(context).size.height * 0.4,
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
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: codeNiveau,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            "Code du niveau :"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: intituleNiveau,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Intitulé du niveau :"),
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
                                                      bool code = false;
                                                      bool intitule = false;
                                                      for (int i = 0;
                                                          i < classes.length;
                                                          i++) {
                                                        if (classes[i]
                                                                .className ==
                                                            codeNiveau.text) {
                                                          code = true;

                                                          print(
                                                              'codeNiveau.text');
                                                        }
                                                        if (classes[i]
                                                                .classDescription ==
                                                            intituleNiveau
                                                                .text) {
                                                          intitule = true;
                                                        }
                                                      }
                                                      if (code == true) {
                                                        EasyLoading.showInfo(
                                                          "Vous avez déjà un niveau ayant niveau qui a ce code",
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      2500),
                                                        );
                                                      } else if (intitule ==
                                                          true) {
                                                        EasyLoading.showInfo(
                                                          "Vous avez déjà un niveau ayant niveau qui a cet intitule",
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      2500),
                                                        );
                                                      } else {
                                                        Classe niveauAdd = Classe(
                                                            className:
                                                                codeNiveau.text,
                                                            classDescription:
                                                                intituleNiveau
                                                                    .text);
                                                        /*if (niveaux.isEmpty) {
                                                          niveauAdd.id = 0;
                                                        } else {
                                                          niveauAdd
                                                              .id = ((niveaux[
                                                                      niveaux.length -
                                                                          1])
                                                                  .id! +
                                                              1)!;
                                                        }*/
                                                        await LocalDataBase(
                                                                context)
                                                            .addClasse(
                                                                niveauAdd,
                                                                context);
                                                      }
                                                      codeNiveau.clear();
                                                      intituleNiveau.clear();
                                                      Navigator.of(context)
                                                          .pop();
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
                                                              Colors.red),
                                                    ),
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
                      recupUe(widget.ue, context);
                      recupNiv(widget.classe, context);
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
        ),*/
      ),
    );
  }
}

class WidgetCours extends StatelessWidget {
  const WidgetCours(
      {Key? key,
      required this.niveau,
      required this.professeur,
      required this.ue});

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

class WidgetDrop extends StatefulWidget {
  WidgetDrop(
      {super.key,
      required this.objet,
      required this.listObject,
      required this.valueEnreg});

  final List<String> listObject;
  String? valueEnreg;
  final String objet;

  State<WidgetDrop> createState() {
    return _WidgetDrop();
  }
}

class _WidgetDrop extends State<WidgetDrop> {
  @override
  Widget build(BuildContext context) {
    widget.valueEnreg = widget.listObject[0];
    return Container(
      height: 70,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: widget.listObject.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text("${widget.valueEnreg} :"),
                value: widget.valueEnreg,
                onChanged: (valueNew) {
                  setState(() {
                    widget.valueEnreg = valueNew!;
                  });
                },
                items: widget.listObject
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          : Center(child: Text("Aucun ${widget.objet} disponible")),
    );
  }
}
