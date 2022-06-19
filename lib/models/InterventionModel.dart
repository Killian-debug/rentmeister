class InterventionModel {
  String idInt;
  String idPro;
  String titre;
  String descInt;
  int cout;
  DateTime dateDeb;
  DateTime dateFin;
  String etat;
  String resp;

  InterventionModel({
    this.idInt = '',
    required this.idPro,
    required this.titre,
    required this.descInt,
    required this.cout,
    required this.dateDeb,
    required this.dateFin,
    required this.etat,
    required this.resp,
  });

  Map<String, dynamic> toJson() => {
        'idMai': idInt,
        'idPro': idPro,
        'titre': titre,
        'description': descInt,
        'cout': cout,
        'dateDeb': dateDeb,
        'dateFin': dateFin,
        'etat': etat,
        'responsable': resp
      };
}
