import 'package:flutter/material.dart';

class FicheTravaux {
  final int? id;
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

  FicheTravaux(
      {this.id,
      required this.titreSeanceTP,
      required this.enseignant,
      required this.codeCours,
      required this.heureDebut,
      required this.heureFin,
      required this.objectifsTP,
      required this.materielNecessaire,
      required this.procedureTP,
      required this.observation,
      required this.resultatsAttendus});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titreSeanceTP': titreSeanceTP,
      'enseignant': enseignant,
      'codeCours': codeCours,
      'heureDebut': heureDebut.toString(),
      'heureFin': heureFin.toString(),
      'objectifsTP': objectifsTP,
      'materielNecessaire': materielNecessaire,
      'procedure': procedureTP,
      'observation': observation,
      'resultatsAttendus': resultatsAttendus
    };
  }

  factory FicheTravaux.fromMap(Map<String, dynamic> map) {
    return FicheTravaux(
        titreSeanceTP: map['titreSeanceTP'],
        enseignant: map['enseignant'],
        codeCours: map['codeCours'],
        heureDebut: map['heureDebut'],
        heureFin: map['heureFin'],
        objectifsTP: map['objectifsTP'],
        materielNecessaire: map['materielNecessaire'],
        procedureTP: map['procedure'],
        observation: map['observation'],
        resultatsAttendus: map['resultatsAttendus']);
  }

  factory FicheTravaux.fromJson(Map<String, dynamic> json) {
    return FicheTravaux(
        titreSeanceTP: json['titreSeanceTP'],
        enseignant: json['enseignant'],
        codeCours: json['codeCours'],
        heureDebut: json['heureDebut'],
        heureFin: json['heureFin'],
        objectifsTP: json['objectifsTP'],
        materielNecessaire: json['materielNecessaire'],
        procedureTP: json['procedure'],
        observation: json['observation'],
        resultatsAttendus: json['resultatsAttendus']);
  }
}
