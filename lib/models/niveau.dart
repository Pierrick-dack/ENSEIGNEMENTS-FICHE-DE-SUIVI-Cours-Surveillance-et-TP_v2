class Niveau {
  late final int? id;
  final String codeNiveau;
  final String intituleNiveau;

  Niveau({
    this.id,
    required this.codeNiveau,
    required this.intituleNiveau,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'className': codeNiveau,
      'classDescription': intituleNiveau,
    };
  }

  factory Niveau.fromMap(Map<String, dynamic> map) {
    return Niveau(
      id: map['id'],
      codeNiveau: map['codeNiveau'],
      intituleNiveau: map['intituleNiveau'],
    );
  }

  factory Niveau.fromJson(Map<String, dynamic> json) {
    return Niveau(
      id: json['id'],
      codeNiveau: json['codeNiveau'],
      intituleNiveau: json['intituleNiveau'],
    );
  }
}
