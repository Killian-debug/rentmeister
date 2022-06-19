import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flututo/models/HouseModel.dart';
import 'package:flututo/models/PropertiesModel.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PropertieModel propertieModel = PropertieModel(
    refPro: '',
  );

  @override
  Widget build(BuildContext context) {
    return //SafeArea(
        //child:
        Scaffold(
      // appBar: AppBar(
      //   title: Text("Hi Username"),
      // ),
      body: Center(
        child: FutureBuilder<List>(
          future: ,
          initialData: [],
          builder: (context, snapshot) {
            return _propertiesRow(propertieModel);
            // snapshot.hasData
            //     ? ListView.builder(
            //         padding: const EdgeInsets.all(10.0),
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (context, i) {
            //           return _propertiesRow(snapshot.data![i]);
            //         },
            //       )
            //     : Center(
            //         child: CircularProgressIndicator(),
            //       )
            ;
          },
        ),
      ),
    );
    //);
  }

  Widget _propertiesRow(PropertieModel propertieModel) {
    return ListView.builder(
      //itemCount: 7,
      itemBuilder: (context, index) {
        final DailyForecast dailyForecast = Server.getDailyForecastByID(index);
        return Card(
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Réf :',
                  style: accent,
                  children: [
                    TextSpan(
                      text: propertieModel.refPro,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Type',
                  style: accent,
                  children: [
                    TextSpan(
                      text: propertieModel.type,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: (propertieModel.statut == "libre")
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 52.0),
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          print("Annonce");
                        },
                        child: Text(
                          "Louer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 52.0),
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          print("Annonce");
                        },
                        child: Text(
                          "Libérer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Statut :',
                  style: accent,
                  children: [
                    TextSpan(
                      text: propertieModel.statut,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Adresse : ',
                  style: accent,
                  children: [
                    TextSpan(
                      text: propertieModel.adresse,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ); });
  }

  
}

Map<int, PropertieModel> _propData = {
  0: PropertieModel(
   idPro: 'aefaefe1236',
        refPro: 'refPro',
        desPro: 'descPro',
        statut: 'statut',
        adresse: 'adresse',
        proprietaire: 'proprietaire'
  ),
  1: PropertieModel(
   idPro: 'iqrh468431qh',
        refPro: 'refPro',
        desPro: 'descPro',
        statut: 'statut',
        adresse: 'adresse',
        proprietaire: 'proprietaire'
  ),
  2: PropertieModel(
   idPro: 'oisj684684',
        refPro: 'refPro',
        desPro: 'descPro',
        statut: 'statut',
        adresse: 'adresse',
        proprietaire: 'proprietaire'
  ),
  3: PropertieModel(
   idPro: 's346510684',
        refPro: 'refPro',
        desPro: 'descPro',
        statut: 'statut',
        adresse: 'adresse',
        proprietaire: 'proprietaire'
  ),
  
};

class Server {
  static List<PropertieModel> getPropList() =>
      _propData.values.toList();

  static PropertieModel getPropByID(int id) {
    assert(id >= 0 && id <= 6);
    return _propData[id]!;
  }
}