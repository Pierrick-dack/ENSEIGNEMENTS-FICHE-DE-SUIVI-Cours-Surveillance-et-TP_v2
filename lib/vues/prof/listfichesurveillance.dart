import 'package:firstapp/models/fichesurveillance.dart';
import 'package:firstapp/vues/delegue/fiches.dart';
import 'package:firstapp/vues/prof/visuelfichesurveillance.dart';
import 'package:flutter/material.dart';

class ListFicheSurveillance extends StatefulWidget {
  const ListFicheSurveillance({super.key, required this.fiches});

  final List<FicheSurveillance> fiches;

  @override
  State<ListFicheSurveillance> createState() {
    return _ListeFicheSurveillance();
  }
}

class _ListeFicheSurveillance extends State<ListFicheSurveillance> {
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
            "FICHES DE SURVEILLANCE",
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
                ...repeatWidgetSurv(widget.fiches.length, widget.fiches),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

List<Widget> repeatWidgetSurv(int count, List<FicheSurveillance> fiches) {
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
        FicheRepSurv(
          fiche: fiches[i],
        ),
      );
    }
  }

  return widgets;
}

class FicheRepSurv extends StatelessWidget {
  const FicheRepSurv({super.key, required this.fiche});

  final FicheSurveillance fiche;

  @override
  Widget build(context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            "${fiche.date.day}/${fiche.date.month}",
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
                "${fiche.codeCours} ${fiche.chefDeSalle}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => VisuelFicheSurveillance(
                  ficheSurveillance: fiche,
                ),
              ),
            );
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ],
    );
  }
}
