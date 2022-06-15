class RappelModel {
  String idRap;
  String datRap;
  String message;
  String receveur;

  RappelModel({
    this.idRap = '',
    required this.datRap,
    required this.message,
    required this.receveur,
  });

  Map<String, dynamic> toJson() => {
        'idRap': idRap,
        'datRap': datRap,
        'message': message,
        'receveur': receveur,
      };

  Future<void> sendRappel(idRap) async {}
}
