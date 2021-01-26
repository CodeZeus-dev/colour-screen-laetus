import 'package:color_details_screen/screens/color_details.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
      ),
      routes: <String, WidgetBuilder>{
        '/color/details': (BuildContext context) => ColorDetailsScreen()
      },
      home: Scaffold(
        body: Builder(builder: (ctx) {
          return Center(
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/color/details');
                },
                child: Text('Check info here...'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
