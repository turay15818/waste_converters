import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:tape_measure/tape_measure.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    ResponsiveMediaQuery().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        // width: ResponsiveMediaQuery.horizontalLength*100,
        // height:ResponsiveMediaQuery.verticalLength*40,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                height: 400,
                padding: EdgeInsets.all(20),
                child: KdGaugeView(
                  minSpeed: 0,
                  maxSpeed: 100,
                  speed: 56,
                  animate: true,
                  alertSpeedArray: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                  alertColorArray: [
                    Color.fromARGB(255, 158, 242, 3),
                    Color.fromARGB(255, 241, 2, 177),
                    Color.fromARGB(255, 9, 0, 62),
                    Colors.orange,
                    Color.fromARGB(255, 151, 4, 236),
                    Color.fromARGB(255, 3, 186, 152),
                    Colors.indigo,
                    Colors.orange,
                    Colors.indigo,
                    Color.fromARGB(255, 15, 88, 17)
                  ],
                  duration: Duration(seconds: 40),
                  gaugeWidth: 30,
                  unitOfMeasurement: 'Gas Level',
                  unitOfMeasurementTextStyle: TextStyle(
                    color: Color.fromARGB(255, 248, 141, 2),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                width: 350,
                height: 400,
                child: Builder(builder: (context) {
                  // SizedBox(height: 360);
                  // Divider(height: 80);
                  return Container(
                    child: DChartGauge(
                      data: [
                        {'domain': 'empty', 'measure': 19},
                        {'domain': 'Mid', 'measure': 0},
                        {'domain': 'Filled', 'measure': 80},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'empty':
                            return Colors.green;
                          case 'Filled':
                            return Color.fromARGB(179, 66, 43, 43);
                          default:
                            return Colors.red;
                        }
                      },
                      showLabelLine: false,
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}";
                      },
                      labelPosition: PieLabelPosition.auto,
                      labelPadding: 0,
                      labelColor: Colors.white,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
