import 'dart:convert';
import 'dart:io';
import 'package:firstapp/models/fiche.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:firstapp/vues/delegue/pdfwidget.dart';
import 'package:firstapp/localdb.dart';

class PagePdf extends StatefulWidget {
  const PagePdf({
    Key? key,
    required this.cours,
    required this.prof,
    required this.code,
    required this.titre,
    required this.salle,
    required this.heuredebut,
    required this.heurefin,
    required this.duree,
    required this.date,
    required this.semestre,
    required this.nature,
    required this.niveaux,
    required this.contenu,
    required this.signP,
    required this.signD,
    required this.confidentialite,
  }) : super(key: key);

  final String cours;
  final String prof;
  final String code;
  final String titre;
  final String salle;
  final TimeOfDay heuredebut;
  final TimeOfDay heurefin;
  final TimeOfDay duree;
  final DateTime date;
  final int semestre;
  final String nature;
  final String contenu;
  final String niveaux;
  final String signP;
  final String signD;
  final int confidentialite;

  @override
  State<PagePdf> createState() {
    return _PagePdf();
  }
}

class _PagePdf extends State<PagePdf> {
  int a = 0;

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
                EasyLoading.init();
                final directory = await getExternalStorageDirectory();
                const dossierPers = 'ICT FOLLOW UP/fiches de suivi';
                final cherminPers = '${directory?.path}/$dossierPers';
                if (!Directory(cherminPers).existsSync()) {
                  Directory(cherminPers).createSync();
                }
                final fichepdf = pw.Document();
                Directory dossier = Directory(cherminPers);
                List<FileSystemEntity> element = await dossier.list().toList();
                int nombreFiche = element.length;
                final cheminpdf = '$cherminPers/fiche $nombreFiche.pdf';
                /*if (a != 0) {
                  File(cheminpdf).deleteSync();
                }*/
                final file = File(cheminpdf);

                Fiche fiche = Fiche(
                    semestre: widget.semestre,
                    date: widget.date,
                    codeCours: widget.code,
                    enseignant: widget.prof,
                    heureDebut: widget.heuredebut,
                    heureFin: widget.heurefin,
                    totalHeures: widget.duree,
                    salle: widget.salle,
                    niveaux: widget.niveaux,
                    typeSeance: widget.nature,
                    titreSeance: widget.titre,
                    signatureDelegue: widget.signD,
                    signatureProf: widget.signP,
                    contenu: widget.contenu,
                    confidentialite: widget.confidentialite);

                // ignore: use_build_context_synchronously
                await LocalDataBase(context).addFiche(fiche, context);

                final ByteData data =
                    await rootBundle.load("assets/images/logouniv.jpg");
                Uint8List image = Uint8List.fromList(
                  data.buffer.asUint8List(),
                );
                fichepdf.addPage(
                  pw.MultiPage(
                    pageFormat: PdfPageFormat.a4,
                    build: (context) {
                      return [
                        Personal(
                            cours: widget.cours,
                            prof: widget.prof,
                            code: widget.code,
                            titre: widget.titre,
                            salle: widget.salle,
                            heuredebut: widget.heuredebut,
                            heurefin: widget.heurefin,
                            duree: widget.duree,
                            date: widget.date,
                            semestre: widget.semestre,
                            nature: widget.nature,
                            contenu: widget.contenu,
                            signP: widget.signP,
                            signD: widget.signD,
                            logo: image)
                      ];
                    },
                  ),
                );

                // ignore: use_build_context_synchronously
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) {
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
                /*Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => DashboardDelegue()),
                );*/
                await file.writeAsBytes(await fichepdf.save());
                a = a + 1;
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
                          "BLABLABLA",
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
                          "BLABLABLA",
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
                  "FICHE DE SUIVI ",
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
                text: "Libellé du cours: \n",
                content: widget.cours,
                un: 1,
                deux: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Nom du professeur: ", content: widget.prof),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Code de la matière : ", content: widget.code),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                text: "Titre de la séance : \n",
                content: widget.titre,
                un: 1,
                deux: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Numéro de la salle : ", content: widget.salle),
              const SizedBox(
                height: 10,
              ),
              MyWidget(
                  text: "Heure de debut :",
                  content: widget.heuredebut.format(context)),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Date :", content: widget.date.toString()),
              const SizedBox(
                height: 10,
              ),
              MyWidget(
                  text: "Heure de fin :",
                  content: widget.heurefin.format(context)),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Durée :", content: widget.duree.format(context)),
              const SizedBox(
                height: 10,
              ),
              MyWidget(
                  text: "Semestre : ", content: widget.semestre.toString()),
              const SizedBox(
                height: 10,
              ),
              MyWidget(text: "Nature du cours : ", content: widget.nature),
              const SizedBox(
                height: 10,
              ),
              MyWidgetSec(
                  text: "Contenu : \n",
                  content: widget.contenu,
                  un: 1,
                  deux: 2),
              MyWidgetImg(
                  text: "Signature du professeur : ",
                  content: base64Decode(widget.signP),
                  un: 1,
                  deux: 2),
              MyWidgetImg(
                  text: "Signature du Delegué : ",
                  content: base64Decode(widget.signD),
                  un: 1,
                  deux: 2)
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.text, required this.content})
      : super(key: key);

  final String text;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidgetSec extends StatelessWidget {
  const MyWidgetSec(
      {Key? key,
      required this.text,
      required this.content,
      required this.un,
      required this.deux})
      : super(key: key);

  final String text;
  final String content;
  final int un;
  final int deux;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: un,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: deux,
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidgetImg extends StatelessWidget {
  const MyWidgetImg(
      {Key? key,
      required this.text,
      required this.content,
      required this.un,
      required this.deux})
      : super(key: key);

  final String text;
  final Uint8List content;
  final int un;
  final int deux;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: un,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: deux,
            child: Center(
              child: Image.memory(content),
            ),
          ),
        ],
      ),
    );
  }
}
