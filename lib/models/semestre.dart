class Semestre {
  final int? id;
  final String numSemestre;
  final int anneeDepart;
  final int anneeFin;
  final int numSemaine;

  Semestre(
      {this.id,
      required this.numSemestre,
      required this.anneeDepart,
      required this.anneeFin,
      required this.numSemaine});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numSemestre': numSemestre,
      'anneeDepart': anneeDepart,
      'anneeFin': anneeFin,
      'numSemaine': numSemaine
    };
  }

  factory Semestre.fromMap(Map<String, dynamic> map) {
    return Semestre(
        id: map['id'],
        numSemestre: map['numSemestre'],
        anneeDepart: map['anneeDepart'],
        anneeFin: map['anneeFin'],
        numSemaine: map['numSemaine']);
  }

  factory Semestre.fromJson(Map<String, dynamic> json) {
    return Semestre(
        id: json['id'],
        numSemestre: json['numSemestre'],
        anneeDepart: json['anneeDepart'],
        anneeFin: json['anneeFin'],
        numSemaine: json['numSemaine']);
  }
}
