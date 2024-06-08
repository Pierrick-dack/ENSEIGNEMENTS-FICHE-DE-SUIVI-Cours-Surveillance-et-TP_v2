class Filiere {
  final int? id;
  final String codeFil;
  final String intFil;

  Filiere({this.id, required this.codeFil, required this.intFil});

  Map<String, dynamic> toMap() {
    return {'id': id, 'codeFil': codeFil, 'intFil': intFil};
  }

  factory Filiere.fromMap(Map<String, dynamic> map) {
    return Filiere(
        id: map['id'], codeFil: map['codeFil'], intFil: map['intFil']);
  }

  factory Filiere.fromJson(Map<String, dynamic> json) {
    return Filiere(
        id: json['id'], codeFil: json['codeFil'], intFil: json['intFil']);
  }
}
