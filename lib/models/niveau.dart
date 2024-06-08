class Niveau {
  final int? id;
  final int numero;

  Niveau({this.id, required this.numero});

  Map<String, dynamic> toMap() {
    return {'id': id, 'numero': numero};
  }

  factory Niveau.fromMap(Map<String, dynamic> map) {
    return Niveau(id: map['id'], numero: map['numero']);
  }

  factory Niveau.fromJson(Map<String, dynamic> json) {
    return Niveau(id: json['id'], numero: json['numero']);
  }
}
