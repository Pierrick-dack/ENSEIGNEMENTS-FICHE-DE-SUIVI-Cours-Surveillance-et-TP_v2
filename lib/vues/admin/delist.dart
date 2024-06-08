import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/delegue.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DeList extends StatefulWidget {
  const DeList({super.key});

  @override
  State<DeList> createState() {
    return _DeList();
  }
}

class _DeList extends State<DeList> with SingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      recup(delegues.length, delegues, context);
    });

    print("object");
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
          child: Column(children: [
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
                "LISTE DES DELEGUES",
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
                  ...repeatWidgetProf(delegues.length, delegues, context)
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

List<Delegue> delegues = [];

void recup(int count, List<Delegue> delegue, context) async {
  Future<List<Delegue>> delegue = LocalDataBase(context).getDelegues();
  List<Delegue> del = await delegue;
  if (del.isNotEmpty) {
    delegues.clear();
    delegues.addAll(del);
  }
  print("liste recupéré");
}

List<Widget> repeatWidgetProf(int count, List<Delegue> delegue, context) {
  List<Widget> widgets = [];
  for (int i = 0; i < count; i++) {
    widgets.add(DelRep(delegue: delegue[i]));
    print("la liste des etudiantes est de ");
  }
  return widgets;
}

class DelRep extends StatelessWidget {
  const DelRep({super.key, required this.delegue});

  final Delegue delegue;
  @override
  Widget build(context) {
    recup(delegues.length, delegues, context);
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
              delegue.nameDel,
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
