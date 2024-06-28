import 'dart:io';
import 'dart:typed_data';

import 'package:firstapp/models/fichetravaux.dart';
import 'package:firstapp/vues/delegue/pagepdf.dart';
import 'package:firstapp/vues/delegue/pdftravaux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;

class VisuelficheTravaux extends StatefulWidget {
  const VisuelficheTravaux({
    Key? key,
    required this.fichetravaux,
  });

  final FicheTravaux fichetravaux;

  State<VisuelficheTravaux> createState() {
    return _VisuelficheTravaux();
  }
}

class _VisuelficheTravaux extends State<VisuelficheTravaux> {
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final directory = await getExternalStorageDirectory();
                const dossierPers = 'ICT FOLLOW UP/fiches de surveillance';
                final cheminPers = '${directory?.path}/$dossierPers';
                if (!Directory(cheminPers).existsSync()) {
                  Directory(cheminPers).createSync();
                }
                final fichePdf = pw.Document();
                Directory dossier = Directory(cheminPers);
                List<FileSystemEntity> element = await dossier.list().toList();
                int nombreFiche = element.length;
                final cheminpdf = '$cheminPers/fiche $nombreFiche.pdf';

                final file = File(cheminpdf);

                final ByteData data =
                    await rootBundle.load("assets/images/logouniv.jpg");
                Uint8List image = Uint8List.fromList(data.buffer.asInt8List());
                fichePdf.addPage(
                  pw.MultiPage(
                    pageFormat: PdfPageFormat.a4,
                    build: (context) {
                      return [
                        PdfTravaux(
                            titreSeanceTP: widget.fichetravaux.titreSeanceTP,
                            enseignant: widget.fichetravaux.enseignant,
                            codeCours: widget.fichetravaux.codeCours,
                            heureDebut: widget.fichetravaux.heureDebut,
                            heureFin: widget.fichetravaux.heureFin,
                            objectifsTP: widget.fichetravaux.objectifsTP,
                            materielNecessaire:
                                widget.fichetravaux.materielNecessaire,
                            procedureTP: widget.fichetravaux.procedureTP,
                            observation: widget.fichetravaux.observation,
                            resultatsAttendus:
                                widget.fichetravaux.resultatsAttendus,
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

                await file.writeAsBytes(await fichePdf.save());
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
                  "FICHE DE SURVEILLANCE ",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidgetSec(
                  text: "Code du cours :",
                  content: widget.fichetravaux.codeCours,
                  un: 1,
                  deux: 1),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Titre de la seance: ",
                  content: widget.fichetravaux.titreSeanceTP,
                  un: 1,
                  deux: 1),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Heure de debut:",
                  content: widget.fichetravaux.heureDebut.format(context),
                  un: 1,
                  deux: 1),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Heure de fin: ",
                  content: widget.fichetravaux.heureFin.format(context),
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Enseignant :",
                  content: widget.fichetravaux.enseignant,
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Materiel Necessaire:",
                  content: widget.fichetravaux.materielNecessaire,
                  un: 1,
                  deux: 3),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Objectifs  :",
                  content: widget.fichetravaux.objectifsTP,
                  un: 1,
                  deux: 3),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Observations :",
                  content: widget.fichetravaux.observation,
                  un: 1,
                  deux: 2),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Procedure de Travaux pratiques :",
                  content: widget.fichetravaux.procedureTP,
                  un: 1,
                  deux: 1),
              MyWidgetSec(
                  text: "Resultats Attendus: ",
                  content: widget.fichetravaux.resultatsAttendus,
                  un: 1,
                  deux: 2),
            ],
          ),
        ),
      ),
    );
  }
}
