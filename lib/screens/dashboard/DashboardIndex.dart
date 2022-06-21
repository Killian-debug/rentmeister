import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flututo/models/HouseModel.dart';
import 'package:flututo/models/PropertiesModel.dart';
import 'package:flutter/services.dart';

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
        child: _propertiesRow(propertieModel)
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

        ,
      ),
    );
    //);
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Diane Omipah"), value: "1"),
      DropdownMenuItem(child: Text("Claude MOdoukpe"), value: "2"),
      DropdownMenuItem(child: Text("Carl Mzx"), value: "3"),
    ];
    return menuItems;
  }

  Widget _propertiesRow(PropertieModel propertieModel) {
    String selectedValue = "1";

    return ListView.builder(
        itemCount: _propData.length,
        itemBuilder: (context, index) {
          final PropertieModel propertieModel = Server.getPropByID(index);
          return Card(
            child: Row(
              children: <Widget>[
                Card(
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Expanded(
                              child:
                                  Image.asset("assets/images/shape_of_you.png"),
                              flex: 2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ],
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: (propertieModel.statut ==
                                                "libre")
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(100, 52.0),
                                                  primary: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                onPressed: () {
                                                  print("Louer");

                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          'Louer cette maison'),
                                                      content: Form(
                                                        child: DropdownButton(
                                                            value:
                                                                selectedValue,
                                                            onChanged: (String?
                                                                newValue) {
                                                              setState(() {
                                                                selectedValue =
                                                                    newValue!;
                                                              });
                                                            },
                                                            items:
                                                                dropdownItems),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'Annuler'),
                                                          child: const Text(
                                                              'Annuler'),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.teal,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context,
                                                                'Valider');
                                                          },
                                                          child: Text("Valider"
                                                              .toUpperCase()),
                                                        ),
                                                      ],
                                                    ),
                                                  );
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
                                                  primary: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                onPressed: () {
                                                  print("libération");

                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          'Libérer un appartement'),
                                                      content: const Text(
                                                          'En cliquant sur "OKAY" le locataire actuelle sera dissocier de cette maison !'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'Annuler'),
                                                          child: const Text(
                                                              'Annuler'),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.teal,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context,
                                                                'Annuler');
                                                          },
                                                          child: Text("Annuler"
                                                              .toUpperCase()),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "Libérer",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex: 8,
                        ),
                      ],
                    ),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
          );
        });
  }
}

Map<int, PropertieModel> _propData = {
  0: PropertieModel(
      idPro: 'aefaefe1236',
      refPro: 'ref02',
      descPro: 'descPro',
      statut: 'libre',
      adresse: 'adresse',
      proprietaire: '1'),
  1: PropertieModel(
      idPro: 'iqrh468431qh',
      refPro: 'ref98',
      descPro: 'descPro',
      statut: 'libre',
      adresse: 'adresse',
      proprietaire: '1'),
  2: PropertieModel(
      idPro: 'oisj684684',
      refPro: 'opl12',
      descPro: 'descPro',
      statut: 'occupé',
      adresse: 'adresse',
      proprietaire: '1'),
  3: PropertieModel(
      idPro: 's346510684',
      refPro: 'fifadji1',
      descPro: 'descPro',
      statut: 'libre',
      adresse: 'adresse',
      proprietaire: '1'),
};

class Server {
  static List<PropertieModel> getPropList() => _propData.values.toList();

  static PropertieModel getPropByID(int id) {
    assert(id >= 0 && id <= 6);
    return _propData[id]!;
  }
}
