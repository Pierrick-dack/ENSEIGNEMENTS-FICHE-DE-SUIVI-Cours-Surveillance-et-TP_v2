import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/delegue.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/vues/delegue/dashboardelegue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserList extends StatefulWidget {
  const UserList(
      {super.key, required this.enseignants, required this.delegues});

  final List<Enseignant> enseignants;
  final List<Delegue> delegues;
  @override
  State<UserList> createState() {
    return _UserList();
  }
}

Color backGround = const Color.fromARGB(255, 239, 239, 239);
Color backgroundNo = Colors.transparent;

//
class _UserList extends State<UserList> with SingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();
  List<Widget> listeWidget =
      repeatWidgetProf(enseignants.length, enseignants, BuildContext);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          title: const Text(
            "UTILISATEURS",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        listeWidget = repeatWidgetProf(
                            widget.enseignants.length,
                            widget.enseignants,
                            context);
                        setState(() {
                          listeWidget = repeatWidgetProf(
                              widget.enseignants.length,
                              widget.enseignants,
                              context);
                          backGround = const Color.fromARGB(255, 239, 239, 239);
                          backgroundNo = Colors.transparent;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(backGround)),
                      child: const Text(
                        "PROFESSEURS",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 2,
                      child: ColoredBox(color: Color.fromARGB(255, 2, 33, 58)),
                    ),
                    TextButton(
                      onPressed: () {
                        listeWidget = repeatWidgetEtudiant(
                            widget.delegues.length, widget.delegues, context);
                        setState(() {
                          listeWidget = repeatWidgetEtudiant(
                              widget.delegues.length, widget.delegues, context);
                          backgroundNo =
                              const Color.fromARGB(255, 239, 239, 239);
                          backGround = Colors.transparent;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(backgroundNo)),
                      child: const Text(
                        "DELEGUES",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                  child: Column(
                children: listeWidget,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> repeatWidgetProf(
    int count, List<Enseignant> enseignants, context) {
  List<Widget> widgets = [];
  for (int i = 0; i < count; i++) {
    widgets.add(EnseignantRep(enseignant: enseignants[i]));
    //print("la liste des etudiantes est de $count");
  }
  return widgets;
}

List<Widget> repeatWidgetEtudiant(int count, List<Delegue> delegue, context) {
  List<Widget> widgets = [];
  for (int i = 0; i < count; i++) {
    widgets.add(DelegueRep(delegue: delegue[i]));
  }
  return widgets;
}

class DelegueRep extends StatefulWidget {
  const DelegueRep({super.key, required this.delegue});

  final Delegue delegue;

  @override
  State<DelegueRep> createState() {
    return _DelegueRep();
  }
}

class _DelegueRep extends State<DelegueRep> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          " ",
          style: TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 80,
        width: 3,
        child: ColoredBox(
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 2,
        width: 40,
        child: ColoredBox(
          color: Colors.black,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: Text(
              "Nom: ${widget.delegue.nameDel} \nMatricule: ${widget.delegue.matDel}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          LocalDataBase(context).suppressionDelegue(widget.delegue);
          setState(() {});
        },
        icon: const Icon(Icons.delete),
      )
    ]);
  }
}

class EnseignantRep extends StatefulWidget {
  const EnseignantRep({super.key, required this.enseignant});

  final Enseignant enseignant;

  @override
  State<EnseignantRep> createState() {
    return _EnseignantRep();
  }
}

class _EnseignantRep extends State<EnseignantRep> {
  @override
  Widget build(context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          " ",
          style: TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 100,
        width: 3,
        child: ColoredBox(
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 2,
        width: 40,
        child: ColoredBox(
          color: Colors.black,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Center(
            child: Text(
              "Nom: ${widget.enseignant.nomEns} \nEmail: ${widget.enseignant.emailEns}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      )
    ]);
  }
}
