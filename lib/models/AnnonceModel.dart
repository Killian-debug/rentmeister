import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnonceModel {
  String idAnn;
  String titre;
  String message;
  DateTime dateAnn = DateTime.now();

  AnnonceModel({
    this.idAnn = '',
    required this.titre,
    required this.message,
    required this.dateAnn,
  });

  Map<String, dynamic> toJson() => {
        'idAnn': idAnn,
        'titre': titre,
        'message': message,
        'dateAnn': dateAnn,
      };
}
