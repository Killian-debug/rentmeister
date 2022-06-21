class EquipmentModel {
  String idBien = '';
  String nom;
  String etat;
  // String image;

  EquipmentModel({
    this.idBien = '',
    required this.nom,
    required this.etat,
    // required this.image,
  });

  Map<String, dynamic> toJson() => {
        'idBien': idBien,
        'refPro': nom,
        'desPro': etat,
        //  'statut': image,
      };

  Future<void> deleteEquip(idBien) async {}
}
