import 'dart:convert';
import 'dart:typed_data';

import 'package:firstapp/vues/delegue/pagepdf.dart';
import 'package:firstapp/vues/delegue/pagepdftravaux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class FicheTravau extends StatefulWidget {
  const FicheTravau({super.key});

  State<FicheTravau> createState() {
    return _FicheTravau();
  }
}

class _FicheTravau extends State<FicheTravau> {
  TextEditingController titleSeance = TextEditingController();
  TextEditingController cod = TextEditingController();
  TextEditingController prof = TextEditingController();
  TextEditingController objectifs = TextEditingController();
  TextEditingController materielNecessaire = TextEditingController();
  TextEditingController procedureTp = TextEditingController();
  TextEditingController observations = TextEditingController();
  TextEditingController results = TextEditingController();

  TextEditingController totalHeure = TextEditingController();

  String data = "";

  String titreSeance = "";
  String code = "";
  String professeur = "";
  TimeOfDay timedebut = TimeOfDay.now();
  TimeOfDay timefin = TimeOfDay.now();
  String objectif = "";
  String materiel = "";
  String procedure = "";
  String observation = "";
  String resultats = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
            "FICHE DE TRAVAUX PRATIQUES",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 227, 242, 238),
              Color.fromARGB(255, 236, 251, 252)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              TextField(
                controller: titleSeance,
                decoration: const InputDecoration(
                  labelText: "Titre de la séance :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: prof,
                decoration: const InputDecoration(
                  label: Text("Nom du professeur"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: cod,
                decoration: const InputDecoration(
                  label: Text("Code de la matière"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                maxLines: 6,
                controller: objectifs,
                decoration: const InputDecoration(
                  label: Text("Objectifs du TP :"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const SizedBox(
                height: 5,
              ),
              TextField(
                maxLines: 4,
                controller: materielNecessaire,
                decoration: const InputDecoration(
                  labelText: "Matériel necessaire :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          timedebut.format(context),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 2, 53, 95),
                          ),
                        ),
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then(
                            (value) {
                              if (value == null) {
                                return;
                              }
                              setState(
                                () {
                                  timedebut = value;
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Heure de debut",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          timefin.format(context),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 2, 53, 95),
                          ),
                        ),
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then(
                            (value) {
                              if (value == null ||
                                  value.hour < timedebut.hour ||
                                  (value.hour == timedebut.hour &&
                                      value.minute < timedebut.minute)) {
                                timefin = timedebut;
                                setState(
                                  () {
                                    data =
                                        "l'heure de fin est inferieure a l'heure de debut";
                                  },
                                );
                              } else {
                                setState(() {
                                  data = "";
                                  timefin = value;
                                });
                              }
                            },
                          );
                        },
                        child: const Text(
                          "Heure de fin",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 35,
                child: Text(
                  data,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                  ),
                ),
              ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${date.year}-${date.month}-${date.day}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 2, 53, 95),
                      ),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        if (value == null) {
                          date = DateTime.now();
                        } else {
                          setState(() {
                            date = value;
                          });
                        }
                      });
                    },
                    child: const Text(
                      'Date',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),*/
              /*Row(
                children: [
                  const Text("Semestre"),
                  Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: semestre,
                      onChanged: (value) {
                        setState(() {
                          activate();
                          semestre = value!;
                        });
                      }),
                  const Text("semestre 1"),
                  Radio(
                      activeColor: Colors.blue,
                      value: 2,
                      groupValue: semestre,
                      onChanged: (value) {
                        setState(() {
                          activate();
                          semestre = value!;
                        });
                      }),
                  const Text("semestre 2"),
                ],
              ),*/
              TextField(
                maxLines: 12,
                controller: procedureTp,
                decoration: const InputDecoration(
                  label: Text("Procedure de travaux pratiques :"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 6,
                controller: observations,
                decoration: const InputDecoration(
                  label: Text("Observations :"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 6,
                controller: results,
                decoration: const InputDecoration(
                  label: Text("Resultats attendus :"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Signature du professeur"),
                      const SizedBox(
                        height: 7,
                      ),
                      Signature(
                        controller: signatureControllerP,
                        width: 250,
                        height: 200,
                        backgroundColor:
                            const Color.fromARGB(255, 202, 215, 221),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          signatureControllerP.clear();
                        },
                        style: const ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 230, 151, 146),
                          ),
                        ),
                        child: const Text(
                          "clean",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          Uint8List? singPlist =
                              await signatureControllerP.toPngBytes();
                          if (singPlist != null) {
                            signP = base64Encode(singPlist);
                          } else {
                            print("signature du professeur non enregistrée");
                          }
                        },
                        style: const ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 138, 241, 141),
                          ),
                        ),
                        child: const Text(
                          "enreg",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Signature du délgué"),
                      const SizedBox(
                        height: 7,
                      ),
                      Signature(
                        controller: signatureControllerD,
                        width: 250,
                        height: 200,
                        backgroundColor:
                            const Color.fromARGB(255, 202, 215, 221),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          signatureControllerD.clear();
                        },
                        style: const ButtonStyle(
                          alignment: Alignment.center,
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          )),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 230, 151, 146),
                          ),
                        ),
                        child: const Text(
                          "clean",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          Uint8List? signDlist =
                              await signatureControllerD.toPngBytes();
                          if (signDlist != null) {
                            signD = base64Encode(signDlist);
                          } else {
                            print("signature du delegue non enregistrée");
                          }
                        },
                        style: const ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 138, 241, 141),
                          ),
                        ),
                        child: const Text(
                          "enreg",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      )
                    ],
                  )
                ],
              ),*/
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () async {
                      if (titleSeance.text.isEmpty ||
                          prof.text.isEmpty ||
                          cod.text.isEmpty ||
                          objectifs.text.isEmpty ||
                          materielNecessaire.text.isEmpty ||
                          procedureTp.text.isEmpty ||
                          observations.text.isEmpty ||
                          results.text.isEmpty) {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text(
                                  "Alerte",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                  ),
                                ),
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Vous ne pouvez pas enregistrer cette fiche il manque une information",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        //creation du pdf et enregistrement dans le telephone

                        titreSeance = titleSeance.text;
                        professeur = prof.text;
                        code = cod.text;
                        objectif = objectifs.text;
                        materiel = materielNecessaire.text;
                        procedure = procedureTp.text;
                        observation = observations.text;
                        resultats = results.text;
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PagePdfTravaux(
                                titreSeanceTP: titreSeance,
                                enseignant: professeur,
                                codeCours: code,
                                heureDebut: timedebut,
                                heureFin: timefin,
                                objectifsTP: objectif,
                                materielNecessaire: materiel,
                                procedureTP: procedure,
                                observation: observation,
                                resultatsAttendus: resultats),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Valider",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      setState(() {
                        titleSeance.clear();
                        prof.clear();
                        cod.clear();
                        timedebut = TimeOfDay.now();
                        timefin = TimeOfDay.now();
                        objectifs.clear();
                        materielNecessaire.clear();
                        procedureTp.clear();
                        observations.clear();
                        results.clear();
                      });
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
