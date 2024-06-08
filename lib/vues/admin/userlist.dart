import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState()  {
    return _UserList();
  }
}



class _UserList extends State<UserList> with SingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();
  
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
        body: Column(children: [
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
            child: const Text(
              "LISTE DES PROFESSEURS",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ...repeatWidgetProf(enseignant.length, enseignant, context)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

List<Enseignant> enseignant = [];

void recup(int count, List<Enseignant> enseignants, context) async {
  Future<List<Enseignant>> enseignants =
      LocalDataBase(context).getEnseignants();
  List<Enseignant> enseigne = await enseignants;
  for (int i = 0; i < enseigne.length; i++) {
    enseignant[i] = enseigne[i];
  }
  print("liste recupéré");
}

List<Widget> repeatWidgetProf(
    int count, List<Enseignant> enseignants, context) {
  List<Widget> widgets = [];
  for (int i = 0; i < count; i++) {
    widgets.add(EnseignantRep(enseignant: enseignant[i]));
    print("la liste des etudiantes est de $count");
  }
  return widgets;
}

class EnseignantRep extends StatelessWidget {
  const EnseignantRep({super.key, required this.enseignant});

  final Enseignant enseignant;
  @override
  Widget build(context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          "${DateTime.now().day}/${DateTime.now().month}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 60,
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
          border: Border.all(color: Colors.blueGrey),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              enseignant.nomEns,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove_red_eye),
      )
    ]);
  }
}
