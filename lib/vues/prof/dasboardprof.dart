import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/models/fiche.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:firstapp/vues/prof/formfichesurveillance.dart';
import 'package:firstapp/vues/prof/listfiche.dart';
import 'package:firstapp/vues/prof/profile.dart';
import 'package:flutter/material.dart';

class DashboardProf extends StatefulWidget {
  const DashboardProf({super.key, required this.prof});

  final Enseignant prof;

  State<DashboardProf> createState() {
    return _DashboardProf();
  }
}

List<Fiche> ficheslist = [];
TimeOfDay heuretotale = const TimeOfDay(hour: 00, minute: 00);
Enseignant enseignant =
    Enseignant(nomEns: "", emailEns: "", numBurEns: "", mdpEns: "");

class _DashboardProf extends State<DashboardProf> {
  @override
  void initState() {
    super.initState();
    enseignant = widget.prof;
  }

  @override
  Widget build(BuildContext context) {
    recupFiche(ficheslist,widget.prof, context);
    heuretotale = calculheure(ficheslist, context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("DASHBOARD"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ProfileProf(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                size: 35,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 206, 233, 255),
                        border: Border.all(
                            color: const Color.fromARGB(255, 5, 31, 159),
                            width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              recupFiche(ficheslist, widget.prof,context);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ListeFiche(fiches: ficheslist),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.folder_shared_sharp,
                              size: 50,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              "Fiches de suivi",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 237, 255, 238),
                        border: Border.all(
                            color: const Color.fromARGB(255, 61, 215, 0),
                            width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            heuretotale.format(context),
                            style: const TextStyle(fontSize: 35),
                          ),
                          const Text(
                            "Total d'heures de cours",
                            style: TextStyle(
                                fontSize: 25, fontFamily: "Times New Roman"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 168, 215, 254),
                          border: Border.all(
                              color: const Color.fromARGB(255, 5, 31, 159),
                              width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 195, 255, 198),
                        border: Border.all(
                            color: const Color.fromARGB(255, 61, 215, 0),
                            width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.08,
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 255, 234),
                  border: Border(
                    top: BorderSide(color: Colors.green, width: 3.0),
                    left: BorderSide(color: Colors.green, width: 3.0),
                    bottom: BorderSide(color: Colors.green, width: 3.0),
                    right: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      "FICHE DE SURVEILLANCE",
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const FormFicheSurveillance(),
                          ),
                        );
                      },
                      iconSize: 35,
                      style: ButtonStyle(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: 0),
                        alignment: Alignment.centerLeft,
                        iconColor: MaterialStateProperty.all(Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const Text(
                  "Cette fiche est utilisée pour consigner les informations liées a la surveillance d'examens ou de sessions de travail.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void recupFiche(List<Fiche> fiche, Enseignant enseignan,context) async {
  //Future<List<Fiche>> fiches = LocalDataBase(context).getFiche();
  Future<List<Fiche>> fiches = LocalDataBase(context).getFicheProf(enseignan);
  List<Fiche> ficheList = await fiches;

  if (fiche.isNotEmpty) {
    fiche.clear();
  }
  fiche.addAll(ficheList);
}

TimeOfDay calculheure(List<Fiche> fiches, context) {
  int totalHeure = 0;
  int totalMinutes = 0;
  
  for (int i = 0; i < fiches.length; i++) {
    totalHeure = fiches[i].totalHeures.hour + totalHeure;
    totalMinutes = fiches[i].totalHeures.minute + totalMinutes;
  }
  
  //print("$totalHeure et $totalMinutes");
  int restHeure = (totalMinutes - totalMinutes % 60) ~/ 60;
  ;
  totalHeure = restHeure + totalHeure;
  totalMinutes = totalMinutes - (restHeure * 60);
  
  return TimeOfDay(hour: totalHeure, minute: totalMinutes);
}
