import 'dart:io';

import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:firstapp/vues/delegue/pagepdf.dart';
import 'package:firstapp/vues/delegue/visuelfichesuivi.dart';
import 'package:firstapp/vues/prof/dasboardprof.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firstapp/models/fiche.dart';

class Fiches extends StatefulWidget {
  const Fiches({super.key, required this.fiches});

  final List<Fiche> fiches;
  @override
  State<Fiches> createState() {
    return _FichesState();
  }
}

class _FichesState extends State<Fiches> {
  TextEditingController search = TextEditingController();

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
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  repeatWidgetText(widget.fiches.length, fiches);
                });
              },
              icon: const Icon(Icons.refresh),
            )
          ],
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
          /*Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                label: Text(
                  "RECHERCHER",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),*/
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ...repeatWidgetText(widget.fiches.length, widget.fiches)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class FicheRep extends StatelessWidget {
  const FicheRep({super.key, required this.fiche});

  final Fiche fiche;

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
                "${fiche.codeCours} ${fiche.enseignant}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => VisuelFicheSuivi(fiche: fiche)),
            );
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ],
    );
  }
}

List<Widget> repeatWidgetText(int count, List<Fiche> fiches) {
  List<Widget> widgets = [];

  for (int i = 0; i < count; i++) {
    widgets.add(
      FicheRep(fiche: fiches[i]),
    );
  }
  return widgets;
}

/*Future<List<String>> readPdf() async {
  List<String> pdfText = [];

  Directory directory = await getApplicationDocumentsDirectory();
  const dossierPers = 'ICT FOLLOW UP';
  final cherminPers = '${directory.path}/$dossierPers';
  if (!Directory(cherminPers).existsSync()) {
    Directory(cherminPers).createSync();
  }
  Directory(cherminPers).listSync().forEach((file) async {
    if (file.path.endsWith('pdf')) {
      //final List<int> bytes = await File(file.path).readAsBytes();
      String fileName = file.uri.pathSegments.last;
      for (int i = 0; i < pdfText.length; i++) {
        if (!pdfText.contains(fileName)) {
          pdfText.add(fileName);
        }
      }
    }
  });
  return pdfText;
}*/
