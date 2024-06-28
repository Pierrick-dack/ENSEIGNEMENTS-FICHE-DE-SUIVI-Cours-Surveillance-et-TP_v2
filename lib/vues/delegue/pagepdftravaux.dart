import 'dart:io';

import 'package:firstapp/localdb.dart';
import 'package:firstapp/vues/delegue/pagepdf.dart';
import 'package:firstapp/vues/delegue/pdftravaux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:firstapp/models/fichetravaux.dart';

class PagePdfTravaux extends StatefulWidget {
  const PagePdfTravaux(
      {Key? key,
      required this.titreSeanceTP,
      required this.enseignant,
      required this.codeCours,
      required this.heureDebut,
      required this.heureFin,
      required this.objectifsTP,
      required this.materielNecessaire,
      required this.procedureTP,
      required this.observation,
      required this.resultatsAttendus})
      : super(key: key);

  final String titreSeanceTP;
  final String enseignant;
  final String codeCours;
  final TimeOfDay heureDebut;
  final TimeOfDay heureFin;
  final String objectifsTP;
  final String materielNecessaire;
  final String procedureTP;
  final String observation;
  final String resultatsAttendus;

  State<PagePdfTravaux> createState() {
    return _PagePdfTravaux();
  }
}

class _PagePdfTravaux extends State<PagePdfTravaux> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "APERCU",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final directory = await getExternalStorageDirectory();
                const dossierPers = 'ICT FOLLOW UP/fiches de TP';
                final cheminPers = '${directory?.path}/$dossierPers';
                if (!Directory(cheminPers).existsSync()) {
                  Directory(cheminPers).createSync();
                }
                final ficheTravau = pw.Document();
                Directory dossier = Directory(cheminPers);
                List<FileSystemEntity> element = await dossier.list().toList();
                int nombreFiche = element.length;
                final cheminpdf =
                    '$cheminPers/fiche de travaux $nombreFiche.pdf';

                final file = File(cheminpdf);

                FicheTravaux ficheTravaux = FicheTravaux(
                    titreSeanceTP: widget.titreSeanceTP,
                    enseignant: widget.enseignant,
                    codeCours: widget.codeCours,
                    heureDebut: widget.heureDebut,
                    heureFin: widget.heureFin,
                    objectifsTP: widget.objectifsTP,
                    materielNecessaire: widget.materielNecessaire,
                    procedureTP: widget.procedureTP,
                    observation: widget.observation,
                    resultatsAttendus: widget.resultatsAttendus);

                //ajouter la fiche dans la base de données
                LocalDataBase(context).addFicheTravaux(ficheTravaux, context);

                final ByteData data =
                    await rootBundle.load("assets/images/logouniv/jpg");
                Uint8List image = Uint8List.fromList(data.buffer.asInt8List());
                ficheTravau.addPage(
                  pw.MultiPage(
                    pageFormat: PdfPageFormat.a4,
                    build: (context) {
                      return [
                        PdfTravaux(
                            titreSeanceTP: widget.titreSeanceTP,
                            enseignant: widget.enseignant,
                            codeCours: widget.codeCours,
                            heureDebut: widget.heureDebut,
                            heureFin: widget.heureFin,
                            objectifsTP: widget.objectifsTP,
                            materielNecessaire: widget.materielNecessaire,
                            procedureTP: widget.procedureTP,
                            observation: widget.observation,
                            resultatsAttendus: widget.resultatsAttendus,
                            logo: image)
                      ];
                    },
                  ),
                );

                // ignore: use_build_context_synchronously
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "Confirmation",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                        ),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Vous avez enregistré la fiche avec succès dans l'appareil",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
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
                  },
                );
                await file.writeAsBytes(await ficheTravau.save());
              },
              child: const Text(
                "Enregistrer",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 206, 205, 205),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text(
                          "REPUBLIQUE DU CAMEROUN",
                          style: TextStyle(fontSize: 10, fontFamily: 'Arial'),
                        ),
                        Text(
                          "PAIX-TRAVAIL-PATRIE",
                          style: TextStyle(fontSize: 10, fontFamily: 'Arial'),
                        ),
                        Text(
                          "REPUBLIQUE DU CAMEROUN",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/logouniv.jpg",
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children: [
                        Text(
                          "REPUBLIQUE DU CAMEROUN",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "PAIX-TRAVAIL-PATRIE",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "REPUBLIQUE DU CAMEROUN",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "FICHE DE TRAVAUX PRATIQUES ",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w300),
                ),
              ),
              MyWidgetSec(
                text: "Titre de la séance : ",
                content: widget.titreSeanceTP,
                un: 1,
                deux: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                text: "Nom du professeur : ",
                content: widget.enseignant,
                un: 1,
                deux: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                text: "Code de l'unité d'enseignement : ",
                content: widget.codeCours,
                un: 1,
                deux: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidget(
                text: "Heure de debut : ",
                content: widget.heureDebut.format(context),
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidget(
                text: "Heure de fin : ",
                content: widget.heureFin.format(context),
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Objectifs : ",
                  content: widget.objectifsTP,
                  un: 1,
                  deux: 3),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Materiel necessaire : ",
                  content: widget.materielNecessaire,
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Procedure à respecter : ",
                  content: widget.procedureTP,
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Observations : ",
                  content: widget.observation,
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Resultats attendus : ",
                  content: widget.resultatsAttendus,
                  un: 1,
                  deux: 2)
            ],
          ),
        ),
      ),
    );
  }
}
