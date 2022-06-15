class HouseModel {
  String idMai;
  String idPro;
  String modele;
  int occupant;

  HouseModel({
    this.idMai = '',
    required this.idPro,
    required this.modele,
    required this.occupant,
  });

  Map<String, dynamic> toJson() => {
        'idMai': idMai,
        'idPro': idPro,
        'modele': modele,
        'occupant': occupant,
      };

  Future<void> deleteHouse(idMai) async {}
}
