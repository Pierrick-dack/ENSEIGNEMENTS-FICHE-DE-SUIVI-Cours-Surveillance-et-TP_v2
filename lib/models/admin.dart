class Admin {
  final int? id;
  final String nomCD;
  final String emailCD;
  final String mdpCD;

  Admin(
      {this.id,
      required this.nomCD,
      required this.emailCD,
      required this.mdpCD});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nomCD': nomCD, 'emailCD': emailCD, 'mdpCD': mdpCD};
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
        id: map['id'],
        nomCD: map['nomCD'],
        emailCD: map['emailCD'],
        mdpCD: map['mdpCD']);
  }

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        id: json['id'],
        nomCD: json['nomCD'],
        emailCD: json['emailCD'],
        mdpCD: json['mdpCD']);
  }
}
