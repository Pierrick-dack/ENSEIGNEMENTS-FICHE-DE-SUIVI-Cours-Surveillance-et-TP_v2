class Semestre {
  final int? id;
  final String numSemestre;

  Semestre({
    this.id,
    required this.numSemestre,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numSemestre': numSemestre,
    };
  }

  factory Semestre.fromMap(Map<String, dynamic> map) {
    return Semestre(
      id: map['id'],
      numSemestre: map['numSemestre'],
    );
  }

  factory Semestre.fromJson(Map<String, dynamic> json) {
    return Semestre(
      id: json['id'],
      numSemestre: json['numSemestre'],
    );
  }
}
