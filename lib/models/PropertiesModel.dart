class PropertieModel {
  String idPro = '';
  String refPro;
  String? descPro;
  String? type;
  String? statut;
  String? adresse;
  String? proprietaire;

  PropertieModel({
    this.idPro = '',
    required this.refPro,
    this.descPro,
    this.type,
    this.statut,
    this.adresse,
    this.proprietaire,
  });

  Map<String, dynamic> toJson() => {
        'idPro': idPro,
        'refPro': refPro,
        'desPro': descPro,
        'statut': statut,
        'adresse': adresse,
        'proprietaire': proprietaire
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["refPro"] = refPro;
    return map;
  }

  fromMap(dynamic obj) {
    this.refPro = obj['refpro'];
  }
}
