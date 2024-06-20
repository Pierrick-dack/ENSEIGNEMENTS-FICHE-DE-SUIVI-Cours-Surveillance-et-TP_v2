import 'package:firstapp/models/fichesurveillance.dart';
import 'package:firstapp/vues/prof/pagepdfsurveillance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FormFicheSurveillance extends StatefulWidget {
  const FormFicheSurveillance({super.key});

  State<FormFicheSurveillance> createState() {
    return _FormFicheSurveillance();
  }
}

class _FormFicheSurveillance extends State<FormFicheSurveillance> {
  TextEditingController chef = TextEditingController();
  TextEditingController salle = TextEditingController();
  TextEditingController session = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController intitule = TextEditingController();

  String chefSalle = "";
  String sall = "";
  DateTime date = DateTime.now();
  String sesion = "";
  String codeCours = "";
  String intituleUe = "";
  int confirmation = 1;

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
            "FICHE DE SURVEILLANCE",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 235, 240, 244),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              TextFormField(
                controller: chef,
                decoration: const InputDecoration(
                  labelText: "Chef de salle :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: salle,
                decoration: const InputDecoration(
                  labelText: "Numero de salle :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: session,
                decoration: const InputDecoration(
                  labelText: "Session :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: code,
                decoration: const InputDecoration(
                  labelText: "Code de l'unité d'enseignement :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: intitule,
                decoration: const InputDecoration(
                  labelText: "L'intitulé de l'unité d'enseignement :",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
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
                      shadowColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 227, 226, 226),
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
                      'Date :',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      if (chef.text.isEmpty ||
                          salle.text.isEmpty ||
                          session.text.isEmpty ||
                          code.text.isEmpty ||
                          intitule.text.isEmpty) {
                        EasyLoading.showError(
                          "Vous ne pouvez pas enregistrer la fiche car il manque une information",
                          duration: const Duration(milliseconds: 3000),
                        );
                      } else {
                        chefSalle = chef.text;
                        sall = salle.text;
                        sesion = session.text;
                        codeCours = code.text;
                        intituleUe = intitule.text;
                        FicheSurveillance ficheSurveillance = FicheSurveillance(
                            chefDeSalle: chefSalle,
                            salle: sall,
                            date: date,
                            session: sesion,
                            codeCours: codeCours,
                            intituleUE: intituleUe,
                            confirmation: true);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PagePdfSurveillance(
                                ficheSurveillance: ficheSurveillance),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "VALIDER",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      setState(() {
                        chef.clear();
                        salle.clear();
                        session.clear();
                        date = DateTime.now();
                        code.clear();
                        intitule.clear();
                      });
                    },
                    child: const Text(
                      "ANNULER",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
