import 'package:flutter/material.dart';

class PropertieCard extends StatelessWidget {
  PropertieCard({Key? key}) : super(key: key);
//final bool _flag = true;
  final List tenancyList = [
    {
      'loyer': 150000,
      'dateEntree': '12-05-2015',
      'locataire': 'Diane Dah',
      'numero': '+229 61 82 65 01',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: <Color>[Colors.grey[800]!, Colors.transparent],
                      ),
                    ),
                    child: Text("Blab bla b alfa"),
                  ),
                  Center(
                    child: Text("COcoc coc "),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           dailyForecast.getWeekday(currentDate.weekday),
            //           style: textTheme.headline4,
            //         ),
            //         const SizedBox(height: 10.0),
            //         Text(dailyForecast.description),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
            //     style: textTheme.subtitle1,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void createAnnonce() {}
