class PropertieModel {
  String idPro = '';
  String refPro;
  String descPro;
  String type;
  String statut;
  String adresse;
  String proprietaire;

  PropertieModel({
    this.idPro = '',
    required this.refPro,
    required this.descPro,
    required this.type,
    required this.statut,
    required this.adresse,
    required this.proprietaire,
  });

  Map<String, dynamic> toJson() => {
        'idPro': idPro,
        'refPro': refPro,
        'desPro': descPro,
        'statut': statut,
        'adresse': adresse,
        'proprietaire': proprietaire
      };

  Future<void> deletePropertie(idPro) async {}
}
