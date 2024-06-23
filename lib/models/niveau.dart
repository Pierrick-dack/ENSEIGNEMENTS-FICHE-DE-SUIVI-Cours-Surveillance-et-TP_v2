class Niveau {
  final int? id;
  final String codeNiveau;
  final String intituleNiveau;
  final String filiereNiveau;

  Niveau(
      {this.id,
      required this.codeNiveau,
      required this.intituleNiveau,
      required this.filiereNiveau});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codeNiveau': codeNiveau,
      'intituleNiveau': intituleNiveau,
      'filiereNiveau': filiereNiveau
    };
  }

  factory Niveau.fromMap(Map<String, dynamic> map) {
    return Niveau(
        id: map['id'],
        codeNiveau: map['codeNiveau'],
        intituleNiveau: map['intituleNiveau'],
        filiereNiveau: map['filiereNiveau']);
  }

  factory Niveau.fromJson(Map<String, dynamic> json) {
    return Niveau(
        id: json['id'],
        codeNiveau: json['codeNiveau'],
        intituleNiveau: json['intituleNiveau'],
        filiereNiveau: json['filiereNiveau']);
  }
}
