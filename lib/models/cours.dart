class Cours {
  final int? id;
  final String codeUE;
  final String intituleUE;

  Cours({this.id, required this.codeUE, required this.intituleUE});
  Map<String, dynamic> toMap() {
    return {'id': id, 'codeUE': codeUE, 'intituleUE': intituleUE};
  }

  factory Cours.fromMap(Map<String, dynamic> map) {
    return Cours(
        id: map['id'], codeUE: map['codeUE'], intituleUE: map['intituleUE']);
  }

  factory Cours.fromJson(Map<String, dynamic> json) {
    return Cours(
        id: json['id'], codeUE: json['codeUE'], intituleUE: json['intituleUE']);
  }
}
