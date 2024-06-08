import 'package:flutter/material.dart';

class Fiche {
  final int? id;
  final int semestre;
  final DateTime date;
  final String codeCours;
  final String enseignant;
  final TimeOfDay heureDebut;
  final TimeOfDay heureFin;
  final TimeOfDay totalHeures;
  final String salle;
  final String typeSeance;
  final String titreSeance;
  final String niveaux;
  final String? signatureDelegue;
  final String? signatureProf;
  final String contenu;
  final int confidentialite;

  Fiche({
    this.id,
    required this.semestre,
    required this.date,
    required this.codeCours,
    required this.enseignant,
    required this.heureDebut,
    required this.heureFin,
    required this.totalHeures,
    required this.salle,
    required this.typeSeance,
    required this.titreSeance,
    required this.niveaux,
    this.signatureDelegue,
    this.signatureProf,
    required this.contenu,
    required this.confidentialite
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'semestre': semestre,
      'date': date.toString(),
      'codeCours': codeCours,
      'enseignant': enseignant,
      'heureDebut': heureDebut.toString(),
      'heureFin': heureFin.toString(),
      'totalHeures': totalHeures.toString(),
      'salle': salle,
      'typeSeance': typeSeance,
      'titreSeance': titreSeance,
      'niveaux': niveaux,
      'signatureDelegue': signatureDelegue,
      'signatureProf': signatureProf,
      'contenu': contenu,
      'confidentialite': confidentialite
    };
  }

  factory Fiche.fromMap(Map<String, dynamic> map) {
    return Fiche(
        id: map['id'],
        semestre: map['semestre'],
        date: map['date'],
        codeCours: map['codeCours'],
        enseignant: map['enseignant'],
        heureDebut: map['heureDebut'],
        heureFin: map['heureFin'],
        totalHeures: map['totalHeures'],
        salle: map['salle'],
        typeSeance: map['typeSeance'],
        titreSeance: map['titreSeance'],
        niveaux: map['niveaux'],
        signatureDelegue: map['signatureDelegue'],
        signatureProf: map['signatureProf'],
        contenu: map['contenu'],
        confidentialite: map['confidentialite']);
  }

  factory Fiche.fromJson(Map<String, dynamic> json) {
    return Fiche(
        id: json['id'],
        semestre: json['semestre'],
        date: json['date'],
        codeCours: json['codeCours'],
        enseignant: json['enseignant'],
        heureDebut: json['heureDebut'],
        heureFin: json['heureFin'],
        totalHeures: json['totalHeures'],
        salle: json['salle'],
        typeSeance: json['typeSeance'],
        titreSeance: json['titreSeance'],
        niveaux: json['niveaux'],
        signatureDelegue: json['signatureDelegue'],
        signatureProf: json['signatureProf'],
        contenu: json['contenu'],
        confidentialite: json['confidentialite']);
  }
}
