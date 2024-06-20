import 'package:firstapp/models/fichesurveillance.dart';
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
      {Key? key, required this.ficheSurveillance, required this.logo});

  final FicheSurveillance ficheSurveillance;
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
              text: "Chef de salle :", content: ficheSurveillance.chefDeSalle, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Salle :", content: ficheSurveillance.salle, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Date :", content: ficheSurveillance.date.toString(), un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(text: "Session :", content: ficheSurveillance.session, un: 1, deux: 2),
          pw.SizedBox(height: 10),
          PartieSec(
              text: "Code du cours :", content: ficheSurveillance.codeCours, un: 1, deux: 1),
          pw.SizedBox(height: 10),
          PartieSec(text: "Intitulé :", content: ficheSurveillance.intituleUE, un: 1, deux: 2),
        ]);
  }
}
