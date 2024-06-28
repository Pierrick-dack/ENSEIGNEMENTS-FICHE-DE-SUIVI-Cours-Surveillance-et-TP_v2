class FicheSurveillance {
  final int? id;
  final String chefDeSalle;
  final String salle;
  final DateTime date;
  final String session;
  final String codeCours;
  final String intituleUE;
  final int confirmation;

  FicheSurveillance(
      {this.id,
      required this.chefDeSalle,
      required this.salle,
      required this.date,
      required this.session,
      required this.codeCours,
      required this.intituleUE,
      required this.confirmation});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chefDeSalle': chefDeSalle,
      'salle': salle,
      'date': date.toString(),
      'session': session,
      'codeCours': codeCours,
      'intituleUE': intituleUE,
      'confirmation': confirmation
    };
  }

  factory FicheSurveillance.fromMap(Map<String, dynamic> map) {
    return FicheSurveillance(
        chefDeSalle: map['chefDeSalle'],
        salle: map['salle'],
        date: map['date'],
        session: map['session'],
        codeCours: map['codeCours'],
        intituleUE: map['intituleUE'],
        confirmation: map['confirmation']);
  }

  factory FicheSurveillance.fromJson(Map<String, dynamic> json) {
    return FicheSurveillance(
        chefDeSalle: json['chefDeSalle'],
        salle: json['salle'],
        date: json['date'],
        session: json['session'],
        codeCours: json['codeCours'],
        intituleUE: json['intituleUE'],
        confirmation: json['confirmation']);
  }
}
