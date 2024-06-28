import 'package:firstapp/models/fiche.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:firstapp/vues/delegue/fiches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListeFiche extends StatefulWidget {
  const ListeFiche({super.key, required this.fiches});

  final List<Fiche> fiches;

  State<ListeFiche> createState() {
    return _ListeFiche();
  }
}

class _ListeFiche extends State<ListeFiche> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          title: const Text(
            "FICHES DE SUIVI",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ...repeatWidgetText(widget.fiches.length, widget.fiches),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

List<Widget> repeatWidgetText(int count, List<Fiche> fiches) {
  List<Widget> widgets = [];
  if (fiches.isEmpty) {
    widgets.add(
      const Center(
        child: Text("Aucune fiche enregistrée"),
      ),
    );
  } else {
    for (int i = 0; i < count; i++) {
      widgets.add(FicheRep(fiche: fiches[i]));
    }
  }

  return widgets;
}
