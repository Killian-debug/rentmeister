class TenancyModel {
  String idLoc;
  String locataire;
  String maison;
  String loyer;
  String dateEntre;
  String dateSortie;
  String bail;

  TenancyModel({
    this.idLoc = '',
    required this.locataire,
    required this.maison,
    required this.loyer,
    required this.dateEntre,
    required this.dateSortie,
    required this.bail,
  });

  Map<String, dynamic> toJson() => {
        'idLoc': idLoc,
        'locataire': locataire,
        'maison': maison,
        'loyer': loyer,
        'dateEntre': dateEntre,
        'dateSortie': dateSortie,
        'bail': bail,
      };

  Future<void> deleteTenancy(idLoc) async {}
}
