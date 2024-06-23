import 'package:flutter/material.dart';

class Delegue {
  final int? id;
  final String nameDel;
  final String mdpDel;
  final String matDel;
  final String nivDel;
  final String filDel;

  Delegue({
    this.id,
    required this.nameDel,
    required this.mdpDel,
    required this.matDel,
    required this.nivDel,
    required this.filDel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameDel': nameDel,
      'mdpDel': mdpDel,
      'matDel': matDel,
      'nivDel': nivDel
    };
  }

  factory Delegue.fromMap(Map<String, dynamic> map) {
    return Delegue(
        id: map['id'],
        nameDel: map['nameDel'],
        mdpDel: map['mdpDel'],
        matDel: map['matDel'],
        nivDel: map['nivDel'],
        filDel: map['filDel']);
  }

  factory Delegue.fromJson(Map<String, dynamic> json) {
    return Delegue(
        id: json['id'],
        nameDel: json['nameDel'],
        mdpDel: json['mdpDel'],
        matDel: json['matDel'],
        nivDel: json['nivDel'],
        filDel: json['filDel']);
  }
}
