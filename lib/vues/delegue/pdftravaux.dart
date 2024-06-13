import 'dart:typed_data';

import 'package:firstapp/vues/delegue/pdfwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<pw.Font> loadFont() async {
  final fontData = await rootBundle.load('assets/fonts/TimesNewRomance.ttf');
  font = pw.Font.ttf(fontData);
  return pw.Font.ttf(fontData);
}

Font font = Font();

class PdfTravaux extends pw.StatelessWidget {
  PdfTravaux(
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
      required this.resultatsAttendus,
      required this.logo});

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
  final Uint8List logo;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 20),
        pw.Container(
          margin: const pw.EdgeInsets.only(left: 15, right: 15),
          child: pw.Row(
            children: [
              pw.Column(
                children: [
                  pw.Text(
                    "REPUBLIQUE DU CAMEROUN",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  ),
                  pw.Text(
                    "PAIX-TRAVAIL-PATRIE",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  ),
                  pw.Text(
                    "UNIVERSITE DE YAOUNDE I",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  )
                ],
              ),
              pw.SizedBox(
                width: 12,
              ),
              pw.Image(pw.MemoryImage(logo), height: 52, width: 52),
              pw.SizedBox(
                width: 12,
              ),
              pw.Column(
                children: [
                  pw.Text(
                    "REPUBLIQUE DU CAMEROUN",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  ),
                  pw.Text(
                    "PAIX-TRAVAIL-PATRIE",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  ),
                  pw.Text(
                    "UNIVERSITE DE YAOUNDE I",
                    style: pw.TextStyle(fontSize: 13, font: font),
                  )
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(
          height: 10,
        ),
        pw.Center(
          child: pw.Text(
            "FICHE DE TRAVAUX PRATIQUES ",
            style: const pw.TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        pw.SizedBox(height: 20),
        Partie(text: "Titre de la séance :", content: titreSeanceTP),
        pw.SizedBox(height: 10),
        Partie(text: "Nom du professeur :", content: enseignant),
        pw.SizedBox(height: 10),
        Partie(text: "Code de l'unité d'enseignement :", content: codeCours),
        pw.SizedBox(height: 10),
        Partie(
          text: "Heure de debut :",
          content: heureDebut.toString(),
        ),
        pw.SizedBox(height: 10),
        Partie(
          text: "Heure de fin :",
          content: heureFin.toString(),
        ),
        pw.SizedBox(height: 10),
        PartieSec(text: "Objectifs :", content: objectifsTP, un: 1, deux: 3),
        pw.SizedBox(height: 10),
        PartieSec(
            text: "Materiel Necessaire :",
            content: materielNecessaire,
            un: 1,
            deux: 3),
        pw.SizedBox(height: 10),
        PartieSec(
            text: "Procedure a respecter :",
            content: procedureTP,
            un: 1,
            deux: 3),
        pw.SizedBox(height: 10),
        PartieSec(text: "Observations :", content: observation, un: 1, deux: 3),
        pw.SizedBox(height: 10),
        PartieSec(
            text: "Resultats attendus :",
            content: resultatsAttendus,
            un: 1,
            deux: 3),
      ],
    );
  }
}
