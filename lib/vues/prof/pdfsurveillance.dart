import 'package:firstapp/vues/delegue/pdfwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';

import 'package:pdf/widgets.dart' as pw;

Future<pw.Font> loadFont() async {
  final fontData = await rootBundle.load('assets/fonts/TimesNewRomance.ttf');
  font = pw.Font.ttf(fontData);
  return pw.Font.ttf(fontData);
}

Font font = Font();

class PdfSurveillance extends pw.StatelessWidget {
  PdfSurveillance(
      {Key? key,
      required this.chefSalle,
      required this.salle,
      required this.date,
      required this.session,
      required this.codeCours,
      required this.intitule,
      required this.confirmation,
      required this.logo});

  final String chefSalle;
  final String salle;
  final DateTime date;
  final String session;
  final String codeCours;
  final String intitule;
  final int confirmation;
  final Uint8List logo;

  @override
  pw.Widget build(Context context) {
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
              "FICHE DE SURVEILLANCE :",
              style: const pw.TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          PartieSec(
              text: "Chef de salle :", content: chefSalle, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Salle :", content: salle, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Date :", content: date.toString(), un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Session :", content: session, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(
              text: "Code du cours :", content: codeCours, un: 1, deux: 1),
          pw.SizedBox(height: 10),
          PartieSec(text: "Intitulé :", content: intitule, un: 1, deux: 2),
        ]);
  }
}
