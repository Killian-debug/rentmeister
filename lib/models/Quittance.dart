class factModel {
  String idFact;
  String datEmi;
  String datPay;
  int montant;
  String idLoc;

  factModel(
      {this.idFact = '',
      required this.datEmi,
      required this.datPay,
      required this.montant,
      required this.idLoc});

  Map<String, dynamic> toJson() => {
        'idFact': idFact,
        'idLoc': idLoc,
        'dateEmi': datEmi,
        'datPay': datPay,
        'montant': montant,
      };
}
