class Enseignant {
  final int? id;
  final String nomEns;
  final String emailEns;
  final String numBurEns;
  final String mdpEns;

  Enseignant(
      {this.id,
      required this.nomEns,
      required this.emailEns,
      required this.numBurEns,
      required this.mdpEns});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomEns': nomEns,
      'emailEns': emailEns,
      'numBurEns': numBurEns,
      'mdpEns': mdpEns
    };
  }

  factory Enseignant.fropMap(Map<String, dynamic> map) {
    return Enseignant(
        id: map['id'],
        nomEns: map['nomEns'],
        emailEns: map['emailEns'],
        numBurEns: map['numBurEns'],
        mdpEns: map['mdpEns']);
  }

  factory Enseignant.fropJson(Map<String, dynamic> json) {
    return Enseignant(
        id: json['id'],
        nomEns: json['nomEns'],
        emailEns: json['emailEns'],
        numBurEns: json['numBurEns'],
        mdpEns: json['mdpEns']);
  }
}
