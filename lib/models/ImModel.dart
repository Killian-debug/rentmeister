class ImModel {
  String idIm;
  int nbrMai;

  ImModel({
    this.idIm = '',
    required this.nbrMai,
  });

  Map<String, dynamic> toJson() => {
        'idIm': idIm,
        'nbrMai': nbrMai,
      };

  Future<void> deleteHouse(idMai) async {}
}
