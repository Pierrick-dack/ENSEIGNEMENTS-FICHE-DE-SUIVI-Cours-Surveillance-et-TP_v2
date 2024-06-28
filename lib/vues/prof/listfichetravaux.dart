import 'package:firstapp/models/fichetravaux.dart';
import 'package:firstapp/vues/delegue/visuelfichetravaux.dart';
import 'package:firstapp/vues/prof/dasboardprof.dart';
import 'package:firstapp/vues/prof/visuelfichesurveillance.dart';
import 'package:flutter/material.dart';

class ListFicheTravaux extends StatefulWidget {
  const ListFicheTravaux({super.key, required this.fiches});

  final List<FicheTravaux> fiches;

  State<ListFicheTravaux> createState() {
    return _ListFicheTravaux();
  }
}

class _ListFicheTravaux extends State<ListFicheTravaux> {
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
            "FICHES DE TRAVAUX PRATIQUES",
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
                ...repeatWidgetTravaux(widget.fiches.length, widget.fiches),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

List<Widget> repeatWidgetTravaux(int count, List<FicheTravaux> fiches) {
  List<Widget> widgets = [];
  if (fiches.isEmpty) {
    widgets.add(
      const Center(
        child: Text("Aucune fiche enregistrée"),
      ),
    );
  } else {
    for (int i = 0; i < count; i++) {
      widgets.add(
        FicheRepTravaux(
          fiche: fiches[i],
        ),
      );
    }
  }

  return widgets;
}

class FicheRepTravaux extends StatelessWidget {
  const FicheRepTravaux({super.key, required this.fiche});

  final FicheTravaux fiche;

  @override
  Widget build(context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            "${fiche.id}",
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
          width: 30,
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
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: Text(
                "${fiche.codeCours} ${fiche.enseignant}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => VisuelficheTravaux(fichetravaux: fiche)),
            );
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ],
    );
  }
}
