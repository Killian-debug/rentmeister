import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';

class PropertieCard extends StatelessWidget {
  PropertieCard({Key? key}) : super(key: key);
//final bool _flag = true;
  final List tenancyList = [
    {
      'loyer': 150000,
      'dateEntree': '12-05-2015',
      'nom': 'Dah',
      'prenom': 'Diane',
      'numero': '+229 61 82 65 01',
    },
    {
      'loyer': 150000,
      'dateEntree': '12-05-2015<',
      'nom': 'Dah',
      'prenom': 'Diane',
      'numero': '+229 61 82 65 01',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          // ],
          // ),
          //  ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Locataire',
                      style: accent,
                      children: [
                        TextSpan(
                          text: tenancyList[0].locataire,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Numéro',
                      style: accent,
                      children: [
                        TextSpan(
                          text: 'Diane Dah',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Date d\'entrée',
                      style: accent,
                      children: [
                        TextSpan(
                          text: '12-02-2021',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Loyer : ',
                      style: accent,
                      children: [
                        TextSpan(
                          text: 'Payé',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(100, 52.0),
              primary: Theme.of(context).primaryColor,
            ),
            /*padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),*/
            onPressed: () {
              print("Annonce");
            },
            child: Text(
              "Annonce".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void createAnnonce() {}
