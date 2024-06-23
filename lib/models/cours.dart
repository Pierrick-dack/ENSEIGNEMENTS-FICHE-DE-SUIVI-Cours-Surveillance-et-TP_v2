class Cours {
  final int? id;
  final String codeUE;
  final String intituleUE;
  final String enseignant;
  final int niveau_id;
  final int semestre_id;

  Cours(
      {this.id,
      required this.codeUE,
      required this.intituleUE,
      required this.enseignant,
      required this.niveau_id,
      required this.semestre_id});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codeUE': codeUE,
      'intituleUE': intituleUE,
      'enseignant': enseignant,
      'niveau_id': niveau_id,
      'semestre_id': semestre_id
    };
  }

  factory Cours.fromMap(Map<String, dynamic> map) {
    return Cours(
        id: map['id'],
        codeUE: map['codeUE'],
        intituleUE: map['intituleUE'],
        enseignant: map['enseignant'],
        niveau_id: map['niveau_id'],
        semestre_id: map['semestre_id']);
  }

  factory Cours.fromJson(Map<String, dynamic> json) {
    return Cours(
        id: json['id'],
        codeUE: json['codeUE'],
        intituleUE: json['intituleUE'],
        enseignant: json['enseignats'],
        niveau_id: json['niveau_id'],
        semestre_id: json['semestre_id']);
  }
}
