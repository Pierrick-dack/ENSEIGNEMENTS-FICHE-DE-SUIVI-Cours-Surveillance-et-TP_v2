import 'dart:convert';

import 'package:firstapp/models/fiche.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart';

Future<pw.Font> loadFont() async {
  final fontData = await rootBundle.load('assets/fonts/TimesNewRomance.ttf');
  font = pw.Font.ttf(fontData);
  return pw.Font.ttf(fontData);
}

Font font = Font();

class Personal extends pw.StatelessWidget {
  Personal({Key? key, required this.fiche, required this.logo});

  final Fiche fiche;
  final Uint8List logo;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            height: 20,
          ),
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
              "FICHE DE SUIVI  ",
              style: const pw.TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          pw.SizedBox(
            height: 20,
          ),
          
          Partie(text: "Nom du professeur", content: fiche.enseignant),
          pw.SizedBox(
            height: 10,
          ),
          Partie(text: "Code de la matière : ", content: fiche.codeCours),
          pw.SizedBox(
            height: 10,
          ),
          Partie(
            text: "Titre de la séance : \n",
            content: fiche.titreSeance,
          ),
          pw.SizedBox(
            height: 10,
          ),
          Partie(text: "Numéro de la salle : ", content: fiche.salle),
          pw.SizedBox(
            height: 10,
          ),
          Partie(
              text: "Heure de debut :",
              content: "${fiche.heureDebut.hour}:${fiche.heureDebut.minute}"),
          pw.SizedBox(
            height: 10,
          ),
          Partie(
              text: "Heure de fin :",
              content: "${fiche.heureFin.hour}:${fiche.heureFin.minute}"),
          pw.SizedBox(
            height: 10,
          ),
          Partie(text: "Durée:", content: "${fiche.totalHeures.hour}: ${fiche.totalHeures.minute}"),
          pw.SizedBox(
            height: 10,
          ),
          Partie(text: "Semestre : ", content: fiche.semestre.toString()),
          pw.SizedBox(
            height: 10,
          ),
          Partie(text: "Nature : ", content: fiche.typeSeance),
          pw.SizedBox(
            height: 10,
          ),
          PartieSec(text: "Contenu : ", content: fiche.contenu, un: 1, deux: 3),
          pw.SizedBox(
            height: 10,
          ),
          PartieImg(
              text: "Signature du professeur : ",
              content: base64Decode(fiche.signatureProf),
              un: 1,
              deux: 3),
          pw.SizedBox(
            height: 10,
          ),
          PartieImg(
              text: "Signature du délégué : ",
              content: base64Decode(fiche.signatureDelegue),
              un: 1,
              deux: 3)
        ]);
  }
}

class Partie extends pw.StatelessWidget {
  Partie({Key? key, required this.text, required this.content});

  final String text;
  final String content;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(left: 10, right: 10),
      padding: const pw.EdgeInsets.all(10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Flexible(
            child: pw.Text(
              "$text \n",
              style: pw.TextStyle(
                font: font,
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          pw.Flexible(
            child: pw.Text(
              content,
              style: const pw.TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PartieSec extends pw.StatelessWidget {
  PartieSec(
      {Key? key,
      required this.text,
      required this.content,
      required this.un,
      required this.deux});

  final String text;
  final String content;
  final int un;
  final int deux;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(left: 10, right: 10),
      padding: const pw.EdgeInsets.all(10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Flexible(
            flex: un,
            child: pw.Text(
              "$text \n",
              style: pw.TextStyle(
                font: font,
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          pw.Flexible(
            flex: deux,
            child: pw.Text(
              content,
              style: const pw.TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PartieImg extends pw.StatelessWidget {
  PartieImg(
      {Key? key,
      required this.text,
      required this.content,
      required this.un,
      required this.deux});

  final String text;
  final Uint8List content;
  final int un;
  final int deux;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(left: 10, right: 10),
      padding: const pw.EdgeInsets.all(10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Flexible(
            flex: un,
            child: pw.Text(
              "$text \n",
              style: pw.TextStyle(
                font: font,
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          pw.Flexible(
            flex: deux,
            child: pw.Center(
              child: pw.Image(
                pw.MemoryImage(content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
